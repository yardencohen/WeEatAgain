import React, { PropTypes } from 'react';

export default class ResturantsList extends React.Component {
    componentDidMount(){
        console.log("mounted");
        console.log(this.props);
    };

    constructor (props) {
        super(props);
        this.state = {
            resturants: JSON.stringify(this.props.resturants)
        };
    }

    render() {
        const resturants = this.props.resturants.map((resturant) => {
            return (
                <li key={resturant.id} className="list-group-item">
                    {resturant.name}
                </li>
            );
        });

        return (
        <ul className="list-group">
            {resturants}
        </ul>
        );
    }
}