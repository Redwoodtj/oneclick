module Api
  module V1
    class PlacesController < Api::V1::ApiController

      def search
        #Get the Search String
        search_string = params[:search_string]
        include_user_pois = params[:include_user_pois]
        max_results = (params[:max_results] || 10).to_i

        locations = []
        count = 0

        if include_user_pois.to_bool
          rel = Place.arel_table[:name].matches(search_string)
          places = @traveler.places.active.where(rel)
          places.each do |place|
            locations.append(place.build_place_details_hash)
            count += 1
            if count >= max_results
              break
            end
          end
        end

        # Global POIs
        pois = Poi.get_by_query_str(search_string, max_results, true)
        pois.each do |poi|
          locations.append(poi.build_place_details_hash)
          count += 1
          if count >= max_results
            break
          end

        end

        hash = {places_search_results: {locations: locations}, record_count: locations.count}
        respond_with hash

      end

      def within_area

        gs = GeographyServices.new
        county = gs.county_from_google_place params

        #No county sent, get county from the lat,lng
        if county.blank?
          origin = params[:geometry]
          lat = origin[:location][:lat]
          lng = origin[:location][:lng]
          og = OneclickGeocoder.new
          county = og.get_county(lat,lng)
        end

        Service.active.paratransit.each do |service |
          if service.county_endpoint_contains?(county)
            render json: {result: true}
            return
          end
        end
        render json: {result: false}
      end

      def boundary
        gs =  GeographyServices.new
        if gs.global_boundary_exists?
          render json: gs.global_boundary_as_geojson
          return
        end

        render :status => 404, json: {message: 'No Global Boundary'}
      end

      def routes
        tp = TripPlanner.new
        render status: 200, json: tp.get_routes
        return
      end

      # If logged in, returns the 4 most recent places.
      def recent
        if @traveler.is_api_guest?
          render status: 200, json: []
          return
        end

        render status: 200, json: @traveler.recent_places.map { |place| place.build_place_details_hash}

      end

    end #Places Controller
  end #V1
end #API