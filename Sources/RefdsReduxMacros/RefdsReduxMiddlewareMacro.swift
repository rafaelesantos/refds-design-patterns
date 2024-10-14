import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct RefdsReduxMiddlewareMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let actorDecl = node.as(ActorDeclSyntax.self) else {
            fatalError("@RefdsReduxState must be applied to an actor.")
        }
        let arguments = node.arguments
        guard arguments.count == 1,
              let stateType = arguments.first?.expression.description else {
            fatalError("@RefdsReduxMiddleware must be applied with State type, e.g. @RefdsReduxMiddleware(State).")
        }
        
        let protocolConformance = """
        extension \(actorDecl.name.text): RefdsReduxMiddlewareProtocol {
            typealias State = \(stateType)
        }
        """
        
        return ExprSyntax(stringLiteral: protocolConformance)
    }
}
