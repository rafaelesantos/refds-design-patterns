import Foundation

@attached(extension, conformances: RefdsReduxActionProtocol)
public macro RefdsReduxAction() = #externalMacro(module: "RefdsReduxMacros", type: "RefdsReduxActionMacro")

public protocol RefdsReduxActionProtocol: Sendable {}
