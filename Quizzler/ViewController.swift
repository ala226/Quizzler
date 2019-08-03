//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   let allQuestion = questionbank ()
    var pickanswer :Bool = false
    var numQuestion :Int = 0
    var scour :Int = 0
    var x : Int = 1
    @IBOutlet weak var Questionlabel: UILabel!
    @IBOutlet weak var scourelabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let firstQuestion = allQuestion.list[0]

        Questionlabel.text =  firstQuestion.questionText
        
    }

    @IBAction func answerpressed(_ sender: AnyObject) {
        if sender.tag == 1
        {
         pickanswer = true
        }
        else if sender.tag == 2
        {
            pickanswer = false
        }
         checkAnswer()
        
          numQuestion+=1
      nextQuestion()
        
    
    }
    func updateUI() {
        scourelabel.text = "Scour: \(scour)"
      progressLabel.text = " \(numQuestion+1) / 13  "
       progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(numQuestion)

    }
   

    func nextQuestion() {
        if numQuestion < allQuestion.list.count {
        
        
            Questionlabel.text = allQuestion.list[numQuestion].questionText
              updateUI()
        }
        else{
            
          let Alert = UIAlertController(title: "finished", message: "you are finished do you want to restart", preferredStyle: .alert)
            let AlertAction = UIAlertAction(title: "restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
                
            })
            Alert.addAction(AlertAction)
            present (Alert,animated: true , completion: nil)
           
        }
        
    }
    func checkAnswer() {
        let firstAnswer = allQuestion.list[numQuestion]
        if pickanswer == firstAnswer.answer
        {
            print("true answer")
         ProgressHUD.showSuccess("correct")
        scour += 3
        }
        else{ print("false answer")
            ProgressHUD.showError("wrong")
        }
  
    }
    
    
    func startOver() {
       numQuestion = 0
        scour = 0
        nextQuestion()
    }
    

    
}
