css_filename = "funky-border-utilities.css"
html_filename = "funky-border-utilities.html"
sizes = %W(sm md lg xl)

vars = %(
:root {
  --h-xl-size: 155px;
  --v-xl-size: 155px;
  --h-lg-size: 100px;
  --v-lg-size: 100px;
  --h-md-size: 55px;
  --v-md-size: 55px;
  --h-sm-size: 35px;
  --v-sm-size: 35px;
}
)

corner_selectors = {
  tl: "border-top-left-radius",
  tr: "border-top-right-radius",
  bl: "border-bottom-left-radius",
  br: "border-bottom-right-radius"
}

def declaration(corner:, h_size:, v_size:, selector:)
  %(
.rounded-#{corner}-#{h_size}-#{v_size} {
  #{selector}: var(--h-#{h_size}-size) var(--v-#{v_size}-size);
}
  )
end

if File.exist?(css_filename)
  File.delete(css_filename)
end

File.open(css_filename, "w") do |file|
  file.write(vars)

  sizes.each do |h_size|
    sizes.each do |v_size|
      corner_selectors.each do |corner, selector|
        file.write(declaration(
          corner: corner,
          h_size: h_size,
          v_size: v_size,
          selector: selector
        ))
      end
    end
  end
end

if File.exist?(html_filename)
  File.delete(html_filename)
end

File.open(html_filename, "w") do |file|
  corner_selectors.each do |corner, selector|
    sizes.each do |h_size|
      sizes.each do |v_size|
        file.write(
%(<div class="h-16 w-64 p-4 mb-2 text-center border-5 border-blue rounded-#{corner}-#{h_size}-#{v_size}">
  .rounded-#{corner}-#{h_size}-#{v_size}
</div>
)
        )
      end
    end
  end
end
