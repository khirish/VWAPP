//
//  SettingViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 19/12/20.
//

import UIKit

class SettingViewController: UIViewController {
    
    var nameText = ["バージョン", "プッシュ通知", "", "タグの選択", "", "利用規約", "プライバシーポリシー", "お問い合わせ", "運営会社", "", "", "", ""]
    var atribute = ["0.0.1 (0.1)", "", "", "", "", "", "", "", "", "", ""]

    @IBOutlet weak var settingTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closeBtn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingTableViewCell", for: indexPath) as! settingTableViewCell
        cell.accessoryType = indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 ? .disclosureIndicator : .none
        cell.selectionStyle = .none
        cell.titleLbl.text = indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 9 ? "" : nameText[indexPath.row]
        cell.descLbl.text = indexPath.row == 0 || indexPath.row == 3 ? atribute[indexPath.row] : ""
        cell.backgroundColor = indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 9 ? .clear : .none
        cell.switchCntrl.isHidden = indexPath.row == 1 ? false : true
        cell.descLbl.isHidden = indexPath.row == 1 ? true : false
        cell.titleLbl.textAlignment = indexPath.row == 10 ? .right : .left
//        cell.textLabel?.text = indexPath.row == 10 ? "ログアウト" : ""
//        cell.titleLbl.text = indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 9 ? "" : "ABC"
        if indexPath.row == 10 {
            cell.textLabel?.text = "ログアウト"
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.textColor = .link
            cell.titleLbl.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingTableViewCell", for: indexPath) as! settingTableViewCell
        
        if indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 {
            cell.accessoryType = .disclosureIndicator
            performSegue(withIdentifier: "toDetailSettingViewController", sender: self)
        } else if indexPath.row == 10 {

            let alert = UIAlertController(title: "ログアウト!", message: "本気ですか?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "取消", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "ログアウト", style: .default, handler: { (alert) in
                self.logoutFromApp()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func logoutFromApp() {
        let sc = UIStoryboard(name: "Main", bundle: nil)
        let vc = sc.instantiateViewController(identifier: "toLoginViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
}
