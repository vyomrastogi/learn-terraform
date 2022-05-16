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
  filename = var.dogsFile[count.index]
  content = data.local_file.inputData.content
  #count creates multiple instances of specified resource 
  #length function returns size of list
  count = length(var.dogsFile) 
}

output "dog_files" {
  value = local_file.dogs
  sensitive = true
}

output "doggos_files" {
  value = local_file.doggos
  sensitive = true
}

resource "local_file" "doggos" {
  #file name 'for' each entry in set/map 
  filename = each.value
  content = data.local_file.inputData.content
  #for_each works only with map type and set type
  for_each = toset(var.doggosFile)
}


//TODO : 
// Understand why this error comes up 
# │ Error: Output refers to sensitive values
# │
# │   on local.tf line 38:
# │   38: output "dog_files" {
# │
# │ To reduce the risk of accidentally exporting sensitive data that was     
# │ intended to be only internal, Terraform requires that any root module    
# │ output containing sensitive data be explicitly marked as sensitive, to   
# │ confirm your intent.
# │
# │ If you do intend to export this data, annotate the output value as       
# │ sensitive by adding the following argument:
# │     sensitive = true