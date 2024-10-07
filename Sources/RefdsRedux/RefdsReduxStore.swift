import Foundation
import SwiftUI

@MainActor
public class RefdsReduxStore: ObservableObject {
    @Published public var state: RefdsReduxState
    public let reducer: RefdsReduxReducer<RefdsReduxState>
    public let middlewares: [RefdsReduxMiddleware]
    
    public init(
        state: RefdsReduxState,
        reducer: RefdsReduxReducer<RefdsReduxState>,
        middlewares: [RefdsReduxMiddleware] = []
    ) {
        self._state = Published(initialValue: state)
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    public func dispatch(action: RefdsReduxAction) async {
        let stateReduced = await reducer.reduce(
            state: state,
            action: action
        )
        
        withAnimation(.easeInOut) { state = stateReduced }
        
        for middleware in middlewares {
            let actions = middleware.middleware(
                state: stateReduced,
                action: action
            )
            
            for await action in actions {
                await dispatch(action: action)
            }
        }
    }
}
