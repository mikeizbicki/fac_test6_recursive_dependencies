#!/bin/bash

# Tests for non-recursive, recursive, and dual-recursive dependency-only variables.

source ../framework.sh

# Test non-recursive dependencies.

reset_git
fac 'simple/$TEST/$NAME'
fac 'nonrecursive/$TEST/$NAME'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint1

reset_git
fac 'nonrecursive/$TEST/$NAME'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint1b

# Test recursive dependencies.

reset_git
fac 'recursive/$TEST/$NAME'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint2

reset_git
fac 'recursive/$TEST/a'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint3

reset_git
fac 'recursive/$TEST/g'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint4

# Test dual-recursive dependencies.

reset_git
fac 'dualrecursion1/$TEST/$NAME'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint5

reset_git
fac 'dualrecursion1/$TEST/a'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint6

reset_git
fac 'dualrecursion1/$TEST/g'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint7

reset_git
fac 'dualrecursion2/$TEST/$NAME'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint5b

reset_git
fac 'dualrecursion2/$TEST/a'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint6b

reset_git
fac 'dualrecursion2/$TEST/g'
files-to-prompt $(find . -type f -not -path "*/.*" -not -name "*.sh" -not -name "*.yaml" | sort) | dotest checkpoint7b

finalize_tests
