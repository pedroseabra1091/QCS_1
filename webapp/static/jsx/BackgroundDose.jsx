var React = require('react');

import Results from './Results.jsx';

var BackgroundDose = React.createClass({

	getInitialState:function() {
	    return {
	        weight : '',
	        results : false,
	        backgroundState: this.props.backgroundState
	    };
	},

	componentDidMount: function(){
		console.log('BackgroundDose Mounted');	
	},

	handleChange:function(type,evt){
		if(type == 'Weight'){
			if(evt.target.value >= 40 && evt.target.value <= 130){
				this.setState({
					weight: evt.target.value
				})
				this.checkEmptyInputs();
			}
			else{
				this.setState({
					weight: ''
				})
				this.checkEmptyInputs();
			}
		}
	},

	checkEmptyInputs:function(){
	  console.log(this.state.weight);
      $('form > p > input').keyup(function() {
        var empty = false;
        $('form > p > input').each(function(item) {
            if ($(item).val() == '' || this.state.weight == '') {
            	console.log('set empty true');
                empty = true;
            }
        }.bind(this));
        console.log(empty);
        if (empty) {
            $('#calculateButton').attr('disabled', 'disabled');
        } else {
            $('#calculateButton').removeAttr('disabled');        
        }
     }.bind(this));
    },

    handleSubmit:function(evt){
    	evt.preventDefault();
    	this.setState({
    		results: true,
    	})
    },

	render: function() {
		return (
			<div>
				<div className="column is-6 inlineblocked backgroundDiv formMarginRight">
					<h1 className="title is-1">Background insulin dose</h1>
					<form onSubmit = {this.handleSubmit}>
						<label className="label">Body weight (kg)</label>
						<p className="control">
						  <input className="input" onChange={this.handleChange.bind(null,'Weight')} type="number" placeholder="40 - 130" />
						</p>
						<p className="control buttonPosition">
	  						<button id="calculateButton" className="button is-medium is-info" disabled="disabled">Calculate insuline dose</button>
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

module.exports = BackgroundDose;