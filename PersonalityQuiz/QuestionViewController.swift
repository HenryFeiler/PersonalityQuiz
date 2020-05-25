//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Henry Feiler on 5/11/20.
//  Copyright © 2020 Henry Feiler. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var setTheme: String!
    var animalTheme: String = "Animal"
    var shoeTheme: String = "Shoes"
    
    
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    override func viewDidLoad() {
//        QuizQuestiondecider()
        updateUI()
        super.viewDidLoad()
        //This is to see which value was passed through from the IntroductionViewController
        print("The value from Introduction view: \(setTheme!)")
        print("The animal theme value is: \(animalTheme)")
        print("The shoe theme value is: \(shoeTheme)")
    }

    private func QuizQuestiondecider() {
        if (setTheme == animalTheme) {
            var questions: [Question] = [
                Question(text: "Which do you like the most?",
                         type: .single,
                         answers: [
                            Answer(text: "High Heel", type: .highHeel),
                            Answer(text: "Sneaker", type: .sneaker),
                            Answer(text: "Hiking Boot", type: .hikingBoot),
                            Answer(text: "No Shoes", type: .bareFoot)
                    ]),
                Question(text: "Which activities do you enjoy?",
                         type: .multiple,
                         answers: [
                            Answer(text: "Running", type: .sneaker),
                            Answer(text: "Walking on the beach", type: .bareFoot),
                            Answer(text: "Hiking", type: .hikingBoot),
                            Answer(text: "Killing it", type: .highHeel)
                    ]),
                Question(text: "How do you like to dress up?",
                         type: .ranged,
                         answers: [
                            Answer(text: "What's dress up?", type: .bareFoot),
                            Answer(text: "I don't own dress shoes!", type: .hikingBoot),
                            Answer(text: "I make it work.", type: .sneaker),
                            Answer(text: "I stay fly!", type: .highHeel
                            )
                    ])
            ]
        } else {
                    var questions: [Question] = [
                        Question(text: "Which do you like the most?",
                                 type: .single,
                                 answers: [
                                    Answer(text: "High Heel", type: .highHeel),
                                    Answer(text: "Sneaker", type: .sneaker),
                                    Answer(text: "Hiking Boot", type: .hikingBoot),
                                    Answer(text: "No Shoes", type: .bareFoot)
                            ]),
                        Question(text: "Which activities do you enjoy?",
                                 type: .multiple,
                                 answers: [
                                    Answer(text: "Running", type: .sneaker),
                                    Answer(text: "Walking on the beach", type: .bareFoot),
                                    Answer(text: "Hiking", type: .hikingBoot),
                                    Answer(text: "Killing it", type: .highHeel)
                            ]),
                        Question(text: "How do you like to dress up?",
                                 type: .ranged,
                                 answers: [
                                    Answer(text: "What's dress up?", type: .bareFoot),
                                    Answer(text: "I don't own dress shoes!", type: .hikingBoot),
                                    Answer(text: "I make it work.", type: .sneaker),
                                    Answer(text: "I stay fly!", type: .highHeel
                                    )
                            ])
                    ]
        }

    }

    
    var questions: [Question] = [
        Question(text: "Which do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "High Heel", type: .highHeel),
                    Answer(text: "Sneaker", type: .sneaker),
                    Answer(text: "Hiking Boot", type: .hikingBoot),
                    Answer(text: "No Shoes", type: .bareFoot)
            ]),
        Question(text: "Which activities do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Running", type: .sneaker),
                    Answer(text: "Walking on the beach", type: .bareFoot),
                    Answer(text: "Hiking", type: .hikingBoot),
                    Answer(text: "Killing it", type: .highHeel)
            ]),
        Question(text: "How do you like to dress up?",
                 type: .ranged,
                 answers: [
                    Answer(text: "What's dress up?", type: .bareFoot),
                    Answer(text: "I don't own dress shoes!", type: .hikingBoot),
                    Answer(text: "I make it work.", type: .sneaker),
                    Answer(text: "I stay fly!", type: .highHeel
                    )
            ])
    ]
    
    

    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    
    

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsviewcontroller = segue.destination as! ResultsViewController
            resultsviewcontroller.responses = answersChosen
        }
    }

    
}
