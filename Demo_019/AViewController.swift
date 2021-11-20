//
//  AViewController.swift
//  Demo_019
//
//  Created by 鄭淳澧 on 2021/8/1.
//

import UIKit

class AViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var aTextField: UITextField! {
        didSet {
            aTextField.delegate = self
        }
    }
    @IBOutlet weak var aLabel: UILabel!
    
    var name = ""
    var age = 0
    
    // MARK: allocate & deallocate
    required init?(coder: NSCoder) {
        print("===> AViewController init")
        super.init(coder: coder)
    }

    deinit {
        print("<=== AViewController Deinit")
    }
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {}
    override func viewWillLayoutSubviews() {}
    override func viewDidLayoutSubviews() {}
    override func viewDidAppear(_ animated: Bool) {}
    override func viewWillDisappear(_ animated: Bool) {}
    override func viewDidDisappear(_ animated: Bool) {}

    
    
    // 採用轉場線, 正向傳值用
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let controller = segue.destination as? BViewController {
//            controller.name = aTextField.text ?? ""
//        }
    }
    
    // MARK: IBActions
    @IBAction func aBtnPressed(_ sender: Any) {
        // 採用轉場線ID轉場(若直接從元件拉線轉場則不需ID)
//        performSegue(withIdentifier: "fromAtoB", sender: nil)

        // 習慣用show做轉場和傳值, 會嵌入navigationController
        let sbd = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sbd.instantiateViewController(withIdentifier: "\(BViewController.self)") as? BViewController {
            vc.name = aTextField.text ?? ""
            show(vc, sender: nil)
        }
       
        
        
        // 使用present轉場和傳值, 但present不會嵌入navigationController, 故沒有返回鍵
//        let sbd = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = sbd.instantiateViewController(withIdentifier: "\(BViewController.self)") as? BViewController {
//            present(vc, animated: true) { [self] in
//                vc.bLabel.text = aTextField.text ?? ""
//            }
//        }
        
    }
    
    // 在B可以直接調用A的UI, 因為轉場到B時, A尚未消失; 但反過來不行, 因為轉場前B尚未產生
    @IBAction func uwindToA(_ segue: UIStoryboardSegue) {
        if let controller = segue.source as? BViewController {
            aLabel.text = "\(controller.bTextField.text ?? "")"
        }
       
    }
    

}

// MARK: TextFieldDelegate
extension AViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
//        textField.endEditing(true)
    }
}
