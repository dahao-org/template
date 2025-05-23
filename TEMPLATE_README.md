# DAHAO Sub-DAHAO Template

This template provides the foundation for creating new Sub-DAHAOs within the DAHAO ecosystem.

## Quick Start

### 1. Use This Template

Click "Use this template" to create a new repository, or fork and customize.

### 2. Initialize Your Sub-DAHAO

```bash
# Clone your new repository
git clone https://github.com/your-username/your-subdahao-name
cd your-subdahao-name

# Run the initialization script
./scripts/init-subdahao.sh --name "your-subdahao-name" --mission "Your mission statement"
```

### 3. Customize Your Sub-DAHAO

1. **Update Mission**: Edit `constitution/mission.yaml`
2. **Set Governance Rules**: Customize `constitution/governance.yaml`
3. **Add Members**: Update `governance/members.yaml`
4. **Define Projects**: Add your projects to `projects/`
5. **Configure Agents**: Set up AI agent permissions in `agents/`

### 4. Submit for Inclusion

Once your Sub-DAHAO is ready:

1. Submit a proposal to [dahao-org/core](https://github.com/dahao-org/core)
2. Get community approval
3. Transfer repository to `dahao-org/your-subdahao-name`

## Structure Overview

```
├── constitution/           # Governance and mission
│   ├── mission.yaml           # Sub-DAHAO mission and scope
│   ├── governance.yaml        # Local governance rules
│   └── extensions/            # Core framework extensions
├── proposals/             # Community proposals
│   ├── active/               # Currently being voted on
│   ├── approved/             # Approved and implemented
│   └── archived/             # Rejected or withdrawn
├── projects/              # Sub-DAHAO projects
├── agents/                # AI agent configurations
├── governance/            # Member registry and roles
├── .core/                 # Link to core framework
└── scripts/               # Automation and setup scripts
```

## Core Inheritance

Your Sub-DAHAO automatically inherits:

- **Core Values** (immutable): Cannot be changed
- **Base Framework** (extendable): Can add new rules
- **Terminology** (extendable): Can add domain terms

## Governance Model

Sub-DAHAOs operate with:

- **Local Autonomy**: Make domain-specific decisions
- **Core Alignment**: Must align with DAHAO core values
- **Democratic Process**: Community-driven governance
- **Transparency**: All decisions are public

## Getting Help

- [DAHAO Core Documentation](https://github.com/dahao-org/core)
- [Community Discussions](https://github.com/dahao-org/core/discussions)
- [Template Issues](https://github.com/dahao-org/template/issues)

## Contributing

1. Fork this template repository
2. Make improvements
3. Submit pull request
4. Help others create Sub-DAHAOs

## License

Licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/), inheriting from DAHAO core.
