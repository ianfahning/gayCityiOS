//
//  ResourceViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 6/13/21.
//

import Foundation
import UIKit

class ResourceViewController: ViewController{
    @IBOutlet var organizationView: UILabel!
    @IBOutlet var missionView: UILabel!
    @IBOutlet var visionView: UILabel!
    @IBOutlet var valuesView: UILabel!
    @IBOutlet var servicesAndResourcesView: UILabel!
    @IBOutlet var serviceAvalibilityView: UILabel!
    @IBOutlet var resourcesAvalibilityView: UILabel!
    @IBOutlet var websiteView: UILabel!
    @IBOutlet var phoneView: UILabel!
    @IBOutlet var emailView: UILabel!
    @IBOutlet var communitesView: UILabel!
    @IBOutlet var basicNeedssupportsView: UILabel!
    @IBOutlet var accessNeedsView: UILabel!
    
    private var organization: String = "-"
    private var mission: String = "-"
    private var vision: String = "-"
    private var values: String = "-"
    private var servicesAndResources: String = "-"
    private var serviceAvalibility: String = "-"
    private var resourcesAvalibility: String = "-"
    private var website: String = "-"
    private var phone: String = "-"
    private var email: String = "-"
    private var communities: String = "-"
    private var basicNeedssupports: String = "-"
    private var accessNeeds: String = "-"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        organizationView.text = organization
        missionView.text = mission
        visionView.text = vision
        valuesView.text = values
        servicesAndResourcesView.text = servicesAndResources
        serviceAvalibilityView.text = serviceAvalibility
        resourcesAvalibilityView.text = resourcesAvalibility
        websiteView.text = website
        phoneView.text = phone
        emailView.text = email
        communitesView.text = communities
        basicNeedssupportsView.text = basicNeedssupports
        accessNeedsView.text = accessNeeds
        
    }
    
    func configure(organization: String, mission: String, vision: String, values: String, servicesAndResources: String, serviceAvalibility: String, resourceAvalibility: String, website: String, phone: String, email: String, communities: String, basicNeeds: String, accessNeeds: String){
        self.organization = organization
        self.mission = changeUndefined(string:mission)
        self.vision = changeUndefined(string:vision)
        self.values = changeUndefined(string:values)
        self.servicesAndResources = changeUndefined(string:servicesAndResources)
        self.serviceAvalibility = changeUndefined(string:serviceAvalibility)
        self.resourcesAvalibility = changeUndefined(string:resourceAvalibility)
        self.website = changeUndefined(string:website)
        self.phone = changeUndefined(string:phone)
        self.email = changeUndefined(string:email)
        self.communities = changeUndefined(string:communities)
        self.basicNeedssupports = changeUndefined(string:basicNeeds)
        self.accessNeeds = changeUndefined(string:accessNeeds)
    }
    
    private func changeUndefined(string: String) -> String{
        if string == "undefined"{
            return "-"
        }else{
            return string
        }
    }
}
