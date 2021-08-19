<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>




<script>
	/* alert("업무를 활성화 하였습니다");	
	window.opener.parent.location.reload();
	window.close();		 */
	
	
	swal({
		title: '성공',
		text: '업무를 활성화 하였습니다',
		icon: 'success', // primary success warning danger
		buttons: {
	        	confirm: {
			text: '확인',
	                value: true,
	                visible: true,
	                className: 'btn btn-success',
	                closeModal: true
	              }
	        }
	}).then(function(e){
		window.opener.parent.location.reload();
		window.close();	
	});
	
</script>



