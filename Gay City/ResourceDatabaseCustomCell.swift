//
//  ResourceDatabaseCustomCell.swift
//  Gay City
//
//  Created by Ian Fahning on 6/12/21.
//

import Foundation
import UIKit

class ResourceDatabaseCustomCell: UICollectionViewCell{
    
    @IBOutlet var organizationView: UILabel!
    @IBOutlet var communitiesView: UILabel!
    @IBOutlet var basicNeedsView: UILabel!
    @IBOutlet var websiteView: UILabel!
    
    func configure(organization: String, communities: String, basicNeeds: String, website: String){
        organizationView.text = organization
        communitiesView.text = communities
        basicNeedsView.text = basicNeeds
        websiteView.text = website
    }

}
