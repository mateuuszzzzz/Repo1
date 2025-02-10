#!/bin/bash

# Test cases for PR_DESCRIPTION
test_cases=(
    "Related Repo2 PR: https://github.com/mateuuszzzzz/repo2/pull/12345"
    "This is not a matching string"
    "Related Repo2 PR: https://github.com/mateuuszzzzz/repo2/pull/67890 with extra text"
    "Related Repo2 PR: https://github.com/mateuuszzzzz/repo2/pull/"
    "Related Repo2 PR: https://github.com/mateuuszzzzz/Repo2/pull/1"
)

# Loop through test cases
for PR_DESCRIPTION in "${test_cases[@]}"; do
    echo "Testing with PR_DESCRIPTION: \"$PR_DESCRIPTION\""

    LOWERCASE_PR_DESCRIPTION=$(echo "$PR_DESCRIPTION" | tr '[:upper:]' '[:lower:]')
    echo "Lowercase description: $LOWERCASE_PR_DESCRIPTION"
    if [[ $LOWERCASE_PR_DESCRIPTION =~ related[[:space:]]repo2[[:space:]]pr:[[:space:]]https://github.com/mateuuszzzzz/repo2/pull/([0-9]+) ]]; then
        PR_NUMBER="${BASH_REMATCH[1]}"
        echo "Found PR number: $PR_NUMBER"
    else
        echo "Error: Could not find related PR URL in the description"
    fi

    echo "----------------------------------------"
done

