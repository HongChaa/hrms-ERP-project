<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/club.css">
    <link rel="stylesheet" href="/assets/css/club-modal.css" </head> <body>
    <!-- ================ 클럽 모달 ============================================================================ -->
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <div class="modal-background"></div>
        <div class="club-modal-wrapper common-club-modal">
            <div class="club-modal-separator">
                <section class="club-modal-content-container">
                    <ul class="contents-wrapper">
                        <li class="club-modal-club-info">
                            <ul class="club-modal-informations">
                                <li class="club-modal-image"><img src="/resources/static/assets/img/logo.png"
                                        alt="동호회사진">
                                </li>
                                <li class="club-name"></li>
                                <li class="board-writer"></li>
                                <li class="detail-join-btn"></li>
                                <li class="my-board-mod-del-btn"></li>
                                    <!-- <button id="update-club-btn">수정하기</button>
                                    <button id="delete-club-btn">삭제하기</button> -->
                            </ul>
                        </li>
                        <li>
                            <div class="club-modal-contents">
                                <div class="post-img"><img id="modal-post-image" alt="게시글미디어"></div>
                                <div class="post-text"></div>
                            </div>
                        </li>
                    </ul>
                </section>
                <section class="club-modal-replies-container">
                    <div class="club-modal-replies-head">
                        <ul class="replies-wrapper">
                            <li class="club-modal-add-reply">
                                    <input type="hidden" class="club-reply-writer" value="${exEmp.empNo}">
                                    <input class="write-reply" type="text" placeholder="댓글을 작성해보세요!">
                                    <button id="add-reply" type="submit">등록</button>
                                    <button id="cancel-reply" type="reset">취소</button>
                            </li>

                            <li class="club-modal-reply-list">
                                <div class="club-reply-generate"></div>    
                            </li>
    
                        </ul>
                    </div>
                </section>
            </div>
        </div>

        <!-- ============================================================================================ -->

        <!-- 새 게시글 작성하기 모달창 ================================================================== -->
        <div class="club-modal-wrapper club-write-content-wrapper">
            <section class="club-write-content-container">
               <ul class="write-wrapper">
                  <li class="write-content-club-info">
                     <ul class="club-modal-informations">
                        <li class="club-modal-image">
                           <img src="/assets/img/samjo-logo.png" alt="동호회사진" class="newClubBoard-clubName-img">
                        </li>
                        <li class="newClubBoard-clubName"></li>
                        <li>
                           <form action="#" method="post">
                              <!-- 가입하기 버튼 id 는 버튼 위치 잡으려고 만듬 -->
                              <button id="add-cancel-btn" type="button">취소
                              </button>
                           </form>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <div class="club-write-wrap">
                        <form action="/hrms/club/clubBoardSave" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="empNo" value="${exEmp.empNo}">
                            <input type="hidden" id="input-clubCode" name="clubCode" value="">
                           <label for="club-write-content" id="content-label"><span>문구</span></label>
                           <textarea id="club-write-content" name="cbContent" maxlength="300" required
                                     style="resize: none"></textarea>
                           <div class="club-content-image">
                              <div class="content-image-box">
                                 <img src="/assets/img/upload-img.png" alt="사진업로드">
                              </div>
         
                              <label>컨텐츠 이미지 추가</label>
         
                              <input
                                    type="file"
                                    id="content-img"
                                    accept="image/*"
                                    style="display: none;"
                                    name="cbURL" required
                              >
                           </div>
                          
                           <div class="buttons">
                              <button id="add-content-btn" type="submit">등록하기</button>
                           </div>
                        </form>
                     </div>
                  </li>
               </ul>
            </section>
         </div>
        <!-- ============================================================================================ -->
        <!-- <div class="sample">안녕</div> -->
        <section class="section-club-board">
            <div id="club-contents">
                <div class="club-drop-down-btn">
                    <button class="club-dropbtn"></button>
                    <div class="club-drop-down-content">
                        <a href="/hrms/club/club-board-list">전체보기</a>
                        <a href="/hrms/club/joined-club-board-list?empNo=${exEmp.empNo}">내 동호회</a>
                    </div>
                </div>
                <div id="club-board-list">
                    <div class="club-card-wrapper">
                        <c:forEach var="c" items="${clubBoardList}">
                            <section class="club-card" data-cbDate="${c.cbDate}" data-bno="${c.cbNo}"
                                data-writer="${c.empName}">
                                <div class="club-card-info">
                                    <ul>
                                        <li><img src="${c.clubProfile}" alt="동호회프로필" class="club-profile-img"></li>
                                        <li class="board-list-club-name" data-clubCode="${c.clubCode}">${c.clubName}</li>
                                        <!-- 가입하기 버튼 -->
                                        <li>
                                            <button class="join" type="submit"
                                                style="cursor: pointer !important;">Join</button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="club-card-content">
                                    <div class="board-list-club-URL"><img src="/hrms${c.cbURL}" alt="게시글사진"></div>
                                    <div class="board-list-club-content">${c.cbContent}</div>
                                </div>
                            </section>
                        </c:forEach>

                    </div>
                </div>
                <div id="club-board-information">
                    <div id="club-board-reply">
                        <div class="club-board-sort">
                            <div class="myBoard"><a href="#">내게시글</a></div>
                            <div class="myClub"><a href="#">내동호회</a></div>
                            <div class="myReply"><a href="#">내가쓴댓글</a></div>
                        </div>
                        <div class="club-my-board">
                            <div class="three-option">

                                <!-- <ul>
                                        <li class="club-board-title" data-cbNo="cbNo" data-clubCode="clubCode">cbTitle</li>   
                                    </ul>  -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        // 내게시글, 가입동호회, 내댓글 관련 스크립트

        // 현재 로그인한 사원번호 -- <세션으로 바꿀 부분>
        const empNo = '${exEmp.empNo}';

        // 비동기 URI
        const clubBoardURL = '/hrms/club';

        // ---------------------------------------------------------------------

        const $showbtn = document.querySelector('.club-dropbtn');
        const $hiddenContent = document.querySelector('.club-drop-down-content');

        $showbtn.onclick = e => {
            $hiddenContent.classList.toggle('show-content');
        };

        // ----------------------------------------------------------------------
        const $threeOption = document.querySelector('.three-option');
        const $myBoard = document.querySelector('.myBoard');
        const $myClub = document.querySelector('.myClub');
        const $myReply = document.querySelector('.myReply');

        // three-option 안에 태그들을 전부 지우는 함수
        function removeAllOption() {
            while ($threeOption.firstChild) {
                $threeOption.removeChild($threeOption.firstChild);
            }
        }
        // detail-join-btn 안에 가입하기 버튼 지우는 함수
        const $detailJoinBtn = document.querySelector('.detail-join-btn');
        function removeJoinBtn() {
            while ($detailJoinBtn.firstChild) {
                $detailJoinBtn.removeChild($detailJoinBtn.firstChild);
            }
        }
        // my-board-mod-del-btn 안에 수정 삭제 버튼 지우는 함수
        const $modDelBtn = document.querySelector('.my-board-mod-del-btn');
        function removeModDelBtn() {
            while ($modDelBtn.firstChild) {
                $modDelBtn.removeChild($modDelBtn.firstChild);
            }
        }

        // 내 게시글 클릭시 태그 생성 및 목록 비동기 요청
        $myBoard.onclick = e => {
            myBoardList();
        };
        
        // 내 게시글 목록 조회 함수
        function myBoardList() {
        let myBoardTag = '';
        removeAllOption();
        fetch(clubBoardURL + '/myboardList/' + empNo)
            .then(res => res.json())
            .then(resResult => {
                // console.log(resResult);
                if (resResult.length === 0) {
                    myBoardTag += "<div id='noMyBoard'> 작성한 게시글이 없습니다.</div>";
                } else {
                    for (let oneboard of resResult) {
                        const {
                            cbNo,
                            cbTitle,
                            clubCode,
                            empNo,
                            cbContent
                        } = oneboard;

                        myBoardTag += "<ul>" +
                            "<li class='club-board-title' data-cbNo='" + cbNo + "' data-clubCode='" +
                            clubCode + "'>" + cbContent + "</li>" +
                            "</ul>";
                    }
                }
                document.querySelector('.three-option').innerHTML = myBoardTag;
            });
        }

        // 내 동호회 클릭시 태그 생성 및 목록 비동기 요청
        $myClub.onclick = e => {
            myJoinedClubList();
        };
        
        // 내 동호회 목록 조회 함수
        function myJoinedClubList() {
        let myClubTag = '';
        removeAllOption();
        fetch(clubBoardURL + '/myclubList/' + empNo)
            .then(res => res.json())
            .then(JoinedClubListResResult => {
                if (JoinedClubListResResult.length === 0) {
                    myClubTag += "<div id='noJoinedClub'> 가입한 동호회가 없습니다.</div>";
                } else {
                    for (let oneClub of JoinedClubListResResult) {
                        const {
                            ecIndex,
                            empJoinDate,
                            empNo,
                            clubCode,
                            clubName
                        } = oneClub;

                        myClubTag += "<ul>" +
                            "<li class='joined-club-list' data-clubCode='" + clubCode + "'>" 
                                + "<b class='joined-club-name'>" + clubName +"</b>"+
                            "<button class='club-board-write-btn'>글쓰기</button>" +
                            "<button class='club-leave-btn'>탈퇴하기</button>" +
                            "</li>" +
                            "</ul>";
                    }
                }
                document.querySelector('.three-option').innerHTML = myClubTag;
            });
        }


        // 내가 쓴 댓글 클릭시 태그 생성 및 목록 비동기 요청
        $myReply.onclick = e => {
            myReplyList();
        };
        

        // 내가 쓴 댓글 목록 비동기 조회 함수
        function myReplyList() {
            let myReplyTag = '';
            removeAllOption();
            fetch(clubBoardURL + '/myClubReply/' + empNo)
                .then(res => res.json())
                .then(resResult => {
                    if (resResult.length === 0) {
                        myReplyTag += "<div id='noMyReply'> 작성한 댓글이 없습니다.</div>";
                    } else {
                        for (let oneReply of resResult) {
                            const {
                                clubRepNo,
                                clubRepContent,
                                clubRepDate,
                                cbNo,
                                empNo,
                                empName
                            } = oneReply;

                            myReplyTag += "<ul>" +
                                "<li class='my-club-reply' data-clubRepNo='" + clubRepNo + "'data-cbNo='" +
                                cbNo + "'>" + clubRepContent +
                                "<button class='crep-mod-btn'>수정</button>" +
                                "<button class='crep-del-btn'>삭제</button>" +
                                "</li>" +
                                "</ul>";
                        }
                    }
                    document.querySelector('.three-option').innerHTML = myReplyTag;

                });
        }

        // 게시글 컨텐츠 클릭시 모달창 띄우기
        const $clubCardContent = document.querySelector('.club-card-content');
        const $commonModal = document.querySelector('.common-club-modal');
        const $modalBackground = document.querySelector('.modal-background');

        // ==================================================================
        const $clubCard = document.querySelector('.club-card');
        // 게시글 상세보기
        const $detailClubName = document.querySelector('.board-list-club-name');
        const $detailClubContent = document.querySelector('.board-list-club-content');
        const $detailClubProfile = document.querySelector('.club-profile-img');
        const $detailClubPostImg = document.querySelector('.board-list-club-URL');

        const $modalClubName = document.querySelector('.club-name');
        const $modalBoardWriter = document.querySelector('.board-writer');
        const $modalProfile = document.querySelector('.club-modal-image');
        const $modalPostImg = document.querySelector('.post-img');
        const $modalPostText = document.querySelector('.post-text');
        const $modalDate = document.querySelector('.reply-time');

        const $joinedClubList = document.querySelectorAll('.joined-club-list');
        const modalPostImg = document.getElementById('modal-post-image');
        
        $clubCard.parentElement.onclick = e => {
            
            // 동호회 가입하기 버튼 클릭시
            if(e.target.classList.contains('join')) {
                
                fetch(clubBoardURL + '/myclubList/' + empNo)
                .then(res => res.json())
                .then(resResult => {
                    for (let oneClub of resResult) {
                            const {
                                ecIndex,
                                empJoinDate,
                                empNo,
                                clubCode,
                                clubName
                            } = oneClub;
                            // 현재 가입하기를 누른 동호회코드가 이미 가입된 동호회 코드인지 확인
                            console.log(e.target.parentElement.previousElementSibling.dataset.clubcode + '///' + clubCode);
    
                            if (+e.target.parentElement.previousElementSibling.dataset.clubcode === +clubCode) {
                                alert('이미 가입된 동호회입니다.');
                                return;    
                            }
                            console.log('================');
                        }
                    
                    // # 서버로 보낼 데이터
                    const joinDto = {
                        empNo: empNo,
                        clubCode: e.target.parentElement.previousElementSibling.dataset.clubcode
                    };
    
                    const requestJoinInfo = {
                        method: 'POST',
                        headers: {
                            'content-type' : 'application/json'
                        },
                        body: JSON.stringify(joinDto)
                    };
    
                    fetch(clubBoardURL + '/clubJoin', requestJoinInfo)
                        .then(res => {
                            if (res.status === 200) {
                                alert('가입에 성공했습니다!');
                            }
                        })
                        .then(resReult => myJoinedClubList())
    
                });
                
                
            }

            // 컨텐츠를 클릭했을 경우만 상세보기
            else if (e.target.classList.contains('board-list-club-content')) {

                e.preventDefault();
                const cbNo = e.target.closest('.club-card').dataset.bno;

                // 모달창 띄우면서 모달창 댓글부분에 cbNo 붙여주기
                document.querySelector('.club-modal-replies-container').dataset.cbno = cbNo;

                $commonModal.classList.add('show-modal');
                $modalBackground.classList.add('show-modal');

                $modalPostText.textContent = e.target.parentElement.querySelector('.board-list-club-content')
                    .textContent;
                $modalClubName.textContent = e.target.parentElement.previousElementSibling.querySelector(
                    '.board-list-club-name').textContent;

                $modalBoardWriter.textContent = e.target.closest('.club-card').dataset.writer;
                // $modalDate.textContent = e.target.closest('.club-card').dataset.cbdate;

                $modalProfile.textContent = e.target.parentElement.previousElementSibling.querySelector(
                    '.club-profile-img').textContent;
                // $modalPostImg.textContent = 

                // $modalPostImg.children.src = e.target.previousElementSibling.querySelector('img').src;
                modalPostImg.setAttribute('src', e.target.previousElementSibling.querySelector('img').src);

                // 수정 삭제 버튼 지우기 함수
                removeModDelBtn();

                // 게시글 상세보기 클릭시 (가입하기 버튼)태그 생성
                // let detailJoinTag = '<button id="join-club-btn">가입하기</button>';
                // document.querySelector('.detail-join-btn').innerHTML = detailJoinTag;
                        

                // 게시글 상세보기 시 댓글 목록 비동기 처리
                clubReplyList(cbNo);
            }
        };


        function clubReplyList(cbNo) {
        let replyTag = '';

        fetch(clubBoardURL + '/boardReply/' + cbNo)
            .then(res => res.json())
            .then(clubReplyListResResult => {
                if (clubReplyListResResult.length === 0) {
                    replyTag += "<div class='noreply'>댓글이 없습니다.</div>"
                } else {
                    for (let rep of clubReplyListResResult) {
                        const {clubRepNo, clubRepContent, clubRepDate, cbNo, empNo, empName} = rep;

                   replyTag += "<div class='club-modal-reply-list-one' data-clubRepNo='" + clubRepNo + "' data-cbNo='" + cbNo + "'"
                                + "data-empNo='" + empNo + "'>"
                                + "<div class='reply-info'> "
                                    + "<span class='reply-writer'>" + empName + "</span>"
                                    + "<span class='reply-time'>" + clubRepDate + "</span>"
                                + "</div>"
                                + "<div class='reply-content'>"
                                    + clubRepContent
                                + "</div>"
                            + "</div>";

                        }
                }

                document.querySelector('.club-reply-generate').innerHTML = replyTag;
            });

        }

        // 모달창 닫기
        $modalBackground.onclick = e => {
            if (e.target.classList.contains('common-club-modal')) return;
            $commonModal.classList.remove('show-modal');
            if (!$modalNewBoard.classList.contains('show-modal')) {
                $modalBackground.classList.remove('show-modal');
            }
        }

        const $modalCancelBtn = document.querySelector('#add-cancel-btn');

        $modalCancelBtn.onclick = e => {
            $modalNewBoard.classList.remove('show-modal');
            $modalBackground.classList.remove('show-modal');

        }

        // 새 글 작성 모달
        const $modalNewBoard = document.querySelector('.club-write-content-wrapper');

        // 동호회 탈퇴하기
        const $clubLeaveBtn = document.querySelector('.club-leave-btn');
        
        // 새 게시글 작성 모달창 띄우기
        const $newClubBoard = document.querySelector('.club-board-write-btn');

        $threeOption.onclick = e => {

            if (e.target.matches('.club-leave-btn')) {
                console.log(e.target.parentElement.dataset.clubcode);
                // # 서버로 보낼 데이터
                    const LeaveDto = {
                        empNo: empNo,
                        clubCode: e.target.parentElement.dataset.clubcode
                    };

                    const requestLeaveInfo = {
                        method: 'DELETE',
                        headers: {
                            'content-type' : 'application/json'
                        },
                        body: JSON.stringify(LeaveDto)
                    };

                if (!confirm('정말로 탈퇴하시겠습니까?')) return;
           
                // 서버에 삭제 비동기 요청
                fetch(clubBoardURL + '/leaveClub', requestLeaveInfo)
                    .then(res => {
                        if (res.status === 200) {
                            alert('동호회를 탈퇴했습니다.');
                            return res.json();
                        } else {
                            alert('동호회 탈퇴 실패');
                        }
                    })
                    .then(resResult => myJoinedClubList());
            }
            // 내가 작성한 게시글 클릭시 해당 게시글 정보 불러오기 + 모달창 띄우기
            else if(e.target.matches('.club-board-title')) {
                $commonModal.classList.add('show-modal');
                $modalBackground.classList.add('show-modal');

                const selectedCbNo = +e.target.dataset.cbno;

                fetch(clubBoardURL + '/detailClubBoard/' + selectedCbNo)
                .then(res => res.json())
                .then(resResult => {
                    const {cbNo, cbTitle, cbContent, cbDate, cbURL, empNo, clubCode, clubName, empName} = resResult;
                    console.log(resResult);
                    $modalPostText.textContent = cbContent;
                    $modalClubName.textContent = clubName;

                    $modalBoardWriter.textContent = empName;
                    // $modalDate.textContent = cbDate;

                    // $modalProfile.textContent = e.target.parentElement.previousElementSibling.querySelector('.club-profile-img').textContent;
                    modalPostImg.src = "/hrms"+cbURL;
                    // 가입하기 버튼 삭제 함수
                    removeJoinBtn();

                    const $modiDelBtnTag = '<button id="update-club-btn">수정</button>'
                                            + '<button id="delete-club-btn">삭제</button>';

                    document.querySelector('.my-board-mod-del-btn').innerHTML = $modiDelBtnTag;  

                    clubReplyList(selectedCbNo);
                });
                
            } 

            // 새 게시글 작성하기 ==============================================
            else if(e.target.matches('.club-board-write-btn')) {
                $modalNewBoard.classList.add('show-modal');
                $modalBackground.classList.add('show-modal');

                document.querySelector('.newClubBoard-clubName').textContent = e.target.previousElementSibling.textContent;
                document.querySelector('#input-clubCode').value = e.target.parentElement.dataset.clubcode;
                
            }

            // 댓글 삭제
            else if(e.target.matches('.crep-del-btn')) {
                $clubRepNo = e.target.parentElement.dataset.clubrepno;
                $delCbNo = e.target.parentElement.dataset.cbno;

                if (!confirm('정말 삭제합니까?')) return;

                // console.log(rno);

                // 서버에 삭제 비동기 요청
                    fetch(clubBoardURL + '/' + $clubRepNo, {
                        method: 'DELETE'
                    }).then(res => {
                        if (res.status === 200) {
                            alert('댓글이 정상 삭제됨!');
                            myReplyList();
                            return res.json();
                        } else {
                            alert('댓글 삭제 실패!');
                        }
                    });

            }
            
        }

        // 댓글 등록하기 
        const $addReply = document.querySelector('#add-reply');

        $addReply.onclick = e => {
            const $clubReplyCbNo = document.querySelector('.club-modal-replies-container').dataset.cbno;
            const $clubReplyWriter = document.querySelector('.club-reply-writer').value;
            let $clubReplyContent = document.querySelector('.write-reply');

            // 클라이언트 입력값 검증
            if ($clubReplyContent.value === '') {
                    alert('댓글 내용을 입력해주세요!');
                    return;
                }

            const replyBox = {
                cbNo: $clubReplyCbNo,
                empNo: $clubReplyWriter,
                clubRepContent: $clubReplyContent.value
            }

            const requestReplyInfo = {
                    method: 'POST',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify(replyBox)
                };
            
            fetch(clubBoardURL + "/clubReplySave", requestReplyInfo)
                .then(res => {
                        if (res.status === 200) {
                            alert('댓글을 등록했습니다!');
                            $clubReplyContent.value = "";
                            clubReplyList($clubReplyCbNo);
                        } else {
                            alert('댓글 등록에 실패함!');
                        }
                    });
        }
        
        


        // 혜영누나 새 게시글 추가 스크립트 ================================================================================================================
        
         // 사진 추가 영역 클릭 시에 수행할 코드
    const $contentImage = document.querySelector('.club-content-image');
    const $inputFile = document.getElementById('content-img');

    $contentImage.onclick = e => {
        $inputFile.click();
    };
    $inputFile.onchange = e => {
        // 첨부한 파일의 데이터를 읽어오기
        const fileData = $inputFile.files[0];
        console.log(fileData);

        // 첨부파일의 바이트데이터를 읽어들이는 객체 생성
        const reader = new FileReader();

        // 파일의 바이트데이터를 읽어서 img태그의 src 속성이나
        // a 태그의 href 속성에 넣기 위한 형태로 읽음
        reader.readAsDataURL(fileData);

        // 첨부파일이 등록되는 순간 img 태그의 이미지를 세팅
        reader.onloadend = e => {
            const $imgTag = document.querySelector('.content-image-box img');
            $imgTag.setAttribute('src', reader.result);
        };

    };
      
        // 혜영누나 새 게시글 추가 스크립트 ================================================================================================================



        // ====================================================================

        //========= 메인 실행부 =========//
        (function () {

            console.log("empNo : " + empNo);
            // 내 게시글 목록 비동기 조회
            myBoardList();

        })();
    </script>



    </body>
<%@ include file="../main/include/footer.jsp" %>

</html>