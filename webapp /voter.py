from suds.client import Client
import logging

if __name__ == '__main__':

	logging.basicConfig(level=logging.INFO)
	wsdlFile = "http://insulincalculator-aybareon.rhcloud.com/InsulinCalculatorTomcat/InsulinCalculator?wsdl"
	client = Client(wsdlFile)
	result = client.service.mealtimeInsulinDose("120")
	print client
	

