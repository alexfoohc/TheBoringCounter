//
//  ViewController.swift
//  COVID-19 Counter
//
//  Created by Alejandro Hernández Cortés on 09/06/21.
//

import UIKit

class MainController: UIViewController, UITextFieldDelegate {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var appNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var capacityLimitLbl: UILabel!
    @IBOutlet weak var counterCapacityLbl: UILabel!
    @IBOutlet weak var separatorCapacityLbl: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var newLimitBtn: UIButton!
    @IBOutlet weak var backgroundVw: UIView!
    
    
// MARK: - Variables and constants
    let counter = CounterLogic()
    var totalCapacity: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()        
    }
    
    private func configureView() {
        backgroundVw.layer.cornerRadius = backgroundVw.frame.height / 2
        backgroundVw.layer.shadowColor = UIColor.black.cgColor
        backgroundVw.layer.shadowOffset = CGSize(width: 0, height: 3)
        backgroundVw.layer.shadowRadius = 4
        backgroundVw.layer.shadowOpacity = 0.5
        
        separatorCapacityLbl.text = "/"
        capacityLimitLbl.text = "0"
        counterCapacityLbl.text = "0"
        appNameLbl.text = NSLocalizedString("appName", comment: "")
        appNameLbl.font = UIFont(name: FONT_BLACK, size: 24)
        appNameLbl.numberOfLines = 0
        appNameLbl.lineBreakMode = .byWordWrapping
        appNameLbl.adjustsFontSizeToFitWidth = true
        
        let labels: [UILabel] = [separatorCapacityLbl, counterCapacityLbl, capacityLimitLbl]
        for label in labels {
            label.font = UIFont(name: FONT_HEAVY, size: 46)
            label.numberOfLines = 1
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.5
            label.textColor = .white
        }
        addBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        addBtn.setTitle("", for: .normal)
        addBtn.tintColor = .black
        addBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 49, weight: .medium), forImageIn: .normal)
        
        minusBtn.setImage(UIImage(systemName: "minus"), for: .normal)
        minusBtn.setTitle("", for: .normal)
        minusBtn.tintColor = .black
        minusBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 49, weight: .medium), forImageIn: .normal)
        
        newLimitBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        newLimitBtn.tintColor = .black
        newLimitBtn.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 28, weight: .regular), forImageIn: .normal)
        newLimitBtn.setTitle("", for: .normal)
        
        descriptionLbl.text = ""
        descriptionLbl.font = UIFont(name: FONT_MEDIUM, size: 24)
        descriptionLbl.textAlignment = .center
    }
    
// MARK: -IBActions
    @IBAction func addBtnPressed(sender: Any) {
        switch counter.checkCapacityLimit() {
        case false:
            let result = counter.incrementCounter()
            backgroundVw.backgroundColor = result.backgroundInfo.color
            descriptionLbl.text = result.backgroundInfo.message
            counterCapacityLbl.text = String(format: "%.0f", result.currentCapacity)
        default:
            let alert = UIAlertController(title: NSLocalizedString("noLimitAlertTitle", comment: ""), message: NSLocalizedString("noLimitAlertMessage", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func minusBtnPressed(sender: Any) {
        switch counter.checkCapacityLimit() {
        case false:
            let result = counter.decrementCounter()
            backgroundVw.backgroundColor = result.backGroundInfo.color
            descriptionLbl.text = result.backGroundInfo.message
            counterCapacityLbl.text = String(format: "%.0f", result.currentCapacity)
        default:
            let alert = UIAlertController(title: NSLocalizedString("noLimitAlertTitle", comment: ""), message: NSLocalizedString("noLimitAlertMessage", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func newLimitBtnPressed(sender: Any) {
        let newLimitAlert = UIAlertController(title: NSLocalizedString("newLimitAlertTitle", comment: ""), message: NSLocalizedString("newLimitAlertMessage", comment: ""), preferredStyle: .alert)

        let setAction = UIAlertAction(title: NSLocalizedString("newLimitAlertSet", comment: ""), style: .default) { (alert) in
            let textField = newLimitAlert.textFields![0] as UITextField
            let textStr = textField.text ?? "0"
            self.capacityLimitLbl.text = textStr
            self.totalCapacity = Double(textStr) ?? 0
            self.counterCapacityLbl.text = "0"
            self.backgroundVw.backgroundColor = greenColor
            
            self.counter.getTotalCapacity(capacity: self.totalCapacity)
            print("TextField is:", textStr)
            print("Finished")
        }
        
        newLimitAlert.addAction(setAction)
        
        newLimitAlert.addTextField { (textfield) in
            setAction.isEnabled = false
            NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: textfield, queue: OperationQueue.main) { (_) in
                let textCount = textfield.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
                let textIsNotEmpty = textCount > 0
                setAction.isEnabled = textIsNotEmpty
            }
            textfield.placeholder = "20"
            textfield.keyboardType = .numberPad
        }

        newLimitAlert.addAction(UIAlertAction(title: NSLocalizedString("newLimitAlertCancel", comment: ""), style: .cancel, handler: nil))

        present(newLimitAlert, animated: true, completion: nil)
    }
}

