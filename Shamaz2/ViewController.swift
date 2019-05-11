//
//  ViewController.swift
//  Test
//
//  Created by Pierre-Henri on 02.03.19.
//  Copyright © 2019 Pierre-Henri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        let randomInt = Int.random(in: 1..<11)
        //        label.text = "\(randomInt)"
    }
    @IBAction func pastButton(_ sender: UIButton) {
        let randomInt = Int.random(in: 1..<11)
        let names = ["week", "month", "year"]
        if let randomName = names.randomElement() {
            if randomInt > 1 {
                label.text = "Describe your \(randomName) \(randomInt) \(randomName)s ago"
            }
            else {
                label.text = "Describe your \(randomName) \(randomInt) \(randomName) ago"
            }
        }
        changetextview()
        storyView.isHidden = false
    }
    
    @IBAction func futureButton(_ sender: UIButton) {
        let randomInt = Int.random(in: 1..<5)
        let names = ["week", "month", "year"]
        if let randomName = names.randomElement() {
            if randomInt > 1 {
                label.text = "What would you like to do in \(randomInt) \(randomName)s"
            }
            else {
                label.text = "What would you like to do in \(randomInt) \(randomName)"
            }
        }
        changetextview()
        storyView.isHidden = false
    }
    
    @IBOutlet weak var whoIsNextButon: UIButton!
    
    func changetextview() {
        // textView.text = ""
    }
    /// jkfl jlöjlöa jlösajö
    ///
    /// # to make sure that the storyView is empty when who is next is tipped on
    /// # fkl jfklajfkfja
    @IBAction func whoIsNextTapped(_ sender: UIButton) {
        storyView.resignFirstResponder()
        let randomInt = Int.random(in: 1..<11)
        label.text = "\(randomInt)"
        changetextview()
        storyView.text = "type your answer here!"
        storyView.isHidden = true
        whoIsNextButon.isEnabled = false
    }
    @IBOutlet weak var storyView: UITextView!
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        whoIsNextButon.isEnabled = textView.hasText
//        if textView.hasText {
//            whoIsNextButon.isEnabled = true
//        }
//        else {
//            whoIsNextButon.isEnabled = false
//        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }
}

