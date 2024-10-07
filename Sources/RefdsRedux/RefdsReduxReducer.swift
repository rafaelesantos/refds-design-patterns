import Foundation

public protocol RefdsReduxReducer {
    func reduce<State>(
        state: State,
        action: RefdsReduxAction
    ) -> State
}
