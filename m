Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277AC57F4E7
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jul 2022 14:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbiGXMUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jul 2022 08:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGXMUw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jul 2022 08:20:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1702D92
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 05:20:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CC6E61049
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 12:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBA8C3411E;
        Sun, 24 Jul 2022 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658665250;
        bh=9oa6ZKzUpEHAYnP8Kd9PAuB8Sy4kuuavFNYHYwcGb5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RpSw35D7JmJPcJkmumX5U3Pi/iRbtNdf7RgpzieYwsoqCxDqj8r9Op+N+YP5JdyLx
         s1oJLirfAX3WzpGmKqqA1I/+RhTpe5eClex9cuSalJPnsRa5gWwBVCmgYahvVYXUdC
         xLWYsdJnMPFRCGercAELfpGkDsExhFO95i6gSEpsh9xJ5obpRJ4y01W5Z+pvbrfjrx
         SioNA8wt/Oh1B8WMcx67mFDfgosuevP7CbqXrkMrE3ptqUeoYj4nGd+BhQ5eCS7OxQ
         rmiqf6ojF4c7dSwh4ehF3szQ4xg9wfX9QzPlbmXABn3FFqSpeSsq7Bc4dkqyVL/NiE
         8dfc5buW+DeoA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oFabS-0006Xq-Jm; Sun, 24 Jul 2022 14:20:59 +0200
Date:   Sun, 24 Jul 2022 14:20:58 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 4/7] USB: serial: ftdi_sio: Do not reset baud rate to
 9600 Baud on error
Message-ID: <Yt05KkAwrkB0EnbN@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-5-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712115306.26471-5-kabel@kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 01:53:03PM +0200, Marek Behún wrote:
> From: Pali Rohár <pali@kernel.org>
> 
> If setting new baud rate fails, all other drivers leave the device at
> previous baud rate, only ftdi_sio resets to 9600 Baud.

> Change this behavior to that of other drivers so that /dev/ttyUSB*
> devices behave in the same way.

These statements are not true. Several USB serial driver set 9600 baud
on errors for historical reasons. Yet others clamp. It's inconsistent at
best.

> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
> Greg pointed out that this make break some people's workflow, that they
> may depend on this behavior.
> 
> This is of course possible, although IMO improbable: it would be weird
> to depend on the fall back to 9600 Baud on error, instead of expecting
> that the baud rate didn't change at all (like in other /dev/ttyUSB*
> drivers).
> 
> Nonetheless if someone complains that they workflow got broken, we will
> need to revert this.

>  static u32 get_ftdi_divisor(struct tty_struct *tty,
> -						struct usb_serial_port *port)
> +			    struct usb_serial_port *port, speed_t old_baud)
>  {
>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
>  	struct device *dev = &port->dev;
> @@ -1322,6 +1322,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			__func__, priv->custom_divisor, baud);
>  	}
>  
> +	if (!baud)
> +		baud = old_baud;
>  	if (!baud)
>  		baud = 9600;

This looks like it breaks B0 handling. Either way, an unrelated change.

>  	switch (priv->chip_type) {
> @@ -1330,8 +1332,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  		if (div_value == -1) {
>  			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
>  				__func__,  baud);
> -			baud = 9600;
> +			baud = old_baud ? old_baud : 9600;
>  			div_value = ftdi_sio_baud_to_divisor(baud);
> +			if (div_value == -1) {
> +				baud = 9600;
> +				div_value = ftdi_sio_baud_to_divisor(baud);
> +			}
>  			div_okay = 0;
>  		}
>  		break;
> @@ -1340,8 +1346,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			div_value = ftdi_232am_baud_to_divisor(baud);
>  		} else {
>  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
> -			baud = 9600;
> -			div_value = ftdi_232am_baud_to_divisor(9600);
> +			baud = (old_baud >= 183 && old_baud <= 3000000) ? old_baud : 9600;

And please avoid using the ternary operator which tend to just hurt
readability.

Looks like this needs to be refactored in some way.

> @@ -1525,7 +1536,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
>  		if (priv->flags & ASYNC_SPD_MASK)
>  			dev_warn_ratelimited(&port->dev, "use of SPD flags is deprecated\n");
>  
> -		change_speed(tty, port);
> +		change_speed(tty, port, 0);

Zero has a special meaning (B0).

>  	}
>  	mutex_unlock(&priv->cfg_lock);
>  	return 0;
> @@ -2774,9 +2785,12 @@ static void ftdi_set_termios(struct tty_struct *tty,
>  		/* Drop RTS and DTR */
>  		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
>  	} else {
> +		speed_t old_baud =
> +			old_termios ? tty_termios_baud_rate(old_termios) : 0;

Just use 9600 if you don't have an old termios. The termios rate should
be valid in that case.

Johan
