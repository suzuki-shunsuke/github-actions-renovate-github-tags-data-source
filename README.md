# github-actions-aws-rds-available-engine-versions

GitHub Actions to list AWS RDS available engine versions

This action is used to updated RDS engine version with Renovate.
Please see https://github.com/suzuki-shunsuke/poc-renovate-aws-rds

## Requirements

* [int128/ghcp](https://github.com/int128/ghcp)
  * update the version file
* [AWS CLI](https://aws.amazon.com/cli/)
  * [aws rds describe-db-engine-versions](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/rds/describe-db-engine-versions.html) is run to list available RDS engine versions
* [Git](https://git-scm.com/)
  * pull and push Git tags
* [jq](https://github.com/stedolan/jq)

## Required AWS Access Key's permission

Only `rds:DescribeDBEngineVersions` is required, so the risk is very low.

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "rds:DescribeDBEngineVersions",
            "Resource": "*"
        }
    ]
}
```

## LICENSE

[MIT](LICENSE)
