Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE781132491
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 12:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgAGLNZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 06:13:25 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35446 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgAGLNZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 06:13:25 -0500
Received: by mail-lj1-f195.google.com with SMTP id j1so46890256lja.2
        for <linux-usb@vger.kernel.org>; Tue, 07 Jan 2020 03:13:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FxQaIttWNUxFXZymPRq1sSS3XWp3fui8Af2ZnQ/t0u4=;
        b=gEbRRBHDj4UoWmYYpxvaIX23P5OELCjgNOeUFTaPjRCj10SCyLU0Rm8VTHsKL/Vh/M
         3yl0E57GC7EcYVDD4c0c2NEaOFrllLotROeXGMwOzKdlfCFTD4q+q/f1iXq1Hx4jYB/L
         dRJKB3fBN57VUPj3nPEQXvrvFaCLrg4Sk78TPknOgjnTPv32MrxbqDeF1h7iOooFn5Dm
         /RGU7EfzgbYGQG+TbMWWYpDEO9UD6eQzMXuhLhWanyE00lLlQFq+xx78cJ3I4Pl0GyXi
         KeGNqldHTPx24ONzgofSt+BeprCRyY6k/emXjw0JaQT1iBzUG45OHBBhEirpVRChbnMW
         Qc7A==
X-Gm-Message-State: APjAAAUbhWmsI99/+D9egwG7Jjm7dSl/za48qxUzZL8WCf8YrajSJhvY
        bUWx8ov1XNKQhDFls/OLj9KMgCN8
X-Google-Smtp-Source: APXvYqyEO95W0NS6xbCfHIIR/lhu2jVCl9C94Yvjtct2FSAc8COC+x+1qYPNu2iNL/hI+AMjSjJKJQ==
X-Received: by 2002:a2e:b60d:: with SMTP id r13mr62713824ljn.40.1578395603571;
        Tue, 07 Jan 2020 03:13:23 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id z22sm23057255ljm.24.2020.01.07.03.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 03:13:22 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iomni-0005Uq-U0; Tue, 07 Jan 2020 12:13:30 +0100
Date:   Tue, 7 Jan 2020 12:13:30 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] USB: serial: pl2303: PL2303HXN can support baud rate are
 set directly
Message-ID: <20200107111330.GE30908@localhost>
References: <20191225133005.1617-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191225133005.1617-1-charlesyeh522@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 25, 2019 at 09:30:05PM +0800, Charles Yeh wrote:
> PL2303HXN (TYPE_HXN) can program form 1 bps to 12000000 bps and
> support standard & non-standard baud rates (Note 1) are set directly
> It doesn't need complicated baud rate division calculation.

What's the benefit of this over using divisors directly?

If there's something wrong with that algorithm I think we should fix
that instead so that all device types benefit.

> Note 1:
> Standard baud rate:
> 75, 150, 300, 600, 1200, 1800, 2400, 3600, 4800, 7200, 9600,14400,
> 19200, 28800, 38400, 57600, 115200, 230400, 460800,614400, 921600,
> 1228800, 2457600, 3000000, 6000000
> 
> Non-standard baud rate (1 ~ 12000000):
> 1, 2, 5, 22, 55, 60, 75, 80, 123, 130, 150, 180, 187, 200, 300, 340,
> 400,..... 115200, 230400, 460800, 474747, 515151, 614400, 921600,
> .. 1000000,.. 7000000,.. 12000000

Which rate does HXN pick if it's not in either of these lists (e.g.
next lower/higher, etc)?

> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
> ---
>  drivers/usb/serial/pl2303.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index aab737e1e7b6..63d354a92db9 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -565,17 +565,21 @@ static void pl2303_encode_baud_rate(struct tty_struct *tty,
>  	if (!baud)
>  		return;
>  
> -	if (spriv->type->max_baud_rate)
> -		baud = min_t(speed_t, baud, spriv->type->max_baud_rate);

You still need this for HXN I guess.

> -	/*
> -	 * Use direct method for supported baud rates, otherwise use divisors.
> -	 */
> -	baud_sup = pl2303_get_supported_baud_rate(baud);
> -
> -	if (baud == baud_sup)
> +	if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
>  		baud = pl2303_encode_baud_rate_direct(buf, baud);
> -	else
> -		baud = pl2303_encode_baud_rate_divisor(buf, baud);
> +	} else {
> +		if (spriv->type->max_baud_rate)
> +			baud = min_t(speed_t, baud, spriv->type->max_baud_rate);
> +		/*
> +		 * Use direct method for supported baud rates, otherwise use divisors.
> +		 */
> +		baud_sup = pl2303_get_supported_baud_rate(baud);
> +
> +		if (baud == baud_sup)
> +			baud = pl2303_encode_baud_rate_direct(buf, baud);
> +		else
> +			baud = pl2303_encode_baud_rate_divisor(buf, baud);
> +	}

You need to find a better way to abstract this. We can't just add
conditionals like this throughout the code without reorganising it or it
will become very hard to read and maintain.

>  
>  	/* Save resulting baud rate */
>  	tty_encode_baud_rate(tty, baud, baud);

Johan
