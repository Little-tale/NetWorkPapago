//
//  ViewController.swift
//  NetWorkPapago
//
//  Created by Jae hyung Kim on 1/17/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var headerView: UIView!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var bottomLineView: UIView!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var searchTextView: UITextView!
    @IBOutlet var testButton: UIButton!
    @IBOutlet var testLabel: UILabel!
    

    var leftButtonText = "Korean"
    var rightButtonText = "English"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.backgroundColor = .darkGray
        headerView.tintColor = .white
        
        searchTextView.text = "Type the text to translate"
        
        designNavi()
        designChageButton()
        designSearchTextField()
        
        designLeftButton(text: leftButtonText)
        designRightButton(text: rightButtonText)
        
        searchTextView.delegate = self
        
        bottomLineView.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .white
       
        view.backgroundColor = .darkGray
        
        testButton.addTarget(self, action: #selector(transltateButtonAct), for: .touchUpInside)
        
    }
    
    @objc func transltateButtonAct() {
        
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : PapagoAPIKey.clientID,
            "X-Naver-Client-Secret": PapagoAPIKey.clientSecret
        ]
        
        let parameters: Parameters = [
            "text": searchTextView.text!,
            "source": "ko",
            "target":"en"
        ]
        
        
        AF.request(url, method: .post, parameters: parameters, headers: headers).responseDecodable(of: PapaGo.self ) { 
            
            response in
            
            switch response.result {
            case .success(let success):
                print(success)
                print(success.message.result.translatedText)
                self.testLabel.text = success.message.result.translatedText
                
            case .failure(let failure):
                print(failure)
            }
        }
        // 한국말 테스트
        
        
        
    }
    
    
    
    @IBAction func leftButtonTap(_ sender: UIButton) {
        goLanguageView()
    }
    
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        goLanguageView()
    }
    
    
    @IBAction func resultAct(_ sender: UIButton) {
        
        
    }
    
}

extension ViewController{
    func sendText(text: String) {
        leftButtonText = text
    }
    
    func goLanguageView() {
        let sb = UIStoryboard(name: "Language", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "LanguageViewController") as! LanguageViewController
        
        
        let navc = UINavigationController(rootViewController: vc)
        self.present(navc, animated: true) {
            print("언어설정 뷰로 이동했습니다.")
        }
    }
}



extension ViewController {
    func designNavi() {
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 25)
        ]
        
        navigationItem.title = "papago"
        navigationItem.leftBarButtonItem = designLeftBarItem()
        navigationItem.rightBarButtonItem = designRightBarItem()
    }
    
    
    func designLeftBarItem() -> UIBarButtonItem {
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: nil)
        
        return leftButton
    }
    func designRightBarItem() -> UIBarButtonItem{
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet.clipboard"), style: .plain, target: self, action: nil)
        
        return rightButton
    }
}

extension ViewController {
    func designChageButton() {
        
        changeButton.setImage(UIImage(systemName: "fibrechannel"), for: .normal)
        // changeButton.configuration = configuar
        changeButton.layer.borderWidth = 0.6
        
        changeButton.clipsToBounds = true
        changeButton.layer.cornerRadius = 12
        changeButton.layer.borderColor = UIColor(.white).cgColor
        changeButton.backgroundColor = .gray
        
    }
    
    func designLeftButton(text: String){
        leftButton.setTitle(text, for: .normal)
        // leftButton.setImage(UIImage(systemName: "star"), for: .normal)
    }
    func designRightButton(text: String){
        rightButton.setTitle(text, for: .normal)
    }
}


extension ViewController {
    func designSearchTextField() {
        searchTextView.textAlignment = .center
        searchTextView.font = .systemFont(ofSize: 24)
        searchTextView.textColor = .systemGray5
        searchTextView.backgroundColor = .darkGray
        
    }
}



extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == ""{
            searchTextView.text = "Type the text to translate"
            searchTextView.textColor = .systemGray5
        }else {
            textViewSet()
        }
    }

}



extension ViewController {
    func textViewSet() {
        searchTextView.text = ""
        searchTextView.textColor = .white
        searchTextView.font = .systemFont(ofSize: 20)
    }
}
