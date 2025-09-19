#!/bin/bash

# SwiftLint Auto-Fix Script for CartoniaApp
# This script helps developers fix common SwiftLint issues automatically

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the correct directory
if [ ! -f "CartoniaApp.xcodeproj/project.pbxproj" ]; then
    print_error "CartoniaApp.xcodeproj not found. Please run this from the project root directory."
    exit 1
fi

# Check if SwiftLint is installed
if ! command -v swiftlint &> /dev/null; then
    print_error "SwiftLint not found. Please install it with: brew install swiftlint"
    exit 1
fi

print_status "🔧 Starting SwiftLint auto-fix process..."

# Run SwiftLint with auto-fix
print_status "Running SwiftLint auto-fix..."
if swiftlint --fix; then
    print_success "Auto-fix completed successfully! ✅"
else
    print_warning "Some issues could not be auto-fixed. Manual intervention required."
fi

# Show remaining issues
print_status "Checking for remaining issues..."
if swiftlint lint --quiet; then
    print_success "All SwiftLint issues have been resolved! 🎉"
else
    print_warning "Some issues remain that require manual fixing:"
    echo ""
    swiftlint lint
    echo ""
    print_status "💡 Tips for fixing remaining issues:"
    echo "  • Use 'guard let' instead of 'if let' for early returns"
    echo "  • Add explicit type annotations for clarity"
    echo "  • Break down large functions into smaller ones"
    echo "  • Use descriptive variable and function names"
    echo "  • Remove unnecessary force unwrapping (!)"
fi

print_status "✨ SwiftLint fix process completed!"
print_status "Run 'swiftlint' to see current status or 'git push' to test the pre-push hook."
