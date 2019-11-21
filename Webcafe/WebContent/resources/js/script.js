
function newGallery() {
	

	var username = document.getElementById('username').value;
	var gallery = document.getElementById('gallery').value;
	
	if (!username || !gallery) {
		alert("이미지 또는 이름이 비어 있습니다.");
		return false;
	}

}

function newPosting() {
	
	var username = document.getElementById('username').value;
	var notice = document.getElementById('notice').value;
	var text = document.getElementById('text').value;

	if (!username || !notice || !text || notice == 0) {
		alert("이름 또는 게시판 또는 내용이 비어있습니다.");
		return false;
	}
	 

}