# Proxmox-Runic-Version-Testpilot

A comprehensive coding framework for Proxmox testing with advanced **BackLink** support for tracking bidirectional dependencies and relationships between test cases.

## Features

- **TestPilot Framework**: Manage and execute test cases with dependency tracking
- **BackLink System**: Bidirectional reference tracking between tests and resources
- **Dependency Chains**: Automatic resolution of test execution order
- **Status Tracking**: Monitor test execution status (pending, running, passed, failed, skipped)
- **Metadata Support**: Attach custom metadata to tests and backlinks
- **JSON Export**: Export test state and backlinks for analysis
- **Visualization**: Text-based visualization of test dependencies and backlinks

## What is BackLink?

A **BackLink** is a bidirectional reference between two entities (tests, resources, etc.). Unlike simple dependencies, backlinks maintain relationships in both directions:

- When Test A depends on Test B, the framework creates:
  - A forward link: `A → B` (depends_on)
  - A reverse link: `B → A` (reverse_depends_on)

This allows you to:
- Find all tests that depend on a specific test
- Trace dependency chains in both directions
- Understand the impact of changes
- Track resource usage and requirements

## Installation

No installation required! This is a standalone Python module.

```bash
# Clone the repository
git clone https://github.com/EU-UNION-AI-PACT/Proxmox-Runic-Version-Testpilot.git
cd Proxmox-Runic-Version-Testpilot

# Run the main module
python3 runic_testpilot.py

# Run examples
python3 examples.py

# Run tests
python3 test_runic_testpilot.py
```

## Quick Start

```python
from runic_testpilot import RunicTestPilot, TestStatus

# Create a testpilot instance
pilot = RunicTestPilot("My Test Suite")

# Add tests with dependencies
pilot.add_test("setup", "Setup Environment", "Initialize test environment")
pilot.add_test("test_1", "First Test", "Test basic functionality", 
               dependencies=["setup"])
pilot.add_test("test_2", "Second Test", "Test advanced features", 
               dependencies=["test_1"])

# Get dependency chain
chain = pilot.get_dependency_chain("test_2")
print(f"Execution order: {chain}")  # ['setup', 'test_1', 'test_2']

# Run tests in order
for test_id in chain:
    pilot.run_test(test_id)

# Check what depends on 'setup'
dependents = pilot.get_dependent_tests("setup")
print(f"Tests depending on setup: {dependents}")  # ['test_1']

# Visualize backlinks
print(pilot.visualize_backlinks("test_2"))

# Export to JSON
pilot.export_to_json("my_tests.json")
```

## Usage Examples

### Example 1: Proxmox VM Workflow

```python
pilot = RunicTestPilot("Proxmox VM Provisioning")

# Infrastructure tests
pilot.add_test("infra_01", "Verify Proxmox Cluster", "Check cluster health")
pilot.add_test("infra_02", "Check Storage", "Verify storage pools", 
               dependencies=["infra_01"])

# Template tests
pilot.add_test("template_01", "Download ISO", "Download OS ISO", 
               dependencies=["infra_02"])
pilot.add_test("template_02", "Create VM Template", "Build VM template", 
               dependencies=["template_01"])

# Deployment tests
pilot.add_test("deploy_01", "Clone VM", "Clone from template", 
               dependencies=["template_02"])
pilot.add_test("deploy_02", "Configure VM", "Configure VM settings", 
               dependencies=["deploy_01"])
pilot.add_test("deploy_03", "Start VM", "Boot the VM", 
               dependencies=["deploy_02"])

# Run all tests
for test_id in pilot.get_dependency_chain("deploy_03"):
    pilot.run_test(test_id)
```

### Example 2: Custom BackLinks with Metadata

```python
pilot = RunicTestPilot("Resource Tracking")

pilot.add_test("network_setup", "Setup Network", "Configure vmbr0")
pilot.add_test("vm_deploy", "Deploy VM", "Deploy test VM")

# Add custom backlink with metadata
vm_test = pilot.get_test("vm_deploy")
backlink = vm_test.add_backlink(
    "network_setup",
    "requires_resource",
    metadata={
        "resource_type": "network_bridge",
        "resource_name": "vmbr0",
        "criticality": "high"
    }
)
```

### Example 3: Multi-VM Deployment

```python
pilot = RunicTestPilot("Multi-VM Setup")

# Shared infrastructure
pilot.add_test("shared_net", "Setup Network", "Configure shared network")
pilot.add_test("shared_storage", "Setup Storage", "Configure shared storage")

# Multiple VMs using shared resources
pilot.add_test("web_vm", "Deploy Web Server", "Deploy web VM", 
               dependencies=["shared_net", "shared_storage"])
pilot.add_test("db_vm", "Deploy Database", "Deploy DB VM", 
               dependencies=["shared_net", "shared_storage"])
pilot.add_test("app_vm", "Deploy App Server", "Deploy app VM", 
               dependencies=["shared_net", "shared_storage", "web_vm", "db_vm"])

# Find all VMs that depend on shared network
dependents = pilot.get_dependent_tests("shared_net")
print(f"VMs using shared network: {dependents}")
```

## API Reference

### RunicTestPilot

Main class for managing tests and backlinks.

**Methods:**
- `add_test(test_id, name, description, dependencies=None)` - Add a new test
- `get_test(test_id)` - Retrieve a test by ID
- `get_dependent_tests(test_id)` - Get tests that depend on this test
- `get_dependency_chain(test_id)` - Get full dependency chain for a test
- `update_test_status(test_id, status)` - Update test status
- `run_test(test_id)` - Execute a test
- `get_all_backlinks(entity_id)` - Get all backlinks for an entity
- `get_statistics()` - Get testpilot statistics
- `visualize_backlinks(test_id)` - Generate text visualization of backlinks
- `export_to_json(filepath)` - Export state to JSON

### TestCase

Represents a single test case.

**Attributes:**
- `test_id` - Unique test identifier
- `name` - Test name
- `description` - Test description
- `status` - Current status (TestStatus enum)
- `dependencies` - List of test IDs this test depends on
- `backlinks` - List of BackLink objects
- `created_at` - Creation timestamp
- `updated_at` - Last update timestamp
- `metadata` - Custom metadata dictionary

**Methods:**
- `add_backlink(target_id, link_type, metadata=None)` - Add a backlink
- `get_backlinks_by_type(link_type)` - Filter backlinks by type
- `to_dict()` - Convert to dictionary

### BackLink

Represents a bidirectional link between entities.

**Attributes:**
- `source_id` - Source entity ID
- `target_id` - Target entity ID
- `link_type` - Type of link
- `created_at` - Creation timestamp
- `metadata` - Custom metadata dictionary

**Methods:**
- `reverse()` - Create a reverse backlink

### TestStatus

Enum for test status values:
- `PENDING` - Test not yet started
- `RUNNING` - Test currently executing
- `PASSED` - Test completed successfully
- `FAILED` - Test failed
- `SKIPPED` - Test skipped (usually due to failed dependency)

## Configuration

See `config.yaml` for configuration options:

```yaml
testpilot:
  name: "Proxmox Runic TestPilot"
  version: "1.0.0"

backlink:
  enable_bidirectional: true
  track_dependencies: true
  auto_reverse_links: true

execution:
  parallel_execution: false
  fail_fast: true
  skip_on_dependency_failure: true
```

## Testing

Run the included test suite:

```bash
python3 test_runic_testpilot.py
```

The test suite includes:
- BackLink creation and reversal tests
- TestCase functionality tests
- RunicTestPilot integration tests
- Dependency chain resolution tests
- JSON export/import tests
- Complete workflow integration tests

## Architecture

```
┌─────────────────────────────────────┐
│      RunicTestPilot                 │
│  (Main Framework Controller)        │
├─────────────────────────────────────┤
│  - tests: Dict[str, TestCase]       │
│  - backlink_registry: Dict          │
│  - add_test()                       │
│  - run_test()                       │
│  - get_dependent_tests()            │
└──────────┬──────────────────────────┘
           │
           │ manages
           │
           ▼
┌─────────────────────────────────────┐
│         TestCase                    │
│  (Individual Test)                  │
├─────────────────────────────────────┤
│  - test_id: str                     │
│  - dependencies: List[str]          │
│  - backlinks: List[BackLink]        │
│  - status: TestStatus               │
│  - add_backlink()                   │
└──────────┬──────────────────────────┘
           │
           │ contains
           │
           ▼
┌─────────────────────────────────────┐
│        BackLink                     │
│  (Bidirectional Reference)          │
├─────────────────────────────────────┤
│  - source_id: str                   │
│  - target_id: str                   │
│  - link_type: str                   │
│  - metadata: Dict                   │
│  - reverse()                        │
└─────────────────────────────────────┘
```

## Use Cases

1. **Proxmox VM Testing**: Manage complex VM provisioning workflows
2. **Dependency Tracking**: Understand test dependencies and impacts
3. **Resource Management**: Track which tests use which resources
4. **CI/CD Integration**: Export test results for pipeline integration
5. **Impact Analysis**: Determine which tests are affected by changes
6. **Test Planning**: Visualize test execution order and dependencies

## License

This project is part of the EU-UNION-AI-PACT initiative.

## Contributing

Contributions are welcome! Please ensure all tests pass before submitting changes.

## Author

Created as part of the Runic-Coding-Version-Testpilot project.
