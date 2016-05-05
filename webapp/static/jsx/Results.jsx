import React from 'react';

var Results = React.createClass({

	componentDidUpdate:function(){
	      console.log(this.props.value);
	},

	render: function() {
		return (
			<div className="container">
			  	<h2 className="title is-2 white resultsHeader">Mealtime insuline results</h2>
			  	<img className="center longPaddingTop position" src ="../../static/assets/syringe.png" />
			  	<br></br>
			  	<h2 className="title is-2 white centerText">{this.props.value}</h2>
			  	<br></br>
			  	<p className="subtitle is-4 centerText white">{this.props.message}</p>
			</div>
		);
	}

});

module.exports = Results;