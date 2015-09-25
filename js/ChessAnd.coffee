---
---

# Ben Scott # 2015-09-21 # coffee & chess #

# const
col = ['a','b','c','d','e','f','g']

inc = 9812 # king++ == queen, etc

init_board = [
	[0xC,0xD,0xC,0xA,0xB,0xC,0xD,0xC],
	[0xF,0xF,0xF,0xF,0xF,0xF,0xF,0xF],
	[0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0],
	[0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0],
	[0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0],
	[0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0],
	[0x9,0x9,0x9,0x9,0x9,0x9,0x9,0x9],
	[0x6,0x7,0x8,0x4,0x5,0x8,0x7,0x6]]

pieces = [
	# white    # black
	"&#9634;", "&#9638;", # square
	"&#9812;", "&#9818;", # king
	"&#9813;", "&#9818;", # queen
	"&#9814;", "&#9820;", # rook
	"&#9815;", "&#9821;", # bishop
	"&#9816;", "&#9822;", # knight
	"&#9817;", "&#9823;"] # pawn

move =
	n: 0x9 # white pawn default
	captured: false
	html: (n) -> "&#"+(9808+n)+";"
	unicode: (n) -> "U+"+(2650+n)
	print: (n) ->
		if (n==9635)
			return pieces[1]
		else if (n==9634)
			return pieces[0]
		return move.html(n)

validSquare = (sq) -> sq.search(/^[a-h][1-8]$/)

# moves e.g, "e2-e4", "f6-d5"
validMove = (move) ->
	temp = move.split('-')
	return (temp.length==2 && validSquare(temp))

# /[!kqrbnpKQRNBP1-8]/

overlayBoard = (board) ->
	base = [
		[pieces[0],pieces[1],pieces[0],pieces[1],
			pieces[0],pieces[1],pieces[0],pieces[1]],
		[pieces[1],pieces[0],pieces[1],pieces[0],
			pieces[1],pieces[0],pieces[1],pieces[0]],
		[pieces[0],pieces[1],pieces[0],pieces[1],
			pieces[0],pieces[1],pieces[0],pieces[1]],
		[pieces[1],pieces[0],pieces[1],pieces[0],
			pieces[1],pieces[0],pieces[1],pieces[0]],
		[pieces[0],pieces[1],pieces[0],pieces[1],
			pieces[0],pieces[1],pieces[0],pieces[1]],
		[pieces[1],pieces[0],pieces[1],pieces[0],
			pieces[1],pieces[0],pieces[1],pieces[0]],
		[pieces[0],pieces[1],pieces[0],pieces[1],
			pieces[0],pieces[1],pieces[0],pieces[1]],
		[pieces[1],pieces[0],pieces[1],pieces[0],
			pieces[1],pieces[0],pieces[1],pieces[0]]]
	base_i = 0
	for i in board
		base_j = 0
		for j in i
			if (j!=0x0)
				base[base_i][base_j] = " "+move.html(j)
			base_j++
		base_i++
	return base

printBoardTable = (board) ->
	document.write("<br><table style=\"width: 30%\">")
	for i in overlayBoard(board)
		document.write("<tr>")
		for j in i
			document.write("<td> "+j+"</td>")
		document.write("</tr>")
	document.write("</table><br>")

printBoard = (board) ->
	for i in overlayBoard(board)
		document.write("<br>")
		for j in i
			document.write(j)

printBoardTable(init_board)

