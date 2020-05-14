Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E821D327C
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 16:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgENORq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 10:17:46 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36225 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENORp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 10:17:45 -0400
Received: by mail-lf1-f66.google.com with SMTP id c21so2785442lfb.3
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 07:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A/CdV3mdj9ujS/eNNKaIrhcwu/qy7mubr144dd196CY=;
        b=G9HAxaN1ynaXeChcBGri8tGOTYOSGhf39lfRtNQzuUJ5MKHk4Z4kKUzL4SAJZWon5N
         8Qyj9OKBim4cltZfQG5Atz2XrtLFLtACgHN4AxYQgQih6xe/UpSUowYvz7xn3W2NtNPm
         PMuUgAk1UwKF2TFgmTWbVoJCms8wosSAj0GaEJdSshUeW6d91JS/DAjlY6QfIwo00oZc
         wq+VO1MIOXOSwizzVpfptkzjFG+Wta3BRS1bF1JQd7C6bUDNGSr30DWjY75rb34bXWWE
         uQd3j/OWZx+ctcCqq9BjtFmQO6AzrzcorDFpEkKPVcJlyVHEg6a7FWQQw1YAb86rvCX/
         lANg==
X-Gm-Message-State: AOAM532sksGE5eXJJLWeO749QseGp74Njg7vC0ltqt0U51ndY8l3NVwX
        5ze0MlF0vM1B2E9OlHGQXog=
X-Google-Smtp-Source: ABdhPJz0MZGGU6ySmIKayvh0g9clf7JAKuKmX/TwFkIkcDincIlpNCi3LKW6/0kVr84ZJhVaytL71Q==
X-Received: by 2002:ac2:4286:: with SMTP id m6mr3495986lfh.84.1589465861239;
        Thu, 14 May 2020 07:17:41 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z21sm1580978ljh.42.2020.05.14.07.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:17:40 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jZEgB-0006f3-H1; Thu, 14 May 2020 16:17:43 +0200
Date:   Thu, 14 May 2020 16:17:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 3/6] USB: serial: ch341: Limit prescaler on quirky
 chips
Message-ID: <20200514141743.GE25962@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <ee0499594a75018c0e31da4af9feb8a322ff448d.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee0499594a75018c0e31da4af9feb8a322ff448d.1585697281.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 31, 2020 at 11:37:19PM +0000, Michael Hanselmann wrote:
> A subset of all CH341 devices stop responding to bulk transfers, usually
> after the third byte, when the highest prescaler bit (0b100) is set.
> There is one exception, namely a prescaler of exactly 0b111 (fact=1,
> ps=3). Limit these to the lower prescaler values at the cost of timing
> precision.
> 
> Rates above 46875 baud use the same timings as the normal algorithm.
> Below that the worst difference between desired and actual baud rate is
> 2.17 percentage points. The worst difference is 1.06 p.p. when only
> looking at divisors differing from the normal algorithm.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 70 ++++++++++++++++++++++++++++----------
>  1 file changed, 52 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 9c839f67c3d4..67a5d4c3df42 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -24,6 +24,8 @@
>  #define DEFAULT_BAUD_RATE 9600
>  #define DEFAULT_TIMEOUT   1000
>  
> +#define CH341_QUIRK_LIMITED_PRESCALER 0x01
> +
>  /* flags for IO-Bits */
>  #define CH341_BIT_RTS (1 << 6)
>  #define CH341_BIT_DTR (1 << 5)
> @@ -195,35 +197,67 @@ static int ch341_calc_divisor(speed_t speed, unsigned int ps,
>   *		2 <= div <= 256 if fact = 0, or
>   *		9 <= div <= 256 if fact = 1
>   */
> -static int ch341_get_divisor(speed_t speed)
> +static int ch341_get_divisor(struct ch341_private *priv)
>  {
> +	speed_t speed;
>  	unsigned int fact, div, clk_div;
>  	int ps;
>  
> +	speed = priv->baud_rate;
> +
>  	/*
>  	 * Clamp to supported range, this makes the (ps < 0) and (div < 2)
>  	 * sanity checks below redundant.
>  	 */
>  	speed = clamp(speed, 46U, 3000000U);
>  
> -	/*
> -	 * Start with highest possible base clock and find a divisor for the
> -	 * requested baud rate.
> -	 */
> -	for (ps = 3; ps >= 0; --ps) {
> -		if (ch341_calc_divisor(speed, ps, 1U, &div, &clk_div) == 0) {
> -			fact = 1;
> -			break;
> -		}
> -
> +	if (priv->quirks & CH341_QUIRK_LIMITED_PRESCALER) {
>  		/*
> -		 * Prefer half base clock (fact = 0) before trying lower
> -		 * prescaler values. This makes the receiver more tolerant to
> -		 * errors.
> +		 * A subset of all CH34x devices stop responding to bulk
> +		 * transfers when configured with certain prescaler values.
> +		 *
> +		 * fact=0, ps=0..3: Works
> +		 * fact=1, ps=0..2: Unreliable
> +		 * fact=1, ps=3: Works
> +		 *
> +		 * Limit these devices to working prescaler values at the cost
> +		 * of precision for speeds up to 46875 baud above which
> +		 * fact = 1 with ps = 3 is used.
>  		 */
> -		if (ch341_calc_divisor(speed, ps, 0U, &div, &clk_div) == 0) {
> +		if (ch341_calc_divisor(speed, 3U, 1U, &div, &clk_div) == 0) {
> +			ps = 3U;
> +			fact = 1U;
> +		} else {
>  			fact = 0;
> -			break;
> +
> +			for (ps = 3; ps >= 0; --ps) {
> +				if (ch341_calc_divisor(speed, ps, fact,
> +						       &div, &clk_div) == 0)
> +					break;
> +			}
> +		}
> +	} else {
> +		/*
> +		 * Start with highest possible base clock and find a divisor
> +		 * for the requested baud rate.
> +		 */
> +		for (ps = 3; ps >= 0; --ps) {
> +			if (ch341_calc_divisor(speed, ps, 1U,
> +					       &div, &clk_div) == 0) {
> +				fact = 1;
> +				break;
> +			}
> +
> +			/*
> +			 * Prefer half base clock (fact = 0) before trying
> +			 * lower prescaler values. This makes the receiver more
> +			 * tolerant to errors.
> +			 */
> +			if (ch341_calc_divisor(speed, ps, 0U,
> +					       &div, &clk_div) == 0) {
> +				fact = 0;
> +				break;
> +			}
>  		}
>  	}
>  
> @@ -250,7 +284,7 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
>  	if (!priv->baud_rate)
>  		return -EINVAL;
>  
> -	val = ch341_get_divisor(priv->baud_rate);
> +	val = ch341_get_divisor(priv);
>  	if (val < 0)
>  		return -EINVAL;
>  
> @@ -353,7 +387,7 @@ static int ch341_detect_quirks(struct usb_device *dev)
>  	if (r == -EPIPE) {
>  		dev_dbg(&dev->dev, "%s - reading break condition register"
>  			" failed (%d)\n", __func__, r);
> -		r = 0;
> +		r = CH341_QUIRK_LIMITED_PRESCALER;
>  		goto out;
>  	}

This can be implemented in a more compact way which makes the algorithm
easier to follow and doesn't depend on your patch 1/6 either. With a
smaller fix we can get this backported to stable as well.

I've verified that the below works here on top of your (slightly
modified) 2/6. Would you mind giving it a try on your end as well?

Johan


From ea23730616b6406101d4efeb12e1ae2312dd20c9 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Thu, 14 May 2020 11:36:45 +0200
Subject: [PATCH] USB: serial: ch341: fix lockup of devices with limited
 prescaler

Michael Hanselmann reports that

	[a] subset of all CH341 devices stop responding to bulk
	transfers, usually after the third byte, when the highest
	prescaler bit (0b100) is set. There is one exception, namely a
	prescaler of exactly 0b111 (fact=1, ps=3).

Fix this by forcing a lower base clock (fact = 0) whenever needed.

This specifically makes the standard rates 110, 134 and 200 bps work
again with these devices.

Fixes: 35714565089e ("USB: serial: ch341: reimplement line-speed handling")
Cc: stable <stable@vger.kernel.org>	# 5.5
Reported-by: Michael Hanselmann <public@hansmi.ch>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ch341.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index f2b93f4554a7..89675ee29645 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -73,6 +73,8 @@
 #define CH341_LCR_CS6          0x01
 #define CH341_LCR_CS5          0x00
 
+#define CH341_QUIRK_LIMITED_PRESCALER	BIT(0)
+
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x4348, 0x5523) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
@@ -160,9 +162,11 @@ static const speed_t ch341_min_rates[] = {
  *		2 <= div <= 256 if fact = 0, or
  *		9 <= div <= 256 if fact = 1
  */
-static int ch341_get_divisor(speed_t speed)
+static int ch341_get_divisor(struct ch341_private *priv)
 {
 	unsigned int fact, div, clk_div;
+	speed_t speed = priv->baud_rate;
+	bool force_fact0 = false;
 	int ps;
 
 	/*
@@ -188,8 +192,12 @@ static int ch341_get_divisor(speed_t speed)
 	clk_div = CH341_CLK_DIV(ps, fact);
 	div = CH341_CLKRATE / (clk_div * speed);
 
+	/* Some devices require a lower base clock if ps < 3. */
+	if (ps < 3 && (priv->quirks & CH341_QUIRK_LIMITED_PRESCALER))
+		force_fact0 = true;
+
 	/* Halve base clock (fact = 0) if required. */
-	if (div < 9 || div > 255) {
+	if (div < 9 || div > 255 || force_fact0) {
 		div /= 2;
 		clk_div *= 2;
 		fact = 0;
@@ -228,7 +236,7 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
 	if (!priv->baud_rate)
 		return -EINVAL;
 
-	val = ch341_get_divisor(priv->baud_rate);
+	val = ch341_get_divisor(priv);
 	if (val < 0)
 		return -EINVAL;
 
@@ -333,6 +341,7 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
 			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
 	if (r == -EPIPE) {
 		dev_dbg(&port->dev, "break control not supported\n");
+		quirks = CH341_QUIRK_LIMITED_PRESCALER;
 		r = 0;
 		goto out;
 	}
-- 
2.26.2


