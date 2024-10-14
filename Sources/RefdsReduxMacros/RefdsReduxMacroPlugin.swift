import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct RefdsReduxMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        RefdsReduxActionMacro.self,
        RefdsReduxStateMacro.self,
        RefdsReduxReducerMacro.self,
        RefdsReduxMiddlewareMacro.self,
        RefdsReduxStoreMacro.self
    ]
}
