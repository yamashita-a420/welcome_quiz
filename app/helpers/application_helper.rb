module ApplicationHelper
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
    if controller_name == ('first_questions' || 'second_questions' || 'third_questions')
      render 'shared/headers/header_quiz'
    elsif (controller_name == 'quizzes') && (action_name == 'index')
      render 'shared/headers/header_result'
    elsif (controller_name == 'messages') && (action_name == ('new' || 'show'))
      render 'shared/headers/header_result'
    else
      login_header
    end
  end

  def separate_footer
    if (controller_name == 'quizzes') && (action_name == 'index')
      render 'shared/footers/footer_quiz'
    elsif controller_name == ('first_questions' || 'second_questions' || 'third_questions')
      render 'shared/footers/footer_quiz'
    elsif (controller_name == 'messages') && (action_name == ('new' || 'show'))
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
      image: image_url('logo.png'),
      locale: 'ja_JP',
    }
  end

  def default_twitter_card
    {
      card: 'summary',
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
