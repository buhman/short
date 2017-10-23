import fetch from 'isomorphic-fetch'

// raw state changes

export const request = (id) => {
  return {
    type: 'REQUEST',
    fetch: id
  }
}

export const responseShort = (short) => {
  return {
    type: 'RESPONSE_SHORT',
    item: short,
    fetch: '__ADD__'
  }
}

export const responseShorts = (shorts) => {
  return {
    type: 'RESPONSE_SHORTS',
    items: shorts,
    fetch: '__LIST__'
  }
}

export const deletedShort = (id) => {
  return {
    type: 'DELETED_SHORT',
    id: id,
    fetch: id
  }
}

// api actions

export const addShort = (href) => {
  return dispatch => {
    dispatch(request('__ADD__'))
    return fetch(`http://localhost:4000/api/urls`, {
      method: 'post',
      headers: {
        'content-type': 'application/json'
      },
      body: JSON.stringify({'url': {'href': href}})
    })
      .then(response => response.json())
      .then(json => dispatch(
        responseShort(json['data'])
      ))
  }
}

export const listShorts = () => {
  return dispatch => {
    dispatch(request('__LIST__'))
    return fetch(`http://localhost:4000/api/urls`)
      .then(response => response.json())
      .then(json => dispatch(
        responseShorts(json['data'])
      ))
  }
}

export const deleteShort = (id) => {
  return dispatch => {
    dispatch(request(id))
    return fetch(`http://localhost:4000/api/urls/${id}`, {
      method: 'delete'
    })
      .then(() => dispatch(
        deletedShort(id)
      ))
  }
}
