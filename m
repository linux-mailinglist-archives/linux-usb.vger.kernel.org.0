Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABD6220DFCA
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jun 2020 23:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389018AbgF2Uj4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 16:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731721AbgF2TOO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jun 2020 15:14:14 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119BDC0086F9
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2020 02:51:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id t9so8709617lfl.5
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2020 02:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q2yZLsjigp7fy0R4Bzt1pxIyciUQlVsiCVn7CDXAKD8=;
        b=GIdXuH2J7pil5Lcmw9eOB4XvYJGTN8rNy4+Y8gjmyWkBiwwpNAEucmQUKMZ1joafik
         QJlOFY9l5YeB3m/zB35bx6PZNiF+zc7T0uZezx8oMOC1bR0NewhtKMB5bHYwf8Gva4O4
         5eb1Glee1MoMSf76WgK/7nBl2zzkJHOldtGzu4BZ4V6Liz334CSxCdWSgwWWG+QhyxM+
         JzpnZ7g2xLde+qr1x8KDU1tM2W3IU0vsVXwkiQqdA695zcoJTRPsJ9vntO+m8WhyW8zQ
         x/IPIj2adneilTO7+GHtN6uc8kym+jvjvIhYaIJr/08+T8d9YuuAqpIiWeeR443tdLIk
         zQmA==
X-Gm-Message-State: AOAM5301O+JE5T3dJvzOdJVK67ZRS+iQILNtMnvjvKZYldt77UjjyerX
        4ZdWEAtkWJCN1Ee5PZxQbfKbp8Fjfsc=
X-Google-Smtp-Source: ABdhPJyOSvXiCGgCwzW0GLHj9j4SmcHtOWkLd4CC44pSSyHScgpzifjXD3ij2UQVlXwwK4csslkf/Q==
X-Received: by 2002:ac2:47e7:: with SMTP id b7mr8634965lfp.68.1593424282335;
        Mon, 29 Jun 2020 02:51:22 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id k25sm282019ljk.87.2020.06.29.02.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 02:51:21 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jpqRc-0002Cf-Az; Mon, 29 Jun 2020 11:51:21 +0200
Date:   Mon, 29 Jun 2020 11:51:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 4/6] USB: serial: ch341: Name prescaler, divisor
 registers
Message-ID: <20200629095120.GR3334@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <65cfdf4a0600e86e89b3a3fb839e733ecebee688.1585697281.git.public@hansmi.ch>
 <20200514142434.GF25962@localhost>
 <2e80916d-1be8-dc0f-abf9-adc0feea1803@msgid.hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e80916d-1be8-dc0f-abf9-adc0feea1803@msgid.hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 27, 2020 at 10:59:53PM +0200, Michael Hanselmann wrote:
> On 14.05.20 16:24, Johan Hovold wrote:
> > On Tue, Mar 31, 2020 at 11:37:20PM +0000, Michael Hanselmann wrote:

> >> The 0x25 register is only used by CH341 chips before version 0x30 and is
> >> involved in configuring the line control parameters. It's not known to
> >> the author whether there any such chips in the wild, and the driver
> >> never supported them (other registers are also treated differently). The
> >> alternative would've been to not set the register, but that may have
> >> unintended effects.
> > 
> > How did you come to those conclusions? I see this register being written
> > the value zero in some older version of the vendor driver, but not in
> > more recent ones.
> >
> > Are you sure it's at all related to LCR?
> 
> I am looking at version 3.50.2014.8 from 2019-03-04 of CH341S64.SYS, the
> vendor driver. The function configuring registers 0x18 and 0x25 starts
> at offset 0x119f0.
> 
> For chip versions 0x30 and above 0x25 is always set to 0. For versions
> before 0x30 the values stored in register 0x25 depend on stop bit,
> partity and word length settings.

Great, thanks for confirming.

> From aa597afe1e9cf5641b94b377ce63248c2d0d677a Mon Sep 17 00:00:00 2001
> From: Michael Hanselmann <public@hansmi.ch>
> Date: Wed, 27 May 2020 22:56:54 +0200
> Subject: [PATCH] USB: serial: ch341: Name prescaler, divisor registers
> 
> Add constants for the prescaler and divisor registers. Document and
> name register 0x25, and put the LCR define to more use.
> 
> The 0x25 register (CH341_REG_LCR2) is only used by CH341 chips before
> version 0x30 and is involved in configuring the line control parameters.
> It's not known to the author whether there any such chips in the wild,
> and Linux' ch341 driver never supported them. For chip version 0x30 and
> above the 0x25 register is always set to zero. The alternative would've
> been to not set the register at all, but that may have unintended
> effects.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 89675ee29645..97214e1ec5d2 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -59,7 +59,11 @@
>  #define CH341_REQ_MODEM_CTRL   0xA4
>  
>  #define CH341_REG_BREAK        0x05
> +#define CH341_REG_PRESCALER    0x12
> +#define CH341_REG_DIVISOR      0x13
>  #define CH341_REG_LCR          0x18
> +#define CH341_REG_LCR2         0x25
> +
>  #define CH341_NBREAK_BITS      0x01
>  
>  #define CH341_LCR_ENABLE_RX    0x80
> @@ -246,11 +250,20 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
>  	 */
>  	val |= BIT(7);
>  
> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, val);
> +	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
> +			      CH341_REG_DIVISOR << 8 | CH341_REG_PRESCALER,
> +			      val);
>  	if (r)
>  		return r;
>  
> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
> +	/*
> +	 * Chip versions before version 0x30 as read using
> +	 * CH341_REQ_READ_VERSION used separate registers for line control
> +	 * (word length, parity and word length). Version 0x30 and above use

I replaced the first "word length" with "stop bits" here before applying.

> +	 * CH341_REG_LCR only and CH341_REG_LCR2 is always set to zero.
> +	 */
> +	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
> +			      CH341_REG_LCR2 << 8 | CH341_REG_LCR, lcr);
>  	if (r)
>  		return r;

Johan
