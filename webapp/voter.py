import sys
import suds
import socket
from suds.client import Client
from time import *
import logging
import threading

#numero de segundos do timeout
timeout = 4
#numero de web services a usar para fazer a request
useWebservicesNumber = 3

class Voter:


	def __init__(self):
		self.wsdlFiles = [
			"http://qcsa1-beardsdei.rhcloud.com/qcsa1/InsulinDoseCalculator?wsdl",
			"http://qcsproject1-qcsproject.rhcloud.com/InsulinDoseCalculator?wsdl",
			"http://insulincalculator-aybareon.rhcloud.com/InsulinCalculatorTomcat/InsulinCalculator?wsdl",
			"http://webservice-sqdcourse.rhcloud.com/InsulinDoseCalculator?wsdl",
			"http://qcs07.dei.uc.pt:8080/InsulinCalculator?wsdl",
			"http://localhost:8080/InsulinCalculatorTomcat/InsulinCalculator?wsdl"
		]

		self.sensitivity = 1
		self.wsClients = []
		self.wsResults = []	
		self.voter_start_time = time()
		self.time_flag=False
		self.numberOfValidWsResults = 0
		self.retry_number=0
		self.wsToUse = self.wsdlFiles[:useWebservicesNumber]

	def retry(self, method, args):
		self.retry_number = self.retry_number +1;
		return self.calcResult(method,args)

	def wsThread(self, thread_id, wsdl_name, method, args):
		try:
			cur = Client(wsdl_name)
			cur.set_options(faults=True, timeout=1)
			self.wsClients.append(cur)
			start_time = time()

			if method==1:
				res = [self.wsToUse[thread_id],cur.service.backgroundInsulinDose(args)]
			elif method==2:
				res = [self.wsToUse[thread_id],cur.service.mealtimeInsulinDose(args[0],args[1],args[2],args[3],args[4])]
			elif method==3:
				res = [self.wsToUse[thread_id],cur.service.personalSensitivity(args[0],args[1],args[2],args[3],args[4])]

			if self.time_flag==False:
				self.wsResults.append(res)
				if res[1]>=0:
					self.numberOfValidWsResults = self.numberOfValidWsResults + 1
		except socket.timeout:
			print "a timeout occurred in the webservice"
		except :
			print "something occurred with the webservice: ", sys.exc_info()[0]


	def calcResult(self, method, args):

		realResults = []
		ws_threads = []

		thread_id = 0
		self.wsToUse = []
		self.wsToUse = self.wsdlFiles[self.retry_number:self.retry_number+useWebservicesNumber]
		for i in args:
			print i
		if len(self.wsToUse) < useWebservicesNumber:
			self.wsToUse.append(self.wsdlFiles[:self.retry_number+useWebservicesNumber-len(self.wsdlFiles)])

		for item in self.wsToUse:
			cur = threading.Thread(target = self.wsThread, args=(thread_id, item, method, args,))
			ws_threads.append(cur)
			cur.start()
			thread_id = thread_id+1

		#verificar se ja passou timeout ou se ja temos todos os resultados
		while time()-self.voter_start_time  < 4:
			if self.numberOfValidWsResults >= useWebservicesNumber :
				break;

		if self.numberOfValidWsResults < useWebservicesNumber:
			return (-1,0,'Majority not occured')

		self.time_flag=True
		
		for wst in ws_threads:
			wst.join()

		for item in self.wsResults:
			exists = False
			newOccurTimes = 1
			for result in range (len(realResults)):
				if item[1] <= realResults[result][0]+self.sensitivity and item[1] >= realResults[result][0]-self.sensitivity:
					realResults[result][1] = realResults[result][1]+1
					newOccurTimes = newOccurTimes+1
				if item[1] == realResults[result][0]:
					exists = True
			if exists == False:
				realResults.append([item[1],newOccurTimes])

		bestVal = -1
		bestOccur = 0
		valid = False
		for item in range (len(realResults)):
			if realResults[item][1] > bestOccur:
				bestVal = realResults[item][0]
				bestOccur = realResults[item][1]
				valid = True
			elif realResults[item][1] == bestOccur:
				valid = False

		ret_message = "\nNumero de web services usados na votacao: "+str(self.numberOfValidWsResults)+"\nDetalhes\n"
		for line in self.wsResults:
			if line[1] < 0:
				ret_message += "webservice: "+line[0]+" \tresultado: timeout ou erro\n"
			else:
				ret_message += "webservice: "+line[0]+" \tresultado: "+str(line[1])+"\n"
		ret_message += "\nVotacao:\n"
		for line in realResults:
			ret_message += "Resultado: "+str(line[0])+"\tScore: "+str(line[1])+"\n"

		

		if valid:
			ret_message += "\nMais Votado\n"
			ret_message += "Resultado "+str(bestVal)+" com "+str(bestOccur)+" votos.\n"
			return (bestVal,bestOccur,ret_message)
		else:
			ret_message += "\nNao foi possivel encontrar maioria\n"
		return (-1, 0,ret_message)


'''if __name__ == '__main__':

	logging.basicConfig(level=logging.INFO)
	cenas = Voter()
	res = cenas.calcResult(2,[80,12,120,100,50])
	print res[2]
	#print cenas.retry(2,[80,12,120,100,50])
	#print cenas.retry(2,[80,12,120,100,50])'''
	