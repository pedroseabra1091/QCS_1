import React from 'react';

var PersonalSensitivity = React.createClass({

	getInitialState: function(){
		return({
			carbAmount: '',
			ratio : '60-120',
			beforeMeal : '',
			target: '',
			personalSensitivity: '50',
			todayPhysical: '',
			samplesPhysical: '',
			bloodDrops: '',
		});
	},

	componentDidMount: function(){
		console.log('Personal Sensivity Mounted');	
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
		else if(type == 'todayPhysical'){
			this.setState({
				todayPhysical : evt.target.value
			})
		}
		else if(type == 'samplesPhysical'){
			this.setState({
				samplesPhysical : evt.target.value
			})
		}
		else if(type == 'bloodDrops'){
			this.setState({
				bloodDrops : evt.target.value
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
					<label className="label">Physical activity level</label>
					 <p className = "control">
					 	<input className="input" onChange={this.handleChange.bind(null,'todayPhysical')} type="text" placeholder="0-10" />
					</p>
					<label className="label">Samples of physical activity</label>
					 <p className = "control">
					 	<input className="input" onChange={this.handleChange.bind(null,'samplesPhysical')} type="text" placeholder="2-10" />
					</p>
					<label className="label">Blood drops</label>
					 <p className = "control">
					 	<input className="input" onChange={this.handleChange.bind(null,'bloodDrops')} type="text" placeholder="2-10" />
					</p>
					<p className="control buttonPosition">
  						<button className="button is-medium is-info">Calculate insuline dose</button>
  					</p>
				</form>			
			</div>
		);
	}

});

module.exports = PersonalSensitivity;