#!/usr/bin/env python3
"""
Example usage of Runic-Version-Testpilot with BackLink functionality.

This script demonstrates how to use the testpilot framework for
Proxmox testing scenarios with complex dependency chains.
"""

from runic_testpilot import RunicTestPilot, TestStatus


def example_proxmox_vm_workflow():
    """Example: Complete Proxmox VM provisioning workflow."""
    print("Example 1: Proxmox VM Provisioning Workflow")
    print("=" * 70)
    
    pilot = RunicTestPilot("Proxmox VM Provisioning")
    
    # Infrastructure setup tests
    pilot.add_test(
        "infra_01", 
        "Verify Proxmox Cluster", 
        "Verify Proxmox cluster is healthy and accessible"
    )
    
    pilot.add_test(
        "infra_02", 
        "Check Storage", 
        "Verify storage pools are available",
        dependencies=["infra_01"]
    )
    
    pilot.add_test(
        "infra_03", 
        "Check Network", 
        "Verify network bridges are configured",
        dependencies=["infra_01"]
    )
    
    # VM template tests
    pilot.add_test(
        "template_01", 
        "Download ISO", 
        "Download OS installation ISO",
        dependencies=["infra_02"]
    )
    
    pilot.add_test(
        "template_02", 
        "Create VM Template", 
        "Create and configure VM template",
        dependencies=["template_01", "infra_03"]
    )
    
    # VM deployment tests
    pilot.add_test(
        "deploy_01", 
        "Clone VM", 
        "Clone VM from template",
        dependencies=["template_02"]
    )
    
    pilot.add_test(
        "deploy_02", 
        "Configure VM", 
        "Configure VM settings and resources",
        dependencies=["deploy_01"]
    )
    
    pilot.add_test(
        "deploy_03", 
        "Start VM", 
        "Start the VM and verify boot",
        dependencies=["deploy_02"]
    )
    
    # Add custom backlinks
    deploy_03 = pilot.get_test("deploy_03")
    deploy_03.add_backlink("infra_01", "requires_cluster")
    pilot._register_backlink(deploy_03.backlinks[-1])
    
    # Display test structure
    print("\nTest Dependency Chain for 'deploy_03':")
    chain = pilot.get_dependency_chain("deploy_03")
    for i, test_id in enumerate(chain, 1):
        test = pilot.get_test(test_id)
        print(f"  {i}. {test_id}: {test.name}")
    
    print("\n" + pilot.visualize_backlinks("deploy_03"))
    
    # Simulate test execution
    print("\n\nSimulating Test Execution:")
    print("-" * 70)
    for test_id in chain:
        pilot.run_test(test_id)
        test = pilot.get_test(test_id)
        print(f"  ✓ {test_id}: {test.name} [{test.status.value}]")
    
    # Show statistics
    print("\n\nTestPilot Statistics:")
    stats = pilot.get_statistics()
    for key, value in stats.items():
        print(f"  {key}: {value}")
    
    return pilot


def example_multi_vm_deployment():
    """Example: Multi-VM deployment with shared dependencies."""
    print("\n\nExample 2: Multi-VM Deployment with Shared Dependencies")
    print("=" * 70)
    
    pilot = RunicTestPilot("Multi-VM Deployment")
    
    # Shared infrastructure
    pilot.add_test("shared_01", "Setup Network", "Configure shared network")
    pilot.add_test("shared_02", "Setup Storage", "Configure shared storage")
    
    # Web server VM
    pilot.add_test(
        "web_01", 
        "Deploy Web Server VM", 
        "Deploy web server",
        dependencies=["shared_01", "shared_02"]
    )
    
    # Database VM
    pilot.add_test(
        "db_01", 
        "Deploy Database VM", 
        "Deploy database server",
        dependencies=["shared_01", "shared_02"]
    )
    
    # Application VM
    pilot.add_test(
        "app_01", 
        "Deploy App VM", 
        "Deploy application server",
        dependencies=["shared_01", "shared_02", "web_01", "db_01"]
    )
    
    # Show backlinks for application VM
    print("\n" + pilot.visualize_backlinks("app_01"))
    
    # Show reverse dependencies
    print("\n\nReverse Dependencies (What depends on shared_01):")
    dependents = pilot.get_dependent_tests("shared_01")
    for dep_id in dependents:
        test = pilot.get_test(dep_id)
        if test:
            print(f"  ← {dep_id}: {test.name}")
    
    return pilot


def example_backlink_metadata():
    """Example: Using BackLink metadata for additional context."""
    print("\n\nExample 3: BackLink Metadata Usage")
    print("=" * 70)
    
    pilot = RunicTestPilot("BackLink Metadata Example")
    
    pilot.add_test("base_01", "Base Test", "Base infrastructure test")
    pilot.add_test("derived_01", "Derived Test", "Test that uses base", 
                   dependencies=["base_01"])
    
    # Add backlink with metadata
    derived = pilot.get_test("derived_01")
    backlink = derived.add_backlink(
        "base_01", 
        "requires_resource",
        metadata={
            "resource_type": "network_bridge",
            "resource_name": "vmbr0",
            "criticality": "high"
        }
    )
    pilot._register_backlink(backlink)
    
    print("\nBackLink with Metadata:")
    print(f"  Source: {backlink.source_id}")
    print(f"  Target: {backlink.target_id}")
    print(f"  Type: {backlink.link_type}")
    print(f"  Metadata:")
    for key, value in backlink.metadata.items():
        print(f"    {key}: {value}")
    
    return pilot


def main():
    """Run all examples."""
    # Example 1: Basic Proxmox workflow
    pilot1 = example_proxmox_vm_workflow()
    pilot1.export_to_json("example_vm_workflow.json")
    
    # Example 2: Multi-VM deployment
    pilot2 = example_multi_vm_deployment()
    pilot2.export_to_json("example_multi_vm.json")
    
    # Example 3: BackLink metadata
    pilot3 = example_backlink_metadata()
    pilot3.export_to_json("example_metadata.json")
    
    print("\n\n" + "=" * 70)
    print("All examples completed successfully!")
    print("Check the generated JSON files for exported testpilot states.")
    print("=" * 70)


if __name__ == "__main__":
    main()
