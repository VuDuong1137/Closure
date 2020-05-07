//
//  SecondViewController.swift
//  PassDataClosure
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameTxt: UITextField!
    
    @IBOutlet weak var Agetxt: UITextField!
    
    @IBOutlet weak var phonetxt: UITextField!
    
    //# chuyển dữ liệu từ nàm view sang màn Second ta tạo một biến để hứng dữ liệu ở màn Second
    var Usersname : String?
    
    
    
    /// bươc1sau sau khi in thử được dữ liệu ta tạo một biến closure

    var passObject: ((User) -> Void)?
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //#
        if let name = Usersname{
            navigationItem.title = name
        }
        // bước1
        //...tạo một file Users.swift
        // chuyển dữ liệu từ màn sau ra màn trước
        // để chuyển dữ liệu ta phải lấy dữ liệu người dùng và phải có nut luư lại
        // tạo một nut luu trên thanh navigation
        let savebutton = UIBarButtonItem(title: "Lưu", style: .done, target: self, action: #selector(SaveData))
        navigationItem.rightBarButtonItem = savebutton
    }
    @objc func SaveData(){
        // trong phần sử lý action ta kiểm tra dữ liệu người dùng nhập vào
        // sử dụng guard let  để kiểm dữ liệu có bị nil hay ko và lưu lại trên biến mới
        guard let name1 = nameTxt.text,
              let age2 = Agetxt.text,
              let phone3 = phonetxt.text
        else {
            return
            
        }
        // sau đó thử in dữ liệu xem dữ liệu đã được in ra chua
    //print(name1, age2, phone3)
        
        ///bươc2 sau sau đó gọi biên passObject và khởi tạo nó
        passObject?(User(name: name1, age: Int(age2) ?? 0, phone: phone3))
        navigationController?.popViewController(animated: true)
        
        /// sau khi chuẩn bị màn khởi tạo đã xong ta sang màn ViewconTroller
    }
}
