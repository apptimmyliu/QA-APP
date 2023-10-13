//
//  ViewController.swift
//  QA APP
//
//  Created by Timmy on 2023/9/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var questions = [Question]()
    var index = 0  // 先設一個變數來存數字  index代表第幾個，0代表第ㄧ個
    
    
    fileprivate func updateUI() {
        questionLabel.text = questions[index].text
        answerLabel.text = ""
        questionNumberLabel.text = "第\(index+1)題"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let question1 = Question(text:"灌籃高手的作者", answer: "井上雄彥" )
        questions.append(question1)
        
        let question2 = Question(text: "愛你這首歌的歌手是誰", answer: "陳芳語")
        questions.append(question2)
        
        let question3 = Question(text: "台積電的創辦人是誰", answer: "張忠謀")
        questions.append(question3)
        
        questionLabel.text = questions[index].text
        //因為是0所以是第一題
        
        questions.shuffle()
        updateUI()
    }
    
    @IBAction func next(_ sender: Any) {
        if index < questions.count - 1 { //array裡的成員數量 property count 代表有幾個東西
            index = index + 1      //要讓index = 才會變
            questionLabel.text = questions[index].text
            answerLabel.text = ""  //
        }
        updateUI()
    }
    @IBAction func showAnswer(_ sender: Any) {
        answerLabel.text = questions[index].answer //顯示答案
    }
    
    @IBAction func replay(_ sender: Any) {
        index = 0
        questions.shuffle()
        updateUI()
    }
}
