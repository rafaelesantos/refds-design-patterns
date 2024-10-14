import Foundation

@attached(extension, conformances: RefdsReduxReducerProtocol)
public macro RefdsReduxReducer<
    State: RefdsReduxStateProtocol,
    Action: RefdsReduxActionProtocol
>() = #externalMacro(module: "RefdsReduxMacros", type: "RefdsReduxReducerMacro")

public protocol RefdsReduxReducerProtocol {
    associatedtype State: RefdsReduxStateProtocol
    associatedtype Action: RefdsReduxActionProtocol
    
    func reduce(
        state: State,
        action: Action
    ) async -> State
}
