class EligibilityHelpers

  def get_eligible_services(user_profile)

    all_services = Service.all
    fully_eligible_services = []
    all_services.each do |service|
      is_eligible = true
      service_characteristic_maps = service.service_traveler_characteristics_maps
      service_characteristic_maps.each do |service_characteristic_map|
        service_requirement = service_characteristic_map.traveler_characteristic
        passenger_characteristic = UserTravelerCharacteristicsMap.where(user_profile_id: user_profile.id, characteristic_id: service_requirement.id)

        if passenger_characteristic.count == 0 #This passenger characteristic is not listed #TODO: Currently we reject ont his but perhaps we should ask for more info
          is_eligible = false
          break
        end
        if !test_condition(passenger_characteristic.first.value, service_characteristic_map.value_relationship_id , service_characteristic_map.value)
          is_eligible = false
          break
        end
      end
      if is_eligible
        fully_eligible_services << service
      end
    end

    fully_eligible_services

  end

  def get_accommodating_services(user_profile)

    #user accommodations
    accommodations_maps = user_profile.user_traveler_accommodations_maps.where('value = ? ', 'true')
    user_accommodations = []
    accommodations_maps.each do |map|
      user_accommodations << map.traveler_accommodation
    end

    #service accommodations
    accommodating_services = []
    all_services = Service.all
    all_services.each do |service|
      accommodations_maps = service.service_traveler_accommodations_maps
      service_accommodations  = []
      accommodations_maps.each do |map|
        service_accommodations << map.traveler_accommodation
      end

      if user_accommodations.count == (service_accommodations & user_accommodations).count
        accommodating_services << service
      end

    end

    accommodating_services

  end

  def get_accommodating_and_eligible_services(user_profile)
    eligible = get_eligible_services(user_profile)
    accommodating = get_accommodating_services(user_profile)
    eligible & accommodating
  end

  def get_services_for_trip(trip, services)
    eligible_by_location = get_location_eligibility(trip, services)
    eligible_by_service_time = get_service_time_eligibility(trip, services)
    eligible_by_advanced_notice = get_advanced_notice_eligibility(trip, services)

    eligible_by_location & eligible_by_service_time & eligible_by_advanced_notice

  end

  def eligible_by_location(trip, services)
    services
  end

  def eligible_by_service_time(trip, services)
    services
  end

  def eligible_by_advanced_notice(trip, services)
    services
  end

  def test_condition(value1, operator, value2)

    case operator
      when 1 # general equals
        return value1 == value2
      when 2 # float equals
        return value1.to_f == value2.to_f
      when 3 # greater than
        return value1.to_f > value2.to_f
      when 4 # greather than or equal
        return value1.to_f >= value2.to_f
      when 5 # less than
        return value1.to_f < value2.to_f
      when 6 # less than or equal
        return value1.to_f <= value2.to_f
      else
        return false
    end
  end

end