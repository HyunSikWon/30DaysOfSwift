//
//  ViewController.swift
//  Project 02 - CustomFont
//
//  Created by 원현식 on 2020/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var texts = [
        "Hello",
        "I'm Hyunsik",
        "HAHAHAH",
        "Hello",
        "I'm Hyunsik",
        "HAHAHAH"
    ]
    
    var fontNames = [
        "HelveticaNeue-CondensedBold",
        "HelveticaNeue-BoldItalic",
        "TimesNewRomanPS-ItalicMT",
        "TimesNewRomanPS-BoldItalicMT"
    ]
    var fontIndex = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        changeButton.layer.cornerRadius = changeButton.bounds.width * 0.5

    }
    
    // navigation controller 사용시 상태바 흰색으로 설정
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black

        
    }

    @IBAction func changButtonDidTouch(_ sender: Any) {
        fontIndex = (fontIndex+1) % fontNames.count
        tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        
        cell.textLabel?.text = texts[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: fontNames[fontIndex], size: 17)
        
        return cell
    }
}
