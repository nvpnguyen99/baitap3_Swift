//
//  main.swift
//  baitap3_class_struct
//
//  Created by Nguyễn Văn Phước Nguyên on 10/08/2022.
//

import Foundation

class SinhVien {
    var ten: String
    var tuoi: Int
    var sdt: String?
    

    init (ten: String, tuoi: Int, sdt: String? = nil){
        self.ten = ten
        self.tuoi = tuoi
        self.sdt = sdt
    }
    func add (t : String, p: String?){
        
    }
}

class Lop {
    var ten: String
    var tenGiaoVien: String
    var danhSachSinhVien: [SinhVien]
    
    init (ten: String, tenGiaoVien: String, danhSachSinhVien: [SinhVien]) {
        self.ten = ten
        self.tenGiaoVien = tenGiaoVien
        self.danhSachSinhVien = danhSachSinhVien
    }
    
    func themSinhVien(ten: String, tuoi: Int, sdt: String? = nil) {
        self.danhSachSinhVien.append(SinhVien(ten: ten, tuoi: tuoi, sdt: sdt))
    }
    
    func updateTenGv(ten: String) {
        self.tenGiaoVien = ten
    }
    
    func searchSv(by ten: String) -> [SinhVien] {
        var searchResult = [SinhVien]()
        if self.danhSachSinhVien.isEmpty {
            return []
        }
        for sinhVien in self.danhSachSinhVien {
            if sinhVien.ten == ten {
                searchResult.append(sinhVien)
            }
        }
        return searchResult
    }
    
    func updateSv(by ten: String, tenMoi: String) -> String {
        if searchSv(by: ten).isEmpty {
            return "Student not found!"
        }
        for sinhVien in searchSv(by: ten) {
            sinhVien.ten = tenMoi
        }
        return "Update Successfully!"
    }
    
    func deleteSv(by ten: String) -> String {
        if searchSv(by: ten).isEmpty {
            return "Student not found!"
        }
        danhSachSinhVien.removeAll { sinhVien in
            sinhVien.ten == ten
        }
        return "Delete successfully!"
    }
    
    func getInfoClass() -> String {
        return "Lớp học \(self.ten), giáo viên \(self.tenGiaoVien), số sinh viên \(danhSachSinhVien.count) "
    }
    
    func getInfoSinhVien() -> [String] {
        var results = [String]()
        for sinhVien in danhSachSinhVien {
            var studentInfo = "Tên sv: \(sinhVien.ten), tuổi: \(sinhVien.tuoi)"
            if (sinhVien.sdt == nil) {
                results.append(studentInfo)
            } else {
                studentInfo += " sdt: \(sinhVien.sdt ?? "")"
                results.append(studentInfo)
            }
        }
        return results
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


print (lop.updateSv(by: "Nam", tenMoi: "Đông"))
print(lop.deleteSv(by: "Hoàng"))

print(lop.getInfoClass())
for info in lop.getInfoSinhVien() {
    print(info)
}
