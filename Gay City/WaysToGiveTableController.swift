//
//  WaysToGiveTableController.swift
//  Gay City
//
//  Created by Ian Fahning on 5/29/21.
//

import UIKit
import Foundation
import CollapsibleTableSectionViewController

class WaysToGiveTableController: MenuViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sections = giveData
        self.delegate = self
    }
    
}

