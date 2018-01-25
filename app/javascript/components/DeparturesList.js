import React from "react"
import PropTypes from "prop-types"
class DeparturesList extends React.Component {
  render () {
    return (
      <div>
        <div>Departures: {this.props.departures}</div>
      </div>
    );
  }
}

DeparturesList.propTypes = {
  departures: PropTypes.string
};
export default DeparturesList
