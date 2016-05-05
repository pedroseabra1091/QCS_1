import React from 'react';

import Results from './Results.jsx';

var StandardSensitivity = React.createClass({

	getInitialState: function(){
		console.log('entering inital state');
		return({
			carbAmount: '',
			ratio : '',
			beforeMeal : '',
			target: '',
			personalSensitivity: '',
			results:false,
			findings: '',
			message:''
		});
	},

	componentDidMount: function(){
		this.checkEmptyInputs();
		console.log('Standard Sensivity Mounted');	
	},

	handleChange:function(type,evt){

		if(type == 'carbAmount'){
			if(evt.target.value >= 60 && evt.target.value <= 120){
				this.setState({
					carbAmount : evt.target.value
				}, function changed(){
					this.checkEmptyInputs();
				});
			}
			else{
				this.setState({
					carbAmount: ''
				}, function changed(){
					this.checkEmptyInputs();
				});
			}
		}
		else if(type == 'ratio'){
			if(evt.target.value >= 10 && evt.target.value <= 15){
				this.setState({
					ratio: evt.target.value
				}, function changed(){
					this.checkEmptyInputs();
				});
				
			}
			else{
				this.setState({
					ratio: ''
				}, function changed(){
					this.checkEmptyInputs();
				});
			}
		}
		else if(type == 'beforeMeal'){
			if(evt.target.value >= 120 && evt.target.value <= 250){
				this.setState({
					beforeMeal: evt.target.value
				}, function changed(){
					this.checkEmptyInputs();
				});
				
			}
			else{
				this.setState({
					beforeMeal: ''
				}, function changed(){
					this.checkEmptyInputs();
				});
			}
		}
		else if(type == 'target'){
			if(evt.target.value >= 80 && evt.target.value <= 120){
				this.setState({
					target: evt.target.value
				}, function changed(){
					this.checkEmptyInputs();
				});
			}		
			else{
				this.setState({
					target: ''
				}, function changed(){
					this.checkEmptyInputs();
				});
			}	
		}
		else if(type == 'personalSensitivity'){
			if(evt.target.value >= 15 && evt.target.value <= 100){
				this.setState({
					personalSensitivity: evt.target.value
				}, function changed(){
					this.checkEmptyInputs();
				});
			}
			else{
				this.setState({
					personalSensitivity: ''
				}, function changed(){
					this.checkEmptyInputs();
				});
			}
		}
		this.checkEmptyInputs();
	},

    checkEmptyInputs:function(){
      	var allow = true;
        if(this.state.carbAmount == '' || this.state.ratio == '' || this.state.beforeMeal == '' || this.state.target == '' || this.state.personalSensitivity == ''){
      		console.log('changes');
      		allow = false;
        }
	    if (!allow) {
	        $('#calculateButton').attr('disabled', 'disabled');
	    } else {
	        $('#calculateButton').removeAttr('disabled');        
	    }
    },

    handleSubmit:function(evt){
    	console.log('handle submit');
    	this.setState({
    		results:true,
    	});
   
    	var data = {
    		carbAmount: this.state.carbAmount,
			ratio: this.state.ratio,
			beforeMeal: this.state.beforeMeal,
			target:this.state.target,
			personalSensitivity:this.state.personalSensitivity
    	};
    	evt.preventDefault();
    	$.ajax({
    		type:"POST",
    		url:"/api/v1/standardSensitivity",
    		contentType: 'application/json',
    		dataType: "json",
    		data: JSON.stringify(data),
    		success: function(result){
    			console.log(result.details);
    			this.setState({
    				findings: result.value,
    				message: result.message
    			})
    		}.bind(this),
    		error: function(){
    			console.log('error');
    		}
    	});
    },

	render: function() {
		return (
			<div>
				<div className="column is-6 inlineblocked formMarginRight">
					<h1 className="title is-1">Standard insulin sensitivity</h1>
					<form onSubmit={this.handleSubmit}>
						<label className="label">Carbohydrate amount (g)</label>
						<p className="control">
						  <input className="input" onChange={this.handleChange.bind(null,'carbAmount')} type="number" placeholder="60 - 120" />
						</p>
						<label className="label">Carbohydrate to insulin ratio (mg/dl)</label>
						<p className="control">
						  <input className="input" onChange={this.handleChange.bind(null,'ratio')} type="number" placeholder="10 - 15" />
						</p>
						<label className="label">Before meal blood sugar(mg/dl)</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'beforeMeal')} type="number" placeholder="120 - 250" />
						</p>
						<label className="label">Target meal blood sugar(mg/dl)</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'target')} type="number" placeholder="80-120" />
						</p>	
						<label className="label">Personal sensitivity(mg/dl)</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'personalSensitivity')} type="number" placeholder = "15 - 100" />
						</p>
						<p className="control buttonPosition">
							<button id = "calculateButton" className="button is-medium is-info" disabled = "disabled">Calculate insulin dose</button>
						</p>
					</form>	
				</div>
				{this.state.results ? 	
					<div className="column is-5 inlineblocked fullHeight" >
						<Results value = {this.state.findings} message = {this.state.message} />
					</div>
				: null}
			</div>
		);
	}

});

module.exports = StandardSensitivity;