//
//  ScrapbookDetailViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 31/12/20.
//

import UIKit

class ScrapbookDetailViewController: UIViewController {
    
    var Scrapbooktitle: String?
    var Scrapbookdetail: String?
    
    @IBOutlet weak var scrapBookTitle: UILabel!
    @IBOutlet weak var scrapBookDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrapBookTitle.text = Scrapbooktitle
        scrapBookDetail.text = Scrapbookdetail
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
