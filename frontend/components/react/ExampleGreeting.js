import React from "react"
import PropTypes from "prop-types"

class ExampleGreeting extends React.Component {
  render () {
    return (
      <div className="greeting">
        <h1>{this.props.greeting}</h1>
      </div>
    );
  }
}

ExampleGreeting.propTypes = {
  greeting: PropTypes.string
};

export default ExampleGreeting
