//
//  ViewController.swift
//  NetWorkPapago
//
//  Created by Jae hyung Kim on 1/17/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var headerView: UIView!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var bottomLineView: UIView!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var searchTextView: UITextView!
    
    
    
    
    
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
        
    }
    
    
    @IBAction func leftButtonTap(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Language", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "LanguageViewController") as! LanguageViewController
        
        let navc = UINavigationController(rootViewController: vc)
        
        self.present(navc, animated: true)

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
//        changeButton.setImage(UIImage(systemName: "fibrechannel"), for: .normal)
//        changeButton.
//        
//        var configuar = UIButton.Configuration.plain()
//        configuar.image = UIImage(systemName: "fibrechannel")
//        
//        configuar.contentInsets =  NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//
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
        textViewSet()
        
    }
}



extension ViewController {
    func textViewSet() {
        searchTextView.text = ""
        searchTextView.textColor = .white
        searchTextView.font = .systemFont(ofSize: 20)
    }
}


