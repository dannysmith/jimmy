import React from "react"
import PropTypes from "prop-types"

class App extends React.Component {
  render () {
    return (
      <div className="site-wrapper">
        <h1>{this.props.greeting}</h1>
      </div>
    );
  }
}

App.propTypes = {
  greeting: PropTypes.string
};
export default App
