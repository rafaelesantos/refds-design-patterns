import Foundation

@attached(extension, conformances: RefdsReduxStateProtocol)
public macro RefdsReduxState() = #externalMacro(module: "RefdsReduxMacros", type: "RefdsReduxStateMacro")

public protocol RefdsReduxStateProtocol: Sendable, Equatable {}
