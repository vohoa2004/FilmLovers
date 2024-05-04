CREATE PROC pr_addRatingWithReview
	@account_id int, @film_id int, @score int, @rate_at Date,
	@title nvarchar(100), @content nvarchar(1000), @is_spoiler bit, 
	@result int output
	as
	select @result = 0
	insert into Review ([title],[content],[is_spoiler],[send_at], [film_id],[account_id])
	VALUES (@title, @content,@is_spoiler,@rate_at,@film_id,@account_id)

	declare @review_id int
	select @review_id = id
	from Review
	where film_id = @film_id AND account_id = @account_id

	insert into Rating(account_id, film_id, score, rated_at, review_id)
	values (@account_id, @film_id, @score, @rate_at, @review_id)

	select @result = count(review_id)
	from Rating
	where account_id = @account_id AND film_id = @film_id

CREATE PROC pr_addReviewToRating
	@account_id int, @film_id int, @title nvarchar(100), @content nvarchar(1000), 
	@is_spoiler bit, @send_at Date,
	@result int output
	as
	insert into Review ([title],[content],[is_spoiler],[send_at], [film_id],[account_id])
	VALUES (@title, @content,@is_spoiler,@send_at,@film_id,@account_id)

	declare @review_id int
	select @review_id = id
	from Review
	where film_id = @film_id AND account_id = @account_id

	update Rating
	set review_id = @review_id
	where film_id = @film_id AND account_id = @account_id

	select @result = count(review_id)
	from Rating
	where account_id = @account_id AND film_id = @film_id