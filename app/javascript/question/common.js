document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById('action-button')
  button.addEventListener('change', ()=> {previewImage()})

  function previewImage() {
    const target = this.event.target;
    const file = target.files[0];
    const reader  = new FileReader();
    reader.onloadend = function () {
        const preview = document.getElementById('preview')
        if(preview) {
            preview.src = reader.result;
        }
    }
    if (file) {
        reader.readAsDataURL(file);
    }
  };
})
