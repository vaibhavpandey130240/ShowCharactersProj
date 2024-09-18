//
//  CharacterDetailVC.swift
//  ShowCharactersProj
//
//  Created by Vaibhav Pandey on 17/09/24.
//

import UIKit

class CharacterDetailVC: UIViewController {

    @IBOutlet weak var imgVCharacter: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSpecies: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblLocation: UILabel!

    var detailObj: CHResult? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseView()
    }

    func initialiseView() {
        if let name = detailObj?.name {
            lblName.text = name
        }
        if let species = detailObj?.species {
            lblSpecies.text = species
        }
        if let gender = detailObj?.gender {
            lblGender.text = gender.rawValue
        }
        if let status = detailObj?.status {
            lblStatus.text = status.rawValue
        }
        if let location = detailObj?.location?.name {
            lblLocation.text = location
        }
        if let imageURL = detailObj?.image {
            imgVCharacter.downloadImageFrom(link: imageURL)
        }
    }
    
    @IBAction func btnActionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
