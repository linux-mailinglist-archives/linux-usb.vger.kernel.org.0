Return-Path: <linux-usb+bounces-4112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333E811087
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 12:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3520281826
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 11:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A936528DD1;
	Wed, 13 Dec 2023 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMPgGAXs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235A128DC5;
	Wed, 13 Dec 2023 11:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C3CC433C7;
	Wed, 13 Dec 2023 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702468151;
	bh=gspTYGLvdxm7u26jTqUP9QE4qxk4YHzbc1GF9KCiV7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMPgGAXsD59orXEQwSuT3rrXWW+pwXyhY9fvZ8X6kscY5uXVHv+7pQdZ8goX2tQg2
	 YnuEt2SSM/+22Vslb33Z83s5HAblMc1uQOIaG4veD5qb26z++yizSosHRt/zeNJpDD
	 sfJk9uv4C59KHCtmYD2t+RV+82qkDt21V06xknzZ4iINstdfEXqU4zfhj4uKCi/J+G
	 EsWkDUP8byKlb9sAFOVfbuceSmcQJsTYHZu7QeY/MivUpoRnnF3fRE3KKFA+0Qu5dW
	 aVht0LKmFKpZLjEFy5xGUQtQ/UH0eUsSY0jQ18zyyKdoMrXvxkyPosGgru0Aj5veHw
	 UplXJHZ3IJyIA==
Date: Wed, 13 Dec 2023 11:49:06 +0000
From: Lee Jones <lee@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: fotg210-hcd: delete an incorrect bounds test
Message-ID: <20231213114906.GL111411@google.com>
References: <87dfa523-1882-417d-97b5-f606ff0099f9@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87dfa523-1882-417d-97b5-f606ff0099f9@moroto.mountain>

On Fri, 08 Dec 2023, Dan Carpenter wrote:

> Here "temp" is the number of characters that we have written and "size"
> is the size of the buffer.  The intent was clearly to say that if we have
> written to the end of the buffer then stop.
> 
> However, for that to work the comparison should have been done on the
> original "size" value instead of the "size -= temp" value.  Not only
> will that not trigger when we want to, but there is a small chance that
> it will trigger incorrectly before we want it to and we break from the
> loop slightly earlier than intended.
> 
> This code was recently changed from using snprintf() to scnprintf().  With
> snprintf() we likely would have continued looping and passed a negative
> size parameter to snprintf().  This would have triggered an annoying
> WARN().  Now that we have converted to scnprintf() "size" will never
> drop below 1 and there is no real need for this test.  We could change
> the condition to "if (temp <= 1) goto done;" but just deleting the test
> is cleanest.
> 
> Fixes: 1dd33a9f1b95 ("usb: fotg210: Collect pieces of dual mode controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/fotg210/fotg210-hcd.c | 3 ---
>  1 file changed, 3 deletions(-)

Super additional clean-up, thanks.

Reviewed-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
> index b2f8b53cc8ef..8c5aaf860635 100644
> --- a/drivers/usb/fotg210/fotg210-hcd.c
> +++ b/drivers/usb/fotg210/fotg210-hcd.c
> @@ -426,8 +426,6 @@ static void qh_lines(struct fotg210_hcd *fotg210, struct fotg210_qh *qh,
>  				td->urb);
>  		size -= temp;
>  		next += temp;
> -		if (temp == size)
> -			goto done;
>  	}
>  
>  	temp = scnprintf(next, size, "\n");
> @@ -435,7 +433,6 @@ static void qh_lines(struct fotg210_hcd *fotg210, struct fotg210_qh *qh,
>  	size -= temp;
>  	next += temp;
>  
> -done:
>  	*sizep = size;
>  	*nextp = next;
>  }
> -- 
> 2.42.0
> 

-- 
Lee Jones [李琼斯]

