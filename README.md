# sparkle-pack-aws-rds
SparklePack that deals with AWS RDS instances.  Contains registries that provide:

| Registry | Purpose |
|----------|----------|
| rds_instance_types | Provides a list of database instance types |
| random_password | Provides a 12-character random password |
| engine_versions | Provides a list of database engine versions filtered by engine (e.g. postgres 9.4.9)|
| latest_engine_version | Provides the latest version of a database engine (e.g. postgres 9.6.1)||
| parameter_group_families | Provides a list of database parameter groups filtered by engine (e.g. postgres-9.4) |
| all_rds_snapshots | Provides a list of RDS snapshots, filtered by database instance identifier |
| latest_rds_snapshot | Provides the latest RDS snapshot, filtered by database instance identifier |

Also included is a dynamic, `rds_force_ssl`, that enforces SSL connections to the RDS instance.

h/t to [techshell](https://github.com/techshell) for this approach.

### Environment variables

The following environment variables must be set in order to use this Sparkle
Pack:

- AWS_REGION
- AWS_DEFAULT_REGION (being deprecated?)
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_CUSTOMER_ID

## Usage

Add the pack to your Gemfile and .sfn:

Gemfile:
```ruby
source 'https://rubygems.org'
gem 'sfn'
gem 'sparkle-pack-aws-my-rds'
```

.sfn:
```ruby
Configuration.new do
  sparkle_pack [ 'sparkle-pack-aws-my-rds' ] ...
end
```

### RDS Snapshots

```ruby
parameters(:snapshot_to_restore) do
  type 'String'
  allowed_values registry!(:all_rds_snapshots, 'my-db-instance')
  default registry!(:latest_rds_snapshot, 'my-db-instance')
end
```

The `all_rds_snapshots` will return all snapshot identifiers available for the
'my-db-instance' RDS instance, while the latest RDS snapshot will be specified as
the default snapshot to restore.

### RDS Instance Types

```ruby
parameters(:db_instance_type) do
  type 'String'
  allowed_values registry!(:rds_instance_types)
  default 'db.t2.micro'
end
```

### RDS Engine Versions (and parameter group families)

```ruby
parameters(:db_engine_version) do
  type 'String'
  allowed_values registry!(:engine_versions, 'postgres')
  default registry!(:latest_engine_version, 'postgres')
end

parameters(:engine_family) do
  type 'String'
  allowed_values registry!(:parameter_group_families, 'postgres')
end
```

Unfortunately, there's a loose coupling between database engine versions and
parameter group families that has to be resolved at stack creation time.

### Random passwords

```ruby
dynamic!(:r_d_s_d_b_instance, 'example').properties do
  master_user_password registry!(:random_password)
end
```
