//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    var answersResult: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let result = answersResult
            .map { $0.animal }
            .reduce(into: [:]) { $0[$1, default: 0] += 1 }
            .sorted { $0.value > $1.value }.prefix(1)

        // Что-то тут не так, но работает
               
        for value in result {
            titleResult.text = "Вы — \(value.key.rawValue)"
            textResult.text = "\(value.key.definition)"
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    @IBOutlet weak var titleResult: UILabel!
    @IBOutlet weak var textResult: UILabel!

    deinit {
        print("ResultViewController is deallocated")
    }
    
}

