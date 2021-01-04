#!/bin/bash
# Installs bakdata IntelliJ configs into your user configs.

bold=$(tput bold)
normal=$(tput sgr0)

# Try to find any intellij installation
FOUND_INTELLIJ=false
for i in "$HOME/Library/Application Support/JetBrains/IntelliJIdea*"  \
         "$HOME/Library/Application Support/JetBrains/IdeaIC*"  \
         "$HOME/.config/JetBrains/IntelliJIdea*"  \
         "$HOME/.config/JetBrains/IdeaIC*"
do
    if [[ -d $i ]]; then
        FOUND_INTELLIJ=true
    fi
done

if [[ $FOUND_INTELLIJ = true ]]; then
    # create .idea folder if not present already
    IDEA_SETTINGS="$PROJECT_DIR/.idea"
    mkdir -p $IDEA_SETTINGS

    CONFIGS="$PROJECT_DIR/code-styles/intellij"
    if [[ -d $CONFIGS ]]; then
        echo "${bold}Overwriting project settings with project-specific settings from repo${normal}"
        cp -frv "$CONFIGS"/* "IDEA_SETTINGS"
    else
        echo "${bold}Copying default bakdata IntelliJ configs...${normal}"
        CONFIGS=$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )
        CODE_STYLE_NAME=bakdata
        INSPECTION_NAME=bakdata

        for i in "$HOME/Library/Application Support/JetBrains/IntelliJIdea*"  \
                 "$HOME/Library/Application Support/JetBrains/IdeaIC*"  \
                 "$HOME/.config/JetBrains/IntelliJIdea*"  \
                 "$HOME/.config/JetBrains/IdeaIC*"
        do
          if [[ -d $i ]]; then
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

        echo "${bold}Overwriting project settings with code style '$CODE_STYLE_NAME' and inspection name with '$INSPECTION_NAME'${normal}"
        find "$CONFIGS/project" -type f -print0 | xargs -0 sed -i "" 's/{{CODE_STYLE_NAME}}/'"$CODE_STYLE_NAME"'/g ; s/{{INSPECTION_NAME}}/'"$INSPECTION_NAME"'/g'
        cp -frv "$CONFIGS/project"/* "$IDEA_SETTINGS"
        echo "${bold}Restart IntelliJ.${normal}"
    fi
else
    echo "${bold}Could not find Intellij setting folder and skipping Intellij project setup."
    echo "If you use Intellij, manually setup by going to preferences, and apply '$CODE_STYLE_NAME' in codestyle and '$INSPECTION_NAME' in inspection.${normal}"
fi


