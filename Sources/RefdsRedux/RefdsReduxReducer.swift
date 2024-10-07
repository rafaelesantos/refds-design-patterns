import Foundation

public protocol RefdsReduxReducer {
    func reduce(
        state: RefdsReduxState,
        action: RefdsReduxAction
    ) -> RefdsReduxState
}
