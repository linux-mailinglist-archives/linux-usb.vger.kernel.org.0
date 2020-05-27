Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D341E434E
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 15:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730255AbgE0NRK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 09:17:10 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36237 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730244AbgE0NRJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 09:17:09 -0400
Received: by mail-lj1-f193.google.com with SMTP id a25so17230787ljp.3
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2020 06:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FVIbP94w7vFdSmku8f9dsAgsay5gMCsOO6VlZRpc1Y4=;
        b=h23cVX+6uexULkGojplMrEfh3+/425XWRAaen6LacgWPQLzrcPXzeXPatTHOIoxIXV
         kNKRl/d7HOpOkVhmdvbJMLqK/oNxUQSGkncr7APzqt/E8W3KXwO2DxRcHU7DkUVSbePa
         Csx06Zi3RtU7KDHKfApUuJDjtUSlzLA0i1Uemxm3i09QKnwN+5h3fjVLP9d4MDmFyxW2
         WlsU7VNHzoobXAbWPXsWq7XFBZftw5bWr4+zM+Q5/0ZDyEnIC8LO6hj6DDGlnjNdoaZo
         ZbJR67A2uRzIhxCUOk2IXCnBpBq8yT+mcqaQE5vCru+xzK3mZe7NkaLcBKlMk4ycJAz5
         IaTA==
X-Gm-Message-State: AOAM533oexvUSpq3DN8z42a7VO4lnNhPTESIrtEWVrZ5YTUM+wFb5wnF
        ndQAD+Wb3AXe5R9B/2mxVjA7LAc6
X-Google-Smtp-Source: ABdhPJz7B92xMQe+tOxpESNnU4rAECO4r3bxQmEhAX/pp1QsoVaz+zwfI7DKXef3aWZniUTkAeinsw==
X-Received: by 2002:a2e:6e17:: with SMTP id j23mr2950760ljc.106.1590585425820;
        Wed, 27 May 2020 06:17:05 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id g10sm684669lja.121.2020.05.27.06.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 06:17:05 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jdvvW-0004IO-9O; Wed, 27 May 2020 15:16:58 +0200
Date:   Wed, 27 May 2020 15:16:58 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 3/6] USB: serial: ch341: Limit prescaler on quirky
 chips
Message-ID: <20200527131658.GJ5276@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <ee0499594a75018c0e31da4af9feb8a322ff448d.1585697281.git.public@hansmi.ch>
 <20200514141743.GE25962@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514141743.GE25962@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 04:17:43PM +0200, Johan Hovold wrote:
> On Tue, Mar 31, 2020 at 11:37:19PM +0000, Michael Hanselmann wrote:

> From ea23730616b6406101d4efeb12e1ae2312dd20c9 Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Thu, 14 May 2020 11:36:45 +0200
> Subject: [PATCH] USB: serial: ch341: fix lockup of devices with limited
>  prescaler
> 
> Michael Hanselmann reports that
> 
> 	[a] subset of all CH341 devices stop responding to bulk
> 	transfers, usually after the third byte, when the highest
> 	prescaler bit (0b100) is set. There is one exception, namely a
> 	prescaler of exactly 0b111 (fact=1, ps=3).
> 
> Fix this by forcing a lower base clock (fact = 0) whenever needed.
> 
> This specifically makes the standard rates 110, 134 and 200 bps work
> again with these devices.
> 
> Fixes: 35714565089e ("USB: serial: ch341: reimplement line-speed handling")
> Cc: stable <stable@vger.kernel.org>	# 5.5
> Reported-by: Michael Hanselmann <public@hansmi.ch>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/ch341.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index f2b93f4554a7..89675ee29645 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -73,6 +73,8 @@
>  #define CH341_LCR_CS6          0x01
>  #define CH341_LCR_CS5          0x00
>  
> +#define CH341_QUIRK_LIMITED_PRESCALER	BIT(0)
> +
>  static const struct usb_device_id id_table[] = {
>  	{ USB_DEVICE(0x4348, 0x5523) },
>  	{ USB_DEVICE(0x1a86, 0x7523) },
> @@ -160,9 +162,11 @@ static const speed_t ch341_min_rates[] = {
>   *		2 <= div <= 256 if fact = 0, or
>   *		9 <= div <= 256 if fact = 1
>   */
> -static int ch341_get_divisor(speed_t speed)
> +static int ch341_get_divisor(struct ch341_private *priv)
>  {
>  	unsigned int fact, div, clk_div;
> +	speed_t speed = priv->baud_rate;
> +	bool force_fact0 = false;
>  	int ps;
>  
>  	/*
> @@ -188,8 +192,12 @@ static int ch341_get_divisor(speed_t speed)
>  	clk_div = CH341_CLK_DIV(ps, fact);
>  	div = CH341_CLKRATE / (clk_div * speed);
>  
> +	/* Some devices require a lower base clock if ps < 3. */
> +	if (ps < 3 && (priv->quirks & CH341_QUIRK_LIMITED_PRESCALER))
> +		force_fact0 = true;
> +
>  	/* Halve base clock (fact = 0) if required. */
> -	if (div < 9 || div > 255) {
> +	if (div < 9 || div > 255 || force_fact0) {
>  		div /= 2;
>  		clk_div *= 2;
>  		fact = 0;
> @@ -228,7 +236,7 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
>  	if (!priv->baud_rate)
>  		return -EINVAL;
>  
> -	val = ch341_get_divisor(priv->baud_rate);
> +	val = ch341_get_divisor(priv);
>  	if (val < 0)
>  		return -EINVAL;
>  
> @@ -333,6 +341,7 @@ static int ch341_detect_quirks(struct usb_serial_port *port)
>  			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
>  	if (r == -EPIPE) {
>  		dev_dbg(&port->dev, "break control not supported\n");
> +		quirks = CH341_QUIRK_LIMITED_PRESCALER;
>  		r = 0;
>  		goto out;
>  	}

I've applied the above fix on top of your quirk-detection patch so that
we can get this into 5.8 and backported to stable.

Johan
