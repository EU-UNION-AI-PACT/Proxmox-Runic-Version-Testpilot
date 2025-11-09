#!/usr/bin/env python3
"""
Runic-Version-Testpilot: A coding framework for Proxmox testing with BackLink support.

This module provides a testpilot framework that tracks bidirectional references
(backlinks) between test cases, resources, and their dependencies.
"""

import json
import datetime
from typing import Dict, List, Optional, Set
from dataclasses import dataclass, field, asdict
from enum import Enum


class TestStatus(Enum):
    """Status of a test case."""
    PENDING = "pending"
    RUNNING = "running"
    PASSED = "passed"
    FAILED = "failed"
    SKIPPED = "skipped"


@dataclass
class BackLink:
    """Represents a bidirectional link between entities."""
    source_id: str
    target_id: str
    link_type: str
    created_at: str = field(default_factory=lambda: datetime.datetime.now().isoformat())
    metadata: Dict = field(default_factory=dict)
    
    def reverse(self) -> 'BackLink':
        """Create a reverse backlink."""
        return BackLink(
            source_id=self.target_id,
            target_id=self.source_id,
            link_type=f"reverse_{self.link_type}",
            created_at=self.created_at,
            metadata=self.metadata
        )


@dataclass
class TestCase:
    """Represents a test case in the testpilot framework."""
    test_id: str
    name: str
    description: str
    status: TestStatus = TestStatus.PENDING
    dependencies: List[str] = field(default_factory=list)
    backlinks: List[BackLink] = field(default_factory=list)
    created_at: str = field(default_factory=lambda: datetime.datetime.now().isoformat())
    updated_at: str = field(default_factory=lambda: datetime.datetime.now().isoformat())
    metadata: Dict = field(default_factory=dict)
    
    def add_backlink(self, target_id: str, link_type: str, metadata: Optional[Dict] = None):
        """Add a backlink to another entity."""
        backlink = BackLink(
            source_id=self.test_id,
            target_id=target_id,
            link_type=link_type,
            metadata=metadata or {}
        )
        self.backlinks.append(backlink)
        self.updated_at = datetime.datetime.now().isoformat()
        return backlink
    
    def get_backlinks_by_type(self, link_type: str) -> List[BackLink]:
        """Get all backlinks of a specific type."""
        return [bl for bl in self.backlinks if bl.link_type == link_type]
    
    def to_dict(self) -> Dict:
        """Convert test case to dictionary."""
        data = asdict(self)
        data['status'] = self.status.value
        return data


class RunicTestPilot:
    """
    Main testpilot framework with BackLink support.
    
    This framework manages test cases and maintains bidirectional references
    between tests, resources, and dependencies.
    """
    
    def __init__(self, name: str = "Proxmox Runic TestPilot"):
        self.name = name
        self.tests: Dict[str, TestCase] = {}
        self.backlink_registry: Dict[str, List[BackLink]] = {}
        self.created_at = datetime.datetime.now().isoformat()
    
    def add_test(self, test_id: str, name: str, description: str, 
                 dependencies: Optional[List[str]] = None) -> TestCase:
        """Add a new test case to the testpilot."""
        test = TestCase(
            test_id=test_id,
            name=name,
            description=description,
            dependencies=dependencies or []
        )
        self.tests[test_id] = test
        
        # Create backlinks for dependencies
        for dep_id in test.dependencies:
            backlink = test.add_backlink(dep_id, "depends_on")
            self._register_backlink(backlink)
            # Create reverse backlink
            reverse_backlink = backlink.reverse()
            self._register_backlink(reverse_backlink)
        
        return test
    
    def _register_backlink(self, backlink: BackLink):
        """Register a backlink in the registry."""
        if backlink.source_id not in self.backlink_registry:
            self.backlink_registry[backlink.source_id] = []
        self.backlink_registry[backlink.source_id].append(backlink)
    
    def get_test(self, test_id: str) -> Optional[TestCase]:
        """Get a test case by ID."""
        return self.tests.get(test_id)
    
    def get_all_backlinks(self, entity_id: str) -> List[BackLink]:
        """Get all backlinks for an entity."""
        return self.backlink_registry.get(entity_id, [])
    
    def get_dependent_tests(self, test_id: str) -> List[str]:
        """Get all tests that depend on this test."""
        backlinks = self.get_all_backlinks(test_id)
        return [bl.target_id for bl in backlinks if bl.link_type.startswith("reverse_depends_on")]
    
    def get_dependency_chain(self, test_id: str) -> List[str]:
        """Get the full dependency chain for a test."""
        test = self.get_test(test_id)
        if not test:
            return []
        
        chain = []
        visited = set()
        
        def traverse(tid: str):
            if tid in visited:
                return
            visited.add(tid)
            t = self.get_test(tid)
            if t:
                for dep in t.dependencies:
                    traverse(dep)
                chain.append(tid)
        
        traverse(test_id)
        return chain
    
    def update_test_status(self, test_id: str, status: TestStatus):
        """Update the status of a test case."""
        test = self.get_test(test_id)
        if test:
            test.status = status
            test.updated_at = datetime.datetime.now().isoformat()
    
    def run_test(self, test_id: str) -> bool:
        """
        Run a test case (placeholder for actual test execution).
        Returns True if test passes, False otherwise.
        """
        test = self.get_test(test_id)
        if not test:
            return False
        
        # Check dependencies
        for dep_id in test.dependencies:
            dep_test = self.get_test(dep_id)
            if dep_test and dep_test.status != TestStatus.PASSED:
                test.status = TestStatus.SKIPPED
                test.updated_at = datetime.datetime.now().isoformat()
                return False
        
        # Update status
        self.update_test_status(test_id, TestStatus.RUNNING)
        
        # Placeholder for actual test execution
        # In a real implementation, this would execute the test
        self.update_test_status(test_id, TestStatus.PASSED)
        
        return True
    
    def export_to_json(self, filepath: str):
        """Export the testpilot state to JSON."""
        data = {
            "name": self.name,
            "created_at": self.created_at,
            "tests": {tid: test.to_dict() for tid, test in self.tests.items()},
            "backlink_registry": {
                entity_id: [asdict(bl) for bl in backlinks]
                for entity_id, backlinks in self.backlink_registry.items()
            }
        }
        
        with open(filepath, 'w') as f:
            json.dump(data, f, indent=2)
    
    def get_statistics(self) -> Dict:
        """Get statistics about the testpilot."""
        status_counts = {status: 0 for status in TestStatus}
        for test in self.tests.values():
            status_counts[test.status] += 1
        
        return {
            "total_tests": len(self.tests),
            "total_backlinks": sum(len(bls) for bls in self.backlink_registry.values()),
            "status_breakdown": {status.value: count for status, count in status_counts.items()},
            "tests_with_dependencies": sum(1 for test in self.tests.values() if test.dependencies)
        }
    
    def visualize_backlinks(self, test_id: str) -> str:
        """Generate a text visualization of backlinks for a test."""
        test = self.get_test(test_id)
        if not test:
            return f"Test '{test_id}' not found."
        
        lines = [f"BackLink Visualization for Test: {test.name} ({test_id})"]
        lines.append("=" * 60)
        lines.append(f"\nDirect Dependencies ({len(test.dependencies)}):")
        for dep_id in test.dependencies:
            lines.append(f"  └─> {dep_id}")
        
        dependent_tests = self.get_dependent_tests(test_id)
        lines.append(f"\nTests Depending on This ({len(dependent_tests)}):")
        for dep_test_id in dependent_tests:
            lines.append(f"  <─┘ {dep_test_id}")
        
        all_backlinks = self.get_all_backlinks(test_id)
        lines.append(f"\nAll BackLinks ({len(all_backlinks)}):")
        for bl in all_backlinks:
            lines.append(f"  [{bl.link_type}] {bl.source_id} <-> {bl.target_id}")
        
        return "\n".join(lines)


def main():
    """Example usage of the Runic TestPilot framework."""
    print("Runic-Version-Testpilot with BackLink Support")
    print("=" * 60)
    
    # Create testpilot instance
    pilot = RunicTestPilot("Proxmox VM Testing")
    
    # Add test cases with dependencies
    pilot.add_test("test_01", "Setup Proxmox Environment", 
                   "Initialize Proxmox test environment")
    pilot.add_test("test_02", "Create VM Template", 
                   "Create a base VM template", 
                   dependencies=["test_01"])
    pilot.add_test("test_03", "Clone VM from Template", 
                   "Clone a VM from the template", 
                   dependencies=["test_02"])
    pilot.add_test("test_04", "Configure VM Network", 
                   "Configure network settings", 
                   dependencies=["test_03"])
    pilot.add_test("test_05", "Start VM", 
                   "Start the configured VM", 
                   dependencies=["test_03", "test_04"])
    
    # Add custom backlinks
    test_05 = pilot.get_test("test_05")
    test_05.add_backlink("test_01", "requires_environment")
    pilot._register_backlink(BackLink("test_05", "test_01", "requires_environment"))
    
    # Display statistics
    print("\nTestPilot Statistics:")
    stats = pilot.get_statistics()
    for key, value in stats.items():
        print(f"  {key}: {value}")
    
    # Visualize backlinks
    print("\n" + pilot.visualize_backlinks("test_05"))
    
    # Show dependency chain
    print(f"\nDependency chain for test_05: {pilot.get_dependency_chain('test_05')}")
    
    # Run tests in order
    print("\nRunning tests...")
    for test_id in pilot.get_dependency_chain("test_05"):
        result = pilot.run_test(test_id)
        test = pilot.get_test(test_id)
        print(f"  {test_id}: {test.status.value}")
    
    # Export to JSON
    pilot.export_to_json("testpilot_state.json")
    print("\nTestPilot state exported to testpilot_state.json")


if __name__ == "__main__":
    main()
