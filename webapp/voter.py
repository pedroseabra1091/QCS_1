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
			"http://webservice-sqdcourse.rhcloud.com/InsulinDoseCalculator?wsdl"
			]

		self.sensitivity = 1
		self.wsClients = []
		self.wsResults = []	
		self.voter_start_time = time()
		self.time_flag=False

	def wsThread(self, thread_id, wsdl_name, method, args):
		cur = Client(wsdl_name)
		cur.set_options(timeout=4)
		self.wsClients.append(cur)
		start_time = time()

		if method==1:
			if thread_id == 1:
				sleep(10)
				res = [self.wsdlFiles[thread_id],20]
			else:
				res = [self.wsdlFiles[thread_id],cur.service.backgroundInsulinDose(args)]
		elif method==2:
			res = [self.wsdlFiles[thread_id],cur.service.mealtimeInsulinDose(args)]
		elif method==3:
			res = [self.wsdlFiles[thread_id],cur.service.personalSensitivity(args)]

		if self.time_flag==False:
			self.wsResults.append(res)
		print str(thread_id)+"\ntime wasted on this webservice: " + str(time()-start_time)

	def calcResult(self, method, args):

		realResults = []
		ws_threads = []

		#start_time = time()

		thread_id = 0
		for item in self.wsdlFiles:
			cur = threading.Thread(target = self.wsThread, args=(thread_id, item, method, args,))
			ws_threads.append(cur)
			cur.start()
			thread_id = thread_id+1

		#verificar se ja passou timeout ou se ja temos todos os resultados
		while time()-self.voter_start_time  < 4:
			if len(self.wsResults) >= useWebservicesNumber or len(self.wsResults) >= len(self.wsdlFiles):
				break;

		self.time_flag=True
		

		print "\ntime wasted!: " + str(time()-self.voter_start_time)

		for item in self.wsResults:
			exists = False
			for result in range (len(realResults)):
				if item[1] <= realResults[result][0]+self.sensitivity and item[1] >= realResults[result][0]-self.sensitivity:
					realResults[result][1] = realResults[result][1]+1
				if item[1] == realResults[result][0]:
					exists = True
			if exists == False:
				realResults.append([item[1],1])

		bestVal = -1
		bestOccur = 0
		valid = False
		for item in range (len(realResults)):
			if realResults[item][0] > bestVal:
				bestVal = realResults[item][0]
				bestOccur = realResults[item][1]
				valid = True
			elif realResults[item][0] == bestVal:
				valid = False


		print("\ndetailed results:")
		for item in self.wsResults:
			print "\nwebservice: "+ item[0] + "\tresult: " + str(item[1])

		if valid:
			return (bestVal,bestOccur)
		return (-1, 0)


if __name__ == '__main__':

	logging.basicConfig(level=logging.INFO)
	wsdlFile = "http://insulincalculator-aybareon.rhcloud.com/InsulinCalculatorTomcat/InsulinCalculator?wsdl"
	#client = Client(wsdlFile)
	#result = client.service.backgroundInsulinDose(120)
	cenas = Voter()
	print cenas.calcResult(1,120)
	#print client
	#print result
	