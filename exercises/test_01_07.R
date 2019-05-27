test <- function() {
    # This function is defined in the testTemplate
    success("Terrific! See how the model with `sp = 0.1` is much smoother, while the one with `sp = 0.0001` fits most wiggles in the data.  Note that these both have the same number of basis functions - the smoothing parameter `sp` calibrates the overall complexity with the bounds allowed by `k`.")
}
