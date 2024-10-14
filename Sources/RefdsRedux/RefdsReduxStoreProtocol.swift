import Foundation
import SwiftUI

@attached(extension, conformances: RefdsReduxStoreProtocol)
public macro RefdsReduxStore<
    State: RefdsReduxStateProtocol
>() = #externalMacro(
    module: "RefdsReduxMacros",
    type: "RefdsReduxStoreMacro"
)

@MainActor
public protocol RefdsReduxStoreProtocol: ObservableObject {
    associatedtype State: RefdsReduxStateProtocol
    
    var state: State { get set }
    var reducer: (State, RefdsReduxActionProtocol) async -> State { get }
    var middlewares: [(State, RefdsReduxActionProtocol) async -> AsyncStream<RefdsReduxActionProtocol>] { get }
    
    func dispatch(action: RefdsReduxActionProtocol) async
}

public extension RefdsReduxStoreProtocol {
    func dispatch(action: RefdsReduxActionProtocol) async {
        let middlewares = self.middlewares
        let stateReduced = await reducer(state, action)
        
        withAnimation(.easeInOut) { state = stateReduced }
        
        for middleware in middlewares {
            let actions = await middleware(state, action)
            
            for await action in actions {
                await dispatch(action: action)
            }
        }
    }
}
