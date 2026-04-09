

 1. LÀM SẠCH DỮ LIỆU & THIẾT LẬP PANEL

destring total_assets total_liabilities total_revenues gross_ppe boardsize 
         big4_auditing pretax_roa pretax_roe femaleboardmember 
         independentboardmember, replace ignore(, %)

encode ticker, gen(firm)
xtset firm year


 2. TẠO BIẾN NGHIÊN CỨU

 Biến tài chính
gen ln_size = ln(total_assets)
gen leverage = total_liabilities  total_assets
gen fixed_asset_ratio = gross_ppe  total_assets
sort firm year
gen sales_growth = (total_revenues - L.total_revenues)  L.total_revenues

 Biến nhân trắc học (Tuổi)
gen ceo_age = year - ceo_birthyear
gen chair_age = year - chair_birthyear

 Biến giả Kiểm toán (Big4)
destring big4_auditing, replace force ignore(,  ) 
gen big4 = (big4_auditing == 1) if !missing(big4_auditing)


 3. XỬ LÝ OUTLIERS & ĐỊNH NGHĨA BIẾN TOÀN CỤC

foreach var in pretax_roa pretax_roe leverage sales_growth fixed_asset_ratio {
    winsor2 `var', replace cuts(1 99)
}

global cg_vars boardsize independentboardmember femaleboardmember duality 
               numberofboardmeeting chair_gender chair_age ceo_gender ceo_age
global control_vars ln_size leverage sales_growth foreign_ownership big4 fixed_asset_ratio

 Thống kê mô tả
sum pretax_roe pretax_roa $cg_vars $control_vars


 4. KIỂM ĐỊNH LỰA CHỌN MÔ HÌNH (Diagnostics)

 Đa cộng tuyến
quietly reg pretax_roa $cg_vars $control_vars i.year
vif

 Lựa chọn FE vs RE (Hausman Test)
quietly xtreg pretax_roa $cg_vars $control_vars i.year, fe
est store FE
quietly xtreg pretax_roa $cg_vars $control_vars i.year, re
est store RE
hausman FE RE, sigmamore

 Kiểm định khuyết tật (Phương sai thay đổi & Tự tương quan)
quietly xtreg pretax_roa $cg_vars $control_vars i.year, fe
xttest3 
xtserial pretax_roa $cg_vars $control_vars

 Kiểm định ý nghĩa của biến năm
.  quietly xtreg pretax_roa $cg_vars $control_vars i.year, fe
testparm i.year


 5. HỒI QUY MÔ HÌNH CHÍNH (Full Sample)

 Sử dụng Robust Standard Errors (Cluster by Firm) để xử lý khuyết tật
xtreg pretax_roe $cg_vars $control_vars i.year, fe vce(cluster firm)
est store ROE_Full

xtreg pretax_roa $cg_vars $control_vars i.year, fe vce(cluster firm)
est store ROA_Full


 6. PHÂN TÍCH SO SÁNH THEO NGÀNH (Sub-sample)

 Ngành Dược phẩm (BDS == 0)
xtreg pretax_roa $cg_vars $control_vars i.year if BDS == 0, fe vce(cluster firm)
est store PHARMA

 Ngành Bất động sản (BDS == 1)
xtreg pretax_roa $cg_vars $control_vars i.year if BDS == 1, fe vce(cluster firm)
est store REAL_ESTATE



 7. XUẤT KẾT QUẢ RA FILE WORD

esttab ROE_Full ROA_Full PHARMA REAL_ESTATE using Main_Results.doc, replace 
    b(%12.3f) se(%12.3f) star( 0.1  0.05  0.01) 
    label compress nogap title(Impact of Corporate Governance on Firm Performance) 
    addnotes(Year fixed effects included. Standard errors clustered at the firm level.)

```


