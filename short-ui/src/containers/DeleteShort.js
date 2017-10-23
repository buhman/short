import React from 'react'
import { connect } from 'react-redux'
import { deleteShort } from '../actions'

let DeleteShort = ({ id, dispatch }) => {
  return (
    <button onClick={e => {
      e.preventDefault()
      dispatch(deleteShort(id))
    }}>
      Delete Short
    </button>
  )
}

DeleteShort = connect()(DeleteShort)

export default DeleteShort
