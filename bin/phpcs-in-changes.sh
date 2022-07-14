#!/usr/scripts/env bash
# Run PHP_CodeSniffer over the modified files for the specified commit range.

COMMIT_RANGE="${1} ${2}"
CHANGED_FILES=`git diff --name-only --diff-filter=ACMR $COMMIT_RANGE | grep '\.php' | awk '{print}' ORS=' '`

if [ "$CHANGED_FILES" != "" ]; then
	echo "Changed files: $CHANGED_FILES"
	echo "Running Code Sniffer."

	../vendor/bin/phpcs --encoding=utf-8 -s -n -p --report-full --report-checkstyle=./phpcs-report.xml ${CHANGED_FILES}
else
	echo "No changes found. Skipping PHPCS run."
fi
