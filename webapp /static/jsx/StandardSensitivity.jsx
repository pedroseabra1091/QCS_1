import React from 'react';

import Results from './Results.jsx';

var StandardSensitivity = React.createClass({

	getInitialState: function(){
		console.log('entering inital state');
		return({
			carbAmount: '',
			ratio : '60-120',
			beforeMeal : '',
			target: '',
			personalSensitivity: '50',
			results:false,
		});
	},

	componentDidMount: function(){
		console.log('Standard Sensivity Mounted');	
		console.log(this.state.results);
	},

	handleChange:function(type,evt){
		if(type == 'carbAmout'){
			this.setState({
				carbAmount : evt.target.value
			})
			
		}
		else if(type == 'ratio'){
			this.setState({
				ratio : evt.target.value
			})
			
		}
		else if(type == 'beforeMeal'){
			this.setState({
				beforeMeal : evt.target.value
			})
			
		}
		else if(type == 'target'){
			this.setState({
				target : evt.target.value
			})
			
		}
		else if(type == 'personalSensitivity'){
			this.setState({
				personalSensitivity : evt.target.value
			})
			
		}
		this.checkEmptyInputs();
	},

    checkEmptyInputs:function(){
      
      $('form > p > input').keyup(function() {
        var empty = false;
        $('form > p > input').each(function() {
            if ($(this).val() == '') {
                empty = true;
            }
        });
        if (empty) {
            $('#calculateButton').attr('disabled', 'disabled');
        } else {
            $('#calculateButton').removeAttr('disabled');        
        }
     });
    },

    handleSubmit:function(evt){
    	evt.preventDefault();
    	console.log('handle submit');
    	this.setState({
    		results:true,
    	})
    },

	render: function() {
		return (
			<div>
				<div className="column is-6 inlineblocked formMarginRight">
					<h1 className="title is-1">Standard insulin sensitivity</h1>
					<form onSubmit={this.handleSubmit}>
						<label className="label">Carbohydrate amount (g)</label>
						<p className="control">
						  <input className="input" onChange={this.handleChange.bind(null,'carbAmount')} type="text" placeholder="60 - 120" />
						</p>
						<label className="label">Carbohydrate to insulin ratio (mg/dl)</label>
						<p className="control">
						  <input className="input" onChange={this.handleChange.bind(null,'ratio')} type="text" placeholder="60-120" />
						</p>
						<label className="label">Before meal blood sugar(mg/dl)</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'beforeMeal')} type="text" placeholder="100" />
						</p>
						<label className="label">Target meal blood sugar(mg/dl)</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'target')} type="text" placeholder="80-120" />
						</p>	
						<label className="label">Personal sensitivity(mg/dl)</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'personalSensitivity')} type="text" placeholder = "50" />
						</p>
						<p className="control buttonPosition">
							<button id = "calculateButton" className="button is-medium is-info" disabled = "disabled">Calculate insulin dose</button>
						</p>
					</form>	
				</div>
				{this.state.results ? 	
					<div className="column is-5 inlineblocked fullHeight" >
						<Results />
					</div>
				: null}
			</div>
		);
	}

});

module.exports = StandardSensitivity;