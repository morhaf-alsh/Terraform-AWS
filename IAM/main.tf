provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "morhaf" {
  name = "morhafsh"
}

resource "aws_iam_policy" "glesier" {
    name = "morhafpolicy"
    policy =  <<EOT
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"glacier:InitiateJob",
				"glacier:AbortMultipartUpload",
				"glacier:CreateVault",
				"glacier:ListTagsForVault",
				"glacier:DeleteVault",
				"glacier:DeleteArchive",
				"glacier:ListParts",
				"glacier:DeleteVaultNotifications",
				"glacier:ListJobs",
				"glacier:ListMultipartUploads",
				"glacier:SetVaultNotifications",
				"glacier:CompleteMultipartUpload",
				"glacier:InitiateMultipartUpload",
				"glacier:UploadMultipartPart",
				"glacier:PurchaseProvisionedCapacity",
				"glacier:UploadArchive",
				"glacier:ListVaults",
				"glacier:ListProvisionedCapacity"
			],
			"Resource": "*"
		}
	]
}
EOT
}
resource "aws_iam_policy_attachment" "policybind" {
  name = "attachment"
  users = [aws_iam_user.morhaf.name]
  policy_arn = aws_iam_policy.glesier.arn
}