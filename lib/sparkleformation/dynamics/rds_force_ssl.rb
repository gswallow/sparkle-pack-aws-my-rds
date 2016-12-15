SparkleFormation.dynamic(:rds_force_ssl) do |_name, _config={}|

  parameters("#{_name}_engine_family".to_sym) do
    type 'String'
    allowed_pattern "[\\x20-\\x7E]*"
    allowed_values registry!(:parameter_group_families, _config.fetch(:engine, nil))
  end

  dynamic!(:r_d_s_d_b_parameter_group, _name).properties do
    description 'Force SSL Connection'
    family ref!("#{_name}_engine_family".to_sym)
    parameters do
      set!('rds.force_ssl'.disable_camel!, '1')
    end
  end
end
