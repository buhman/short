import fetch from 'isomorphic-fetch'

// raw state changes

export const request = () => {
  return {
    type: 'REQUEST'
  }
}

export const responseShort = (short) => {
  return {
    type: 'RESPONSE_SHORT',
    item: short
  }
}

export const responseShorts = (shorts) => {
  return {
    type: 'RESPONSE_SHORTS',
    items: shorts
  }
}

// api actions

export const addShort = (href) => {
  return dispatch => {
    dispatch(request())
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
    dispatch(request())
    return fetch(`http://localhost:4000/api/urls`)
      .then(response => response.json())
      .then(json => dispatch(
        responseShorts(json['data'])
      ))
  }
}
