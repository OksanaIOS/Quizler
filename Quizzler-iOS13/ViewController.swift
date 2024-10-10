//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UI Elements
    
    
    private lazy var backgroundImageView: UIImageView  = {
        let element = UIImageView()
        element.image = UIImage(named: "Background-Bubbles")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainStackView: UIStackView  = {
        let element = UIStackView()
        element.axis = .vertical
        element.distribution = .fillProportionally
        element.spacing = 5
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var scoreLabel: UILabel  = {
        let element = UILabel()
        element.text = "Score: 0"
        element.font = .systemFont(ofSize: 20, weight: .bold)
        element.textColor = .white
        element.textAlignment = .center
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var questionLabel: UILabel  = {
        let element = UILabel()
        element.text = "Question text"
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .white
        element.textAlignment = .left
        element.numberOfLines = 0
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var firstButton: UIButton  = {
        let element = UIButton(type: .system)
        element.tintColor = .white
        element.titleLabel?.font = .systemFont(ofSize: 25)
        element.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var secondButton: UIButton  = {
        let element = UIButton(type: .system)
        element.tintColor = .white
        element.titleLabel?.font = .systemFont(ofSize: 25)
        element.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var thirdButton: UIButton  = {
        let element = UIButton(type: .system)
        element.tintColor = .white
        element.titleLabel?.font = .systemFont(ofSize: 25)
        element.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var progressBar: UIProgressView  = {
        let element = UIProgressView()
        element.progress = 0.5
        element.progressTintColor = UIColor(red: 1.00, green: 0.46, blue: 0.66, alpha: 1)
        element.trackTintColor = .white 
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - Private Properties
    
    private var quizBrain = QuizBrain()
    private var delayTime = 0.3
    private var timer = Timer()
    
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    
    }
    private func setViews() {
        view.addSubview(backgroundImageView)
        view.backgroundColor = UIColor(red: 0.15, green: 0.17, blue: 0.29, alpha: 1)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(scoreLabel)
        mainStackView.addArrangedSubview(questionLabel)
        mainStackView.addArrangedSubview(firstButton)
        mainStackView.addArrangedSubview(secondButton)
        mainStackView.addArrangedSubview(thirdButton)
        mainStackView.addArrangedSubview(progressBar)
        
        firstButton.setTitle("First Button", for: .normal)
        firstButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        secondButton.setTitle("Second Button", for: .normal)
        secondButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        thirdButton.setTitle("Third Button", for: .normal)
        thirdButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        
    }
    
    @objc private func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else {
            print("Current title error")
            return
        }
        let check = quizBrain.checkAnswer(userAnswer)
        sender.backgroundColor = check ? .green : .red
        quizBrain.nextQuestion()
        timer = Timer.scheduledTimer(timeInterval: delayTime, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc private func updateUI() {
        questionLabel.text = quizBrain.getQuestionText
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.heightAnchor.constraint(equalToConstant: 102),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
           
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            firstButton.heightAnchor.constraint(equalToConstant: 80),
            secondButton.heightAnchor.constraint(equalToConstant: 80),
            thirdButton.heightAnchor.constraint(equalToConstant: 80),
            progressBar.heightAnchor.constraint(equalToConstant: 5),
            
          
        ])
        
    }
}

#Preview {
    ViewController()
}

