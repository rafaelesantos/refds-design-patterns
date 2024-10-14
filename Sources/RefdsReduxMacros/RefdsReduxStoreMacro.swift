import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct RefdsReduxStoreMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let enumDecl = node.as(EnumDeclSyntax.self) else {
            fatalError("@RefdsReduxStore must be applied to an enum.")
        }
        
        let arguments = node.arguments
        guard arguments.count == 1,
              let stateType = arguments.first?.expression.description else {
            fatalError("@RefdsReduxStore must be applied with State type, e.g. @RefdsReduxStore(State).")
        }
        
        let protocolConformance = """
        extension \(enumDecl.name.text): RefdsReduxStoreProtocol {
            typealias State = \(stateType)
        }
        """
        
        return ExprSyntax(stringLiteral: protocolConformance)
    }
}
