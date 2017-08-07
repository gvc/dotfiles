function fish_mode_prompt --description 'Displays the current mode'
    switch $fish_bind_mode
        case default
            set_color --bold -o f6494d
            echo 'N'
        case insert
            set_color --bold -o bac932
            echo 'I'
        case visual
            set_color --bold f2d714
            echo 'V'
    end
    set_color normal
    echo -n ' '
end

