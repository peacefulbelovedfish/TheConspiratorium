#!/bin/bash

# Base directory (modify if needed)
BASE_DIR="data/towns"
CAMPAIGN_DIR="campaigns"

# Function to create NPCs
make_npc() {
    CITY="$1"
    NPC="$2"
    FILE_PATH="${BASE_DIR}/${CITY}/npcs/${NPC}.md"

    mkdir -p "$(dirname "$FILE_PATH")"
    cat > "$FILE_PATH" <<EOL
## $NPC

**Race:**  
**Class:**  
**Alignment:**  
**Affiliation:**  

### **Visual Description:**  
[Describe appearance, clothing, demeanor]  

### **Personality:**  
[Describe their mindset, beliefs, and quirks]  

### **Stats:**  
- **Strength:**   
- **Dexterity:**   
- **Constitution:**   
- **Intellect:**   
- **Wisdom:**   
- **Charisma:**   

### **Wants & Fears:**  
- **Wants:**  
- **Fears:**  

### **Secrets & Hooks:**  
[Plot ties, rumors, or future story elements]  

### **Quotes:**  
- *"Example quote."*  

### **Notable Game Moments:**  
- TBD  
EOL

    echo "✅ NPC file created: $FILE_PATH"
}

# Function to create Businesses
make_business() {
    CITY="$1"
    BUSINESS="$2"
    FILE_PATH="${BASE_DIR}/${CITY}/businesses/${BUSINESS}.md"

    mkdir -p "$(dirname "$FILE_PATH")"
    cat > "$FILE_PATH" <<EOL
# $BUSINESS  
**Type:** [Inn, Tavern, Blacksmith, etc.]  
**Location:** $CITY  

## Description  
[Describe the business, its reputation, and atmosphere]  

## Services & Goods  
- **[Item Name]** – [Description] – **[Price]**  

## Notable NPCs  
- **[Owner Name](../../npcs/OwnerName.md)** (*Owner/Manager*)  

## Rumors & Secrets  
- **Rumor:**  
- **Secret:**  

## Role in the Campaign  
- [How does this business fit into the world?]  
EOL

    echo "✅ Business file created: $FILE_PATH"
}

# Function to create Guilds
make_guild() {
    CITY="$1"
    GUILD="$2"
    FILE_PATH="${BASE_DIR}/${CITY}/guilds/${GUILD}.md"

    mkdir -p "$(dirname "$FILE_PATH")"
    cat > "$FILE_PATH" <<EOL
# $GUILD  
**Type:** [Thieves' Guild, Merchant Coalition, etc.]  
**Location:** $CITY  

## Leadership  
[Who runs this guild?]  

## Influence & Power  
[What do they control?]  

## Notable NPCs  
- **[Leader Name](../../npcs/LeaderName.md)**  

## Rivalries & Alliances  
- **Allies:**  
- **Rivals:**  

## Secrets & Hooks  
[Story elements, internal conflicts, hidden truths]  
EOL

    echo "✅ Guild file created: $FILE_PATH"
}

# Function to create Temples
make_temple() {
    CITY="$1"
    TEMPLE="$2"
    FILE_PATH="${BASE_DIR}/${CITY}/temples/${TEMPLE}.md"

    mkdir -p "$(dirname "$FILE_PATH")"
    cat > "$FILE_PATH" <<EOL
# $TEMPLE  
**Deity:** [Deity Name]  
**Location:** $CITY  

## Description  
[Describe the temple’s architecture, atmosphere, and influence]  

## Clergy & Leadership  
- **[Head Cleric Name](../../npcs/ClericName.md)**  

## Religious Practices  
[What rituals, beliefs, or restrictions exist?]  

## Role in the Campaign  
[How does this temple affect the world or the party?]  
EOL

    echo "✅ Temple file created: $FILE_PATH"
}

 # Function to list all NPCs across all cities
list_npcs() {
    echo "-----------------------------------------------------------------------------------------------------------------"
    printf "| %-15s | %-30s | %-40s |\n" "City" "Name" "Relative Path"
    echo "-----------------------------------------------------------------------------------------------------------------"

    # Loop through all NPC directories inside "data/towns/"
    find "$BASE_DIR" -type f -path "*/npcs/*.md" | while read -r file; do
        CITY_NAME=$(echo "$file" | awk -F'/' '{print $(NF-2)}')  # Extract city name
        NPC_NAME=$(basename "$file" .md)  # Extract NPC name from filename
        RELATIVE_PATH="${file#$BASE_DIR/}"  # Make path relative to BASE_DIR

        printf "| %-15s | %-30s | %-40s |\n" "$CITY_NAME" "$NPC_NAME" "$RELATIVE_PATH"
    done

    echo "-----------------------------------------------------------------------------------------------------------------"
}

# Function to list NPCs for a specific city
list_npcs_city() {
    CITY="$1"
    SEARCH_PATH="${BASE_DIR}/${CITY}/npcs"

    if [ ! -d "$SEARCH_PATH" ]; then
        echo "⚠️  No NPCs found in ${SEARCH_PATH}. Are you sure the city exists?"
        exit 1
    fi

    echo "-----------------------------------------------------------------------------------------------------------------"
    printf "| %-15s | %-30s | %-40s |\n" "City" "Name" "Relative Path"
    echo "-----------------------------------------------------------------------------------------------------------------"

    find "$SEARCH_PATH" -type f -name "*.md" | while read -r file; do
        NPC_NAME=$(basename "$file" .md)  # Extract NPC name from filename
        RELATIVE_PATH="${file#$BASE_DIR/}"  # Make path relative to BASE_DIR

        printf "| %-15s | %-30s | %-40s |\n" "$CITY" "$NPC_NAME" "$RELATIVE_PATH"
    done

    echo "-----------------------------------------------------------------------------------------------------------------"
}

# Function to list all NPCs across all cities
list_npcs() {
    echo "-----------------------------------------------------------------------------------------------------------------"
    printf "| %-15s | %-30s | %-40s |\n" "City" "Name" "Relative Path"
    echo "-----------------------------------------------------------------------------------------------------------------"

    # Loop through all NPC directories inside "data/towns/"
    find "$BASE_DIR" -type f -path "*/npcs/*.md" | while read -r file; do
        CITY_NAME=$(echo "$file" | awk -F'/' '{print $(NF-2)}')  # Extract city name
        NPC_NAME=$(basename "$file" .md)  # Extract NPC name from filename
        RELATIVE_PATH="${file#$BASE_DIR/}"  # Make path relative to BASE_DIR

        printf "| %-15s | %-30s | %-40s |\n" "$CITY_NAME" "$NPC_NAME" "$RELATIVE_PATH"
    done

    echo "-----------------------------------------------------------------------------------------------------------------"
}

# Function to list NPCs for a specific city
list_npcs_city() {
    CITY="$1"
    SEARCH_PATH="${BASE_DIR}/${CITY}/npcs"

    if [ ! -d "$SEARCH_PATH" ]; then
        echo "⚠️  No NPCs found in ${SEARCH_PATH}. Are you sure the city exists?"
        exit 1
    fi

    echo "-----------------------------------------------------------------------------------------------------------------"
    printf "| %-15s | %-30s | %-40s |\n" "City" "Name" "Relative Path"
    echo "-----------------------------------------------------------------------------------------------------------------"

    find "$SEARCH_PATH" -type f -name "*.md" | while read -r file; do
        NPC_NAME=$(basename "$file" .md)  # Extract NPC name from filename
        RELATIVE_PATH="${file#$BASE_DIR/}"  # Make path relative to BASE_DIR

        printf "| %-15s | %-30s | %-40s |\n" "$CITY" "$NPC_NAME" "$RELATIVE_PATH"
    done

    echo "-----------------------------------------------------------------------------------------------------------------"
}


# Function to create a session log file
make_session() {
    CAMPAIGN_NUM="$1"
    SESSION_NUM="$2"
    SESSION_DIR="${CAMPAIGN_DIR}/campaign${CAMPAIGN_NUM}"
    SESSION_FILE="${SESSION_DIR}/session_${SESSION_NUM}.md"

    mkdir -p "$SESSION_DIR"
    if [ -f "$SESSION_FILE" ]; then
        echo "⚠️  Session file already exists: $SESSION_FILE"
    else
        cat > "$SESSION_FILE" <<EOL
# Session ${SESSION_NUM}

**Campaign:** Campaign ${CAMPAIGN_NUM}  
**Date:** [Insert Date]  
**Players Present:**  

## **Summary:**  
[Write session details here.]  

## **Key NPCs Met:**  
-  

## **Major Events & Decisions:**  
-  

## **Loot & Rewards:**  
-  

## **Next Steps / Future Hooks:**  
-  
EOL
        echo "✅ Session file created: $SESSION_FILE"
    fi
}
# Function to create a session planning file
make_session_plan() {
    CAMPAIGN_NUM="$1"
    SESSION_NUM="$2"
    SESSION_DIR="${CAMPAIGN_DIR}/campaign${CAMPAIGN_NUM}/planning"
    SESSION_FILE="${SESSION_DIR}/session_${SESSION_NUM}.md"

    mkdir -p "$SESSION_DIR"
    if [ -f "$SESSION_FILE" ]; then
        echo "⚠️  Session planning file already exists: $SESSION_FILE"
    else
        cat > "$SESSION_FILE" <<EOL
# Session ${SESSION_NUM} Planning

**Campaign:** Campaign ${CAMPAIGN_NUM}  
**Date:** [Insert Date]  
**Objectives:**  
-  

## **Expected Player Actions:**  
-  

## **Key NPCs & Encounters:**  
-  

## **Major Plot Points to Introduce:**  
-  

## **World Changes or Faction Shifts:**  
-  

## **Challenges & Potential Diversions:**  
-  

## **GM Notes:**  
-  
EOL
        echo "✅ Session planning file created: $SESSION_FILE"
    fi
}
# Function to create a description file
make_description() {
    PLACE="$1"
    DESCRIPTION="$2"
    DESC_DIR="${CAMPAIGN_DIR}/campaign2/descriptions"
    DESC_FILE="${DESC_DIR}/${PLACE}.md"

    mkdir -p "$DESC_DIR"
    if [ -f "$DESC_FILE" ]; then
        echo "⚠️  Description file already exists: $DESC_FILE"
    else
        cat > "$DESC_FILE" <<EOL
# $PLACE  

## **Description:**  
$DESCRIPTION  

## **Additional Details:**  
- [Expand on environment, notable features, or sensory details here.]  

## **Potential Connections:**  
- [How does this setting relate to NPCs, quests, or world events?]  
EOL
        echo "✅ Description file created: $DESC_FILE"
    fi
}

# Function to display help menu
show_help() {
    echo "---------------------------------------------------------"
    echo "              DND Campaign Management Script             "
    echo "---------------------------------------------------------"
    echo "Usage: dnd <command> [arguments]"
    echo ""
    echo "Available Commands:"
    echo "  makeNpc <city> <npcName>       - Create a new NPC file"
    echo "  makeBusiness <city> <name>     - Create a new Business file"
    echo "  makeGuild <city> <name>        - Create a new Guild file"
    echo "  makeTemple <city> <name>       - Create a new Temple file"
    echo "  session <campaign> <session>   - Creates a new session log"
    echo "  sessionPlan <campaign> <session> - Creates a session planning file"
    echo "  describe <Place> <Description> - Creates a Markdown file for location/setting descriptions"
    echo "  listNpcs [city]                - List all NPCs, or filter by city"
    echo "  help                           - Show this help menu"
    echo ""
    echo "Examples:"
    echo "  dnd makeNpc belford JamieWatt"
    echo "  dnd makeBusiness belford TheFourSeaSons"
    echo "  dnd listNpcs"
    echo "  dnd listNpcs belford"
    echo "  dnd session 2 3      # Creates a session log for Campaign 2, Session 3"
    echo "  dnd sessionPlan 2 3  # Creates a session planning file for Campaign 2, Session 3"
    echo "  dnd describe Tavern \"A rustic inn with the scent of roasted meats and old ale.\""
    echo ""
    echo "---------------------------------------------------------"
}

# Command handling
case "$1" in
    makeNpc)
        make_npc "$2" "$3"
        ;;
    makeBusiness)
        make_business "$2" "$3"
        ;;
    makeGuild)
        make_guild "$2" "$3"
        ;;
    makeTemple)
        make_temple "$2" "$3"
        ;;
    session)
        make_session "$2" "$3"
        ;;
    sessionPlan)
        make_session_plan "$2" "$3"
        ;;
    describe)
        make_description "$2" "$3"
        ;;
    help)
        show_help
        ;;
    *)
        echo "❌ Unknown command: $1"
        show_help
        ;;
esac