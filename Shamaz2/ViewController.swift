//
//  ViewController.swift
//  Test
//
//  Created by Pierre-Henri on 02.03.19.
//  Copyright © 2019 Pierre-Henri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var whoIsNextButton: UIButton!
    @IBOutlet weak var storyView: UITextView!
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        let randomInt = Int.random(in: 1..<11)
        //        label.text = "\(randomInt)"
    }
    // MARK:- Actions
    /// Properties of the Past Button
    /// # create a random time period in the past associated with a number between 1 and 10
    /// # make the storyView field available
    @IBAction func pastButton(_ sender: UIButton) {
        let randomInt = Int.random(in: 1..<11)
        let periods = ["week", "month", "year"]
        if let randomPeriod = periods.randomElement() {
            if randomInt > 1 {
                label.text = "Describe your \(randomPeriod) \(randomInt) \(randomPeriod)s ago"
            }
            else {
                label.text = "Describe your \(randomPeriod) \(randomInt) \(randomPeriod) ago"
            }
        }
        storyView.isHidden = false
    }
    /// Properties of the Future Button
    /// # create a random time period associated with a number between 1 and 4
    /// # make the storyView field available
    @IBAction func futureButton(_ sender: UIButton) {
        let randomInt = Int.random(in: 1..<5)
        let periods = ["week", "month", "year"]
        if let randomPeriod = periods.randomElement() {
            if randomInt > 1 {
                label.text = "What would you like to do in \(randomInt) \(randomPeriod)s"
            }
            else {
                label.text = "What would you like to do in \(randomInt) \(randomPeriod)"
            }
        }
            storyView.isHidden = false
    }
    /// button WhoIsNextTapped
    ///
    /// # to create a random number between 1 and 10 to design next storyteller
    /// # to make sure that the storyView is empty when who is next is tipped on
    @IBAction func whoIsNextTapped(_ sender: UIButton) {
        storyView.resignFirstResponder()
        let randomInt = Int.random(in: 1..<11)
        label.text = "\(randomInt)"
        storyView.text = "type your answer here!"
        storyView.isHidden = true
        whoIsNextButton.isEnabled = false
    }
}
// MARK:- UITextViewDelegate
/// whoIsNext appearance Button Properties

/// # make whoIsNext visible when text is entered in storyView
/// # make whoIsNext grey when text is not entered
extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        whoIsNextButton.isEnabled = textView.hasText
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
    }
}

