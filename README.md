# Azure Emergency Access

## Overview

This repository contains Terraform scripts to establish a robust emergency access strategy within Azure environments. The primary goal is to create secure, auditable, and
minimal access accounts that can be utilized in the rare event that primary access mechanisms fail or are compromised.

The infrastructure as code (IaC) approach, leveraging Terraform, ensures a consistent and reproducible setup that can be easily integrated into disaster recovery plans.
This strategy aligns with best cloud security and governance practices, providing a safety net for Azure subscriptions without compromising security principles.

## Getting Started

### Prerequisites

- An Azure subscription where you have administrative privileges.
- Full Control over Azure AD
- Terraform is installed on your local machine or in a CI/CD environment.
- Basic understanding of Terraform syntax and Azure services.

### Setup Instructions

1. Clone the Repository:

   ```shell
   git clone https://github.com/wernerstrydom-examples/terraform-azure-emergency-access.git
   ```

2. Navigate to the Repository Directory

   ```shell
   cd terraform-azure-emergency-access
   ```

3. Login to Azure

   ```shell
   az login
   ```

4. Initialize Terraform

   ```shell
   terraform init
   ```

5. Review the Plan

   ```shell
   terraform plan
   ```

6. Apply changes

   ```shell
   terraform apply
   ```

### Configuration Options

You can set the following variables:

| Variable Name | Description                                | Default Value                                           |
|---------------|--------------------------------------------|---------------------------------------------------------|
| `name`        | The name of the group to create            | `Emergency Access`                                      |
| `description` | The description of the group               | `The breaking-the-glass group used when all else fails` |
| `members`     | The object ids of the members of the group | `[]`                                                    |

## Security Considerations

The members of the group being created will have complete control over Azure, and as such, additional measures should be taken 
to secure who can modify this group, along with getting notifications whenever in this group performs any activities.

## Contributions

Contributions to this repository are welcome. To contribute:

- Fork the repository.
- Create a new branch for your feature or fix.
- Submit a pull request with a detailed description of your changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

