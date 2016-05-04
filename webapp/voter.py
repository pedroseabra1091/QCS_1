from suds.client import Client
from time import *
import logging





class Voter:
	wsdlFiles = [
		"http://insulincalculator-aybareon.rhcloud.com/InsulinCalculatorTomcat/InsulinCalculator?wsdl"
		]

	sensitivity = 1


	def calcResult(self, method, args):
		wsClients = []
		wsResults = []
		realResults = []

		for item in self.wsdlFiles:
			cur = Client(item)
			wsClients.append(cur)
			wsResults.append(cur.service.backgroundInsulinDose(args))

		for item in wsResults:
			exists = False
			for result in range (len(realResults)):
				if item <= realResults[result][0]+sensitivity and item >= realResults[result][0]-sensitivity:
					realResults[result][1] = realResults[result][1]+1
				if item == realResults[result][0]:
					exists = True
			if exists == False:
				realResults.append([item,1])

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
	