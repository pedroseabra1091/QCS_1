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
			this.setState({
				background: false,
				standard : true,
				personal: false,
			})
		}
		else if(type == 'Personal'){
			this.setState({
				background:false,
				standard: false,
				personal : true,
			})
		}
		else if(type == 'Background'){
			this.setState({
				background: true,
				personal:false,
				standard:false,

			})
		}
	},

	render: function() {
		return (
			<div className = "columns">
				<div className="column is-one-quarter menu">
					<aside className="menu">
					  <p className="menu-label">
					    Insulin Calculator
					  </p>
					  <ul className="menu-list">
					    <li onClick = {this.handleClick.bind(null,'Standard')}><a>Standard Sensitivity</a></li>
					    <li onClick = {this.handleClick.bind(null,'Personal')}><a>Personal Sensitivity</a></li>
					    <li onClick = {this.handleClick.bind(null,'Background')}><a>Background insuline dose</a></li>
					  </ul>
					</aside>
				</div>
				{this.state.standard ? <PersonalSensitivity /> : null}
				{this.state.personal ? <StandardSensitivity /> : null}
				{this.state.background ? <BackgroundDose /> : null}
			</div>
		);
	}

});

module.exports = App;