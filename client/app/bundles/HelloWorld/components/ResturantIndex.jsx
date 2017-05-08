import React from 'react';
import PropTypes from 'prop-types';
import ResturantsList from "./ResturantsList";
import Filters from "./Filters";

export default class ResturantIndex extends React.Component {

    static propTypes = {
        resturants: PropTypes.array.isRequired,
        cuisineTitles: PropTypes.array.isRequired,
        tenbis: PropTypes.string.isRequired,
        newResturantPath: PropTypes.string.isRequired
    };

    constructor (props) {
        super(props);
        this.state = {
            resturants: this.props.resturants,
            cuisineFilter: '',
            ratingFilter: 0,
            currentResturants: this.props.resturants
        }
    };

    handleRatingFilterUpdate = (filterValue) => {
        this.setState ({
            ratingFilter: parseInt(filterValue)
        }, function() {
            this.calcFilter();
        });
    };

    handleCuisineFilterUpdate = (filterValue) => {
        if (filterValue === 'All') {
            filterValue = '';
        }
        this.setState ({
            cuisineFilter: filterValue
        }, function() {
            this.calcFilter();
        });
    };

    calcFilter () {
        let new_resturants = this.props.resturants;
        if (this.state.cuisineFilter) {
            new_resturants = new_resturants.filter(function(resturant) {
                const match = resturant.cuisine_title.toLowerCase().indexOf(this.state.cuisineFilter.toLowerCase());
                return (match !== -1);
            }.bind(this));
        }
        if (this.state.ratingFilter) {
            new_resturants = new_resturants.filter(function(resturant) {
                return (resturant.average_rating >= this.state.ratingFilter)
            }.bind(this));
        }
        this.setState ({
            currentResturants: new_resturants
        });
    }

    render () {
        return (
            <div>
                <Filters updateCuisineFilter={this.handleCuisineFilterUpdate}
                         cuisines={this.props.cuisineTitles}
                         updateRatingFilter={this.handleRatingFilterUpdate}
                />
                <ResturantsList resturants={this.state.currentResturants} tenbis={this.props.tenbis} />
                <a href={this.props.newResturantPath}>New Resturant</a>
            </div>
        )
    }

}

