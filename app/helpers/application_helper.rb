module ApplicationHelper
  include Pagy::Frontend

  def default_meta_tags
    {
      site: 'Welcome Quiz Maker',
      title: 'Welcome Quiz Maker',
      reverse: true,
      separator: '|',
      charset: 'utf-8',
      description: Settings.site.description,
      keywords: Settings.site.keywords,
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.png') },
        { href: image_url('logo.png'), rel: 'logo.png' }
      ],
      og: defalut_og,
      twitter: default_twitter_card,
    }
  end

  def separate_header
    if ((controller_name == 'quiz_tops') && (action_name == 'index')) || ((controller_name == 'take_quizzes') && (action_name == 'index'))
      render 'shared/headers/header_quiz'
    elsif (controller_name == 'messages') && action_name.in?(['new', 'show'])
      render 'shared/headers/header_result'
    else
      login_header
    end
  end

  def separate_footer
    if ((controller_name == 'quiz_tops') && (action_name == 'index')) || ((controller_name == 'take_quizzes') && (action_name == 'index'))
      render 'shared/footers/footer_quiz'
    elsif (controller_name == 'messages') && action_name.in?(['new', 'show'])
      render 'shared/footers/footer_result'
    else
      render 'shared/footers/footer'
    end
  end

  private

  def defalut_og
    {
      site_name: 'Welcome Quiz Maker',
      title: :title,
      description: :description,
      type: 'website',
      url: request.original_url,
      image: image_url('ogp.png'),
      locale: 'ja_JP',
    }
  end

  def default_twitter_card
    {
      card: 'summary_large_image',
      site: '@WelcomeQuizMake',
    }
  end

  def login_header
    if logged_in?
      render 'shared/headers/header'
    else
      render 'shared/headers/before_login_header'
    end
  end
end
