#!/usr/bin/env python3
"""
Unit tests for Runic-Version-Testpilot with BackLink functionality.
"""

import unittest
import json
import os
from runic_testpilot import RunicTestPilot, TestCase, BackLink, TestStatus


class TestBackLink(unittest.TestCase):
    """Test cases for BackLink class."""
    
    def test_backlink_creation(self):
        """Test creating a backlink."""
        bl = BackLink("source_1", "target_1", "depends_on")
        self.assertEqual(bl.source_id, "source_1")
        self.assertEqual(bl.target_id, "target_1")
        self.assertEqual(bl.link_type, "depends_on")
    
    def test_backlink_reverse(self):
        """Test creating a reverse backlink."""
        bl = BackLink("source_1", "target_1", "depends_on")
        reverse_bl = bl.reverse()
        self.assertEqual(reverse_bl.source_id, "target_1")
        self.assertEqual(reverse_bl.target_id, "source_1")
        self.assertEqual(reverse_bl.link_type, "reverse_depends_on")
    
    def test_backlink_metadata(self):
        """Test backlink with metadata."""
        metadata = {"key": "value", "priority": "high"}
        bl = BackLink("source_1", "target_1", "custom_link", metadata=metadata)
        self.assertEqual(bl.metadata, metadata)


class TestTestCase(unittest.TestCase):
    """Test cases for TestCase class."""
    
    def test_testcase_creation(self):
        """Test creating a test case."""
        test = TestCase("test_1", "Test Name", "Test Description")
        self.assertEqual(test.test_id, "test_1")
        self.assertEqual(test.name, "Test Name")
        self.assertEqual(test.status, TestStatus.PENDING)
    
    def test_add_backlink(self):
        """Test adding backlink to test case."""
        test = TestCase("test_1", "Test Name", "Test Description")
        backlink = test.add_backlink("target_1", "depends_on")
        self.assertEqual(len(test.backlinks), 1)
        self.assertEqual(backlink.source_id, "test_1")
        self.assertEqual(backlink.target_id, "target_1")
    
    def test_get_backlinks_by_type(self):
        """Test filtering backlinks by type."""
        test = TestCase("test_1", "Test Name", "Test Description")
        test.add_backlink("target_1", "depends_on")
        test.add_backlink("target_2", "requires")
        test.add_backlink("target_3", "depends_on")
        
        depends_on_links = test.get_backlinks_by_type("depends_on")
        self.assertEqual(len(depends_on_links), 2)


class TestRunicTestPilot(unittest.TestCase):
    """Test cases for RunicTestPilot class."""
    
    def setUp(self):
        """Set up test fixtures."""
        self.pilot = RunicTestPilot("Test Pilot")
    
    def test_add_test(self):
        """Test adding a test to the pilot."""
        test = self.pilot.add_test("test_1", "Test Name", "Description")
        self.assertIsNotNone(test)
        self.assertEqual(test.test_id, "test_1")
        self.assertEqual(len(self.pilot.tests), 1)
    
    def test_add_test_with_dependencies(self):
        """Test adding a test with dependencies."""
        self.pilot.add_test("test_1", "Test 1", "Description 1")
        test2 = self.pilot.add_test("test_2", "Test 2", "Description 2", 
                                     dependencies=["test_1"])
        self.assertEqual(test2.dependencies, ["test_1"])
        self.assertGreater(len(test2.backlinks), 0)
    
    def test_get_test(self):
        """Test retrieving a test by ID."""
        self.pilot.add_test("test_1", "Test Name", "Description")
        test = self.pilot.get_test("test_1")
        self.assertIsNotNone(test)
        self.assertEqual(test.test_id, "test_1")
    
    def test_get_dependent_tests(self):
        """Test getting tests that depend on a specific test."""
        self.pilot.add_test("test_1", "Test 1", "Description 1")
        self.pilot.add_test("test_2", "Test 2", "Description 2", 
                           dependencies=["test_1"])
        self.pilot.add_test("test_3", "Test 3", "Description 3", 
                           dependencies=["test_1"])
        
        dependents = self.pilot.get_dependent_tests("test_1")
        self.assertEqual(len(dependents), 2)
        self.assertIn("test_2", dependents)
        self.assertIn("test_3", dependents)
    
    def test_get_dependency_chain(self):
        """Test getting the dependency chain for a test."""
        self.pilot.add_test("test_1", "Test 1", "Description 1")
        self.pilot.add_test("test_2", "Test 2", "Description 2", 
                           dependencies=["test_1"])
        self.pilot.add_test("test_3", "Test 3", "Description 3", 
                           dependencies=["test_2"])
        
        chain = self.pilot.get_dependency_chain("test_3")
        self.assertEqual(chain, ["test_1", "test_2", "test_3"])
    
    def test_update_test_status(self):
        """Test updating test status."""
        self.pilot.add_test("test_1", "Test Name", "Description")
        self.pilot.update_test_status("test_1", TestStatus.PASSED)
        test = self.pilot.get_test("test_1")
        self.assertEqual(test.status, TestStatus.PASSED)
    
    def test_run_test(self):
        """Test running a test."""
        self.pilot.add_test("test_1", "Test Name", "Description")
        result = self.pilot.run_test("test_1")
        self.assertTrue(result)
        test = self.pilot.get_test("test_1")
        self.assertEqual(test.status, TestStatus.PASSED)
    
    def test_run_test_with_failed_dependency(self):
        """Test running a test with a failed dependency."""
        self.pilot.add_test("test_1", "Test 1", "Description 1")
        self.pilot.add_test("test_2", "Test 2", "Description 2", 
                           dependencies=["test_1"])
        
        # Make test_1 fail
        self.pilot.update_test_status("test_1", TestStatus.FAILED)
        
        # Try to run test_2
        result = self.pilot.run_test("test_2")
        self.assertFalse(result)
        test2 = self.pilot.get_test("test_2")
        self.assertEqual(test2.status, TestStatus.SKIPPED)
    
    def test_export_to_json(self):
        """Test exporting testpilot state to JSON."""
        self.pilot.add_test("test_1", "Test Name", "Description")
        filepath = "/tmp/test_export.json"
        
        self.pilot.export_to_json(filepath)
        self.assertTrue(os.path.exists(filepath))
        
        with open(filepath, 'r') as f:
            data = json.load(f)
        
        self.assertEqual(data["name"], "Test Pilot")
        self.assertIn("test_1", data["tests"])
        
        # Cleanup
        os.remove(filepath)
    
    def test_get_statistics(self):
        """Test getting statistics."""
        self.pilot.add_test("test_1", "Test 1", "Description 1")
        self.pilot.add_test("test_2", "Test 2", "Description 2", 
                           dependencies=["test_1"])
        
        stats = self.pilot.get_statistics()
        self.assertEqual(stats["total_tests"], 2)
        self.assertGreater(stats["total_backlinks"], 0)
        self.assertEqual(stats["tests_with_dependencies"], 1)
    
    def test_visualize_backlinks(self):
        """Test backlink visualization."""
        self.pilot.add_test("test_1", "Test 1", "Description 1")
        self.pilot.add_test("test_2", "Test 2", "Description 2", 
                           dependencies=["test_1"])
        
        visualization = self.pilot.visualize_backlinks("test_2")
        self.assertIn("test_1", visualization)
        self.assertIn("BackLink Visualization", visualization)


class TestIntegration(unittest.TestCase):
    """Integration tests for the complete workflow."""
    
    def test_complete_workflow(self):
        """Test a complete workflow with multiple tests and dependencies."""
        pilot = RunicTestPilot("Integration Test")
        
        # Create a chain of tests
        pilot.add_test("setup", "Setup Environment", "Setup test environment")
        pilot.add_test("test_1", "Test 1", "First test", dependencies=["setup"])
        pilot.add_test("test_2", "Test 2", "Second test", dependencies=["test_1"])
        pilot.add_test("test_3", "Test 3", "Third test", dependencies=["test_2"])
        
        # Run all tests in order
        chain = pilot.get_dependency_chain("test_3")
        for test_id in chain:
            pilot.run_test(test_id)
        
        # Verify all tests passed
        for test_id in chain:
            test = pilot.get_test(test_id)
            self.assertEqual(test.status, TestStatus.PASSED)
        
        # Verify statistics
        stats = pilot.get_statistics()
        self.assertEqual(stats["total_tests"], 4)
        self.assertEqual(stats["status_breakdown"]["passed"], 4)


if __name__ == "__main__":
    unittest.main()
