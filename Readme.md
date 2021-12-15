
# AWS IAM Role Terraform Module

## Overview

This module is designed to create _AWS IAM Role(s)_ in a simple and repeatable way.  

- _IAM Role_
- _IAM Policy_
- _IAM Instance Profile_

---

## Usage

A standard use of the module from a _Terraform_ working directory.

```
data "aws_iam_policy_document" "my_role_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]x
    resources = ["*"]
  }
}

data "aws_iam_policy" "AmazonEC2ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

module "iam-role" {
  source = "../terraform_aws_iam-role"
  
  role_name                 = "my_role_name"
  assume_role_policy        = "my_role_policy_name"
  iam_role_policy_name      = "my_role_policy_name"
  iam_role_policy           = data.aws_iam_policy_document.my_role_policy.json
  iam_instance_profile_name = "my_instance_profile_name"
  policy_list               = ["${data.aws_iam_policy.AmazonEC2ReadOnlyAccess.arn}"]

  tags  =  {
    "Environment" = dev,
  }
}

```

---

## Requirements

This module requires the following versions to be configured in the workspace `terraform {}` block.

### Terraform

| **Version** |
| :---------- |
| `>= 1.0.7` |

### Providers

| **Name**                                                            | **Version** |
| :------------------------------------------------------------------ | :---------- |
| [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest) | `>= 3.66.0`  |

---

## Variables

| **Variable**      | **Description**                                                     | **Type**       | **Default** |
| :---------------- | :------------------------------------------------------------------ | :------------- | :---------- |
| `role_name`            | IAM Role name                                           | `string`       | `nil`       |
| `assume_role_policy`     | Assume Role policy                                    | `string`       | `""`        |
| `create_iam_role_policy`    | Whether to create IAM role policy                                    | `boolean`         | `true`      |
| `iam_role_policy_name`          | IAM role policy name                                | `string`       | `""`       |
| `iam_role_policy`       | IAM role policy             | `string` | `""`       |
| `create_instance_profile`       | Whether to create IAM instance profile | `boolean`       | `true`       |
| `iam_instance_profile_name` | Name of the IAM instance profile to be created      | `string`       | `""`       |
| `policy_list`            | List of IAM policies to be attached to the IAM role                                              | `list`  | `[]`        |
| `tags`            | Tags to apply to role.                                              | `map(string)`  | `{ Terraform = "true" }`        |


---

## Outputs

| **Variable** | **Description**                                     | **Type** |
| :----------- | :-------------------------------------------------- | :------- |
| `iam_role_arn`         | The ARN of the IAM role                               | `string` |
| `iam_role_name`       | The name of the IAM role                               | `string` |