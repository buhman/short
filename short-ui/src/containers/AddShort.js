import React from 'react'
import { connect } from 'react-redux'
import { addShort } from '../actions'

let AddShort = ({ isFetching, dispatch }) => {
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
      <button type="submit" disabled={isFetching}>
        Add Short
      </button>
    </form>
  )
}

const mapStateToProps = state => {
  return {
    isFetching: state.short.fetching['__ADD__']
  }
}

AddShort = connect(
  mapStateToProps
)(AddShort)

export default AddShort
