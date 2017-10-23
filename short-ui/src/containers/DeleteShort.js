import React from 'react'
import { connect } from 'react-redux'
import { deleteShort } from '../actions'

let DeleteShort = ({ id, fetching, dispatch }) => {
  return (
    <button onClick={e => {
      e.preventDefault()
      dispatch(deleteShort(id))
    }} disabled={fetching[id]}>
      Delete Short
    </button>
  )
}

const mapStateToProps = state => {
  return {
    fetching: state.short.fetching
  }
}

DeleteShort = connect(
  mapStateToProps
)(DeleteShort)

export default DeleteShort
