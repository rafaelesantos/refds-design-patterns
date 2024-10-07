import Foundation

public protocol RefdsReduxMiddleware {
    func middleware<State>(
        state: State,
        action: RefdsReduxAction
    ) -> AsyncStream<RefdsReduxAction>
}
