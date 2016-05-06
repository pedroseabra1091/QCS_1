from flask import Blueprint,request,jsonify
import new_voter


personalSensitivity = Blueprint('personalSensitivity',__name__)

@personalSensitivity.route('/api/v1/personalSensitivity',methods=['POST','GET'])
def getPersonalSensitivity():

	todayPhysical = request.json['todayPhysical']
	physicalSamples = request.json['samplesPhysical']
	bloodSamples = request.json['bloodDrops']

	voterCaller = new_voter.Voter()
	outcome = voterCaller.calcResult(3,[todayPhysical,physicalSamples,bloodSamples])
	

	return jsonify({
		'value' : outcome[0],
		'details': outcome[2],
		'message': 'sugar drop per insulin unit (mg/dl)',
	
	})