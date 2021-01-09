//
//  PaperSubscriptionViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 29/12/20.
//

import UIKit

class PaperSubscriptionViewController: UIViewController {

    @IBOutlet weak var paperImg: UIImageView!
    
    var paperImage: UIImage?
    var getId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("%%%%%%%% \(getId)")
        paperImg.image = paperImage
    }
    
    @IBAction func purchaseBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "サブスクライブ!", message: "サブスクライブされます", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Logout", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    


}
