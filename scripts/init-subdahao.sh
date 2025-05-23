#!/bin/bash
set -e

# DAHAO Sub-DAHAO Initialization Script
# Usage: ./init-subdahao.sh --name "climate-action" --mission "Accelerating climate solutions with AI"

SUBDAHAO_NAME=""
MISSION=""
CORE_VERSION="1.0.0"
TEMPLATE_DIR="$(dirname "$0")/.."

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --name)
      SUBDAHAO_NAME="$2"
      shift 2
      ;;
    --mission)
      MISSION="$2"
      shift 2
      ;;
    --core-version)
      CORE_VERSION="$2"
      shift 2
      ;;
    *)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

# Validate inputs
if [[ -z "$SUBDAHAO_NAME" || -z "$MISSION" ]]; then
  echo "Usage: $0 --name <subdahao-name> --mission <mission-statement>"
  echo "Example: $0 --name \"climate-action\" --mission \"Accelerating climate solutions with AI\""
  exit 1
fi

echo "🚀 Initializing Sub-DAHAO: $SUBDAHAO_NAME"
echo "📋 Mission: $MISSION"
echo "🔗 Core Version: $CORE_VERSION"
echo ""

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p constitution/extensions
mkdir -p proposals/{active,approved,archived}
mkdir -p projects
mkdir -p agents
mkdir -p governance
mkdir -p .core

# Create core link file
echo "🔗 Linking to DAHAO core..."
cat > .core/link.yaml << EOF
core:
  repository: "dahao-org/core"
  version: "$CORE_VERSION"
  commit: "main"  # Will be updated to specific commit
  
inheritance:
  values: immutable        # Cannot be changed
  framework: extendable    # Can add, not modify
  terms: extendable        # Can add domain terms
  
overrides:
  allowed: []             # No core overrides allowed
  
validation:
  enforce_inheritance: true
  check_compatibility: true
EOF

# Create mission statement
echo "🎯 Creating mission statement..."
cat > constitution/mission.yaml << EOF
name: "$SUBDAHAO_NAME"
type: "sub_dahao"
version: "1.0.0"
status: "active"

mission:
  statement: "$MISSION"
  vision: "To be defined by the community"
  scope: "Domain-specific applications of DAHAO principles"

focus_areas:
  - "To be defined by the community"

founding:
  date: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  founding_principles:
    - "Adherence to DAHAO core values"
    - "Domain expertise and innovation"
    - "Community-driven governance"
    - "Sustainable impact"

governance:
  inherits_from: "dahao-org/core"
  local_adaptations: "constitution/governance.yaml"
  voting_members: "members.yaml"
  
metadata:
  created: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  template_version: "1.0.0"
EOF

# Create governance structure
echo "⚖️ Setting up governance structure..."
cat > constitution/governance.yaml << EOF
governance_model:
  type: "delegated_democracy"
  inherits_from: "dahao-org/core"
  
local_rules:
  membership:
    requirements:
      - "Alignment with DAHAO core values"
      - "Domain expertise or genuine interest"
      - "Commitment to community participation"
    
  voting:
    quorum: 0.3              # 30% of members for valid vote
    threshold: 0.6           # 60% for approval
    voting_period: "7 days"
    
  proposals:
    types: ["project", "governance", "budget", "partnership"]
    requirements:
      project: "simple_majority"
      governance: "supermajority"
      budget: "majority"
      partnership: "majority"

roles:
  maintainer:
    responsibilities: ["repository_management", "technical_oversight"]
    election_term: "6 months"
    max_maintainers: 5
    
  coordinator:
    responsibilities: ["community_coordination", "proposal_facilitation"]
    election_term: "3 months"
    max_coordinators: 3

automation:
  governance_bot: true
  automated_voting: false
  proposal_validation: true
EOF

# Create members file
echo "👥 Creating member registry..."
cat > governance/members.yaml << EOF
members:
  founding:
    - id: "founder"
      github: "your-github-username"
      role: "founder"
      joined: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
      status: "active"

member_tiers:
  contributor:
    requirements: ["1+ merged contribution"]
    permissions: ["vote_on_projects", "propose_projects"]
    
  member:
    requirements: ["5+ contributions", "3+ months active"]
    permissions: ["vote_on_all", "propose_governance"]
    
  maintainer:
    requirements: ["elected_by_members"]
    permissions: ["repository_admin", "emergency_decisions"]

onboarding:
  process: "proposal_based"
  mentor_assignment: true
  probation_period: "30 days"
EOF

# Create sample project structure
echo "📦 Creating sample project structure..."
mkdir -p projects/sample-project
cat > projects/sample-project/README.md << EOF
# Sample Project

This is a template for projects within the $SUBDAHAO_NAME Sub-DAHAO.

## Project Structure

- \`proposal.yaml\` - Project proposal and specifications
- \`status.yaml\` - Current status and milestones
- \`team.yaml\` - Team members and roles
- \`resources/\` - Project resources and documentation

## Getting Started

1. Copy this template for new projects
2. Update the proposal.yaml with your project details
3. Submit for community review and approval
4. Begin development with regular status updates
EOF

# Create agent permissions
echo "🤖 Setting up agent permissions..."
cat > agents/permissions.yaml << EOF
agents:
  governance_bot:
    permissions:
      - "merge_approved_proposals"
      - "update_member_status"
      - "validate_proposals"
    restrictions:
      - "cannot_override_votes"
      - "cannot_modify_core_values"
      
  project_bot:
    permissions:
      - "update_project_status"
      - "assign_reviewers"
      - "manage_issues"
    restrictions:
      - "cannot_approve_budgets"
      - "cannot_modify_governance"

automation_rules:
  auto_merge:
    enabled: true
    conditions:
      - "all_checks_pass"
      - "required_approvals_met"
      - "no_conflicts"
      
  member_management:
    auto_promote: false
    auto_demote: false
    notification_required: true
EOF

# Create README
echo "📖 Creating README..."
cat > README.md << EOF
# $SUBDAHAO_NAME Sub-DAHAO

$MISSION

## Overview

This is a Sub-DAHAO within the larger DAHAO (Decentralized Autonomous Hybrid AI Organization) ecosystem. We inherit the core values and framework from [dahao-org/core](https://github.com/dahao-org/core) while focusing on our specific domain.

## Core Values (Inherited)

- **Radical Transparency**: All decisions and processes are open
- **True Decentralization**: Distributed governance and decision-making  
- **Human-AI Symbiosis**: Collaborative intelligence between humans and AI
- **Long-term Sustainability**: Actions consider long-term impact
- **Continuous Innovation**: Embracing change and creative solutions

## Getting Started

### For Contributors
1. Read our [mission statement](constitution/mission.yaml)
2. Review our [governance model](constitution/governance.yaml)
3. Check out [active projects](projects/)
4. Join the discussion in [proposals](proposals/active/)

### For Members
1. Review [member responsibilities](governance/members.yaml)
2. Participate in [active proposals](proposals/active/)
3. Contribute to ongoing [projects](projects/)

### For Maintainers
1. Ensure alignment with [DAHAO core values](https://github.com/dahao-org/core)
2. Facilitate community discussions
3. Maintain technical infrastructure
4. Coordinate with other Sub-DAHAOs

## Structure

- \`constitution/\` - Our governance framework and mission
- \`proposals/\` - Community proposals and decisions
- \`projects/\` - Active projects and initiatives
- \`agents/\` - AI agent configurations and permissions
- \`governance/\` - Member registry and governance data
- \`.core/\` - Link to DAHAO core framework

## Contributing

1. Fork this repository
2. Create a feature branch for your proposal
3. Submit a pull request
4. Participate in community review

## Links

- [DAHAO Core Framework](https://github.com/dahao-org/core)
- [Other Sub-DAHAOs](https://github.com/dahao-org)
- [Web Interface](https://dahao.org)

## License

Content licensed under CC BY-SA 4.0, inheriting from DAHAO core.
EOF

echo ""
echo "✅ Sub-DAHAO initialization complete!"
echo ""
echo "Next steps:"
echo "1. Review and customize the generated files"
echo "2. Add your specific focus areas and projects"
echo "3. Invite founding members to join"
echo "4. Submit proposal to dahao-org/core for inclusion"
echo ""
echo "Files created:"
echo "- constitution/mission.yaml"
echo "- constitution/governance.yaml" 
echo "- governance/members.yaml"
echo "- agents/permissions.yaml"
echo "- .core/link.yaml"
echo "- README.md"
echo ""
echo "🚀 Welcome to the DAHAO ecosystem!"