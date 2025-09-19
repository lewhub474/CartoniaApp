#!/bin/bash

# Test Pre-Push Hook Script for CartoniaApp
# This script demonstrates how the pre-push hook works

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

print_status "🧪 Testing Pre-Push Hook for CartoniaApp"
echo ""

# Test 1: Run the pre-push hook
print_status "Test 1: Running pre-push hook with current code..."
if .git/hooks/pre-push; then
    print_success "✅ Pre-push hook passed with current code"
else
    print_error "❌ Pre-push hook failed with current code"
fi

echo ""

# Test 2: Demonstrate SwiftLint failure
print_status "Test 2: Demonstrating SwiftLint failure scenario..."
print_warning "To test SwiftLint failure, you can:"
echo "  1. Add a force unwrapping (!) to any Swift file"
echo "  2. Make a function too long (>50 lines)"
echo "  3. Use an implicitly unwrapped optional"
echo "  4. Then run: .git/hooks/pre-push"

echo ""

# Test 3: Demonstrate unit test failure
print_status "Test 3: Demonstrating unit test failure scenario..."
print_warning "To test unit test failure, you can:"
echo "  1. Uncomment the failing assertion in testFailingExample()"
echo "  2. Or add a new test that always fails"
echo "  3. Then run: .git/hooks/pre-push"

echo ""

print_status "📋 Pre-Push Hook Summary:"
echo "  • SwiftLint checks run first (code quality)"
echo "  • Unit tests run second (functionality)"
echo "  • Both must pass for push to be allowed"
echo "  • Use 'git push --no-verify' to bypass (not recommended)"

print_success "🎉 Pre-push hook testing completed!"
