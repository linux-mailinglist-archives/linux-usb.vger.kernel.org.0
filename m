Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5C557F512
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jul 2022 14:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbiGXM2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jul 2022 08:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGXM2g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jul 2022 08:28:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC804231
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 05:28:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 557056103F
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 12:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2812C3411E;
        Sun, 24 Jul 2022 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658665714;
        bh=+zK6og//YGom8LW/sOdN+q0Fs4MHPw4TSBFxY8SrpaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xv90zMZTTN6GaknG4VFjgWay9CGCzqBmmAhNMbDmKHVecmykzDL0Em3EZmplMaQMx
         BA1YMsDR/PFP0+NHj5mJ3Byh0bIghbnfCDcyO831OGewn0o1xt/cax64FYvhR7+FCT
         RGgp0KyVmtq4Gujfd+tCDpvrQsU47ZyOyvXKWJA0x+ZiyTT6C9nKu6NBQE5xCqBKHl
         PbIb4JphKhZ+EvwhXaUpKO3gZcriSKk63q1iQcnX0hAA1FMFF78gJMOszag6m+EOlZ
         qNO2zxs9FK7jaX9HqTxCjUHxb/JmhxGmRfquxap7rYXQJ8Wqf2KYeHdBQ2809LPWjv
         CuTC6O3CsIK1Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oFaix-0006aZ-GR; Sun, 24 Jul 2022 14:28:43 +0200
Date:   Sun, 24 Jul 2022 14:28:43 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <Yt06+wicNYMt/D7f@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-7-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712115306.26471-7-kabel@kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 01:53:05PM +0200, Marek Behún wrote:
> From: Pali Rohár <pali@kernel.org>
> 
> When ASYNC_SPD_CUST is used, update custom_divisor and c_*speed fields
> so that they correspond to the newly set baud rate value, so that
> userspace GET ioctls will see the true baud rate that is being used.

No, this is wrong.

In fact, there's a long-standing bug in this driver which started
reporting back the actual baud rate when using SPD_CUST. The rate should
be left unchanged at 38400 in that case.

> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 5db1293bb7a2..39e8c5d06157 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1303,6 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  {
>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
>  	struct device *dev = &port->dev;
> +	int fix_custom_divisor = 0;
>  	int div_value = 0;
>  	int div_okay = 1;
>  	int baud;
> @@ -1317,6 +1318,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  	if (baud == 38400 &&
>  	    ((priv->flags & ASYNC_SPD_MASK) == ASYNC_SPD_CUST) &&
>  	     (priv->custom_divisor)) {
> +		fix_custom_divisor = 1;
>  		baud = DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
>  		dev_dbg(dev, "%s - custom divisor %d sets baud rate to %d\n",
>  			__func__, priv->custom_divisor, baud);
> @@ -1401,7 +1403,19 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			ftdi_chip_name[priv->chip_type]);
>  	}
>  
> +	/* Fix deprecated async-compatible custom_divisor hack and update tty baud rate */
> +	if (fix_custom_divisor) {
> +		priv->custom_divisor = DIV_ROUND_CLOSEST(priv->baud_base, baud);
> +		old_baud = baud;
> +		baud = 38400;
> +	}
> +
>  	tty_encode_baud_rate(tty, baud, baud);
> +
> +	/* For async-compatible custom_divisor store into TCGETS2 c_*speed fields real baud rate */
> +	if (fix_custom_divisor)
> +		tty->termios.c_ispeed = tty->termios.c_ospeed = old_baud;
> +
>  	return div_value;
>  }
>  
> @@ -2674,6 +2688,8 @@ static void ftdi_set_termios(struct tty_struct *tty,
>  		dev_dbg(ddev, "%s: forcing baud rate for this device\n", __func__);
>  		tty_encode_baud_rate(tty, priv->force_baud,
>  					priv->force_baud);
> +		termios->c_ispeed = termios->c_ospeed =
> +			DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
>  	}
>  
>  	/* Force RTS-CTS if this device requires it. */

Johan
