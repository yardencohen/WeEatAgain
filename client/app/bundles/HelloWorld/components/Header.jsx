import React, { PropTypes } from 'react';

export default class HelloWorld extends React.Component {

    render() {
        return (
            <header className="business-header">
                <div className="container">
                    <div className="row">
                        <div className="col-lg-12  text-center">
                            <br /><br /><br /><br /><br /><br />
                                <hr />
                                    <a href="/">
                                        <h1 className="tagline">WeEatAgain</h1>
                                    </a>
                                    <hr />
                                        <p>Is it lunchtime already?</p>
                                        <p>Choose a place to eat out of these recommended resturants</p>
                                        <br />
                        </div>
                    </div>
                </div>
            </header>
        );
    }
}
