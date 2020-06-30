Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DA920F202
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 11:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732115AbgF3J6D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 05:58:03 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46099 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgF3J6C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 05:58:02 -0400
Received: by mail-lf1-f67.google.com with SMTP id m26so10972345lfo.13
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YA0saKtGHbgxLuug6kEUv+C0K2YEK+AC3niJ97B41X4=;
        b=m5MIKnyxHcg5e2rvnIrYE1bql+lHEoaYqJAwJt0W5t+hwexyM6vlVIqbnPdsemPKuc
         3oGfwS7gEFlaSAM7MWoYVj3C8S4exmIrFR/+A84CSrikXM3E+rU98dgiJPDJkH4pen3v
         6ZFN+v7w0R5JLVaT2rJDWbJQzBv+S50farlgcRAEj0+KiSgCsWa5pGQgy+8H9umjmEp4
         nyhTrL10/AmW5RBIJqC2ySpb4QSSpOtWiiGbAaBHXYY7f/N20djcawMuaZJBTiSirzo5
         NNCwagzHvj4QO/eu6ujZRX1dIE5XTbGyJhDUz+07heCPLlzr+GXqQYaSewCmj76AEVyH
         RX8Q==
X-Gm-Message-State: AOAM5319jJZgF9sPAsxUyc3jmfb+AQCh86y9PqvIPxIdI7aWsPDy82Ka
        XAykbOP8UiRiH3QuXgaMyzeW7JpknD4=
X-Google-Smtp-Source: ABdhPJz79+yiYdfEzVIM6KjCL1qMtHwfF6WdsqhiSvWh+pL63QU6i4WTUHBr+sLu1ISCBspt9PHMMw==
X-Received: by 2002:a05:6512:3190:: with SMTP id i16mr11566462lfe.158.1593511080033;
        Tue, 30 Jun 2020 02:58:00 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id d18sm633377lfb.26.2020.06.30.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 02:57:59 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jqD1Y-0000mu-NB; Tue, 30 Jun 2020 11:57:56 +0200
Date:   Tue, 30 Jun 2020 11:57:56 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 5/6] USB: serial: ch341: Compute minimum baud rate
Message-ID: <20200630095756.GZ3334@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <55c53ab4650ecabd1a6cd619ec72eed2e00d5dd2.1585697281.git.public@hansmi.ch>
 <de39436b-ba4d-73be-513f-72ccff0fec1b@msgid.hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de39436b-ba4d-73be-513f-72ccff0fec1b@msgid.hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 28, 2020 at 12:19:30AM +0200, Michael Hanselmann wrote:
> The minimum baud rate was hardcoded, not computed from first principles.
> The break condition simulation added in a later patch will also need to
> make use of the minimum baud rate.
> 
> The (1 + ((x - 1) / y)) pattern is to force rounding up (mathematically
> the minimum rate is about 45.78bps).
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
> Rebase on top of usb-next and wording change in commit message.
> 
>  drivers/usb/serial/ch341.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 97214e1ec5d2..202cfa4ef6c7 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -147,6 +147,8 @@ static int ch341_control_in(struct usb_device *dev,
>  
>  #define CH341_CLKRATE		48000000
>  #define CH341_CLK_DIV(ps, fact)	(1 << (12 - 3 * (ps) - (fact)))
> +#define CH341_MIN_BPS \
> +	(unsigned int)(1 + (((CH341_CLKRATE) - 1) / (CH341_CLK_DIV(0, 0) * 256)))

We have DIV_ROUND_UP(), and the cast can be avoided by using
clamp_val().

>  #define CH341_MIN_RATE(ps)	(CH341_CLKRATE / (CH341_CLK_DIV((ps), 1) * 512))
>  
>  static const speed_t ch341_min_rates[] = {
> @@ -174,10 +176,10 @@ static int ch341_get_divisor(struct ch341_private *priv)
>  	int ps;
>  
>  	/*
> -	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
> -	 * sanity checks below redundant.
> +	 * Clamp to supported range, making the later range sanity checks
> +	 * redundant.

This change seems uncalled for.

>  	 */
> -	speed = clamp(speed, 46U, 3000000U);
> +	speed = clamp(speed, CH341_MIN_BPS, 3000000U);
>  
>  	/*
>  	 * Start with highest possible base clock (fact = 1) that will give a

I replaced this patch with the below one adding both MIN and MAX macros
instead.

Johan


From fd1d3198e26696ba66e8ac2111acadd360eb86b3 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Mon, 29 Jun 2020 14:18:48 +0200
Subject: [PATCH] USB: serial: ch341: add min and max line-speed macros

The line-speed algorithm clamps the requested value to the supported
range instead of bailing out on unsupported values.

Provide min and max macros and indicate how they are derived instead of
hardcoding the limits.

Note that the algorithm depends on the minimum rate (45.78 bps)
being rounded up (and the maximum rate being rounded down) to avoid
special casing.

Suggested-by: Michael Hanselmann <public@hansmi.ch>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ch341.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 684d595e7630..55a1c6dbeeb2 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -156,6 +156,10 @@ static const speed_t ch341_min_rates[] = {
 	CH341_MIN_RATE(3),
 };
 
+/* Supported range is 46 to 3000000 bps. */
+#define CH341_MIN_BPS	DIV_ROUND_UP(CH341_CLKRATE, CH341_CLK_DIV(0, 0) * 256)
+#define CH341_MAX_BPS	(CH341_CLKRATE / (CH341_CLK_DIV(3, 0) * 2))
+
 /*
  * The device line speed is given by the following equation:
  *
@@ -177,7 +181,7 @@ static int ch341_get_divisor(struct ch341_private *priv)
 	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
 	 * sanity checks below redundant.
 	 */
-	speed = clamp(speed, 46U, 3000000U);
+	speed = clamp_val(speed, CH341_MIN_BPS, CH341_MAX_BPS);
 
 	/*
 	 * Start with highest possible base clock (fact = 1) that will give a
-- 
2.26.2

