import React from 'react';
import PropTypes from 'prop-types';

export default class Filters extends React.Component {
    static propTypes = {
        cuisines: PropTypes.array.isRequired,
        updateCuisineFilter: PropTypes.func.isRequired,
        updateRatingFilter: PropTypes.func.isRequired
    };

    constructor(props) {
        super(props);
        this.state = {
            cuisines: this.props.cuisines
        };
        this.state.cuisines.unshift('All');
    }

    handleCuisineFilterChange = (e) => {
        this.props.updateCuisineFilter(e.target.value);
    };

    handleRatingFilterChange = (e) => {
        this.props.updateRatingFilter(e.target.value);
    };

    render () {
        let lines = this.state.cuisines.map((cuisine) => {
            return <option key={cuisine} value={cuisine}>{cuisine}</option>
        });
        return (
            <div className="filters">
                Cuisine:
                <select onChange={this.handleCuisineFilterChange}>{lines}</select>
                Rating above or equal to:
                <select onChange={this.handleRatingFilterChange}>
                    <option value="0">0</option>
                    <option value="1">1</option>
                    <option value="2">2</option>.
                    <option value="3">3</option>
                </select>
            </div>
        );
    };

}

