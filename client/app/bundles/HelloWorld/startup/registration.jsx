import ReactOnRails from 'react-on-rails';

import HelloWorld from '../components/HelloWorld';

import Header from '../components/Header';

import ResturantsList from '../components/ResturantsList';

import ResturantItem from '../components/ResturantItem';

import ResturantIndex from '../components/ResturantIndex';

import NewResturantForm from '../components/NewResturantForm';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld, Header, ResturantsList, ResturantItem, ResturantIndex, NewResturantForm
});
