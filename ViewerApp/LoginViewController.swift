//
//  LoginViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 19/12/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var registerBtn: UIButton!
    
    var paper = [PaperData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerBtn.layer.borderColor = UIColor.systemBlue.cgColor
//        registerBtn.layer.borderWidth = 10
        
        getData()
    }
    
    func getData() {
        let getUrl = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: "tmp")
        
        for (index, url) in getUrl!.enumerated() {
        
            paper.append(PaperData(url: url, id: index))
        }
    }


}
