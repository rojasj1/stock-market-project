class NewsController < ApplicationController
    def index

require 'aylien_news_api'
AylienNewsApi.configure do |config|
  config.api_key['X-AYLIEN-NewsAPI-Application-ID'] = '8a8377dc'
  config.api_key['X-AYLIEN-NewsAPI-Application-Key'] = 'd5083d510bf9ceb9fa46c6b8466169fd'
end

@api_instance = AylienNewsApi::DefaultApi.new

## GOOGLE FILTER 
@opts = {
    :title => "googl",
    :language => ["en"],
    :categories_taxonomy => "iptc-subjectcode",
    :categories_id => ["04008026"],
    :published_at_start => "NOW-7DAYS"
}
## AMAZON FILTER 
@opts2 = {
    :title => "amzn",
    :language => ["en"],
    :categories_taxonomy => "iptc-subjectcode",
    :categories_id => ["04008026"],
    :published_at_start => "NOW-14DAYS"
}
## APPLE FILTER 
@opts3 = {
    :title => "aapl",
    :language => ["en"],
    :categories_taxonomy => "iptc-subjectcode",
    :categories_id => ["04008026"],
    :published_at_start => "NOW-14DAYS"
}

## GOOGLE  
@googlTitle = @api_instance.list_stories(@opts)
@googlBody = @api_instance.list_stories(@opts)
@googlSource = @api_instance.list_stories(@opts)

## AMAZON 
@amznTitle = @api_instance.list_stories(@opts2)
@amznBody = @api_instance.list_stories(@opts2)
@amznSource = @api_instance.list_stories(@opts2)

## APPLE 
@aaplTitle = @api_instance.list_stories(@opts3)
@aaplBody = @api_instance.list_stories(@opts3)
@aaplSource = @api_instance.list_stories(@opts3)
## GOOGLE ----------------------------------------
@googlTitle.stories.each do |story|
    @googlTitle = "#{story.title}"
end

@googlBody.stories.each do |story|
    @googlBody = "#{story.body}"
end

@googlSource.stories.each do |story|
    @googlSource = "#{story.source.name}"
end
## AMAZON --------------------------------------
@amznTitle.stories.each do |story|
    @amznTitle = "#{story.title}"
end

@amznBody.stories.each do |story|
    @amznBody = "#{story.body}"
end

@amznSource.stories.each do |story|
    @amznSource = "#{story.source.name}"
end
## APPLE ---------------------------------------
@aaplTitle.stories.each do |story|
    @aaplTitle = "#{story.title}"
end 

@aaplBody.stories.each do |story|
    @aaplBody = "#{story.body}"
end 

@aaplSource.stories.each do |story|
    @aaplSource = "#{story.source.name}"
    
end 
    end
end
