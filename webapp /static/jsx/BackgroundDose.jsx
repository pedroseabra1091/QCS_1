var React = require('react');

var BackgroundDose = React.createClass({

	getInitialState:function() {
	    return {
	        weight : ''
	    };
	},

	handleChange:function(type,evt){
		if(type == 'Weight')
			this.setState({
				weight: evt.target.value
			})
	},

	render: function() {
		return (
			<div className="column is-one-third">
				<form>
					<label className="label">Body weight (kg)</label>
					<p className="control">
					  <input className="input" onChange={this.handleChange.bind(null,'Weight')} type="text" placeholder="40 - 130" />
					</p>
					<p className="control buttonPosition">
  						<button className="button is-medium is-info">Calculate insuline dose</button>
  					</p>
				</form>	
			</div>
		);
	}

});

module.exports = BackgroundDose;