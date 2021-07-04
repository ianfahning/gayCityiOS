//
//  HealthcareTableController.swift
//  Gay City
//
//  Created by Ian Fahning on 5/16/21.
//

import Foundation
import CollapsibleTableSectionViewController

class HealthcareTableController: MenuViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = HealthcareData
        self.delegate = self
    }
    
}
