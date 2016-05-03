import React from 'react';
import BackgroundDose from './BackgroundDose.jsx';
import PersonalSensitivity from './PersonalSensitivity.jsx';
import StandardSensitivity from './StandardSensitivity.jsx';

var App = React.createClass({

	getInitialState() {
	    return {
	        standard: true,
	        personal:false,
	        background: false,  
	    };
	},

	handleClick: function(type,evt){
		if(type == 'Standard'){
			console.log('entered type')
			this.setState({
				background: false,
				standard : true,
				personal: false,
			})
		}
		else if(type == 'Personal'){
			console.log('entered type');
			this.setState({
				background:false,
				standard: false,
				personal : true,
			})
		}
		else if(type == 'Background'){
			console.log('entered type');
			this.setState({
				background: true,
				personal:false,
				standard:false,

			})
		}
	},

	render: function() {
		var style ={
			'backgroundColor' : 'transparent'	
		};

		var activeStyle = {	
		    backgroundColor: "#1fc8db",
			color: "white"
		};

		return (

			<div className = "columns">
				<div className="column is-2 menu">
					<aside className="menu">
					  <p className="menu-label">
					    Insulin Calculator
					  </p>
					  <ul className="menu-list">
					    <li onClick = {this.handleClick.bind(null,'Standard')}><a style={this.state.standard ? activeStyle : style}>Standard Sensitivity</a></li>
					    <li onClick = {this.handleClick.bind(null,'Personal')}><a style={this.state.personal ? activeStyle : style}>Personal Sensitivity</a></li>
					    <li onClick = {this.handleClick.bind(null,'Background')}><a style={this.state.background ? activeStyle : style}>Background insuline dose</a></li>
					  </ul>
					</aside>
				</div>
				<div className = "column">
					{this.state.standard ? <StandardSensitivity /> : null}
					{this.state.personal ? <PersonalSensitivity  /> : null}
					{this.state.background ? <BackgroundDose  /> : null}
				</div>
			</div>
		);
	}

});

module.exports = App;