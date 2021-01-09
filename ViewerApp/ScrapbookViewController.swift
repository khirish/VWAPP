//
//  ScrapbookViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 30/12/20.
//

import UIKit

class ScrapbookViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var scrapTitle = ["スクラップ名称 1", "スクラップ名称 2", "スクラップ名称 3", "スクラップ名称 4", "スクラップ名称 5"]
    var scrapData = ["⽇付 1", "⽇付 2", "⽇付 3", "⽇付 4", "⽇付 5"]
    var scrapDetail = ["詳細テキスト 1", "詳細テキスト 2", "詳細テキスト 3", "詳細テキスト 4", "詳細テキスト 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
}

extension ScrapbookViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scrapTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scrapbookTableViewCell") as! scrapbookTableViewCell
        cell.scrapTitle.text = scrapTitle[indexPath.row]
        cell.scrapDate.text = scrapData[indexPath.row]
        cell.scrapDetail.text = scrapDetail[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toScrapbookDetailViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let indexPath = self.tableView.indexPathsForSelectedRows?.first
        let index = indexPath!.row

        if segue.identifier == "toScrapbookDetailViewController" {
            let destVC = segue.destination as! ScrapbookDetailViewController
            destVC.Scrapbooktitle = scrapTitle[index]
            destVC.Scrapbookdetail = scrapDetail[index]
        }
    }
    
    
    
    
}
