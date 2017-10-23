import ShortList from '../components/ShortList'
import { connect } from 'react-redux'

const mapStateToProps = state => {
  return {
    shorts: state.short
  }
}

const ContainerShortList = connect(
  mapStateToProps
)(ShortList)

export default ContainerShortList
