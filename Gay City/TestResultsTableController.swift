//
//  TestResultsTableController.swift
//  Gay City
//
//  Created by Ian Fahning on 5/15/21.
//

import UIKit
import Foundation
import CollapsibleTableSectionViewController

class TestResultsTableController: MenuViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = testResualtsData
        self.delegate = self
    }
    
}
