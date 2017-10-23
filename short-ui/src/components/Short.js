import React from 'react'
import DeleteShort from '../containers/DeleteShort'

const Short = ({ short }) => (
  <tr>
    <td>{short.id}</td>
    <td>{short.href}</td>
    <td><DeleteShort id={short.id} /></td>
  </tr>
)

export default Short
