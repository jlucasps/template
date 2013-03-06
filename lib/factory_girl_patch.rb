class FactoryGirlPatch
  def association(runner)
    runner.run
  end

  def result(evaluation)
    evaluation.object.tap do |instance|
      evaluation.notify(:after_build, instance)
      evaluation.notify(:before_create, instance)
      saved_object = instance.class.where(instance.attributes.except("id", "created_at", "updated_at")).first
      if saved_object.present?
        instance.id = saved_object.id
        instance.created_at = saved_object.created_at if instance.respond_to?(:created_at)
        instance.updated_at = saved_object.updated_at if instance.respond_to?(:updated_at)
      else
        evaluation.create(instance)
        evaluation.notify(:after_create, instance)
      end
    end
  end
end