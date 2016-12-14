# https://github.com/aws/aws-sdk-ruby/blob/master/aws-sdk-core/apis/rds/2014-10-31/docs-2.json

SfnRegistry.register(:rds_instance_types) do
  [
    "db.t2.micro",
    "db.t2.small",
    "db.t2.medium",
    "db.t2.large",
    "db.m3.medium",
    "db.m3.large",
    "db.m3.xlarge",
    "db.m3.2xlarge",
    "db.m4.large",
    "db.m4.xlarge",
    "db.m4.2xlarge",
    "db.m4.4xlarge",
    "db.m4.10xlarge",
    "db.r3.large",
    "db.r3.xlarge",
    "db.r3.2xlarge",
    "db.r3.4xlarge",
    "db.r3.8xlarge"
  ].sort
end
