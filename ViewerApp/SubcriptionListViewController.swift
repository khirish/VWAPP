//
//  SubcriptionListViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 31/12/20.
//

import UIKit
import AlamofireImage

class SubcriptionListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var paper: PaperData!
    var imageArray = [URL]()
    let imgUrl = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: "tmp")
    var urls = [URL]()

    var paperName = ["外食レストラン", "百菜元気", "日本食糧新聞", "日本食糧新聞", "外食レストラン新聞", "百菜元気新聞", "関西音楽新聞", "産業新聞スマートフォン版", "産業新聞海外版", "観光経済新聞", "観光経済新聞", "インテリアビジネスニュース", "シルバー産業新聞", "住宅産業新聞", "住宅産業新聞", "警備新報", "日本印刷新聞", "デパートニューズ", "統一日報", "日本歯科新聞", "ゴムタイムス", "郵湧新報"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("IMage URL :\(imgUrl)")
    }
    
    func initData() {
        
        var data = [PaperData]()
        for (index, url) in urls.enumerated() {
            data.append(PaperData(url: url, id: index))
        }
    }
}

extension SubcriptionListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgUrl!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscriptionListCollectionViewCell", for: indexPath) as! SubscriptionListCollectionViewCell
            
        cell.imageView.af.setImage(withURL: imgUrl![indexPath.row])
        cell.nameLbl.text = paperName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "todetailNewsPaperViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let indexPath = self.collectionView.indexPathsForSelectedItems?.first
        let index = indexPath?.item

        if segue.identifier == "todetailNewsPaperViewController" {
            let destVC = segue.destination as! detailNewsPaperViewController
            destVC.getUrl = imgUrl?[index!]
            destVC.paperName = paperName[index!]
        }
    }
    
}
