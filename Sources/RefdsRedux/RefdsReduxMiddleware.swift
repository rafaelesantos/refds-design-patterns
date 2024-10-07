import Foundation

public protocol RefdsReduxMiddleware {
    func middleware<State: RefdsReduxState>(
        state: State,
        action: RefdsReduxAction
    ) -> AsyncStream<RefdsReduxAction>
}
