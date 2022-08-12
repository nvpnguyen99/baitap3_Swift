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
    
    func searchSv(ten: String) -> Bool{
        for sinhVien in self.danhSachSinhVien{
            if sinhVien.ten == ten {
                return true
            }
        }
        return false
    }
    
    func updateSv(ten: String, tenMoi: String) -> Bool {
        if searchSv(ten: ten) {
            for sinhVien in self.danhSachSinhVien{
                if sinhVien.ten == ten {
                    sinhVien.ten = tenMoi
                    return true
                }
            }
        }
        return false
    }
    
    func deleteSv(ten: String) -> Bool{
        if searchSv(ten: ten) {
            danhSachSinhVien.removeAll { sinhVien in
                return sinhVien.ten == ten
            }
            return true
        }
        return false
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

if lop.updateSv(ten: "Nam", tenMoi: "Đông") {
    print("Update Successfully")
} else {
    print("không có tên cần tìm")
}

if lop.deleteSv(ten: "Đức"){
    print("Delete Successfully")
} else {
    print("Không có tên cần xoá")
}

print(lop.ten, lop.tenGiaoVien)
for sinhVien in lop.danhSachSinhVien {
    print(sinhVien.ten, sinhVien.tuoi, sinhVien.sdt)
}
