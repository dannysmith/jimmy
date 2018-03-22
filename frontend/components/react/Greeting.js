import React from "react"
import PropTypes from "prop-types"

class Greeting extends React.Component {
  render () {
    return (
      <div className="greeting">
        <h1>{this.props.greeting}</h1>
      </div>
    );
  }
}

Greeting.propTypes = {
  greeting: PropTypes.string
};

export default Greeting
