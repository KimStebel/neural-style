


command to run

```
th neural_style.lua \
  -style_image /kim/images/door.jpg \
  -content_image /kim/images/nata1.jpeg \
  -output_image /kim/out.jpg \
  -print_iter 200 \
  -save_iter 0 \
  -backend nn \
  -image_size 1920 \
  -style_scale 1.0 \
  -original_colors 0 \
  -content_weight 5e0 \
  -style_weight 1e2 \
  -tv_weight 1e-3 # 0 to disable
  
  



  
```
