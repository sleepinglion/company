$(document).ready(function(){
	$('#myModal').on('hidden.bs.modal', function () {
			$(this).removeData('bs.modal');
	});

	$('.modal_link').click(function(event){
		event.preventDefault();
		$('#myModal').removeData("modal");
		$('#myModal').load($(this).attr('href')+'?no_layout=true',function(){
			$('#myModal').modal();
		});
	});

	var cookie_login_id=getCookie('login_id');

	if(cookie_login_id) {
		$("#shit_login_id").val(cookie_login_id);
		$("#remember_me").prop('checked',true);
	}

	$("#sl_login_form").submit(function(){
		var loginID=$.trim($("#shit_login_id").val());
		var password=$.trim($("#shit_password").val());
		var token=$(this).find('input[name="authenticity_token"]').val();

		if(loginID=='') {
			display_message($("#message_no_email").val());
			return false;
		}

		if(password=='') {
			display_message($("#message_no_password").val());
			return false;
		}

		if($("#remember_me").is(":checked")) {
			setCookie('login_id',loginID);
		} else {
			if(getCookie('login_id'))
				deleteCookie('login_id')
		}
	});

	var cookie_barcode=getCookie('barcode');

	if(cookie_barcode) {
		$("#barcode").val(cookie_barcode);
		$("#remember_barcode").prop('checked',true);
	}

	$("#check_id_form").submit(function(){
		var barcode=$.trim($("#barcode").val());

		if($("#remember_barcode").is(":checked")) {
			setCookie('barcode',barcode);
		} else {
			if(getCookie('barcode'))
				deleteCookie('barcode')
		}
	});

	var cookie_geropic_id=getCookie('geropic_id');

	if(cookie_geropic_id) {
		$("#geropic_id").val(cookie_geropic_id);
		$("#remember_geropic_id").prop('checked',true);
	}

	$("#geropic_check_id_form").submit(function(){
		var geropic_id=$.trim($("#geropic_id").val());

		if($("#remember_geropic_id").is(":checked")) {
			setCookie('geropic_id',geropic_id);
		} else {
			if(getCookie('geropic_id'))
				deleteCookie('geropic_id')
		}
	});

	email_check=false;

	$("#regist_kit h3").css('cursor','pointer');
	$("#regist_kit h3").click(function(){
		location.href=$("#regist_kit a").attr('href');
	});

	$('<div>').addClass('menu_back').appendTo('header');
	$(".sl-dropdown-menu").slideUp();

	if($( document ).width()>996) {
	$("header .nav > li > a").mouseover(function(){
		if($(this).parent().hasClass('sl-dropdown')) {
			if(!$("header .menu_back").is(":visible")) {
				$(".sl-dropdown-menu").slideDown();
				$('header .menu_back').slideDown(function(){
					$("header .menu_back").show();
				});
			}
		}
	});

	$("#main_main,.sub_main").mouseover(function(){
		if($("header .menu_back").is(":visible")) {
			$(".sl-dropdown-menu").slideUp();
			$('header .menu_back').slideUp(function(){
				$("header .menu_back").hide();
			});
		}
	});
} else {
	$('.sl-dropdown-menu').addClass('dropdown-menu').removeClass('sl-dropdown-menu');

	$('.sl-dropdown>a').click(function(){
		if($(this).parent().find('ul').is(":visible")) {
			$('.sl-dropdown ul').hide();
		} else {
			$('.sl-dropdown ul').hide();
			$(this).parent().find('ul').show();
		}
		return false;
	});
}

	$("#user_form").submit(function(){
		if(!email_check) {
			alert(I18n.t('first_check_your_email_availability'));
			return false;
		}

		var email=$.trim($("#user_login_id").val());
		var password=$.trim($("#user_password").val());
		var password_confirm=$.trim($("#user_password_confirmation").val());

		if(password.length<5) {
			alert(I18n.t('password_complexity_description'));
			return false;
		}

		var num = password.search(/[0-9]/g);
	  var eng = password.search(/[a-z]/ig);
	  var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
			alert(I18n.t('password_complexity_description'));
			return false;
		}

		if(password!=password_confirm) {
			alert(I18n.t('password_password_confirm_not_match'));
			return false;
		}

/*
		$.post('/users.json',{'user[login_id]':email,'user[password]':password,'user[password_confirm]': password_confirm},function(data){
			if(data) {
				alert(data);
			} else {
				alert(data);
			}
		},'json');

		return false;
		*/
	});

	$("#user_login_id").keyup(function(){
		$("#check_email_available_button").parent().find('p').text('');
		email_check=false;
	});

	$("#check_email_available_button").click(function(){
		var email=$.trim($("#user_login_id").val());

		if(!email) {
			alert(I18n.t('login_p_email'));
			$("#user_login_id").focus();
			return false;
		}

		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if (!filter.test(email)) {
			alert(I18n.t('invalid_email'));
			email_check=false;
			return false;
		}

		$.getJSON('/users/check_email.json',{'email':email},function(data){
			if(data.exists) {
				email_check=false;
				$("#check_email_available_button").parent().find('p').text(I18n.t('unavailable_email')).attr('class','red').slideDown();
			} else {
				email_check=true;
				$("#check_email_available_button").parent().find('p').text(I18n.t('available_email')).attr('class','blue').slideDown();
			}
		});
	});

		$("#faqCategoryList a.title").click(getList);
		$("#faqList dt a.title").click(getContent);

		function getList() {
			var tt=$(this);
			var parent=$(this).parent();

			$.getJSON($(this).attr('href')+'.json',function(data){
				$("#faqList").empty();
				if(data.faqs.length) {
					$.each(data.faqs,function(index,value){
						var a=$('<a class="title" href="/faqs/id='+value.id+'">'+value.title+'</a>').click(getContent);
						if(data.admin) {
							var div=$('<div class="sl_faq_menu"><a>수정</a> &nbsp; | &nbsp; <a rel="nofollow" data-method="delete" data-confirm="정말로 삭제합니까?">삭제</a></div>');
							div.find('a:first').attr('href','/faqs/'+value.id+'/edit');
							div.find('a:eq(1)').attr('href','/faqs/'+value.id);
							$('<dt>').appendTo("#faqList").append(a).append(div);
						} else {
							$('<dt>').appendTo("#faqList").append(a);
						}
					});
				} else {
					$('<dt>글이 없습니다.</dt>').appendTo("#faqList");
				}

				$("#faqCategoryList li").removeClass('on');
				parent.addClass('on');

				var faqCategoryId=$.uri.setUri(tt.attr('href')).param("faq_category_id");

				if(data.admin) {
					$("#faqCategoryList li .sl_faq_category_menu").remove();
					var dd=$('<div class="sl_faq_category_menu"><a>수정</a><br /><a rel="nofollow" data-method="delete" data-confirm="정말로 삭제합니까?">삭제</a></div>');
					dd.find('a:first').attr('href','/faq_categories/'+faqCategoryId+'/edit');
					dd.find('a:eq(1)').attr('href','/faq_categories/'+faqCategoryId);
					parent.append(dd);
				}

				$('#sl_bottom_menu a:eq(1)').attr('href','/faqs/new?faq_category_id='+faqCategoryId);
			});
			return false;
		}

		function getContent(){
			var parent=$(this).parent();
			$.getJSON($(this).attr('href')+'.json',function(value){
				if(parent.next().get(0)) {
					if(parent.next().get(0).tagName!='DD') {
						parent.after('<dd>');
					}
				} else {
					parent.after('<dd>');
				}
				$("#faqList dt").removeClass('on');
				$("#faqList dd").hide();
				parent.addClass('on');
				parent.next().html('<p>'+nl2br(value.content)+'</p>').slideDown();
			});

			return false;
		}

});


 function setDateInput(obj) {
  if (obj != undefined) {
   var datediff = -(parseInt(obj));
   var newDate = new Date();
   var now = new Date();
   newDate.setDate(now.getDate()+datediff);
   var newYear = newDate.getFullYear();
   var newMonth = newDate.getMonth()+1;
   if (newMonth.toString().length == 1) newMonth = "0" + newMonth;

   endMonth=now.getMonth() +1;
   if (endMonth.toString().length == 1) endMonth = "0" + endMonth;

   var newDay = newDate.getDate();
   if (newDay.toString().length == 1) newDay = "0" + newDay;
   var txtSDate = newMonth + "/" + newDay +'/'+newYear;
   endDay=now.getDate();
   if (endDay.length == 1) endDay = "0" + endDay;
   var txtEDate = endMonth + "/" + endDay + '/' + now.getFullYear();
   $('input[name="start_date"]').val(txtSDate);
   $('input[name="end_date"]').val(txtEDate);
  } else {alert("잠시 후 이용해 주시기 바랍니다."); return false;}
 }


 function display_message(message,alert_type) {
 	if(!alert_type)
 		alert_type='danger';

 	$("#sl_message").addClass('alert-'+alert_type).show();
 	$("#sl_message p").empty();
 	$("#sl_message p").text(message);
 }


 /**
  * 쿠키값 추출
  * @param cookieName 쿠키명
  */
 function getCookie( cookieName )
 {
  var search = cookieName + "=";
  var cookie = document.cookie;

  // 현재 쿠키가 존재할 경우
  if( cookie.length > 0 )
  {
   // 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴.
   startIndex = cookie.indexOf( cookieName );
   // 만약 존재한다면
   if( startIndex != -1 )
   {
    // 값을 얻어내기 위해 시작 인덱스 조절
    startIndex += cookieName.length;

    // 값을 얻어내기 위해 종료 인덱스 추출
    endIndex = cookie.indexOf( ";", startIndex );

    // 만약 종료 인덱스를 못찾게 되면 쿠키 전체길이로 설정
    if( endIndex == -1) endIndex = cookie.length;

    // 쿠키값을 추출하여 리턴
    return cookie.substring( startIndex + 1, endIndex ) ;
   }
   else
   {
    // 쿠키 내에 해당 쿠키가 존재하지 않을 경우
    return false;
   }
  }
  else
  {
   // 쿠키 자체가 없을 경우
   return false;
  }
 }


 /**
  * 쿠키 설정
  * @param cookieName 쿠키명
  * @param cookieValue 쿠키값
  * @param expireDay 쿠키 유효날짜
  */
 function setCookie( cookieName, cookieValue, expireDate )
 {
  var today = new Date();
  today.setDate( today.getDate() + parseInt( expireDate ) );
  document.cookie = cookieName + "=" + cookieValue + "; path=/; expires=" + today.toGMTString() + ";";
 }


 /**
  * 쿠키 삭제
  * @param cookieName 삭제할 쿠키명
 */
 function deleteCookie( cookieName )
 {
  var expireDate = new Date();

  //어제 날짜를 쿠키 소멸 날짜로 설정한다.
  expireDate.setDate( expireDate.getDate() - 1 );
  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
 }


 function nl2br (str, is_xhtml) {
 	  var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br ' + '/>' : '<br>';
 	  return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
 }
