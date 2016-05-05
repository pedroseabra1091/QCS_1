from flask import Blueprint,jsonify,request
import voter

standardSensitivity = Blueprint('standardSensitivity',__name__)

@standardSensitivity.route('/api/v1/standardSensitivity',methods=['POST','GET'])
def getResultsStandardSensitivity():

	print 'prioca'
	carbAmount = request.json['carbAmount']
	ratio = request.json['ratio']
	beforeMeal = request.json['beforeMeal']
	target = request.json['target']
	personalSensitivity = request.json['personalSensitivity']

	coiso = voter.Voter()
	a = coiso.calcResult(2,[carbAmount,ratio,beforeMeal,target,personalSensitivity])

	print a[2]

	return jsonify({
		'message': 'successful communication'
	})