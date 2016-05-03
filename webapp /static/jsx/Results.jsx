import React from 'react';

var Results = React.createClass({

	render: function() {
		return (
			<div className="container">
			  	<h2 className="title is-2 white resultsHeader">Mealtime insuline results</h2>
			  	<img className="center longPaddingTop" src ="../../static/assets/meal.png" />
			  	<br></br>
			  	<h2 className="title is-2 centerText">50 mg/dl</h2>
			  	<p className="subtitle is-4 centerText white">For a standard sensitivity</p>
			</div>
		);
	}

});

module.exports = Results;