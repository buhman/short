const short = (state = [], action) => {
  switch (action.type) {
    case 'RECIEVE_SHORT':
      return [
        ...state,
        action.short
      ]
    case 'RECIEVE_SHORTS':
      return action.shorts
    default:
      return state
  }
}

export default short
