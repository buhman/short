import React from 'react'
import { connect } from 'react-redux'
import { addShort } from '../actions'

let AddShort = ({ dispatch }) => {
  let input

  return (
    <form onSubmit={e => {
      e.preventDefault()
      if (!input.value.trim()) {
        return
      }
      dispatch(addShort(input.value))
      input.value = ''
    }}>
      <input ref={node => {
        input = node
      }} />
      <button type="submit">
        Add Short
      </button>
    </form>
  )
}

AddShort = connect()(AddShort)

export default AddShort
