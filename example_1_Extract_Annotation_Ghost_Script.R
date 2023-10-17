library(stringr)
system2("C:\\Program Files\\gs\\gs10.02.0\\bin\\gswin64c.exe",args="-sDEVICE=pdfwrite -dDOPDFMARKS -dNOPAUSE -dPreserveAnnots=true -dBATCH -o C:\\Annotated_F.pdf C:\\Annotated.pdf")
fileConn <- file("C:\\Annotated_F.pdf")
txt <- readLines(fileConn)
bool_Txt <- stringr::str_detect(txt, "/Contents\\(")
txt_Comments <- txt[bool_Txt]
txt_Comments <- stringr::str_remove(txt_Comments, "/Contents\\(")
nb_Char <- nchar(txt_Comments)
txt_Comments <- stringr::str_sub(txt_Comments, end = nb_Char - 1)
