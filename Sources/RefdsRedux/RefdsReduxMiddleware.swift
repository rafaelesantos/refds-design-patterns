import Foundation

public typealias RefdsReduxMiddlewareCompletion = (RefdsReduxAction) -> Void
public typealias RefdsReduxMiddleware<State> = (State, RefdsReduxAction, @escaping RefdsReduxMiddlewareCompletion) -> Void

public protocol RefdsReduxMiddlewareProtocol {
    var middleware: RefdsReduxMiddleware<RefdsReduxState> { get }
}
