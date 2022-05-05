variable "filename" {
  default = "../results/local_pets/pets.txt"
}
variable "prefix" {
  default = "Mr"
}
variable "separator" {
  default = "."
}
variable "length" {
  default = 1
}
variable "content" {
  default = "We love all Pets!"
}
variable "dogsFile" {
  default = [
    "../results/local_pets/pug.txt",
    "../results/local_pets/poodle.txt",
    "../results/local_pets/retriever.txt",
    "../results/local_pets/husky.txt"
  ]
}