import React, { Component } from 'react';
import styled from 'styled-components';
import PropTypes from 'prop-types';

const Container = styled.div`
	/* margin-top: 0.3rem; */
	text-align: center;
	font-family: 'Roboto', sans-serif;
`;

const Input = styled.input`
	padding: 1rem;
	margin: 0.5em;
	border: 1px solid #efefef;
	border-radius: 30px;
	box-shadow: 0px 0px 7px -3px rgba(0, 0, 0, 0.66);
	font-size: 1.5rem;
	width: 250px;
	&:focus {
		box-shadow: 0 0 3pt 2pt rgba(49, 132, 242, 1);
		outline: none;
	}
`;

const SubBnt = styled.button`
	width: 50px;
	height: 2.2rem;
	margin-top: 2rem;
	margin-left: 15px;
	font-size: 1.4rem;
	border-radius: 2px;
`;

class TestScraperForm extends Component {
	state = {
		inputData: {
			url: ''
		}
	};

	handleInput = event => {
		//Event handler for when you start typing in a form
		this.setState({
			...this.state,
			inputData: {
				...this.state.inputData,
				[event.target.name]: event.target.value
			}
		});
	};

	handleURL = event => {
		//Event handler for when you click a button that you want to trigger info added
		event.preventDefault();
		this.props.sendUrl(this.state.inputData, this.props.serverToken);
		// console.log('inputData:', this.state.inputData);
		this.resetForm();
	};

	resetForm() {
		this.setState({
			...this.state,
			inputData: {
				...this.state.inputData,
				url: ''
			}
		});
	}

	render() {
		return (
			<Container>
				<form>
					<Input
						type="text"
						name="url"
						placeholder="http://..."
						value={this.state.inputData.url}
						onChange={this.handleInput}
					/>
					<SubBnt onClick={this.handleURL}>Save</SubBnt>
				</form>
			</Container>
		);
	}
}

TestScraperForm.propTypes = {
	serverToken: PropTypes.object.isRequired,
	sendUrl: PropTypes.func.isRequired
};

export default TestScraperForm;
