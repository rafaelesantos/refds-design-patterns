import Foundation

@attached(extension, conformances: RefdsReduxMiddlewareProtocol)
public macro RefdsReduxMiddleware<
    State: RefdsReduxStateProtocol
>() = #externalMacro(
    module: "RefdsReduxMacros",
    type: "RefdsReduxMiddlewareMacro"
)

public protocol RefdsReduxMiddlewareProtocol {
    associatedtype State: RefdsReduxStateProtocol
    
    func middleware(
        state: State,
        action: RefdsReduxActionProtocol
    ) async -> AsyncStream<RefdsReduxActionProtocol>
}
