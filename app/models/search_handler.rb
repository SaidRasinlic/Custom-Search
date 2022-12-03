class SearchHandler < ApplicationRecord
  def initialize(data, ip)
    super
    @query = data[:search].gsub(/[^0-9A-Za-z ]/, '')
    @session_identifier = data[:identifier]
    @user_id = ip
  end

  def search
    @results = Article.search(@query).limit(6)
    if @results.blank?
      { error_message: ["We were not able to find any results for search '#{@query}'"], error_code: 404 }
    else
      { data: @results, errors: [] }
    end
  end

  def save_activity
    @query_form_activity = Query.find_by(identifier: @session_identifier)
    @increment_query = Query.find_by(user_id: @user_id, query: @query)
    @similar_queries = Query.search(@query).user(@user_id).where(identifier: @session_identifier)
    @increment_query.nil? ? create_new_query : increment_query

    decrement_query_counter if !part_of_session? && !@query_form_activity.nil?

    @similar_queries.each do |query|
      query.delete if included_and_shorter(query.query)
    end
  end

  private

  def included_and_shorter(query)
    @query.include?(query) && query.length < @query.length
  end

  def part_of_session?
    @query_form_activity.counter == 1 unless @query_form_activity.nil?
  end

  def new_query?
    !@query_form_activity.nil? && @query.include?(@query_form_activity.query)
  end

  def create_new_query
    @new_query = Query.create!(user_id: @user_id, identifier: @session_identifier, found: !@results.blank?, query: @query)
  end

  def increment_query
    @increment_query.update(identifier: @session_identifier, counter: @increment_query.counter + 1)
  end

  def decrement_query_counter
    @query_form_activity.update(counter: @query_form_activity.counter - 1, identifier: 0)
  end
end
