import React from 'react';
import PropTypes from 'prop-types';

export default class NewResturantForm extends React.Component {

    static propTypes = {
        cuisines: PropTypes.array.isRequired
    };

    componentDidMount() {
        console.log('mounted');
    }

    constructor(props) {
        super(props);
        this.state = {
            name: '',
            cuisine: '',
            tenbis: false,
            address: '',
            maxDeliveryTime: ''
        }
    };

    newResturantSubmit = (e) => {
        e.preventDefault();
        $.ajax({
            url: '/resturants',
            dataType: 'json',
            type: 'POST',
            data: {resturant: {name: this.state.name,
                tenbis: this.state.tenbis,
                address: this.state.address,
                max_delivery_time: this.state.maxDeliveryTime,
                cuisine_id: this.state.cuisine},
            },
            success: function() {
                window.location.href = "/";
            }
        });
    };

    handleNameChange = (e) => {
        this.setState({
            name: e.target.value
        });
    };

    handleCuisineChange = (e) => {
        this.setState({
            cuisine: parseInt(e.target.value)
        });
    };

    handleTenbisChange = (e) => {
        this.setState({
            tenbis: e.target.checked
        });
    };

    handleAddressChange = (e) => {
        this.setState({
            address: e.target.value
        });
    };

    handleMaxDeliveryTimeChange = (e) => {
        this.setState({
            maxDeliveryTime: parseInt(e.target.value)
        });
    };

    renderCuisineSelect() {
        let cuisineSelect;
        cuisineSelect = this.props.cuisines.map((cuisine) => {
            return (<option value={cuisine.id} key={cuisine.id}>{cuisine.title}</option>);
        });
        return (
            <div className="row">
                <div className="col-sm-4 form-group>">
                    <label>Cuisine:</label>
                    <select className="form-control" onChange={this.handleCuisineChange} value={this.state.cuisine}>
                        <option disabled hidden value="" />
                        {cuisineSelect}
                    </select>
                </div>
            </div>
        );
    }

    renderNameInput() {
        return (
            <div className="row">
                <div className="col-sm-4 form-group">
                    <label>Restaurant Name:</label>
                    <input name="resturant[name]"
                           type="string"
                           placeholder="Restaurant Name"
                           value={this.state.name}
                           onChange={this.handleNameChange}
                           className="string form-control"
                    />
                </div>
            </div>
        )
    }

    renderTenbisCheck () {
        return (
            <div className="row">
                <div className="col-sm-4 form-group checkbox">
                    <label>Accepts Tenbis?</label>
                    <input type="checkbox"
                           onChange={this.handleTenbisChange} />
                </div>
            </div>
        )
    }

    renderAddressInput () {
        return (
            <div className="row">
                <div className="col-sm-4 form-group">
                    <label>Resturants Address:</label>
                    <input name="resturant[address]"
                           type="string"
                           placeholder="Restaurant Address"
                           value={this.state.address}
                           onChange={this.handleAddressChange}
                           className="string form-control"
                    />
                </div>
            </div>
        )
    }

    renderMaxDeliveryTimeSelect() {
        return (
            <div className="row">
                <div className="col-sm-4 form-group">
                    <label>Max Delivery Time (Minutes):</label>
                    <select className="form-control" onChange={this.handleMaxDeliveryTimeChange}
                            value={this.state.maxDeliveryTime}>
                        <option value="" disabled hidden />
                        <option value="30">30</option>
                        <option value="40">40</option>
                        <option value="50">50</option>
                        <option value="60">60</option>
                        <option value="70">70</option>
                        <option value="80">80</option>
                        <option value="90">90</option>
                    </select>
                </div>
            </div>
        )
    }

    render() {
        return (
            <div>
                <h1>New Restaurant</h1>
                <form className="resturant-form" onSubmit={this.newResturantSubmit}>
                    <div className="form-inputs"/>
                    {this.renderNameInput()}
                    {this.renderCuisineSelect()}
                    {this.renderTenbisCheck()}
                    {this.renderAddressInput()}
                    {this.renderMaxDeliveryTimeSelect()}
                    <div className='row'>
                        <div className='col-sm-4'>
                            <input type="submit" value="Save" className='btn btn-primary' />
                        </div>
                    </div>
                </form>
            </div>
        )
    }
}
