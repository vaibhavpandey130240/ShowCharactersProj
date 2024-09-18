//
//  CharactersTableViewCell.swift
//  ShowCharactersProj
//
//  Created by Vaibhav Pandey on 17/09/24.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCharacters: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var vwHolder: UIView!

    static let cellIdentifier = String(describing: CharactersTableViewCell.self)

    var cellData: CHResult? {
        didSet {
            imgCharacters.image = nil
            if let status = cellData?.status {
                switch status {
                case .alive:
                    vwHolder.backgroundColor = UIColor(red: 235.0/255.0, green: 246.0/255.0, blue: 251.0/255.0, alpha: 1.0)
                case .dead:
                    vwHolder.backgroundColor = UIColor(red: 251.0/255.0, green: 231.0/255.0, blue: 235.0/255.0, alpha: 1.0)
                default:
                    vwHolder.backgroundColor = .white
                }
            }
            if let name = cellData?.name {
                lblName.text = name
            }
            if let species = cellData?.species {
                lblSpecies.text = species
            }
            if let imageURL = cellData?.image {
                imgCharacters.downloadImageFrom(link: imageURL)
            }
        }
    }
    
}
