# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create([username: 'TEST', email: 'test@gmail.com', password: '321321321', password_confirmation: '321321321', phone: '0987654321', sex: 0])
puts '>>SUCCESS<< Create user [email: test@gmail.com, password: 321321321]'

create_company = Company.create([companyCode: '001', nameFull: 'TEST inc', nameShort: 'TT', level: 'A',
                                 phone: '0987654321', fax: '07654321', taxId: '12345678', email: 'testinc@testinc.com',
                                 address: '台北市T區T路123號', remark: 'This is for test.', companyType: 'main'])
puts '>>SUCCESS<< Create company for test'

create_supplier = for i in 1..5 do
                    Company.create([companyCode: "S0#{i}", nameFull: "Supplier0#{i}", nameShort: "S0#{i}", level: 'B',
                                     phone: '0987654321', fax: '07654321', taxId: '12345678', email: "supplier0#{i}@testinc.com",
                                     address: "台北市T區T路#{i}號", remark: "種子建立的第#{i}個廠商.", companyType: 'supplier'])
                  end
puts '>>SUCCESS<< Create 5 suppliers'

create_client = for i in 1..5 do
                    Company.create([companyCode: "C0#{i}", nameFull: "Client0#{i}", nameShort: "C0#{i}", level: 'B',
                                     phone: '0987654321', fax: '07654321', taxId: '12345678', email: "client0#{i}@testinc.com",
                                     address: "台北市C區C路#{i}號", remark: "種子建立的第#{i}個客戶.", companyType: 'client'])
                  end
puts '>>SUCCESS<< Create 5 clients'

create_product = for i in 1..3 do
                    Product.create!([code: "P0#{i}", name: "Product0#{i}", unit: '個', price: '300', bargain_price: '150',
                                     buffer_stock: "15", description: "種子建立的第#{i}個商品", remark: '易碎', company_id: 2])
                  end
puts '>>SUCCESS<< Create 3 products'

