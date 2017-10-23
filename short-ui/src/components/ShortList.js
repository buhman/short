import React from 'react'
import Short from './Short'

const ShortList = ({ shorts }) => (
  <table>
    <thead>
      <tr>
        <td><strong>id</strong></td>
        <td><strong>href</strong></td>
        <td><strong>actions</strong></td>
      </tr>
    </thead>
    <tbody>
    {
      shorts.map(short => (
        <Short key={short.id} short={short} />
      ))
    }
    </tbody>
  </table>
)

export default ShortList
