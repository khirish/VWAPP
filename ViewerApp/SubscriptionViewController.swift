//
//  SubscriptionViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 23/12/20.
//

import UIKit

class SubscriptionViewController: UIViewController {
        
    var imageArray3 = [UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170315T451B5400050_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), ]
 
    
    var nameArray = ["外食レストラン", "百菜元気", "日本食糧新聞", "日本食糧新聞", "外食レストラン新聞", "百菜元気新聞", "関西音楽新聞", "産業新聞スマートフォン版", "産業新聞海外版", "観光経済新聞", "観光経済新聞", "インテリアビジネスニュース", "シルバー産業新聞", "住宅産業新聞", "住宅産業新聞", "警備新報", "日本印刷新聞", "デパートニューズ", "統一日報", "日本歯科新聞", "ゴムタイムス", "郵湧新報"]

    @IBOutlet weak var listCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    @IBAction func backBtn(_ sender: UIBarButtonItem) {
        let sc = UIStoryboard(name: "Main", bundle: nil)
        let vc = sc.instantiateViewController(identifier: "homeNav")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}

extension SubscriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionListCollectionViewCell", for: indexPath) as! SubscriptionListCollectionViewCell
        cell.imageView.image = imageArray3[indexPath.item]
        cell.nameLbl.text = nameArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sc = UIStoryboard(name: "Main", bundle: nil)
        let vc = sc.instantiateViewController(identifier: "detailNewsPaperViewController") as! detailNewsPaperViewController
        vc.modalPresentationStyle = .fullScreen
        vc.paperImage = imageArray3[indexPath.row]
        vc.paperName = nameArray[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
 
}
