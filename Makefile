L# Makefile for CartoniaApp
# Provides convenient commands for development

.PHONY: help lint fix test pre-push clean

# Default target
help:
	@echo "CartoniaApp Development Commands:"
	@echo ""
	@echo "  make lint        - Run SwiftLint checks"
	@echo "  make fix         - Auto-fix SwiftLint issues"
	@echo "  make test        - Run unit tests"
	@echo "  make pre-push    - Run pre-push validation (SwiftLint + Tests)"
	@echo "  make clean       - Clean build artifacts"
	@echo "  make help        - Show this help message"
	@echo ""

# Run SwiftLint checks
lint:
	@echo "🔍 Running SwiftLint checks..."
	swiftlint lint

# Auto-fix SwiftLint issues
fix:
	@echo "🔧 Auto-fixing SwiftLint issues..."
	./scripts/fix-swiftlint.sh

# Run unit tests
test:
	@echo "🧪 Running unit tests..."
	xcodebuild test \
		-project CartoniaApp.xcodeproj \
		-scheme CartoniaApp \
		-destination 'platform=iOS Simulator,name=iPhone 16,OS=18.6' \
		-only-testing:CartoniaAppTests \
		-quiet

# Run pre-push validation
pre-push:
	@echo "🚀 Running pre-push validation..."
	.git/hooks/pre-push

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	xcodebuild clean \
		-project CartoniaApp.xcodeproj \
		-scheme CartoniaApp
	rm -rf ~/Library/Developer/Xcode/DerivedData/CartoniaApp-*

# Install dependencies (if needed in the future)
install:
	@echo "📦 Installing dependencies..."
	@echo "No dependencies to install currently"

# Setup development environment
setup: install
	@echo "⚙️  Setting up development environment..."
	@echo "✅ Development environment ready!"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Run 'make lint' to check code quality"
	@echo "  2. Run 'make test' to run tests"
	@echo "  3. Run 'make pre-push' to test the pre-push hook"
