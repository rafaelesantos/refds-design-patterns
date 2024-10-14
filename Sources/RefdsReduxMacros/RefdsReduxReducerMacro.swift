import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct RefdsReduxReducerMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let actorDecl = node.as(ActorDeclSyntax.self) else {
            fatalError("@RefdsReduxState must be applied to an actor.")
        }
        let arguments = node.arguments
        guard arguments.count == 2,
              let stateType = arguments.first?.expression.description,
              let actionType = arguments.last?.expression.description else {
            fatalError("@RefdsReduxReducer must be applied with State and Action types, e.g. @RefdsReduxReducer(State, Action).")
        }
        
        let protocolConformance = """
        extension \(actorDecl.name.text): RefdsReduxReducerProtocol {
            typealias State = \(stateType)
            typealias Action = \(actionType)
        }
        """
        
        return ExprSyntax(stringLiteral: protocolConformance)
    }
}
