resource "local_file" "pet" {
    filename = var.filename
    content = var.content
    file_permission = "0700"

    //first creates the resource before deleting
    lifecycle {
      create_before_destroy = true
    }
}

resource "random_pet" "my_pet" {
    prefix = var.prefix
    separator = var.separator
    length = var.length

    //resource can still be destroyed using terraform destroy command
    lifecycle {
      prevent_destroy = false
      ignore_changes = all
    }
  
}

//Create pet from a local file as datasource

data "local_file" "inputData" {
  
  filename = "input_data.txt"
}

resource "local_file" "dogs" {
  filename = var.dogsFile
  content = data.local_file.inputData.content
}