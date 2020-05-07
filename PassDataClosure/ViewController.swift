//
//  ViewController.swift
//  PassDataClosure
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var namelable: UILabel!
    @IBOutlet weak var Agelable: UILabel!
    @IBOutlet weak var phonelable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // them title
        title = "Home"
        // Do any additional setup after loading the view.
        // khởi tạo nut barbutonitem để điều hướng sang màn secodViewcontroller
        let gobutton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(Chuyenman))
        // hiển thị nút sang bên phải
        navigationItem.rightBarButtonItem = gobutton
    }
    @objc func Chuyenman(){
        let main = SecondViewController()
        //#
        main.Usersname = "Vũ Dương"
        
        ///bước3sau
        /// truy cập để hứng dữ liệu
        /// đặt self trạng thái weak để tránh rêtencical
        /// đặt biến data để hứng dữ liệu sử dụng in để ngăn cách biến hứng dữ liệu và phần sử lý logic
        /// sau đó kiểm tra self có bị nil hay ko và gán lại 1 biến la Strongself
        
        main.passObject = { [ weak self ] data in
            guard let StrongSelf = self  else {
               return
            }
             /// từ biến Strongself này minh truy cập vào các đôi tượng trong class viewcontroller và cập nhật giá trị cho nó
            StrongSelf.namelable.text = "name: \(data.name)"
            StrongSelf.Agelable.text = "Age: \(data.age)"
            StrongSelf.phonelable.text = "Phone: \(data.phone)"
            /// kết thúc 
        }
        
            // sử dụng phương thức push
        self.navigationController?.pushViewController(main, animated: true)
    }
    
   // bạn đã làm rất tốt
    // cam ơn bạn đã giúp tôi
}

