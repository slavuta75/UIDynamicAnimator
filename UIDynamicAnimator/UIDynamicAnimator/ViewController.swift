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
 
//    let squareView = UIView()
    var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        //создаем квадрат
//        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        squareView.backgroundColor = UIColor.blue
//        squareView.center = view.center
//        view.addSubview(squareView)
//
//        //создаем аниматор тяготения
//        animator = UIDynamicAnimator(referenceView: view)
//        let gravity = UIGravityBehavior(items: [squareView])
//        animator.addBehavior(gravity)
        
        //создаем view
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        var colors = [UIColor.red, .green]
        var currentCenterPoint: CGPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
    
        for counter in  0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
            newView.backgroundColor = colors[counter]
            newView.center = currentCenterPoint
            currentCenterPoint.y += 200
            view.addSubview(newView)
            squareViews.append(newView)
        }
     animator = UIDynamicAnimator(referenceView: view)
        
        // создадим тягтение
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
        
        //реализуем столкновение
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: view.bounds.size.height - 100), to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))
        
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    
    }

 

}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let indentifier = identifier as? String
        let kbottomBoundary = "bottomBoundary"
        
        if indentifier == kbottomBoundary {
            UIView.animate(withDuration: 3.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = UIColor.black
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }) { (finish) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            }
           
            
        }
    }
}
