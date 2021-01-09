//
//  NewsListViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 06/01/21.
//

import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var segmentCntrl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var titleLbl = ["鎌ケ谷に日本ハムのマスコット柄の男ホールがあります", "SapproroChanthip最初の実際の戦いはもっと慣れている", "ニュースタイトル詳細番号四百四十四 ニュースタイトル詳細番号四百四十四", "ニュースタイトル詳細番号五百五十五 ニュースタイトル詳細番号五百五十五", "ニュースタイトル詳細番号六百＆六十六 ニュースタイトル詳細番号六百＆六十六", "鎌ケ谷に日本ハムのマスコット柄の男ホールがあります", "鎌ケ谷に日本ハムのマスコット柄の男ホールがあります"]
    
    var descLbl = ["Most applications nowadays communicate with servers to exchange data, and they do so by consuming RESTful APIs, also called RESTful web services. Using REST, applications can send requests to servers, and servers send responses as answers back to client apps.", "Most applications nowadays communicate with servers to exchange data, and they do so by consuming RESTful APIs, also called RESTful web services. Using REST, applications can send requests to servers, and servers send responses as answers back to client apps.", "Most applications nowadays communicate with servers to exchange data, and they do so by consuming RESTful APIs, also called RESTful web services. Using REST, applications can send requests to servers, and servers send responses as answers back to client apps.", "Most applications nowadays communicate with servers to exchange data, and they do so by consuming RESTful APIs, also called RESTful web services. Using REST, applications can send requests to servers, and servers send responses as answers back to client apps.", "Most applications nowadays communicate with servers to exchange data, and they do so by consuming RESTful APIs, also called RESTful web services. Using REST, applications can send requests to servers, and servers send responses as answers back to client apps.", "Most applications nowadays communicate with servers to exchange data, and they do so by consuming RESTful APIs, also called RESTful web services. Using REST, applications can send requests to servers, and servers send responses as answers back to client apps."]
    
    var dateLbl = ["2020年2月7日11時間07分", "2021年1月1日06時間04分", "2021年2月3日01時間03分", "2020年2月10日04時間05分", "2021年7月4日10時間05分", "2020年2月7日11時間07分"]
    var categoryLbl = ["野球", "プロ野球", "サッカー", "野球", "プロ野球", "サッカー"]
    var image = [UIImage(named: "Dice1"), UIImage(named: "Dice2"), UIImage(named: "Dice3"), UIImage(named: "Dice4"), UIImage(named: "Dice5"), UIImage(named: "Dice6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    

}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descLbl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTableViewCell", for: indexPath) as! NewsListTableViewCell
        
        switch segmentCntrl.selectedSegmentIndex {
        case 0:
            cell.titleLbl.text = titleLbl.shuffled()[indexPath.row]
            cell.descLbl.text = descLbl.shuffled()[indexPath.row]
            cell.dateLbl.text = dateLbl.shuffled()[indexPath.row]
            cell.categoryLbl.text = categoryLbl.shuffled()[indexPath.row]
            cell.img.image = image.shuffled()[indexPath.row]
        case 1:
            cell.titleLbl.text = titleLbl.shuffled()[indexPath.row]
            cell.descLbl.text = descLbl.shuffled()[indexPath.row]
            cell.dateLbl.text = dateLbl.shuffled()[indexPath.row]
            cell.categoryLbl.text = categoryLbl.shuffled()[indexPath.row]
            cell.img.image = image.shuffled()[indexPath.row]
        case 2:
            cell.titleLbl.text = titleLbl.shuffled()[indexPath.row]
            cell.descLbl.text = descLbl.shuffled()[indexPath.row]
            cell.dateLbl.text = dateLbl.shuffled()[indexPath.row]
            cell.categoryLbl.text = categoryLbl.shuffled()[indexPath.row]
            cell.img.image = image.shuffled()[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    
}
