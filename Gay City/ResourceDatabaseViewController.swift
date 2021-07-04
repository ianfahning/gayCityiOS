//
//  ResourceDatabaseViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 6/6/21.
//

import UIKit
import Foundation

class ResourceDatabaseViewController: ViewController, UISearchBarDelegate{
    
    @IBOutlet var loadingSymbol: UIActivityIndicatorView!
    
    struct ResourceData: Codable {
        var Organization: String
        var Communities: String
        var basicNeeds: String
        var website: String
        var services: String
        var mission: String
        var vision: String
        var values: String
        var serviceAvailablility: String
        var resourceAvailablility: String
        var accessNeeds: String
        var phone: String
        var email: String
    }
    
    @IBOutlet var collectionView: UICollectionView!
    private var resourceData: [ResourceData] = []
    private var resourceDataCopy: [ResourceData] = []
    private var isDone = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingSymbol.startAnimating()
        let urlString = "https://gay-city-server.herokuapp.com/"
        self.loadJson(fromURLString: urlString) { (result) in
            switch result {
            case .success(let data):
                //drops the resource tag at the front for easier decoding
                let data = data.dropLast(1).dropFirst(13)
                let dataString = String(data: data, encoding: .utf8)
                //removes all control characters becasue they cause errors
                let dataStringRemovedCtrlChars = self.removingControlCharacters(inputString: dataString!)
                let dataRemovedCtrlChars = dataStringRemovedCtrlChars.data(using: .utf8)
                self.resourceData = self.parse(jsonData: dataRemovedCtrlChars!)
                self.resourceDataCopy = self.resourceData
                self.isDone = true
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        while(!isDone){
            
        }
        loadingSymbol.stopAnimating()
        loadingSymbol.isHidden = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func removingControlCharacters(inputString: String) -> String {
        let controlChars = CharacterSet.controlCharacters
        var range = (inputString as NSString).rangeOfCharacter(from: controlChars)
        if range.location != NSNotFound {
            var mutable = inputString
            while range.location != NSNotFound {
                if let subRange = Range<String.Index>(range, in: mutable) { mutable.removeSubrange(subRange) }
                range = (mutable as NSString).rangeOfCharacter(from: controlChars)
            }
            return mutable
        }
        return inputString
    }
    
    private func parse(jsonData: Data) -> [ResourceData]{
            return try! JSONDecoder().decode([ResourceData].self, from: jsonData)
    }
    
    private func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
    

    
    
}

extension ResourceDatabaseViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let resourceView = self.storyboard?.instantiateViewController(withIdentifier: "resourceView") as? ResourceViewController
        let resource = resourceData[indexPath.item]
        resourceView?.configure(organization: resource.Organization, mission: resource.mission, vision: resource.vision, values: resource.values, servicesAndResources: resource.services, serviceAvalibility: resource.serviceAvailablility, resourceAvalibility: resource.resourceAvailablility, website: resource.website, phone: resource.phone, email: resource.email, communities: resource.Communities, basicNeeds: resource.basicNeeds, accessNeeds: resource.accessNeeds)
        resourceView?.modalPresentationStyle = .fullScreen
        self.present(resourceView!, animated: true, completion: nil)
    }

    
}

extension ResourceDatabaseViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resourceData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ResourceDatabaseCustomCell
        
        let resource = resourceData[indexPath.item]
        cell.configure(organization: resource.Organization, communities: resource.Communities, basicNeeds: resource.basicNeeds, website: resource.website)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
     
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SearchBar", for: indexPath)
        return searchView
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.resourceData.removeAll()
             
        for item in self.resourceDataCopy {
            let search = searchBar.text!.lowercased()
            if (item.Organization.lowercased().contains(search) || item.Communities.lowercased().contains(search) || item.basicNeeds.lowercased().contains(search)) {
                self.resourceData.append(item)
            }
        }
             
        if (searchBar.text!.isEmpty) {
            self.resourceData = self.resourceDataCopy
        }
        self.collectionView.reloadData()
    }
}
