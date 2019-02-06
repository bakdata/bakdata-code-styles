#!/bin/bash
# Installs bakdata IntelliJ configs into your user configs.

CONFIGS="$PROJECT_DIR/code-styles/intellij"
if [[ -d $CONFIGS ]]; then
    echo "Copying project-specific IntelliJ configs..."
    CODE_STYLE_NAME=$(sed -ne '/<code_scheme name=/ s/.*name="\(.*\)".*/\1/gp' "$CONFIGS/codestyles"/*.xml)
    INSPECTION_NAME=$(sed -ne '/<option name="PROJECT_PROFILE"/ s/\s*<[^>]*>\s*//gp' "$CONFIGS/inspection"/*.xml)
else
    echo "Copying default bakdata IntelliJ configs..."
    CONFIGS=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
    CODE_STYLE_NAME=bakdata
    INSPECTION_NAME=bakdata
fi

FOUND_INTELLIJ=false
for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/.IntelliJIdea*/config              
do
  if [[ -d $i ]]; then
    FOUND_INTELLIJ=true

    # Install codestyles
    mkdir -p $i/codestyles
    cp -frv "$CONFIGS/codestyles"/* "$i/codestyles"

    # Install inspections
    mkdir -p $i/inspection
    cp -frv "$CONFIGS/inspection"/* "$i/inspection"

    # Install options ("Exclude from Import and Completion")
    mkdir -p $i/options
    cp -frv "$CONFIGS/options"/* "$i/options"
  fi
done

if [[ $FOUND_INTELLIJ = true ]]; then
    IDEA_SETTINGS="$PROJECT_DIR/.idea"
    mkdir -p $IDEA_SETTINGS
    echo "Overwriting project settings with code style '$CODE_STYLE_NAME' and inspection name with '$INSPECTION_NAME'"
    find "$CONFIGS/project" -type f -print0 | xargs -0 sed -i "" 's/{{CODE_STYLE_NAME}}/'"$CODE_STYLE_NAME"'/g ; s/{{INSPECTION_NAME}}/'"$INSPECTION_NAME"'/g'
    cp -frv "$CONFIGS/project"/* "$IDEA_SETTINGS"
    echo "Restart IntelliJ."
else
    echo "Could not find Intellij setting folder and skipping Intellij project setup."
    echo "If you use Intellij, manually setup by going to preferences, and apply '$CODE_STYLE_NAME' in codestyle and '$INSPECTION_NAME' in inspection."
fi
