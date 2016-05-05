from flask import Blueprint,request,jsonify

personalSensitivity = Blueprint('personalSensitivity',__name__)

@personalSensitivity.route('/api/v1/personalSensitivity',methods=['POST','GET'])
def getPersonalSensitivity():

	

	return jsonify({
		'message' : 'mounting'
	})