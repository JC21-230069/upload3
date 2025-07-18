<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>画像リスト２</title>
<link href="./jsp/css/style.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script>
	function submitCheck() {
		return window.confirm("削除してよろしいですか？");
	}
</script>
</head>
<body>
	<header>
		<h1>画像リスト２</h1>
	</header>
	<main>
		<form method="post" action="delete" onsubmit="return submitCheck()">
			<div class="buttonArea">
				<button type="submit">🗑 削除</button>
				<a href="./html/uploadform.html"><button type="button">➕ 新規登録</button></a>
			</div>
			<div class="image-grid">
				<%
				String path = (String) request.getAttribute("PATH");
				List<String> files = (List<String>) request.getAttribute("FILES");
				if (path != null && files != null) {
					for (String file : files) {
						String pathName = path + file;
				%>
				<div class="image-box">
					<br> <img src="<%=pathName%>" alt="画像ファイル"> 
					<input type="checkbox" name="check" value="<%=file%>"> 
					<span class="delete-label">削除</span>
					<div class="filename"><%=file%></div>
				</div>
				<%
				}
				} else {
				out.println("画像情報が取得できません。");
				}
				%>
			</div>
		</form>
	</main>
</body>
</html>