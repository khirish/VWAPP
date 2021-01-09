//
//  SettingViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 19/12/20.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingTable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func closeButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
