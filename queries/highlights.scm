; Identifier conventions

; Assume all-caps names are constants
((identifier) @entity.name.constant.rust
 (#match? @entity.name.constant.rust "^[A-Z][A-Z\\d_]+$'"))

; Assume that uppercase names in paths are types
((scoped_identifier
  path: (identifier) @entity.name.type.rust)
 (#match? @entity.name.type.rust "^[A-Z]"))
((scoped_identifier
  path: (scoped_identifier
    name: (identifier) @entity.name.type.rust))
 (#match? @entity.name.type.rust "^[A-Z]"))

; Assume other uppercase names are enum constructors
((identifier) @variable.function.constructor.rust
 (#match? @variable.function.constructor.rust "^[A-Z]"))

; Function calls

(call_expression
  function: (identifier) @variable.function.rust)
(call_expression
  function: (field_expression
    field: (field_identifier) @variable.function.method.rust))
(call_expression
  function: (scoped_identifier
    "::"
    name: (identifier) @variable.function.rust))

(generic_function
  function: (identifier) @entity.name.function.rust)
(generic_function
  function: (scoped_identifier
    name: (identifier) @entity.name.function.rust))
(generic_function
  function: (field_expression
    field: (field_identifier) @entity.name.function.method.rust))

(macro_invocation
  macro: (identifier) @variable.function.macro.rust
  "!" @variable.function.macro.rust)

; Function definitions

(function_item (identifier) @entity.name.function.rust)
(function_signature_item (identifier) @entity.name.function.rust)

; Other identifiers

(type_identifier) @storage.type.rust
(primitive_type) @storage.type.language.rust
(field_identifier) @variable.other.member.rust

(line_comment) @comment.line.rust
(block_comment) @comment.block.rust

"(" @punctuation.section.parens.begin
")" @punctuation.section.parens.end
"[" @punctuation.section.brackets.begin
"]" @punctuation.section.brackets.end

(type_arguments
  "<" @punctuation.definition.generic.begin
  ">" @punctuation.definition.generic.end)
(type_parameters
  "<" @punctuation.definition.generic.begin
  ">" @punctuation.definition.generic.end)

"::" @punctuation.separator
"." @punctuation.separator
";" @punctuation.terminator

(parameter (identifier) @variable.parameter)

(lifetime (identifier) @entity.name.label)

"async" @keyword.other
"await" @keyword.other
"break" @keyword.control
"const" @keyword.other
"continue" @keyword.control
"default" @keyword.other
"dyn" @keyword.other
"else" @keyword.control
"enum" @keyword.other
"extern" @keyword.other
"fn" @keyword.declaration
"for" @keyword.control
"if" @keyword.conditional
"impl" @keyword.other
"in" @keyword.control
"let" @keyword.declaration
"let" @keyword.declaration
"loop" @keyword.control
"macro_rules!" @keyword
"match" @keyword.conditional
"mod" @keyword.declaration
"move" @keyword.other
"pub" @keyword.other
"ref" @keyword.other
"return" @keyword.other
"static" @keyword.other
"struct" @keyword.other
"trait" @keyword.other
"type" @keyword.declaration
"union" @keyword.declaration
"unsafe" @keyword.other
"use" @keyword.import
"where" @keyword.control
"while" @keyword.control
(mutable_specifier) @keyword.other
(use_list (self) @keyword.import)
(scoped_use_list (self) @keyword.import)
(scoped_identifier (self) @keyword.other)
(super) @keyword.other

(self) @variable.language

(char_literal) @string
(string_literal) @string
(raw_string_literal) @string

(boolean_literal) @constant.language
(integer_literal) @constant.language
(float_literal) @constant.language

(escape_sequence) @constant.character.escape

(attribute_item) @attribute
(inner_attribute_item) @attribute

"as" @keyword.operator
"*" @keyword.operator
"&" @keyword.operator
"'" @keyword.operator
