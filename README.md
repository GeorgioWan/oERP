# ***oERP***

*oERP* is a simple ERP with [Ruby on Rails](http://rubyonrails.org/).



### **Environment**

This is my develop environment and the version:

 - `Ubuntu 15.04` 
 - `Rails 4.2.0`
 - `Ruby  2.2.3` 

#### **Editor**

I use [`Sublime Text 2`](http://www.sublimetext.com/) to code, if you use the same as me, you could install some plugin: 

 - [`Package Control`](https://packagecontrol.io/installation#st2) 
 - [`AllAutocomplete`](https://github.com/alienhard/SublimeAllAutocomplete)
 - [`gitgutter`](http://www.jisaacks.com/gitgutter/) 

> **Note:** *Package Control* has different install way for ***sublime text 2*** and ***sublime text 3***.

I also do this setting( *Preferences > Settings > User* ) :
```
 {
   # 把 tab 換兩個空白字元
   "translate_tabs_to_spaces": true,
   "tab_size": 2,
   # 高亮所在行
   "highlight_line": true,
   # 存檔時移除多餘的空白
   "trim_trailing_white_space_on_save": true
 }
```

> **Reference:** [***ihower's blog***](https://ihower.tw/blog/archives/7375)

### **Installation**

<i class="icon-download"></i> Clone *oERP* repo:
```
 git clone https://github.com/GeorgioWan/oERP.git
```

<i class="icon-hdd"> Remember to bundle install:
```ruby
 bundle
```

<i class="icon-folder"> Then, run:
```ruby
 rake db:migrate
```
### 2015.10.29
* 新增 **seed** 方便生成 data
```ruby
 rake db:seed
 # 單純生成 data
 
 rake db:reset
 # 資料太亂想重建，可以單純作 reset 重生 data 就好
```
* 如果想完全清空(包含tmp、log...etc)，我寫了 rake 方便重建
```ruby
 rake dev:rebuild
 # 清空重建 schema
 
 rake dev:rebuild_all
 # 清空重建並用seed生成 data
```
