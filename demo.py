#!/usr/bin/env python3
"""
Quick demonstration of Runic-Version-Testpilot with BackLink
"""

from runic_testpilot import RunicTestPilot

def main():
    print("=" * 70)
    print("Runic-Version-Testpilot with BackLink - Quick Demo")
    print("=" * 70)
    
    # Create testpilot
    pilot = RunicTestPilot("Quick Demo")
    
    # Add tests with dependencies
    pilot.add_test("test_a", "Test A", "First test")
    pilot.add_test("test_b", "Test B", "Depends on A", dependencies=["test_a"])
    pilot.add_test("test_c", "Test C", "Depends on B", dependencies=["test_b"])
    
    # Show backlinks
    print("\n📊 BackLink Visualization for Test C:")
    print(pilot.visualize_backlinks("test_c"))
    
    # Show reverse dependencies
    print("\n🔗 What depends on Test A?")
    dependents = pilot.get_dependent_tests("test_a")
    print(f"   Answer: {dependents}")
    
    # Show execution order
    print("\n⚙️  Execution order for Test C:")
    chain = pilot.get_dependency_chain("test_c")
    print(f"   {' → '.join(chain)}")
    
    # Run tests
    print("\n✅ Running tests...")
    for test_id in chain:
        pilot.run_test(test_id)
        test = pilot.get_test(test_id)
        print(f"   {test_id}: {test.status.value}")
    
    # Show statistics
    print("\n📈 Statistics:")
    stats = pilot.get_statistics()
    for key, value in stats.items():
        print(f"   {key}: {value}")
    
    print("\n" + "=" * 70)
    print("Demo complete! Check README.md for more examples.")
    print("=" * 70)

if __name__ == "__main__":
    main()
