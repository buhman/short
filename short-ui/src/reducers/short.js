const short = (state = {
  isFetching: false,
  items: []
}, action) => {
  switch (action.type) {
    case 'REQUEST':
      return Object.assign({}, state, {
        isFetching: true
      })
    case 'RESPONSE_SHORT':
      return Object.assign({}, state, {
        isFetching: false,
        items: [
          ...state.items,
          action.item
        ]
      })
    case 'RESPONSE_SHORTS':
      return Object.assign({}, state, {
        isFetching: false,
        items: [
          ...action.items
        ]
      })
    case 'DELETED_SHORT':
      return Object.assign({}, state, {
        isFetching: false,
        items: state.items.filter(item =>
          item.id !== action.id
        )
      })
    default:
      return state
  }
}

export default short
