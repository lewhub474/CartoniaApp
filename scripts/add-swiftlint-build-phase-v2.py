#!/usr/bin/env python3

"""
Script to add SwiftLint as a build phase to Xcode project (Version 2)
This script uses a more careful approach to avoid syntax errors
"""

import re
import uuid
import sys
import os

def generate_uuid():
    """Generate a 24-character UUID for Xcode project"""
    return str(uuid.uuid4()).replace('-', '').upper()[:24]

def add_swiftlint_build_phase(project_path):
    """Add SwiftLint build phase to the Xcode project"""
    
    # Read the project file
    with open(project_path, 'r') as f:
        content = f.read()
    
    # Generate unique IDs
    swiftlint_phase_id = generate_uuid()
    
    # Check if SwiftLint build phase already exists
    if 'SwiftLint' in content:
        print("⚠️  SwiftLint build phase already exists in the project")
        return True
    
    # Create the SwiftLint build phase section
    swiftlint_section = f'''/* Begin PBXShellScriptBuildPhase section */
		{swiftlint_phase_id} /* SwiftLint */ = {{
			isa = PBXShellScriptBuildPhase;
			buildActionMask = 2147483647;
			files = (
			);
			inputFileListPaths = (
			);
			inputPaths = (
			);
			name = SwiftLint;
			outputFileListPaths = (
			);
			outputPaths = (
			);
			runOnlyForDeploymentPostprocessing = 0;
			shellPath = /bin/sh;
			shellScript = "if which swiftlint >/dev/null; then\\n  cd \\"${{SRCROOT}}\\"\\n  swiftlint\\nelse\\n  echo \\"warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint\\"\\nfi\\n";
		}};
/* End PBXShellScriptBuildPhase section */'''
    
    # Find the main app target build phases
    main_target_pattern = r'(8002BACD2E7C717F004BADE9 /\* CartoniaApp \*/ = \{[^}]*buildPhases = \(\s*)(8002BACA2E7C717F004BADE9 /\* Sources \*/)'
    
    # Add SwiftLint build phase to the main target
    def replace_build_phases(match):
        indent = match.group(1)
        sources_phase = match.group(2)
        return f'{indent}{swiftlint_phase_id} /* SwiftLint */,\n\t\t\t\t{sources_phase}'
    
    # Apply the replacement
    new_content = re.sub(main_target_pattern, replace_build_phases, content, flags=re.DOTALL)
    
    if new_content == content:
        print("❌ Could not find the main app target build phases")
        return False
    
    # Add the SwiftLint build phase section
    # Find a good place to insert it (after PBXTargetDependency section)
    target_dependency_end = '/* End PBXTargetDependency section */'
    if target_dependency_end in new_content:
        new_content = new_content.replace(
            target_dependency_end,
            f'{target_dependency_end}\n\n{swiftlint_section}'
        )
    else:
        print("❌ Could not find a suitable place to insert SwiftLint build phase")
        return False
    
    # Write the modified content back
    with open(project_path, 'w') as f:
        f.write(new_content)
    
    print(f"✅ SwiftLint build phase added with ID: {swiftlint_phase_id}")
    return True

def main():
    project_path = "CartoniaApp.xcodeproj/project.pbxproj"
    
    if not os.path.exists(project_path):
        print("❌ CartoniaApp.xcodeproj not found. Please run from project root.")
        sys.exit(1)
    
    # Create backup
    backup_path = f"{project_path}.backup3"
    with open(project_path, 'r') as src, open(backup_path, 'w') as dst:
        dst.write(src.read())
    print(f"📁 Created backup: {backup_path}")
    
    # Add SwiftLint build phase
    if add_swiftlint_build_phase(project_path):
        print("🎉 SwiftLint build phase successfully added!")
        print("💡 You can now build the project in Xcode to see SwiftLint warnings")
    else:
        print("❌ Failed to add SwiftLint build phase")
        sys.exit(1)

if __name__ == "__main__":
    main()
