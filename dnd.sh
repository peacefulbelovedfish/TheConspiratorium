#!/bin/bash

# Base directories
BASE_DIR="data/towns"
CAMPAIGN_DIR="campaigns"

# Function to create NPC files
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

# Function to create Business files
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

# Function to create Guild files
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

# Function to create Temple files
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

# Function to create a session log file
make_session() {
    CAMPAIGN_NUM="$1"
    SESSION_NUM="$2"
    SESSION_DIR="${CAMPAIGN_DIR}/campaign${CAMPAIGN_NUM}/sessions"
    SESSION_FILE="${SESSION_DIR}/session_${SESSION_NUM}.md"

    mkdir -p "$SESSION_DIR"
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
}

# Function to create a session planning file
make_session_plan() {
    CAMPAIGN_NUM="$1"
    SESSION_NUM="$2"
    SESSION_DIR="${CAMPAIGN_DIR}/campaign${CAMPAIGN_NUM}/planning"
    SESSION_FILE="${SESSION_DIR}/session_${SESSION_NUM}.md"

    mkdir -p "$SESSION_DIR"
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
}

# Function to create a description file
make_description() {
    PLACE="$1"
    DESCRIPTION="$2"
    DESC_DIR="${CAMPAIGN_DIR}/descriptions"
    DESC_FILE="${DESC_DIR}/${PLACE}.md"

    mkdir -p "$DESC_DIR"
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
}

# Function to create a deity file
make_god() {
    DEITY_NAME="$1"
    DEITY_DIR="data/deities"
    DEITY_FILE="${DEITY_DIR}/${DEITY_NAME}.md"

    mkdir -p "$DEITY_DIR"
    if [ -f "$DEITY_FILE" ]; then
        echo "⚠️  Deity file already exists: $DEITY_FILE"
    else
        cat > "$DEITY_FILE" <<EOL
# $DEITY_NAME  

## **Domains:**  
[War, Trickery, Knowledge, etc.]  

## **Symbols & Icons:**  
[Describe the holy symbols, colors, and visual themes.]  

## **Worship & Rites:**  
[How do people worship? What festivals, rituals, or customs exist?]  

## **Legends & Stories:**  
[A major myth or story about the deity.]  

## **Influence in the World:**  
[How present is this deity? Are they actively involved or more distant?]  

## **Major Temples & Centers of Worship:**  
- [Temple Name](../towns/city_name/temples/TempleName.md)  

## **Clergy & Followers:**  
[Who worships this deity? What is expected of them?]  
EOL

        echo "✅ Deity file created: $DEITY_FILE"
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
    echo "  makeGod <DeityName>            - Create a new Deity file"
    echo "  session <campaign> <session>   - Create a session log"
    echo "  sessionPlan <campaign> <session> - Create a session planning file"
    echo "  describe <Place> <Description> - Create a description file"
    echo "  help                           - Show this help menu"
}

# Command handling
case "$1" in
    makeNpc) make_npc "$2" "$3" ;;
    makeBusiness) make_business "$2" "$3" ;;
    makeGuild) make_guild "$2" "$3" ;;
    makeTemple) make_temple "$2" "$3" ;;
    makeGod) make_god "$2" ;;
    session) make_session "$2" "$3" ;;
    sessionPlan) make_session_plan "$2" "$3" ;;
    describe) make_description "$2" "$3" ;;
    help) show_help ;;
    *) echo "❌ Unknown command: $1"; show_help ;;
esac
