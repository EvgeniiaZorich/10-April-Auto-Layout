//
//  ViewController.swift
//  April 10
//
//  Created by Евгения Зорич on 11.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var redView: UIView!
    var yellowView: UIView!
    var greenView: UIView!
    
    let scenes = UIApplication.shared.connectedScenes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        yellowView = UIView()
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        
        greenView = UIView()
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//
//            redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
//            redView.widthAnchor.constraint(equalToConstant: 180),
//            redView.heightAnchor.constraint(equalToConstant: 180),
//            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 10),
//            yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
//            yellowView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
//            yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
//
//            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10),
//            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
//            greenView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
//            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor),
//            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180)
//        ])
    }
    
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            
            let windowScene = scenes.first as? UIWindowScene
            
            switch windowScene?.interfaceOrientation {
            case .portrait:
                deleteConstraints(width: 180)
            case .landscapeLeft:
                deleteConstraints(width: 600)
            case .landscapeRight:
                deleteConstraints(width: 50)
            default:
                deleteConstraints(width: 180)
            }
        }
        
    func deleteConstraints(width: CGFloat) {
            redView.removeConstraints(redView.constraints)
            yellowView.removeConstraints(yellowView.constraints)
            greenView.removeConstraints(greenView.constraints)
            
            NSLayoutConstraint.activate([
                redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
                redView.widthAnchor.constraint(equalToConstant: width),
                redView.heightAnchor.constraint(equalToConstant: 180),
                redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                
                yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 10),
                yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor),
                yellowView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
                yellowView.heightAnchor.constraint(equalTo: redView.heightAnchor),
                
                greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10),
                greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
                greenView.centerXAnchor.constraint(equalTo: redView.centerXAnchor),
                greenView.heightAnchor.constraint(equalTo: redView.heightAnchor),
                greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180)
            ])
        }
    }

