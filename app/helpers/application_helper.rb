module ApplicationHelper
  def default_meta_tags
    {
      site: :sitename,
      reverse: true,
      charset: 'utf-8',
      description: Settings.site.description,
      keywords: Settings.site.keywords,
      canonical: request.original_url,
      separator: '|',
      og: defalut_og,
      twitter: default_twitter_card,
    }
  end

  private

  def defalut_og
    {
      site_name: :site,
      title: :title,
      description: :description,
      type: 'website',
      url: request.original_url,
      image: image_url('favicon.png'),
      locale: 'ja_JP',
    }
  end

  def default_twitter_card
    {
      card: 'summary',
      site: '@WelcomeQuizMake',
    }
  end
end
