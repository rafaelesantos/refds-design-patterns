import Foundation

public protocol RefdsReduxReducer {
    func reduce<State: RefdsReduxState>(
        state: State,
        action: RefdsReduxAction
    ) -> State
}
