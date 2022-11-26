Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCFC163956A
	for <lists+linux-usb@lfdr.de>; Sat, 26 Nov 2022 11:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbiKZKmW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Nov 2022 05:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiKZKmV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Nov 2022 05:42:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3AB1E723
        for <linux-usb@vger.kernel.org>; Sat, 26 Nov 2022 02:42:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B07460A5C
        for <linux-usb@vger.kernel.org>; Sat, 26 Nov 2022 10:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898CDC433D6;
        Sat, 26 Nov 2022 10:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669459339;
        bh=Am4kvXRVZ6pRKQ8wFgTqG4Ro1Obhe/Y4VpooYwjIvxs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOJe8BJSGG3/MIHUYAoDH8bUqW1IGR5JH/7jnfaAnK2zIe5ewCSfzsDpswDV8DV78
         CsV4TpXqw4BOtH+jm9fKmeXAhoLqnVQu4cHm5ZW5PluUSVuYNDuzXDIvv6obIQP8YT
         VbzLeFAymGe2G/X5vJ7gnpXsVzfd6hcN1D1UCHGw=
Date:   Sat, 26 Nov 2022 08:10:07 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alex Henrie <alexh@vpitech.com>
Cc:     linux-usb@vger.kernel.org, johan@kernel.org,
        johanna.abrahamsson@afconsult.com, alexhenrie24@gmail.com
Subject: Re: [PATCH] USB: serial: cp210x: map B0 to B9600
Message-ID: <Y4G7z0fa7W/qseqw@kroah.com>
References: <20221126035825.6991-1-alexh@vpitech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221126035825.6991-1-alexh@vpitech.com>
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 25, 2022 at 08:58:25PM -0700, Alex Henrie wrote:
> When a baud rate of 0 is requested, both the 8250 driver and the FTDI
> driver reset the baud rate to the default of 9600 (see the comment above
> the uart_get_baud_rate function). Some old versions of the NXP blhost
> utility depend on this behavior. However, the CP210x driver resets the
> baud rate to the minimum supported rate of 300. Special-case B0 so that
> it returns the baud rate to the more sensible default of 9600.
> 
> Signed-off-by: Alex Henrie <alexh@vpitech.com>
> ---
>  drivers/usb/serial/cp210x.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 3bcec419f463..2c910550dca8 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -1051,9 +1051,14 @@ static void cp210x_change_speed(struct tty_struct *tty,
>  	 * This maps the requested rate to the actual rate, a valid rate on
>  	 * cp2102 or cp2103, or to an arbitrary rate in [1M, max_speed].
>  	 *
> -	 * NOTE: B0 is not implemented.
> +	 * NOTE: B0 is not implemented, apart from returning the baud rate to
> +	 * the default of B9600.
>  	 */
> -	baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
> +	if (tty->termios.c_ospeed) {
> +		baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
> +	} else {
> +		baud = 9600;
> +	}

No need for { } here (checkpatch.pl should have warned about this.)

thanks,

greg k-h
