import sys
import suds
import socket
from suds.client import Client
from time import *
import logging
import threading

class Voter:

	def __init__(self):
		self.N_WebServices = 3
		self.custom_timeout = 4
		self.bound = 1
		self.majority = False
		self.wsdlFiles = [
			"http://qcsa1-beardsdei.rhcloud.com/qcsa1/InsulinDoseCalculator?wsdl",
			"http://qcsproject1-qcsproject.rhcloud.com/InsulinDoseCalculator?wsdl",
			"http://insulincalculator-aybareon.rhcloud.com/InsulinCalculatorTomcat/InsulinCalculator?wsdl",
			"http://webservice-sqdcourse.rhcloud.com/InsulinDoseCalculator?wsdl",
			"http://qcs07.dei.uc.pt:8080/InsulinCalculator?wsdl",
			"http://localhost:8080/InsulinCalculatorTomcat/InsulinCalculator?wsdl"
		]
		self.runtime_wsdlList = self.wsdlFiles
		self.results = []
		self.detalhes = []
		self.time_flag = False
		self.bestValue = -1
		self.score = 0
		self.retry_times = 0


	def wsThread(self, thread_id, wsdl_name, method, args):

		try:
			cur = Client(wsdl_name)
			cur.set_options(faults=True, timeout=1)

			
			if method==1:
				res = [wsdl_name,cur.service.backgroundInsulinDose(args)]
			elif method==2:
				res = [wsdl_name,cur.service.mealtimeInsulinDose(args[0],args[1],args[2],args[3],args[4])]
			elif method==3:
				res = [wsdl_name,cur.service.personalSensitivityToInsulin(args[0],args[1],args[2])]

			if self.time_flag==False:
				self.results[thread_id][1] = res[1]
		except socket.timeout:
			self.results[thread_id][1] = -1
			print "a timeout occurred in the webservice"
		except :
			self.results[thread_id][1] = -1
			print "something occurred with the webservice: ", sys.exc_info()[0]


	def calcResult(self, method, args):
		start_time = time()
		retry_times = 0

		while time()-start_time < self.custom_timeout and len(self.runtime_wsdlList)>=(self.N_WebServices - len(self.results)):
			self.calcularMajority(method,args)
			#se tiver majority nao precisa de voltar a calcular
			if self.majority == True:
				break

		print "tempo", time()-start_time

		self.time_flag = True

		#editar detalhes e enviar a informacao ao utilizador
		#os detalhes devem conter o numero de webservices usados, quais os seus resultados(e respectiva votacao) ou se deram timeout ou erro

		if self.majority == True:
			message = "Valor consensual encontrado\n"
		else:
			message = "Nao foi possivel alcancar maioria\n"

		message +=("Numero de web services conferidos: " + str(self.retry_times) + "\n")

		for det in self.detalhes:
			message += (str(det)+"\n")

		return self.bestValue, self.score, message

	def calcularMajority(self,method,args):
		myThreads = []
		self.bestValue = -1
		self.score = 0
		self.majority = False

		if len(self.results) >= self.N_WebServices:
			self.results.pop(0)

		#pedir N_WebServices para devolverem resultados para votacao
		while len(self.results) < self.N_WebServices :
			a = []
			a.append(self.runtime_wsdlList.pop())
			a.append(-1 )#por defeito, colocamos -1 - o web service ainda nao devolveu resultado
			self.retry_times += 1
			self.results.append(a)

		#invocar os webservices
		for i in range(len(self.results)):
			cur = threading.Thread(target = self.wsThread, args=(i, self.results[i][0], method, args,))
			myThreads.append(cur)
			cur.start()

		#garantir que ja temos resultados dos webservices que invocamos(incluindo timeouts ou erros)
		for t in myThreads:
			t.join()

		realResults = []
		#votacao
		for res in self.results:
			exists = False
			#adicionar aos detalhes - este webservice nao volta a ser usado para este calculo
			if res[1] < 0:
				self.detalhes.append([[res[1],0,res[0]],self.retry_times])
			#votacao real
			else:
				#self.detalhes.append([res[1],0,res[0]])
				resScore = 1
				for item in realResults:
					if res[1] <= item[0]+self.bound and res[1] >= item[0]-self.bound:
						resScore += 1
						item[1] += 1
					if res[1] == item[0]:
						item[1] += 1
						exists = True
				if exists == False:
					realResults.append([res[1],resScore,res[0]])

		#retirar os webservices que deram bode
		self.results[:] = [x for x in self.results if not x[1]<0]

		#quem teve mais votos? Ha maioria?
		for res in realResults:
			#o ser maior que 1 significa que teve votos alem de si proprio
			if res[1] > self.score and res[1]>1:
				self.score = res[1]
				self.bestValue = res[0]
				self.majority = True
			elif res[1] == self.score:
				self.majority = False
				self.bestValue = -1
				self.score = 0

		for res in self.results:
			self.detalhes.append([res,self.retry_times])


if __name__ == '__main__':

	logging.basicConfig(level=logging.INFO)
	cenas = Voter()
	#res = cenas.calcResult(2,[120,14,170,100,60])#120, 14, 170, 100, 60, expected output: 8 -> OK
	#res = cenas.calcResult(2,[95,10,100,120,50])#95, 10, 100, 120, 50, expected 0 ->deu asneira ( -1 ) preMealBloodSugar e invalido
	#res = cenas.calcResult(2,[60,12,200,100,25])#expected 14 -> OK
	#res = cenas.calcResult(1,79)#expected 22 -> OK
	res = cenas.calcResult(3,[5,[0,10],[50,50]])#5, {0, 10}, {50, 50} ---> expected output: 50
	#6, {2, 8}, {32, 83} ---> expected output: 66
	#0, {1, 3, 10}, {33, 43, 70} ---> expected output: 30
	#4, {1, 6, 8, 9}, {32, 61, 91, 88} ---> expected output: 53
	print res[2]
	print "Resultado: ", res[0]
