//
//  ViewController.swift
//  UIDynamicAnimator
//
//  Created by Slava Utyuzh on 25.06.2018.
//  Copyright © 2018 Slava Utyuzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //UICollisionBehavior - обнаружение столкновений
    //UIGravityBehavior - обеспечивает тяготение
    //UIPushBehavior - реагирует на толчки
    //UISnapBehavior - крепит view к определенной точке
 
    let squareView = UIView()
    var animator = UIDynamicAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //создаем квадрат
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.backgroundColor = UIColor.blue
        squareView.center = view.center
        view.addSubview(squareView)
        
        //создаем аниматор тяготения
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
        
        
    }

 

}

