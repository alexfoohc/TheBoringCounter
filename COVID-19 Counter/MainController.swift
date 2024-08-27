//
//  ViewController.swift
//  COVID-19 Counter
//
//  Created by Alejandro Hernández Cortés on 09/06/21.
//

import UIKit

class MainController: UIViewController, UITextFieldDelegate {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var currentValueLbl: UILabel!
    @IBOutlet weak var currentValueBkgView: UIView!
    
    
    
// MARK: - Variables and constants
    var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()        
    }
    
    private func configureView() {
        addBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        addBtn.setTitle("", for: .normal)
        addBtn.tintColor = .white
        addBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32, weight: .regular), forImageIn: .normal)
        addBtn.backgroundColor = UIColor(named: "customGreen")
        addBtn.layer.cornerRadius = 12
        
        minusBtn.setImage(UIImage(systemName: "minus"), for: .normal)
        minusBtn.setTitle("", for: .normal)
        minusBtn.tintColor = .white
        minusBtn.backgroundColor = UIColor(named: "customRed")
        minusBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 32, weight: .regular), forImageIn: .normal)
        minusBtn.layer.cornerRadius = 12
        
        resetBtn.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        resetBtn.setTitle("", for: .normal)
        resetBtn.tintColor = .white
        resetBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .regular), forImageIn: .normal)
        resetBtn.backgroundColor = UIColor(named: "customTeal")
        resetBtn.layer.cornerRadius = 12
        
        currentValueLbl.text = "\(currentValue)"
        currentValueLbl.font = UIFont(name: FONT_HEAVY, size: 64)
        
        currentValueBkgView.backgroundColor = UIColor(named: "BackgroundViewColor")
        currentValueBkgView.layer.cornerRadius = 12
//        currentValueBkgView.layer.shadowColor = UIColor.lightGray.cgColor
//        currentValueBkgView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        currentValueBkgView.layer.shadowRadius = 12.0
//        currentValueBkgView.layer.shadowOpacity = 0.5
        
    }
    
    private func presentInvalidNumberAlert() {
        let alert = UIAlertController(title: NSLocalizedString("zeroWarningTitle", comment: "") , message: NSLocalizedString("zeroWarning", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
// MARK: -IBActions
    @IBAction func addBtnPressed(sender: UIButton) {
        sender.pulse()
        currentValue += 1
        currentValueLbl.text = "\(currentValue)"
    }
    
    @IBAction func minusBtnPressed(sender: UIButton) {
        sender.pulse()
        currentValue -= 1
        if currentValue < 0 {
            presentInvalidNumberAlert()
            currentValue = 0
        } else {
            currentValueLbl.text = "\(currentValue)"
        }

    }

    @IBAction func resetBtnPressed(_ sender: UIButton) {
        sender.pulse()
        currentValue = 0
        currentValueLbl.text = "\(currentValue)"
    }
}

