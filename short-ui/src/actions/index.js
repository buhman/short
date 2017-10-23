import fetch from 'isomorphic-fetch'

export const recieveShort = (short) => {
  return {
    type: 'RECIEVE_SHORT',
    short: short
  }
}

export const addShort = (href) => {
  return dispatch => {
    return fetch(`http://localhost:4000/api/urls`, {
      method: 'post',
      headers: {
        'content-type': 'application/json'
      },
      body: JSON.stringify({'url': {'href': href}})
    })
      .then(response => response.json())
      .then(json => dispatch(recieveShort(
        json['data']
      )))
  }
}

export const recieveShorts = (shorts) => {
  return {
    type: 'RECIEVE_SHORTS',
    shorts: shorts
  }
}

export const listShorts = () => {
  return dispatch => {
    return fetch(`http://localhost:4000/api/urls`)
      .then(response => response.json())
      .then(json => dispatch(recieveShorts(
        json['data']
      )))
  }
}
