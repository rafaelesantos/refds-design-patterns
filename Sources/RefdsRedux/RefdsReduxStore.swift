import Foundation
import SwiftUI

public final class RefdsReduxStore<State>: ObservableObject {
    @Published public var state: State
    
    public var middlewares: [RefdsReduxMiddleware<State>]
    public var reducer: RefdsReduxReducer<State>
    
    private let queue = DispatchQueue(
        label: "refds.designPatterns.redux.middleware",
        qos: .userInteractive
    )
    
    public init(
        reducer: @escaping RefdsReduxReducer<State>,
        state: State,
        middlewares: [RefdsReduxMiddleware<State>] = []
    ) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    public func dispatch(action: RefdsReduxAction) {
        DispatchQueue.main.async {
            withAnimation {
                self.state = self.reducer(self.state, action)
            }
        }
        
        self.middlewares.forEach { middleware in
            queue.async {
                middleware(self.state, action, self.dispatch)
            }
        }
    }
}
