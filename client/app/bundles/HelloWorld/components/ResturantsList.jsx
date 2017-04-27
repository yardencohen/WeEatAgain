import React from 'react';
import PropTypes from 'prop-types';
import ResturantItem from './ResturantItem';

export default class ResturantsList extends React.Component {

    static propTypes = {
        resturants: PropTypes.array.isRequired,
        tenbis: PropTypes.string.isRequired
    };

    render() {
        let content;
        if (this.props.resturants.length > 0) {
            content = this.props.resturants.map((item) => {
                return (
                    <ResturantItem key={item.id} resturant={item} tenbis={this.props.tenbis}/>
                );
            });
        }
        else {
            content = <p>No Results Found</p>
        }
        return (
        <ul className="list-group">
            {content}
        </ul>
        );
    }
}