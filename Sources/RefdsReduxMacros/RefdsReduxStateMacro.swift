import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct RefdsReduxStateMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let structDecl = node.as(StructDeclSyntax.self) else {
            fatalError("@RefdsReduxState must be applied to an struct.")
        }
        let protocolConformance = """
        extension \(structDecl.name.text): RefdsReduxStateProtocol {}
        """
        return ExprSyntax(stringLiteral: protocolConformance)
    }
}
