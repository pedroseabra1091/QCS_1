from flask import Blueprint,jsonify

standardSensitivity = Blueprint('standardSensitivity',__name__)

@standardSensitivity.route('/api/v1/standardSensitivity',methods=['POST'])
def getResultsStandardSensitivity():

	carbAmount = request.json['carbAmount']
	ratio = request.json['ratio']
	beforeMeal = request.json['beforeMeal']
	target = request.json['target']
	personalSensitivity = request.json['personalSensitivity']

	return jsonify({
		'message': 'successful communication'
	})