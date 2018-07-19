#* @get /hello_world
hello_world <- function() {
	return("Hello World!!!")
}

#* @post /sum_two
plus_operation <- function(a, b) {
	return(list(result = as.numeric(a) + as.numeric(b)))
}

#* @get /iris/<sp>/<n:int>
function(n, sp) {
	iris %>% dplyr::filter(Species == sp) %>% 
		.[as.integer(n), ]
}


#* @get /ggplot2_density
#* @png

ggp2dens <- function(seed = rnorm(1), fill.colour = "tomato", alpha = 1) {
	library(ggplot2)
	set.seed(seed)
	p <- data.frame(x = rnorm(100)) %>% ggplot(aes(x)) + 
		geom_density(fill = fill.colour, alpha = alpha)
	print(p)
}


#* @post /predict
predict.default.rate <- function(
	Status.of.existing.checking.account
	, Duration.in.month
	, Credit.history
	, Savings.account.bonds
) {
	data <- list(
		Status.of.existing.checking.account=Status.of.existing.checking.account
		, Duration.in.month=Duration.in.month
		, Credit.history=Credit.history
		, Savings.account.bonds=Savings.account.bonds
	)
	prediction <- predict(decision.tree, data)
	return(list(default.probability=unbox(prediction[1, 2])))
}