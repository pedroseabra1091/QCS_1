import React from 'react';

import Results from './Results.jsx';

var PersonalSensitivity = React.createClass({

	getInitialState: function(){
		return({
			todayPhysical: '',
			samplesPhysical: [],
			bloodDrops: [],
			currentPhysical:'',
			currentBlood:'',
			results:false,
			personalState: this.props.personalState,
			samples:true
		});
	},

	componentDidMount: function(){
		console.log('Personal Sensivity Mounted X');	
	},

	handleChange:function(type,evt){
		if(type == 'todayPhysical'){
			if(evt.target.value >= 0 && evt.target.value <= 10)
			this.setState({
				data : evt.target.value
			})
			this.checkEmptyInputs();
		}
		else if(type == 'currentPhysical'){
			this.setState({
				currentPhysical : evt.target.value
			})
			this.checkEmptyInputs();
		}
		else if(type == 'currentBlood'){
			this.setState({
				currentBlood : evt.target.value
			})
			this.checkEmptyInputs();
		}
		this.checkEmptyInputs();
	},

	checkEmptyInputs:function(){

	  	var allow = true;
        if(this.state.todayPhysical == '' || this.state.samplesPhysical == '' || this.state.bloodDrops == ''){
      		allow = false;
        }
	    if (!allow) {
	        $('#calculateButton').attr('disabled', 'disabled');
	    } else {
	        $('#calculateButton').removeAttr('disabled');        
	    }
     },

    handleClick:function(evt){
    	evt.preventDefault();
    	var physicalArray = this.state.samplesPhysical.slice()
    	physicalArray.push(this.state.currentPhysical)
    	var bloodArray = this.state.bloodDrops.slice()
    	bloodArray.push(this.state.currentBlood)
    	this.setState({
    		samplesPhysical: physicalArray,
    		bloodDrops: bloodArray,
    	}, function after(){
    		this.showResults();
    	});
    },

    showResults:function(){	
		for(var i=0;i < this.state.samplesPhysical.length;i++){
    		console.log(this.state.samplesPhysical[i]);
    	}
    },

    handleSubmit:function(evt){
    	evt.preventDefault();
    	this.setState({
    		results:true,
    	})
    },

	render: function() {
		return (
			<div>
				<div className = "column is-5 inlineblocked formMarginRight">
					<h1 className="title is-1">Personal insulin sensitivity</h1>
					<form className = "inlineblocked" >
						<label className="label">Physical activity level</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'todayPhysical')} type="text" placeholder="0-10" />
						</p>
						<p className="control buttonPosition inlineblocked marginLeft">
		  					<button onSubmit={this.handleSubmit} id="calculateButton" className="button is-medium is-info" disabled="disabled">Calculate insuline dose</button>
		  				</p>
		  			</form>
		  		</div> 
		  		<div className = "column is-1 inlineblocked formMarginRight">
					<form className = "inlineblocked">	
						<label className="label">Samples of physical activity</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'currentPhysical')} type="text" placeholder="2-10" />
						</p>
						<label className="label">Blood drops</label>
						 <p className = "control">
						 	<input className="input" onChange={this.handleChange.bind(null,'currentBlood')} type="text" placeholder="2-10" />
						</p>
						<p id = 'samples' className="control buttonPosition inlineblocked">
	  						<button id="calculateButton" onClick = {this.handleClick} className="button is-medium" >Add pair of samples</button>
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

module.exports = PersonalSensitivity;