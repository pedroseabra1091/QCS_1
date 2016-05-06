from flask import Blueprint,jsonify,request
import new_voter

standardSensitivity = Blueprint('standardSensitivity',__name__)

@standardSensitivity.route('/api/v1/standardSensitivity',methods=['POST','GET'])
def getResultsStandardSensitivity():

	carbAmount = request.json['carbAmount']
	ratio = request.json['ratio']
	beforeMeal = request.json['beforeMeal']
	target = request.json['target']
	personalSensitivity = request.json['personalSensitivity']

	voterCaller = new_voter.Voter()
	outcome = voterCaller.calcResult(2,[carbAmount,ratio,beforeMeal,target,personalSensitivity])

	print '###########OUTCOME###############'
	print outcome
	print '-------------------------'

	return jsonify({

		'value' : outcome[0],
		'details': outcome[2],
		'message': 'units of rapid acting insuline',
	
	})