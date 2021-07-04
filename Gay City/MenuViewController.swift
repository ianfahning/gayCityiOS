//
//  CollapsibleTableSectionViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 4/14/21.
//
import UIKit
import Foundation
import CollapsibleTableSectionViewController

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ section: Int)
    func changeView(_ identifier: String)
}

class MenuViewController: CollapsibleTableSectionViewController{

    var sections: [Section] = menuData
    var del: CollapsibleTableViewHeaderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
     func getDelegate()-> CollapsibleTableViewHeaderDelegate?{
        return del
    }
    
    
    
}
extension MenuViewController: CollapsibleTableSectionDelegate {
    
    func numberOfSections(_ tableView: UITableView) -> Int {
        return sections.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: Item = sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
        let identifier = item.viewIdentifier
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomCell ??
            CustomCell(style: .default, reuseIdentifier: identifier)
        
        
    
        cell.nameLabel.text = item.name
        cell.detailLabel.text = item.detail
        if item.imageName != "" {
            cell.imageUIView.image = UIImage(named: item.imageName)!
            
        }
        
        
        return cell
    }
    
    func collapsibleTableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].name
    }
    
    func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
        return true
    }
    
    func getHeaderIdentifer(identiferForHeader section: Int) -> String? {
        return sections[section].viewIdentifier
    }
    
    func changeView(_ identifier: String) {
        if identifier != "" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let view  = storyboard.instantiateViewController(withIdentifier: identifier)
            view.modalPresentationStyle = .fullScreen
            self.present(view, animated: true, completion: nil)
        }
        
    }
    
}

