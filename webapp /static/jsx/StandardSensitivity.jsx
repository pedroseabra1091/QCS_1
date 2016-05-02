import React from 'react';

var StandardSensitivity = React.createClass({

	getInitialState: function(){
		return({
			carbAmount: '',
			ratio : '60-120',
			beforeMeal : '',
			target: '',
			personalSensitivity: '50',
		});
	},

	componentDidMount: function(){
		console.log('Component Mounted');	
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
	},

	

	render: function() {
		return (
			<div className="column is-one-third">
				<form>
					<label className="label">Carbohydrate amount (g)</label>
					<p className="control">
					  <input className="input" onChange={this.handleChange.bind(null,'carbAmount')} type="text" placeholder="60 - 120" />
					</p>
					<label className="label">Carbohydrate to insulin ratio (mg/dl)</label>
					<p className="control">
					  <input className="input" onChange={this.handleChange.bind(null,'ratio')} type="text" placeholder="Text input" value={this.state.ratio} />
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
					 	<input className="input" onChange={this.handleChange.bind(null,'personalSensitivity')} type="text" value={this.state.personalSensitivity} />
					</p>
					<p className="control buttonPosition">
  						<button className="button is-medium is-info">Calculate insulin dose</button>
  					</p>
				</form>		
			</div>
		);
	}

});

module.exports = StandardSensitivity;