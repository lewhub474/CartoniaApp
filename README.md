# CartoniaApp

iOS app with SwiftLint integration and pre-push validation.

## 🚀 Quick Start

### Prerequisites
```bash
# Install SwiftLint
brew install swiftlint

# Clone and setup
git clone https://github.com/lewhub474/CartoniaApp.git
cd CartoniaApp
chmod +x .git/hooks/pre-push
```

## 🛠️ Commands

### Development
```bash
make lint        # Check code quality
make fix         # Auto-fix SwiftLint issues
make test        # Run unit tests
make clean       # Clean build artifacts
make help        # Show all commands
```

### Testing
```bash
make pre-push    # Test pre-push hook
./scripts/test-pre-push.sh  # Alternative testing
```

## 📤 Push Workflow

### Normal Push
```bash
git add .
git commit -m "Your commit message"
git push  # Pre-push hook validates automatically
```

### Emergency Push (Not Recommended)
```bash
git push --no-verify  # Bypasses validation
```

## 🔧 What Happens on Push

1. **SwiftLint Check** - Validates code quality (strict mode)
2. **Unit Tests** - Runs all tests
3. **Push Decision** - Allows push only if both pass

## 📚 Documentation

- **SwiftLint Guide**: `SWIFTLINT_GUIDE.md`
- **Configuration**: `.swiftlint.yml`
- **Pre-push Hook**: `.git/hooks/pre-push`

## 🛠️ Troubleshooting

```bash
# SwiftLint not found
brew install swiftlint

# Pre-push hook not working
chmod +x .git/hooks/pre-push

# Build issues
make clean
```

---

**Ready to code! 🚀**
