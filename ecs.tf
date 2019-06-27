resource "aws_ecs_cluster" "server-cluster" {
  name = "aoki-cluster"
  tags = {
    Name = "aoki-handson"
  }
}

resource "aws_ecr_repository" "server-repository" {
  name = "aoki-repository"
  tags = {
      Name = "aoki-handson"
  }
}

data "template_file" "front-container-template" {
  template = "${file("${path.root}/task-definitions/nginx.json")}"
}
