import ReactOnRails from 'react-on-rails';

import HelloWorld from '../components/HelloWorld';

import Header from '../components/Header';

import ResturantsList from '../components/ResturantsList';

import ResturantItem from '../components/ResturantItem';

import ResturantIndex from '../components/ResturantIndex';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  HelloWorld, Header, ResturantsList, ResturantItem, ResturantIndex
});
