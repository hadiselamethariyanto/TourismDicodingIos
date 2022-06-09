//
//  ProfileViewController.swift
//  TourismDicoding
//
//  Created by MuhammadHariyanto on 08/06/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func goToLinkedIn(_ sender: Any) {
        let urlLinkedin = "https://www.linkedin.com/in/hadi-hariyanto-776974128/"

        if let url = URL(string: urlLinkedin), UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
        }
    }
    
}
