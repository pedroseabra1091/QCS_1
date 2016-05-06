from flask import Blueprint,jsonify,request
import new_voter

backgroundDose = Blueprint('backgroundDose',__name__)

@backgroundDose.route('/api/v1/backgroundDose',methods=['POST','GET'])
def getBackgroundDose():

	weight = request.json['weight']

	voterCaller = new_voter.Voter()
	outcome = voterCaller.calcResult(1,weight)

	return jsonify({
		'details': outcome[2],
		'value': outcome[0],
		'message' : 'units needed between meals'
	})