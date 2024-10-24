var ingredients = [];

document.getElementById('HomePageAddBtn').addEventListener('click', function() {
	
	var ingredientInput = document.getElementById('ingredientInput');
	var ingredient = ingredientInput.value.trim(); // 공백 제거

	if (ingredient) {
		if (ingredients.includes(ingredient)) {

			// 중복된 재료일 경우 알림
			alert('이 재료는 이미 추가되었습니다.');

		} else {
			// 해시태그 요소 생성
			ingredients.push(ingredient);
			updateHiddenInput();

			var tagContainer = document.getElementById('HomePageHash-container');
			var tag = document.createElement('div');
			tag.className = 'HashTag-block';
			tag.innerHTML = '<span>#</span><span>' + ingredient + '</span><button class ="hashtagbtn" type="button" onclick="removeTag(this, \'' + ingredient + '\')">x</button>';
			tagContainer.appendChild(tag);

			// input 값 초기화
			ingredientInput.value = '';
		}
	}
});

function removeTag(button, ingredient) {
	// 태그 삭제
	var tag = button.parentElement;
	tag.remove();

	// 배열에서 재료 제거
	var index = ingredients.indexOf(ingredient);
	if (index > -1) {
		ingredients.splice(index, 1);
	}
	updateHiddenInput();
}

function updateHiddenInput() {
	// 숨겨진 필드에 배열 값을 넣어서 서버로 전송할 준비
	document.getElementById('ingredientsInput').value = ingredients.join(',');
}