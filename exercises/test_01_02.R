ex() %>% {
  check_function(., "head") %>% check_arg("x") %>% check_equal()
  check_function(., "plot") %>% check_arg("x") %>% check_equal()

  check_function(., "lm") %>% {
    check_arg(., "formula") %>% check_equal()
    check_arg(., "data") %>% check_equal()
  }
  check_object(., "lm_mod")

  check_function(., "termplot") %>% {
    check_arg(., "model") %>% check_equal(eval = FALSE)
    check_arg(., "partial.resid") %>% check_equal()
    check_arg(., "se") %>% check_equal()
  }

  check_error(.)
}

success_msg("Good work! As you can see, the linear model does a poor job fitting this data, which clearly has a nonlinear pattern.")
