# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#
ProductCategory.create!(id: 1, title: '프로그램사용')
ProductCategory.create!(id: 2, title: '신규 시스템 제작')
ProductCategory.create!(id: 3, title: '프로그램 유지보수')
ProductCategory.create!(id: 4, title: '서버관련')

Product.create!(id: 1, product_category_id: 1, title: '프로그램 광고없이 사용신청', price: 5000)
Product.create!(id: 2, product_category_id: 1, title: '프로그램 단독-사용(광고없이 사용 포함)', price: 10000)
Product.create!(id: 3, product_category_id: 1, title: '프로그램 기술지원', price: 100000)

Product.create!(id: 4, product_category_id: 2, title: '제대로웹 프로그램 수정-제작', price: 2000)
Product.create!(id: 5, product_category_id: 2, title: '신규 프로그램 제작', price: 2000)

Product.create!(id: 6, product_category_id: 3, title: '문제점개선', price: 2000)
Product.create!(id: 7, product_category_id: 3, title: '속도개선', price: 2000)

Product.create!(id: 8, product_category_id: 4, title: '서버 설치,설정', price: 2000)
Product.create!(id: 9, product_category_id: 4, title: '서버 이전', price: 2000)
Product.create!(id: 10, product_category_id: 4, title: '서버 기술지원', price: 2000)




ProgramLanguage.create!(:id=>1,:title=>'ruby',:link=>'https://www.ruby-lang.org/',:enable=>1)
ProgramLanguage.create!(:id=>2,:title=>'PHP',:link=>'https://www.php.net/',:enable=>1)
ProgramLanguage.create!(:id=>3,:title=>'CSS',:link=>nil,:enable=>1)
ProgramLanguage.create!(:id=>4,:title=>'javascript',:link=>nil,:enable=>1)
ProgramLanguage.create!(:id=>5,:title=>'java',:link=>'https://www.java.com/',:enable=>1)
ProgramLanguage.create!(:id=>6,:title=>'python',:link=>'https://www.python.org/',:enable=>1)

ProgramCategory.create!(:id=>1,:program_language_id=>1,:title=>'Ruby on Rails',:link=>'http://rubyonrails.org/')
ProgramCategory.create!(:id=>2,:program_language_id=>2,:title=>'Pure PHP')
ProgramCategory.create!(:id=>3,:program_language_id=>2,:title=>'Wordpress',:link=>'https://wordpress.org/')
ProgramCategory.create!(:id=>4,:program_language_id=>2,:title=>'Mediawiki',:link=>'https://www.mediawiki.org/wiki/MediaWiki')
ProgramCategory.create!(:id=>5,:program_language_id=>2,:title=>'Codeigniter',:link=>'https://codeigniter.com/')
ProgramCategory.create!(:id=>6,:program_language_id=>2,:title=>'CakePHP',:link=>'https://cakephp.org/')
ProgramCategory.create!(:id=>7,:program_language_id=>3,:title=>'Boostrap',:link=>'http://getbootstrap.com/',:main=>false)
ProgramCategory.create!(:id=>8,:program_language_id=>4,:title=>'Jquery',:link=>'https://jquery.com/',:main=>false)

Program.create!(:id=>1,:title=>'카페(매점) 주문,관리 프로그램',:description=>'카페,매점등에서 회원,상품,주문등을 관리하는 프로그램입니다.')
Program.create!(:id=>2,:title=>'헬스장관리 프로그램',:description=>'헬스장에서 회원,수강,대여등을 관리하는 프로그램입니다.')
Program.create!(:id=>3,:title=>'구인구직 프로그램',:description=>'구인구직 프로그램입니다')
Program.create!(:id=>4,:title=>'제대로웹 홈페이지',:description=>'현재 보고계시는 제대로웹의 홈페이지입니다')

ProgramCategoriesProgram.create!(:id=>1,:program_category_id=>1,:program_id=>1)
ProgramCategoriesProgram.create!(:id=>2,:program_category_id=>1,:program_id=>2)
ProgramCategoriesProgram.create!(:id=>3,:program_category_id=>1,:program_id=>3)
ProgramCategoriesProgram.create!(:id=>4,:program_category_id=>1,:program_id=>4)

ProgramLinkCategory.create!(:id=>1, :title=>'service')
ProgramLinkCategory.create!(:id=>2, :title=>'repository')
ProgramLinkCategory.create!(:id=>3, :title=>'download')

ProgramLink.create!(:program_link_category_id=>1, :program_id=>1, :title=>'카페(매점) 주문,관리 프로그램 체험',:link=>'http://cafe.jedaeroweb.com')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>1, :title=>'카페(매점) 주문,관리 프로그램',:link=>'https://github.com/sleepinglion/anti-kb')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>1, :title=>'카페(매점) 주문,관리 프로그램 다운로드',:link=>'https://github.com/sleepinglion/sleepinglion')
ProgramLink.create!(:program_link_category_id=>1, :program_id=>2, :title=>'헬스장관리 프로그램 체험',:link=>'https://github.com/sleepinglion/anti-kb')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>2, :title=>'헬스장관리 프로그램 ',:link=>'https://github.com/sleepinglion/sleepinglion')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>2, :title=>'헬스장관리 프로그램 다운로드',:link=>'https://github.com/sleepinglion/anti-kb')
ProgramLink.create!(:program_link_category_id=>1, :program_id=>3, :title=>'',:link=>'https://github.com/sleepinglion/sleepinglion')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>3, :title=>'',:link=>'https://github.com/sleepinglion/anti-kb')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>3, :title=>'',:link=>'https://github.com/sleepinglion/sleepinglion')
ProgramLink.create!(:program_link_category_id=>1, :program_id=>4, :title=>'',:link=>'https://github.com/sleepinglion/anti-kb')
ProgramLink.create!(:program_link_category_id=>2, :program_id=>4, :title=>'',:link=>'https://github.com/sleepinglion/sleepinglion')
ProgramLink.create!(:program_link_category_id=>3, :program_id=>4, :title=>'',:link=>'https://github.com/sleepinglion/anti-kb')

