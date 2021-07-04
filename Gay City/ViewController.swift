//
//  ViewController.swift
//  Gay City
//
//  Created by Ian Fahning on 4/13/21.
//

import UIKit

import NavigationDrawer

class ViewController: UIViewController {

//1.
let interactor = Interactor()

override func viewDidLoad() {
super.viewDidLoad()
// Do any additional setup after loading the view, typically from a nib.
}

//2.
@IBAction func homeButtonPressed(_ sender: UIBarButtonItem) {
performSegue(withIdentifier: "showSlidingMenu", sender: nil)
}

//3. Add a Pan Gesture to slide the menu from Certain Direction
@IBAction func edgePanGesture(sender: UIScreenEdgePanGestureRecognizer) {
let translation = sender.translation(in: view)

let progress = MenuHelper.calculateProgress(translationInView: translation, viewBounds: view.bounds, direction: .Right)

MenuHelper.mapGestureStateToInteractor(
gestureState: sender.state,
progress: progress,
interactor: interactor){
self.performSegue(withIdentifier: "showSlidingMenu", sender: nil)
}
}

//4. Prepare for segue
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
if let destinationViewController = segue.destination as? SlidingViewController {
destinationViewController.transitioningDelegate = self
destinationViewController.interactor = self.interactor
}
}
}

extension ViewController: UIViewControllerTransitioningDelegate {

func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentMenuAnimator(direction: .Left)
}

func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
return DismissMenuAnimator()
}

func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
return interactor.hasStarted ? interactor : nil
}

func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
return interactor.hasStarted ? interactor : nil
}
}

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
