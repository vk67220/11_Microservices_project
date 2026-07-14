output "repository_names" {

  description = "ECR Repository Names"

  value = [

    for repo in aws_ecr_repository.services :

    repo.name

  ]

}

output "repository_urls" {

  description = "Repository URLs"

  value = {

    for name, repo in aws_ecr_repository.services :

    name => repo.repository_url

  }

}