import React, { PropTypes } from 'react';

export default class ResturantItem extends React.Component {
    componentDidMount(){
        console.log("mounted");
        console.log(this.props);
    };

    constructor (props) {
        super(props);
        this.state = {
            resturant: JSON.stringify(this.props.resturant),
            average_rating: this.props.average_rating,
            cuisine_image: this.props.cuisine_image,
            cuisine_title: this.props.cuisine_title,
            tenbis_image: this.props.tenbis_image
        };
    }

    reviewStars(num) {
        let stars = [];
        for(let i= 0; i < num; i++) {
            stars.push(<i key={i} className="fa fa-star" aria-hidden="true" />);
        }
        return (
            <div>{stars}</div>
        );
    }

    tenbis() {
        if (this.props.resturant.tenbis) {
            return (
                <div className="tenbis">
                    <img src={this.props.tenbis_image} />
                </div>
            )
        }
    }

    render () {
        const resturant = this.props.resturant;
        const stars = this.reviewStars(this.props.average_rating);
        const tenbis = this.tenbis();
        return (
            <li className="list-group-item" id={resturant.id}>
                <div className="col-md-2">
                    <img className="cuisine-image" src={this.props.cuisine_image} />
                </div>
                <div className="col-md-6">
                    <div className="subtitle">{resturant.name}</div>
                    <div>{this.props.cuisine_title}</div>
                    {stars}
                    {tenbis}

                </div>
            </li>
        )

    }
}