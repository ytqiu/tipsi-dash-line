import React, { Component } from 'react'
import PropTypes from 'prop-types'
import { View, requireNativeComponent } from 'react-native'

export default class DashLine extends Component {
    static defaultProps = {
        horizontal: true
    }
    static propTypes = {
        ...View.propTypes,
        dashColor: PropTypes.string,
        dashLineWidth: PropTypes.number,
        dashLineSpace: PropTypes.number,
        horizontal: PropTypes.bool
    }

    render() {
        return <DashLineComponent {...this.props} />
    }
}

const DashLineComponent = requireNativeComponent('DashLineComponent', DashLine)
