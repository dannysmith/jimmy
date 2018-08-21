import React from "react";
import PropTypes from "prop-types";

import styles from "./ExampleGreeting.module.css";

class ExampleGreeting extends React.Component {
  render() {
    console.log(styles);
    return (
      <div className={styles.exampleGreeting}>
        <h1>From React: {this.props.greeting}</h1>
      </div>
    );
  }
}

ExampleGreeting.propTypes = {
  greeting: PropTypes.string
};

export default ExampleGreeting;
