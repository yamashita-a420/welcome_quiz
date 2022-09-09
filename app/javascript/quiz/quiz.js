$(() => {
  $('.quiz__next--button').click((e) => {
    let target    = $(e.currentTarget).data('target');
    let checkName = $(e.currentTarget).data('check');
    if(canNext(checkName)) {
      let id = '#' + target;
      $('.quiz__panel').removeClass('active');
      $(id).addClass('active');
    };
  });

  $('.quiz__prev--link').click((e) => {
    let target = $(e.currentTarget).data('target');
    let id = '#' + target;
    $('.quiz__panel').removeClass('active');
    $(id).addClass('active');
  });
});


/**
 * 回答が選択されているかクイズごとにチェック
 * @param {String}
 * @return {Boolean}
 */
function canNext(name)
{
  let checked = $(`input[name="${name}"]:checked`);
  if (0 < checked.length) {
    return true;
  } else {
    alert('回答を選択してください。');
    return false;
  }
}
