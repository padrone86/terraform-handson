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

resource "aws_ecs_task_definition" "frontend-task-definition" {
  family                   = "aoki-frontend-task"
  container_definitions    = "${data.template_file.front-container-template.rendered}"
  execution_role_arn       = "arn:aws:iam::383466607609:role/ecsTaskExecutionRole"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "2048"
}

# resource "aws_ecs_service" "frontend-service" {
#   name                               = "aoki-frontend-service"
#   cluster                            = "${aws_ecs_cluster.server-cluster.id}"
#   task_definition                    = "${aws_ecs_task_definition.frontend-task-definition.arn}"
#   launch_type                        = "FARGATE"
#   desired_count                      = 1
#   deployment_minimum_healthy_percent = 100
#   deployment_maximum_percent         = 200
#   health_check_grace_period_seconds  = 60

#   network_configuration {
#     subnets          = ["${aws_subnet.main.id}"]
#     security_groups  = ["${aws_security_group.XXXX.id}"]
#     assign_public_ip = "true"
#   }
# }
