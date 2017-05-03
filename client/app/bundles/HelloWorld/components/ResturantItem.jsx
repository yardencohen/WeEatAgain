import React from 'react';
import PropTypes from 'prop-types';
export default class ResturantItem extends React.Component {

    static propTypes = {
        resturant: PropTypes.object.isRequired,
        tenbis: PropTypes.string.isRequired
    };

    constructor(props) {
        super(props);
        this.state = {
            distance: 'Unknown'
        }
    }

    
    renderResturantDistance() {
        navigator.geolocation.getCurrentPosition((position) => {
            $.ajax({
                url: '/resturants/distance_calc',
                dataType: 'json',
                type: 'POST',
                data: {id: this.props.resturant.id, user_location: position},
                success: ((res) => {
                    if (res["status"] == 'OK'){
                        let distance_item = res["rows"][0]["elements"][0];
                        if (distance_item["status"] == "OK") {
                            this.setState({
                                distance: distance_item["distance"]["text"]
                            });
                        }
                    }
                }),
                error(xhr, thrownError) {
                    console.log(xhr.status);
                    console.log(thrownError);
                }
            })
        });
        return (
            <div>Distance: {this.state.distance}</div>
        );
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

    tenbisIcon() {
        return this.props.resturant.tenbis && (
            <div className="tenbis">
                <img src={this.props.tenbis} />
            </div>
            );
    }

    render () {
        const resturant = this.props.resturant;
        return (
            <li className="list-group-item" id={resturant.id}>
                <div className="col-md-3 col-sm-4 col-xs-4">
                    <img className="cuisine-image" src={resturant.cuisine_image} />
                </div>
                <div className="col-md-6 col-sm-6">
                    <div className="subtitle">
                        <a href={"/resturants/" + resturant.id}>{resturant.name}</a>
                    </div>
                    <div>{resturant.cuisine_title}</div>
                    {this.reviewStars(resturant.average_rating)}
                    {this.tenbisIcon()}
                    <div>Max delivery time: {resturant.max_delivery_time} minutes</div>
                    {this.renderResturantDistance()}
                </div>
                <div className="col-md-3 col-sm-3">
                    <a href={this.props.resturant.new_review}>Add a review</a>
                </div>
            </li>
        )

    }
}