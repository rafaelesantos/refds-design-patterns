import Foundation

public typealias RefdsReduxReducer<State> = (State, RefdsReduxAction) -> State

public protocol RefdsReduxReducerProtocol {
    associatedtype State
    var reduce: RefdsReduxReducer<State> { get }
}
