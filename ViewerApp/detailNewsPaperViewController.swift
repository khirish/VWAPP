//
//  detailNewsPaperViewController.swift
//  ViewerApp
//
//  Created by Khirish Meshram on 22/12/20.
//

import UIKit
import WebKit
import FSCalendar
import AlamofireImage

class detailNewsPaperViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var paperTitle: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var calenderView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var shortList: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var getUrl: URL!
    var paperName: String?
    var paperImage: UIImage?
    private var xml = ""
    var item: PaperData!
    let imgUrl = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: "tmp")
    var shortListName = ["外食レストラン", "百菜元気", "日本食糧新聞", "日本食糧新聞", "外食レストラン新聞", "百菜元気新聞", "関西音楽新聞", "産業新聞スマートフォン版", "産業新聞海外版", "観光経済新聞", "観光経済新聞", "インテリアビジネスニュース", "シルバー産業新聞", "住宅産業新聞", "住宅産業新聞", "警備新報", "日本印刷新聞", "デパートニューズ", "統一日報", "日本歯科新聞", "ゴムタイムス", "郵湧新報"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        webView.uiDelegate = self
        webView.scrollView.delegate = self
        
        
        webView.configuration.userContentController.add(self, name: "news")
        webView.configuration.userContentController.add(self, name: "log")
        
        loadWebviewContent()
        
        paperTitle.text = paperName
        
        slider.minimumValue = 1
        slider.maximumValue = 4
        slider.value = 0.1
//        slider.minimumValue = Float(webView.scrollView.minimumZoomScale)
//        slider.maximumValue = Float(webView.scrollView.maximumZoomScale)
//        slider.value = Float(1)
        
        containerView.isHidden = true
        shortList.isHidden = true
        calenderView.isHidden = true
        
        self.showAnimate()
    }
    
    @IBAction func closeCalendar(_ sender: UIButton) {
        shortList.isHidden = true
        self.calenderView.isHidden = !calenderView.isHidden
    }
    
    @IBAction func closeShortList(_ sender: UIButton) {
        calendar.isHidden = true
        shortList.isHidden = !shortList.isHidden
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
        });
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
            
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction func calenderBtn(_ sender: UIButton) {
        calenderView.isHidden = !calenderView.isHidden
    }
    
    @IBAction func shortListView(_ sender: UIButton) {
        shortList.isHidden = !shortList.isHidden
        print("Short List Clicked")
    }
    
    @IBAction func setmentControlTapped(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            print("Print 1")
            containerView.isHidden = true
            paperTitle.isHidden = false
            webView.isHidden = false
            bottomView.isHidden = false
            calenderView.isHidden = true
        case 1:
            containerView.isHidden = false
            paperTitle.isHidden = true
            webView.isHidden = true
            bottomView.isHidden = true
            calenderView.isHidden = true
        default:
            break
        }
    }
    
    @IBAction func slidingControl(_ sender: UISlider) {
        webView.scrollView.setZoomScale(CGFloat(sender.value - 1), animated: true)
    }
    
    func loadWebviewContent() {
        
        let url = getUrl.lastPathComponent.components(separatedBy: ".")
        
        guard let fileURL = Bundle.main.url(forResource: "tmp/\(url[0])", withExtension: "kei")  else {
            print("Got an error!!!")
            return
        }
        guard var fileContents = try? String(contentsOf: fileURL) else {
            print("Got another error!!!")
            return
        }
        
        fileContents = fileContents.replacingOccurrences(of: "\n", with: "")
        xml = fileContents.replacingOccurrences(of: "  ", with: "")
        print("XML \(xml)")
        
        let path = Bundle.main.path(forResource: "tmp/index", ofType: "html")!
        let localHtmlUrl = URL(fileURLWithPath: path, isDirectory: false)
        webView.loadFileURL(localHtmlUrl, allowingReadAccessTo: localHtmlUrl)
    }
}

extension detailNewsPaperViewController: WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "news" {
            performSegue(withIdentifier: "toDetailNewsViewController", sender: self)
            print("Done !!!!!!!!")
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url = getUrl.lastPathComponent
        let execJsFunc = "initHTML({img: '\(url)', xml: '\(xml)'});"
        webView.evaluateJavaScript(execJsFunc, completionHandler: { (object, error) -> Void in
            if (error != nil) {
                print("Error from JavaScript")
            }
        })
    }
}

extension detailNewsPaperViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shortListCollectionViewCell", for: indexPath) as! shortListCollectionViewCell
        cell.img.af.setImage(withURL: imgUrl![indexPath.row])
        cell.imgName.text = shortListName[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shortList.isHidden = true
        self.getUrl = imgUrl![indexPath.row]
        loadWebviewContent()
        self.webView.reload()
    }
   
}



