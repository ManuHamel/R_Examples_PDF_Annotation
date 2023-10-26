library(reticulate)

conda_Env <- conda_list()

if(any(conda_Env[, 1] == "PyMuPDF") == FALSE)
{
  reticulate::conda_create(envname = "PyMuPDF", python_version = "3.7.16")
  reticulate::conda_install(envname = "PyMuPDF", packages = "PyMuPDF", pip = TRUE)
}

reticulate::use_condaenv(condaenv = "PyMuPDF")
path_To_PDF <- "C:/File.pdf"
fitz <- import("fitz")
doc <- fitz$open(path_To_PDF)
nb_Page <- doc$page_count

for(i in 1 : nb_Page)
{
  page <- doc[i - 1]
  list_Hit <- page$search_for("cats")
  nb_Hit <- length(list_Hit)
  
  if(nb_Hit > 1)
  {
    for(l in 1 : nb_Hit)
    {
      annot <- page$add_highlight_annot(list_Hit[[l]])
      annot$set_colors(stroke = fitz$utils$getColor('black'))
      annot$update() 
      doc$save("C:/Highlighted_File.pdf")
    }
  }
}
