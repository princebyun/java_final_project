<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/switchery/dist/switchery.min.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/switchery/dist/switchery.min.js"></script>
<!DOCTYPE html>
<body>
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<br> <a onclick="javascript:history.go(-1)" style="cursor: pointer;"> <i
				class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">COP 정보 수정</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<form method="post" action="modifyCop.do" name="registForm" role="form">
									<input type="hidden" id="copCode" name="copCode" value="">
									<div class="row">
										<div class="col-6">
											<!-- BEGIN register-content -->
											<div class="register-content">
												<div class="mb-3">
													<h3>
														CoP 프로필 사진 / 150 x 150 권장<span class="text-danger">*</span>
													</h3>
													<div class="mailbox-attachment-icon has-img"
														id="copProfile"
														style="border: 1px solid green; height: 100px; width: 100px; margin: 0 auto; text-align: center; background-size: cover; background-repeat: no-repeat; background-image: url('<%=request.getContextPath() %>/cop/getPictureByCode/${copInfo.copCode}');"></div>
													<br>
													<div class="mailbox-attachment-info">
														<div class="input-group input-group-sm">
															<label for="inputProfileImg"
																class="btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
															<input id="inputProfileFileName" class="form-control"
																type="text" name="tempPicture" value="${copInfo.copBannerimg.split('\\$\\$')[1] }" readonly="readonly"> <span
																class="input-group-append-sm">
																<button type="button"
																	class="btn btn-info btn-sm btn-append"
																	onclick="profileUpload_go();">업로드</button>
															</span>
														</div>
													</div>
												</div>
												<br> <br> <br>
												<div class="mb-3">
													<h3>
														CoP 배너 / 1200 x 270 권장<span class="text-danger">*</span>
													</h3>
													<div class="mailbox-attachment-icon has-img" id="copBanner"
														style="border: 1px solid green; height: 100px; margin: 0 auto; background-size: cover; background-repeat: no-repeat; background-image: url('<%=request.getContextPath() %>/cop/getBannerByCode/${copInfo.copCode}');"></div>
													<br>
													<div class="mailbox-attachment-info">
														<div class="input-group input-group-sm">
															<label for="inputBannerFile"
																class="btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
															<input id="inputBannerFileName" class="form-control"
																type="text" name="tempPicture" value="${copInfo.copProfileimg.split('\\$\\$')[1] }" readonly="readonly"> <span
																class="input-group-append-sm">
																<button type="button"
																	class="btn btn-info btn-sm btn-append"
																	onclick="bannerUpload_go();">업로드</button>
															</span>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-6">
											<div class="register-content">
												<div class="mb-3">
													<h3>
														CoP 이름<span class="text-danger">*</span>
													</h3>
													<div class="row gx-3">
														<div class="col-md-12 mb-2 mb-md-0">
															<input type="text" class="form-control fs-13px"
																placeholder="CoP Name" id="copName" name="copName" value="${copInfo.copName }" readonly="readonly">
														</div>
													</div>
												</div>
												<br>
												<div class="mb-3">
													<h3>
														CoP 주제<span class="text-danger">*</span>
													</h3>
													<input type="text" class="form-control fs-13px"
														placeholder="CoP Subject" id="copSubject"
														name="copSubject" value="${copInfo.copSubject}"/>
												</div>
												<br>
												<div class="mb-3">
													<h3>
														CoP 설명<span class="text-danger">*</span>
													</h3>
													<textarea rows="" cols="" class="form-control fs-13px"
														style="margin-top: 0px; margin-bottom: 0px; height: 102px; resize: none;"
														placeholder="CoP Description" id="copDetail"
														name="copDetail">${copInfo.copDetail}</textarea>
												</div>
												<br>
												<div class="mb-3">
													<h3>
														CoP 공개 여부<span class="text-danger">*</span>
													</h3>
													<div class="mb-4" style="text-align: center;" id="clickDiv">
														비공개 <input type="checkbox" id="switchery-default" role="openCheck" ${copInfo.copType eq '1' ? 'checked' : '' }/>공개 
														<input type="hidden" value="1" name="copType" id="copType">
													</div>
												</div>
												<div style="display: none;">
													<input id="profileImg" name="copProfileimg" value="${copInfo.copBannerimg.split('\\$\\$')[1]}">
													<input id="bannerImg" name="copBannerimg" value="${copInfo.copProfileimg.split('\\$\\$')[1]}">
												</div>
											</div>
										</div>
										<hr>
									<div class="row">
										<div class="col-4"></div>
										<div class="col-4">
											<button type="button" id="createBtn" onclick="modifyCopInfo()" class="btn btn-yellow d-block w-100 btn-lg h-50px fs-20px">수정완료</button>
										</div>
										<div class="col-4"></div>
									</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 	$('form[role="form"]  input[name="copBannerimg"]') -->
		<form role="profileImageForm" action="upload/profileImg.do" method="post" enctype="multipart/form-data">
		<input id="inputProfileImg" name="inputProfileImg" type="file" class="form-control" onchange="picture_goForProfile()" style="display: none;"> 
		<input id="profileOldFile" type="hidden" name="oldPicture" value="${copInfo.copProfileimg}" /> 
		<input type="hidden" name="profileCheckUpload" value="0" />
	</form>
	<form role="bannerImageForm" action="upload/bannerImg.do" method="post" enctype="multipart/form-data">
		<input id="inputBannerFile" name="inputBannerFile" type="file" class="form-control" onchange="picture_goForBanner()" style="display: none;"> 
		<input id="bannerOldFile" type="hidden" name="oldPicture" value="${copInfo.copBannerimg}" /> 
		<input type="hidden" name="bannerCheckUpload" value="0" />
	</form>
	<script type="text/javascript">
		window.onload = function() {
			var copCode = "${copCode}";
			
			$('input[name="copCode"]').val(copCode);
		}
		function modifyCopInfo(){
			
			var profileCheck = $('input[name="profileCheckUpload"]').val();
			if (profileCheck == "0") {
    			swal({
					title : '경고',
					text : '프로필 사진 업로드는 필수 입니다',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}

			var bannerCheck = $('input[name="bannerCheckUpload"]').val();
			if (bannerCheck == "0") {
    			swal({
					title : '경고',
					text : '배너 사진 업로드는 필수 입니다',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}

			if ($('input[name="copName"]').val() == "") {
    			swal({
					title : '경고',
					text : 'COP명은 필수입니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}

			if ($('input[id="copSubject"]').val() == "") {
    			swal({
					title : '경고',
					text : '주제를 입력해주세요.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}

			if ($('textarea[id="copDetail"]').val() == "") {
    			swal({
					title : '경고',
					text : '설명을 입력해주세요.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}
			
			swal({
				title : 'COP 정보 수정',
				text : '정말 수정하시겠습니까?',
				icon : 'warning', // primary success warning danger
				buttons : {
					cancel : {
						text : '취소',
						value : false,
						visible : true,
						className : 'btn btn-default',
						closeModal : true,
					},
					confirm : {
						text : '확인',
						value : true,
						visible : true,
						className : 'btn btn-warning',
						closeModal : true
					}
				}
			}).then(function(val) {
				if (val == true) {
					$('form[name="registForm"]').submit();			
				}
			})
		};

		var elm = document.getElementById('switchery-default');
		var switchery = new Switchery(elm, {
			color : '#00acac'
		});
	
		switchery.enable(); // enable
		
		$('span[class="switchery switchery-default"]').click(
			function() {

				var color = $(
						'span[class="switchery switchery-default"]')
						.css('box-shadow').substr(4, 3);
				if (color == "223") {
					$('input[id="copType"]').val('1');
				} else {
					$('input[id="copType"]').val('0');
				}
				var ale = $('input[id="copType"]').val();
		});

		var checkedCOP = "";

		function picture_goForProfile() {
			profileFormData = new FormData(
					$('form[role="profileImageForm"]')[0]);
			//alert("file choice");

			var form = $('form[role="profileImageForm"]');
			var picture = form.find('[name=inputProfileImg]')[0];

			//업로드 확인변수 초기화
			form.find('[name="profileCheckUpload"]').val(0);
			var fileFormat = picture.value.substr(
					picture.value.lastIndexOf(".") + 1).toUpperCase();

			//이미지 확장자 jpg 확인
			if (!(fileFormat == "JPG" || fileFormat == "JPEG")) {
    			swal({
					title : '경고',
					text : '이미지는 jpg/jpeg 형식만 가능합니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				picture.value = "";
				return;
			}

			//이미지 파일 용량 체크
			if (picture.files[0].size > 1024 * 1024 * 1) {
    			swal({
					title : '경고',
					text : '사진 용량은 1MB 이하만 가능합니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}
			;

			document.getElementById('inputProfileFileName').value = picture.files[0].name;

			if (picture.files && picture.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('div#copProfile').css({
						'background-image' : 'url(' + e.target.result + ')',
						'background-position' : 'center',
						'background-size' : 'cover',
						'background-repeat' : 'no-repeat'
					});
				}
				reader.readAsDataURL(picture.files[0]);

			}
		}

		function picture_goForBanner() {
			bannerFormData = new FormData($('form[role="bannerImageForm"]')[0]);
			//alert("file choice");

			var form = $('form[role="bannerImageForm"]');
			var picture = form.find('[name=inputBannerFile]')[0];

			//업로드 확인변수 초기화
			form.find('[name="bannerCheckUpload"]').val(0);
			var fileFormat = picture.value.substr(
					picture.value.lastIndexOf(".") + 1).toUpperCase();

			//이미지 확장자 jpg 확인
			if (!(fileFormat == "JPG" || fileFormat == "JPEG")) {
    			swal({
					title : '경고',
					text : '이미지는 jpg/jpeg 형식만 가능합니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				picture.value = "";
				return;
			}

			//이미지 파일 용량 체크
			if (picture.files[0].size > 1024 * 1024 * 1) {
    			swal({
					title : '경고',
					text : '사진 용량은 1MB 이하만 가능합니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;
			}
			;

			document.getElementById('inputBannerFileName').value = picture.files[0].name;

			if (picture.files && picture.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('div#copBanner').css({
						'background-image' : 'url(' + e.target.result + ')',
						'background-position' : 'center',
						'background-size' : 'cover',
						'background-repeat' : 'no-repeat'
					});
				}
				reader.readAsDataURL(picture.files[0]);

			}
		}
// 		var elm = document.getElementById('switchery-default');
// 		var switchery = new Switchery(elm, {
// 			color : '#00acac'
// 		});

// 		switchery.enable(); // enable
		/* switchery.disable(); // disable
		switchery.destroy(); // destroy */

		function profileUpload_go() {
			// alert("upload btn click");
			if ($('input[name="inputProfileImg"]').val() == "") {
    			swal({
					title : '경고',
					text : '사진을 선택하세요.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				$('input[name="inputProfileImg"]').click();
				return;
			}
			;

			if ($('input[name="profileCheckUpload"]').val() == 1) {
    			swal({
					title : '경고',
					text : '이미업로드 된 사진입니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;

			}

			$.ajax({
				url : "<%=request.getContextPath()%>/cop/profileImg.do",
				data : profileFormData,
				type : 'post',
				processData : false,
				contentType : false,
				success : function(data) {
					// 업로드 확인변수 세팅
					
					$('input[name="profileCheckUpload"]').val(1);

					// 저장된 파일명 저장.
					$('input#profileOldFile').val(data); // 변경시 삭제될 파일명
					$('form[role="form"] input[name="copProfileimg"]').val(data);

	    			swal({
						title : '성공',
						text : '사진이 업로드 되었습니다.',
						icon : 'success', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-success',
								closeModal : true
							}
						}
					});
				},
				error : function(error) {
					AjaxErrorSecurityRedirectHandler(error.status);

	    			swal({
						title : '오류',
						text : '현재 사진 업로드가 불가합니다. 관리자에게 연락바랍니다.',
						icon : 'danger', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-danger',
								closeModal : true
							}
						}
					});
				}
			});
		}

		function bannerUpload_go() {
			// alert("upload btn click");
			if ($('input[name="inputBannerFile"]').val() == "") {
    			swal({
					title : '경고',
					text : '사진을 선택하세요.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				$('input[name="inputBannerFile"]').click();
				return;
			}
			;

			if ($('input[name="bannerCheckUpload"]').val() == 1) {
    			swal({
					title : '경고',
					text : '이미 업로드 된 사진입니다.',
					icon : 'warning', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning',
							closeModal : true
						}
					}
				});
				return;

			}

			$.ajax({
				url : "<%=request.getContextPath()%>/cop/bannerImg.do",
				data : bannerFormData,
				type : 'post',
				processData : false,
				contentType : false,
				success : function(data) {
					
					// 업로드 확인변수 세팅
					$('input[name="bannerCheckUpload"]').val(1);

					// 저장된 파일명 저장.
					$('input#bannerOldFile').val(data); // 변경시 삭제될 파일명
					$('form[role="form"] input[name="copBannerimg"]').val(data);

	    			swal({
						title : '성공',
						text : '사진이 업로드 되었습니다.',
						icon : 'success', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-success',
								closeModal : true
							}
						}
					});

				},
				error : function(error) {
					AjaxErrorSecurityRedirectHandler(error.status);

	    			swal({
						title : '오류',
						text : '현재 사진 업로드가 불가합니다. 관리자에게 연락바랍니다.사진이 업로드 되었습니다.',
						icon : 'danger', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-danger',
								closeModal : true
							}
						}
					});
				}
			});
		}
	</script>
</body>