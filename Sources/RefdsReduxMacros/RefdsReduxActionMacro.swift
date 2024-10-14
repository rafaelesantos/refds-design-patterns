import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct RefdsReduxActionMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let enumDecl = node.as(EnumDeclSyntax.self) else {
            fatalError("@RefdsReduxAction must be applied to an enum.")
        }
        let protocolConformance = """
        extension \(enumDecl.name.text): RefdsReduxActionProtocol {}
        """
        return ExprSyntax(stringLiteral: protocolConformance)
    }
}
