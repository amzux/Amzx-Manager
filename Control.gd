extends Control


func _ready():
	$srvreq.request("https://raw.githubusercontent.com/amzux/Amzx-Manager/master/verion/version.txt")
	$HTTPRequest.request("https://raw.githubusercontent.com/amzux/Packages/master/list.txt")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var html = body.get_string_from_utf8()
	$list.text = html

var DI="list"

func _on_Button_pressed():
	OS.execute("terminator", ["-x", "Amzy","-di", "Amzx-Manager"],false)
#zenity --question  --text="Do you want to install from local file"


func _on_refresh_pressed():
	 _ready()
	
func _install():
	pass


func _on_Install_pressed():
	var PK = $pag.text
	OS.execute("terminator",["-x", "Amzy", "-di", PK], false)

func _on_selectfile_button_up():
	$FileDialog.popup()
	 
func _on_FileDialog_file_selected(path):
	#OS.execute("cp", ["-r", path ,"$HOME/Amzx/"])
	#OS.execute("cd", ["$HOME/Amzx/"],false)
	
	OS.execute("terminator", ["-x", "Amzy" , "-i" , path] ,false)
	#OS.execute("terminator",["-x", "tar", "-C" , "$HOME/Amzx/" , "-xvf", path], false)


func _on_cache_pressed():
	OS.execute("terminator", ["-x", "sudo", "Amzy", "-c"] ,false)
	OS.execute("terminator", ["-x", "sudo" , "rm" , "-r" ,"$HOME/Amzx/*"],false)



	

func _on_srvreq_request_completed(result, response_code, headers, body):
	var html = body.get_string_from_utf8()
	$srver.text = html
