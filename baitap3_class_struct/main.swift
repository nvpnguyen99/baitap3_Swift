//
//  main.swift
//  baitap3_class_struct
//
//  Created by Nguyễn Văn Phước Nguyên on 10/08/2022.
//

import Foundation

class SinhVien {
    var ten : String
    var tuoi : Int
    var sdt  : String?
    

    init (ten : String, tuoi: Int, sdt: String? = nil){
        self.ten = ten
        self.tuoi = tuoi
        self.sdt = sdt
    }
    func add (t : String, p: String?){
        
    }
}

class Lop {
    var ten : String
    var tenGiaoVien: String
    var danhSachSinhVien: [SinhVien]
    
    init (ten :String, tenGiaoVien: String, danhSachSinhVien: [SinhVien]){
        self.ten = ten
        self.tenGiaoVien = tenGiaoVien
        self.danhSachSinhVien = danhSachSinhVien
    }
    
    func themSinhVien(ten: String, tuoi: Int, sdt: String? = nil){
        self.danhSachSinhVien.append(SinhVien(ten: ten, tuoi: tuoi, sdt: sdt))
    }
    
    func updateTenGv(ten: String){
        self.tenGiaoVien = ten
    }
    
    func searchSv(ten: String) -> SinhVien? {
        for sinhVien in self.danhSachSinhVien{
            if sinhVien.ten == ten {
                return sinhVien
            }
        }
        return nil
    }
    
    func updateSv(ten: String, tenMoi: String) -> String{
        if searchSv(ten: ten) != nil {
           var sinhVien = searchSv(ten: ten)!
            sinhVien.ten = tenMoi
            return "Update Successfully!"
        }
       return "Student not found!"
    }
    
    func deleteSv(ten: String) -> String{
        if searchSv(ten: ten) != nil {
            danhSachSinhVien.removeAll { sinhVien in
                sinhVien.ten == ten
            }
            return "Delete successfully!"
        }
        return "Student not found!"
    }
}

var lop = Lop(ten: "Techmaster", tenGiaoVien: "Quỳnh", danhSachSinhVien: [])
lop.themSinhVien(ten: "Nam", tuoi: 20, sdt: "0123")
lop.themSinhVien(ten: "Hoàng", tuoi: 21)
lop.themSinhVien(ten: "Linh", tuoi: 20, sdt: "0122")
lop.themSinhVien(ten: "Huyền ", tuoi: 20)
lop.themSinhVien(ten: "Đức", tuoi: 20, sdt: "0623")
lop.themSinhVien(ten: "Dương", tuoi: 20)
lop.themSinhVien(ten: "Tùng", tuoi: 20, sdt: "0163")
lop.themSinhVien(ten: "Bắc", tuoi: 20)
lop.themSinhVien(ten: "Thanh", tuoi: 20, sdt: "0168")

lop.updateTenGv(ten: "Quỳnh Teacher")


print (lop.updateSv(ten: "Nam", tenMoi: "Đông"))
print(lop.deleteSv(ten: "Hoàng"))

print(lop.ten, lop.tenGiaoVien)
for sinhVien in lop.danhSachSinhVien {
    print(sinhVien.ten, sinhVien.tuoi, sinhVien.sdt)
}
