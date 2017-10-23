import 'babel-polyfill'

// presentation
import React from 'react'
import { render } from 'react-dom'
import App from './components/App'

import { Provider } from 'react-redux'
// reducer
import rootReducer from './reducers'
// store
import { createStore, applyMiddleware } from 'redux'
import thunkMiddleware from 'redux-thunk'
import { createLogger } from 'redux-logger'

import {
  listShorts
} from './actions'

const loggerMiddleware = createLogger()

const store = createStore(
  rootReducer,
  applyMiddleware(
    thunkMiddleware,
    loggerMiddleware
  )
)

store.dispatch(listShorts())

render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
)
