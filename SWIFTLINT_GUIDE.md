# SwiftLint Configuration Guide for CartoniaApp

This project uses SwiftLint to maintain high code quality and help developers improve their Swift skills. The configuration is designed to be educational and enforce best practices.

## 🚀 Quick Start

### Running SwiftLint
```bash
# Check all files
swiftlint

# Check specific files
swiftlint lint CartoniaApp/ContentView.swift

# Auto-fix issues where possible
swiftlint --fix

# Check with specific rules
swiftlint --enable rule_name
```

### Pre-commit Hook
The project includes a pre-push hook that automatically runs SwiftLint and unit tests before allowing pushes. This ensures code quality is maintained.

## 📋 Configuration Overview

### Key Rules Enabled

#### Code Style & Formatting
- **Line Length**: 120 characters warning, 150 error
- **Function Body Length**: 50 lines warning, 100 error
- **Type Body Length**: 300 lines warning, 500 error
- **Cyclomatic Complexity**: 10 warning, 20 error
- **Nesting**: 3 levels warning, 6 error

#### Swift Best Practices
- **Force Unwrapping**: Warnings for `!` usage
- **Force Casting**: Warnings for `as!` usage
- **Implicitly Unwrapped Optionals**: Warnings for `!` in declarations
- **Sorted Imports**: Automatically sort import statements
- **Trailing Closures**: Prefer trailing closure syntax
- **Guard Statements**: Encourage guard over if-let for early returns

#### Educational Rules
- **Explicit Type Annotations**: Encourage explicit types for clarity
- **Vertical Whitespace**: Consistent spacing around braces
- **Modifier Order**: Consistent access control ordering
- **Function Parameter Count**: Limit to 5 parameters warning, 8 error

## 🛠️ Common Issues and Fixes

### 1. Sorted Imports
**Issue**: Imports should be sorted alphabetically
```swift
// ❌ Wrong
import XCTest
@testable import CartoniaApp

// ✅ Correct
@testable import CartoniaApp
import XCTest
```

### 2. Vertical Whitespace
**Issue**: Inconsistent spacing around braces
```swift
// ❌ Wrong
class MyClass {

    func myFunction() {
        // code
    }

}

// ✅ Correct
class MyClass {
    func myFunction() {
        // code
    }
}
```

### 3. Explicit Type Annotations
**Issue**: Missing type annotations for clarity
```swift
// ❌ Wrong
let result = someFunction()

// ✅ Correct
let result: String = someFunction()
```

### 4. Force Unwrapping
**Issue**: Using `!` instead of safe unwrapping
```swift
// ❌ Wrong
let value = optionalValue!

// ✅ Correct
guard let value = optionalValue else { return }
// or
if let value = optionalValue {
    // use value
}
```

### 5. Function Complexity
**Issue**: Functions that are too long or complex
```swift
// ❌ Wrong - Too long
func processUserData() {
    // 100+ lines of code
}

// ✅ Correct - Break into smaller functions
func processUserData() {
    validateInput()
    transformData()
    saveToDatabase()
}
```

## 🔧 Auto-Fix Commands

Many issues can be automatically fixed:

```bash
# Fix all auto-fixable issues
swiftlint --fix

# Fix specific rules
swiftlint --fix --enable trailing_whitespace
swiftlint --fix --enable sorted_imports
```

## 📚 Learning Resources

### Swift Style Guide
- [Apple's Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- [Ray Wenderlich Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)

### SwiftLint Documentation
- [SwiftLint Rules](https://realm.github.io/SwiftLint/rule-directory.html)
- [Custom Rules](https://github.com/realm/SwiftLint#custom-rules)

## 🎯 Best Practices for Developers

### 1. Write Self-Documenting Code
- Use descriptive variable and function names
- Add comments for complex business logic
- Prefer explicit over implicit

### 2. Keep Functions Small
- One responsibility per function
- Use guard statements for early returns
- Extract complex logic into separate functions

### 3. Handle Optionals Safely
- Use guard-let for early returns
- Use if-let for conditional unwrapping
- Avoid force unwrapping unless absolutely necessary

### 4. Follow Swift Conventions
- Use camelCase for variables and functions
- Use PascalCase for types
- Use descriptive names that explain intent

## 🚨 Pre-Push Hook

The pre-push hook will:
1. Run SwiftLint checks
2. Run unit tests
3. Block push if any issues are found

To bypass the hook (not recommended):
```bash
git push --no-verify
```

## 🔄 Integration with XcodeGen

When you migrate to XcodeGen, the SwiftLint configuration will work seamlessly. The `.swiftlint.yml` file will be automatically recognized and used by SwiftLint.

## 📊 Monitoring Code Quality

### IDE Integration
- SwiftLint integrates with Xcode to show warnings inline
- Use Xcode's Issue Navigator to see all SwiftLint warnings
- Enable "Treat Warnings as Errors" for stricter enforcement

### CI/CD Integration
- SwiftLint can be integrated into your CI/CD pipeline
- Generate reports for code quality metrics
- Track improvements over time

## 🤝 Contributing

When contributing to this project:
1. Run `swiftlint` before committing
2. Fix all warnings and errors
3. Write tests for new functionality
4. Follow the established code style

## 📞 Support

If you encounter issues with SwiftLint:
1. Check the [SwiftLint documentation](https://github.com/realm/SwiftLint)
2. Run `swiftlint rules` to see all available rules
3. Ask the team for help with specific rule violations

Remember: The goal is to write clean, maintainable, and readable Swift code! 🎉
