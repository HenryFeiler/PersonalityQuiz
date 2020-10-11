//
//  ViewController.swift
//  PersonalityQuiz
//
//  Created by Henry Feiler on 5/11/20.
//  Copyright © 2020 Henry Feiler. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet weak var animalQuizButton: UIButton!
    @IBOutlet weak var shoeQuizButton: UIButton!
    
    var theme: String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func animalQuizButtonPressed(_ sender: UIButton) {
        self.theme = "Animal"
        performSegue(withIdentifier: "QuestionSegue", sender: self)
        
    }
    
    @IBAction func shoeQuizButtonPressed(_ sender: UIButton) {
        self.theme = "Shoes"
        performSegue(withIdentifier: "QuestionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "QuestionSegue" {
            let navVc = segue.destination as! UINavigationController
            
            let vc = navVc.viewControllers.first as! QuestionViewController
            vc.setTheme = self.theme
        }
    }

    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        
    }

}

