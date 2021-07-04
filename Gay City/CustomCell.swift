//
//  CustomCell.swift
//  Gay City
//
//  Created by Ian Fahning on 4/14/21.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    let nameLabel = UILabel()
    let detailLabel = UILabel()
    let imageUIView = UIImageView()
    let slidingController =  SlidingViewController()
    var delegate: CollapsibleTableViewHeaderDelegate?
    
    
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let marginGuide = contentView.layoutMarginsGuide
        
        // configure nameLabel
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont(name: "rokkitt-regular",size: 16)
        
        // configure detailLabel
        contentView.addSubview(detailLabel)
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont(name: "rokkitt-regular",size: 10)
        
        //configure image
        contentView.addSubview(imageUIView)
        imageUIView.translatesAutoresizingMaskIntoConstraints = false
        imageUIView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        imageUIView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        imageUIView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        imageUIView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        imageUIView.contentMode = .scaleAspectFit
        //
        // Call tapCell when tapping on this item
        //
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapCell(_:))))
    }
    
    //
    // Trigger toggle section when tapping on the cell
    //
    @objc func tapCell(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CustomCell else {
            return
        }
        slidingController.changeView(cell.reuseIdentifier ?? "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
