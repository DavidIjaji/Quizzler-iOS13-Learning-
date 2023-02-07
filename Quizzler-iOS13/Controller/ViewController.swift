//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreText: UILabel!
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
        quizBrain.updateOptions(option1: option1, option2: option2, option3: option3)
        progressBar.setProgress(0.0, animated: false)
    }
    
    @IBAction func answerBtnTap(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let isUserRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        if isUserRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        quizBrain.setProgressValue(progressBar: progressBar)
        quizBrain.updateOptions(option1: option1, option2: option2, option3: option3)
        questionLabel.text = quizBrain.getQuestionLabel()
        scoreText.text="Score: \(quizBrain.getScore())"
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
        
    }
    
}

