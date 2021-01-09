//
//  HomeViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 30/12/20.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var imageArray = [UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170315T451B5400050_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx")]
    
    var imageArray1 = [UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170315T451B5400050_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx")]
    
    var imageArray2 = [UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170315T451B5400050_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx")]
    
    var imageArray3 = [UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170315T451B5400050_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), UIImage(named: "MN20170306T331B0400010_xx"), UIImage(named: "MN20170306T331B0500010_xx"), UIImage(named: "MN20170306T331B0600010_xx"), UIImage(named: "MN20170306T331B0700010_xx"), UIImage(named: "MN20170306T331B0800010_xx"), UIImage(named: "MN20170306T331B0900010_xx"), UIImage(named: "MN20170306T331B1000010_xx"), UIImage(named: "MN20170306T331B1100010_xx"), UIImage(named: "MN20170306T331B1200010_xx"), UIImage(named: "MN20170306T331B0100010_xx"), UIImage(named: "MN20170306T331B0200010_xx"), UIImage(named: "MN20170306T331B0300010_xx"), ]
 
    
    var nameArray = ["外食レストラン", "百菜元気", "日本食糧新聞", "日本食糧新聞", "外食レストラン新聞", "百菜元気新聞", "関西音楽新聞", "産業新聞スマートフォン版", "産業新聞海外版", "観光経済新聞", "観光経済新聞", "インテリアビジネスニュース", "シルバー産業新聞", "住宅産業新聞", "住宅産業新聞", "警備新報", "日本印刷新聞", "デパートニューズ", "統一日報", "日本歯科新聞", "ゴムタイムス", "郵湧新報"]
    
    var nameArray1 = ["産業新聞海外版", "観光経済新聞", "観光経済新聞", "インテリアビジネスニュース", "シルバー産業新聞", "住宅産業新聞", "住宅産業新聞", "警備新報", "日本印刷新聞", "デパートニューズ", "統一日報", "日本歯科新聞", "ゴムタイムス", "郵湧新報", "外食レストラン", "百菜元気", "日本食糧新聞", "日本食糧新聞", "外食レストラン新聞", "百菜元気新聞", "関西音楽新聞", "産業新聞スマートフォン版"]
    
    var nameArray2 = ["外食レストラン新聞", "百菜元気新聞", "関西音楽新聞", "産業新聞スマートフォン版", "産業新聞海外版", "観光経済新聞", "観光経済新聞", "インテリアビジネスニュース", "シルバー産業新聞", "住宅産業新聞", "住宅産業新聞", "警備新報", "日本印刷新聞", "デパートニューズ", "統一日報", "日本歯科新聞", "ゴムタイムス", "郵湧新報", "外食レストラン", "百菜元気", "日本食糧新聞", "日本食糧新聞"]
    
    var nameArray3 = ["ゴムタイムス", "郵湧新報", "外食レストラン", "百菜元気", "日本食糧新聞", "日本食糧新聞", "外食レストラン新聞", "百菜元気新聞", "関西音楽新聞", "産業新聞スマートフォン版", "産業新聞海外版", "観光経済新聞", "観光経済新聞", "インテリアビジネスニュース", "シルバー産業新聞", "住宅産業新聞", "住宅産業新聞", "警備新報", "日本印刷新聞", "デパートニューズ", "統一日報", "日本歯科新聞"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        self.collectionView.reloadData()
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCollectionViewCell", for: indexPath) as! listCollectionViewCell
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            cell.paperImg.image = imageArray[indexPath.row]
            cell.paperName.text = nameArray[indexPath.row]
        case 1:
            cell.paperImg.image = imageArray1[indexPath.row]
            cell.paperName.text = nameArray1[indexPath.row]
        case 2:
            cell.paperImg.image = imageArray2[indexPath.row]
            cell.paperName.text = nameArray2[indexPath.row]
        case 3:
            cell.paperImg.image = imageArray3[indexPath.row]
            cell.paperName.text = nameArray3[indexPath.row]
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPaperSubscriptionViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = self.collectionView.indexPathsForSelectedItems?.first
        let index = indexPath?.item
        
        if segue.identifier == "toPaperSubscriptionViewController" {
            let destVC = segue.destination as! PaperSubscriptionViewController
            
            switch segmentControl.selectedSegmentIndex {
            case 0:
                destVC.paperImage = imageArray[index!]
            case 1:
                destVC.paperImage = imageArray1[index!]
            case 2:
                destVC.paperImage = imageArray2[index!]
            case 3:
                destVC.paperImage = imageArray3[index!]
            default:
                break
            }
        }
    }
    
}
