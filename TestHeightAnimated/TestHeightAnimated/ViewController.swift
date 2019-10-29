//
//  ViewController.swift
//  TestHeightAnimated
//
//  Created by hscai on 2019/10/29.
//  Copyright © 2019 HSCOO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var folded: Bool = false
    var imagen: UIImageView!
    private var foldConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let imagen = UIImageView(image: UIImage(named: "001"))
        imagen.contentMode = .scaleAspectFit
        imagen.translatesAutoresizingMaskIntoConstraints = false
        imagen.backgroundColor = .gray
        view.addSubview(imagen)
        self.imagen = imagen
        imagen.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imagen.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        foldConstraint = imagen.heightAnchor.constraint(equalToConstant: 1)
        
        createAnimationButton()
    }
    
    private func createAnimationButton() {
        
        let button = UIButton()
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc func click(){
        self.folded = !self.folded
        if self.folded {
            self.foldConstraint.isActive = true
            UIView.animate(withDuration: 0.5, animations: {
                self.imagen.setNeedsLayout()
                self.imagen.superview?.layoutIfNeeded()
            }) { (completion) in
                self.imagen.isHidden = true
            }
        } else {
            self.imagen.isHidden = false
            self.foldConstraint.isActive = false
            UIView.animate(withDuration: 0.5, animations: {
                 self.imagen.setNeedsLayout()
                 self.imagen.superview?.layoutIfNeeded()
             })
        }
    }
}

