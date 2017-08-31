class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def contact
    @linkedin_url = 'https://il.linkedin.com/in/basel-shbita-8294b077'
    @github_url = 'https://github.com/basels'
    @facebook_url = 'https://www.facebook.com/basel92'
    @instagram_url = 'https://www.instagram.com/basel92'
    @soundcloud_url = 'https://soundcloud.com/basels'
  end
end
