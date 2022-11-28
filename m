Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB9863ADE6
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 17:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbiK1Qhb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 11:37:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiK1Qha (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 11:37:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564A62127C
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 08:37:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D92EC61262
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 16:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E768C433D6;
        Mon, 28 Nov 2022 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669653448;
        bh=El8xHRWSF/pKNPkhLV3QJPzq58ZuZJVu+xESjue7/9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SJg9SKzOTOtOmBPXWgUKeoovPNMLzAjSeeqQlck9D1Nu21Kh7g+79QZhveFGScivk
         8lSTB0C3T7eWePqdN/MwLjiq9gBDLbfL4oB/WnHCXr1bTg3a05zlH6hiXZdQTeCZ6/
         60bBMOQ6x/2gLXkOagHa37Jay1xWu236glfCr9qMVylkj/C+g8h8zSaayuDS9GyUzy
         yv+xTdxNFkX2Ov0sdq+C8Z6EuwVdtFnYiis/kKI2dMh0GY9aV2tO+c2dXva0fcdIee
         0JQTN74xKcRK8Pmau/drfdpIMVwei3oMpZ4/p6zeqJXNtAzDK9peeFjGkHySqNlVQ7
         J27c7Z1OIne5A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozh8H-0007u2-7V; Mon, 28 Nov 2022 17:37:25 +0100
Date:   Mon, 28 Nov 2022 17:37:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 4/7] USB: serial: ftdi_sio: Do not reset baud rate to
 9600 Baud on error
Message-ID: <Y4TjxSsuPODmBzBA@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-5-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-5-pali@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:15PM +0200, Pali Rohár wrote:
> If setting new baud rate fails, some other drivers leave the device at
> previous baud rate, and ftdi_sio resets to 9600 Baud.
> 
> Change this behavior to not reset baud rate to 9600.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 47 ++++++++++++++++++++++++++---------
>  1 file changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index fe8a7c5fa0e9..1ab6bf48516f 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1315,7 +1315,7 @@ static int update_mctrl(struct usb_serial_port *port, unsigned int set,
>  
>  
>  static u32 get_ftdi_divisor(struct tty_struct *tty,
> -						struct usb_serial_port *port)
> +			    struct usb_serial_port *port, speed_t old_baud)
>  {
>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
>  	struct device *dev = &port->dev;
> @@ -1338,6 +1338,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			__func__, priv->custom_divisor, baud);
>  	}
>  
> +	if (!baud)
> +		baud = old_baud;
>  	if (!baud)
>  		baud = 9600;

While not apparent from just looking at the diff, this is only used for
SPD_CUST for and for which you now always pass in 9600 as old_baud.

So just drop this.

>  	switch (priv->chip_type) {
> @@ -1346,8 +1348,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  		if (div_value == (u32)-1) {
>  			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
>  				__func__,  baud);
> -			baud = 9600;
> +			baud = old_baud ? old_baud : 9600;

Please avoid the ternary operator.

>  			div_value = ftdi_sio_baud_to_divisor(baud);

How can setting the old speed fail here? That should not be possible
after you checked for B0, right?

> +			if (div_value == -1) {

Cast for consistency (unless you remove this).

> +				baud = 9600;
> +				div_value = ftdi_sio_baud_to_divisor(baud);
> +			}
>  			div_okay = 0;
>  		}
>  		break;
> @@ -1356,8 +1362,11 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			div_value = ftdi_232am_baud_to_divisor(baud);
>  		} else {
>  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
> -			baud = 9600;
> -			div_value = ftdi_232am_baud_to_divisor(9600);
> +			if (old_baud >= 183 && old_baud <= 3000000)
> +				baud = old_baud;
> +			else
> +				baud = 9600;
> +			div_value = ftdi_232am_baud_to_divisor(baud);
>  			div_okay = 0;
>  		}
>  		break;
> @@ -1379,9 +1388,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			div_value = ftdi_232bm_baud_to_divisor(baud);
>  		} else {
>  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
> -			div_value = ftdi_232bm_baud_to_divisor(9600);
> +			if (old_baud >= 183 && old_baud <= 3000000)
> +				baud = old_baud;
> +			else
> +				baud = 9600;
> +			div_value = ftdi_232bm_baud_to_divisor(baud);
>  			div_okay = 0;
> -			baud = 9600;
>  		}
>  		break;
>  	case FT2232H: /* FT2232H chip */
> @@ -1393,9 +1405,17 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			div_value = ftdi_232bm_baud_to_divisor(baud);
>  		} else {
>  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
> -			div_value = ftdi_232bm_baud_to_divisor(9600);
> +			if (old_baud >= 183 && old_baud < 1200) {
> +				baud = old_baud;
> +				div_value = ftdi_232bm_baud_to_divisor(baud);
> +			} else {
> +				if (old_baud >= 1200 && old_baud <= 12000000)
> +					baud = old_baud;
> +				else
> +					baud = 9600;
> +				div_value = ftdi_2232h_baud_to_divisor(baud);
> +			}

Please try to refactor this so that you don't have to open-code the same
test for baud as well as old_baud.

This function was hard to read already before this series and we should
not make it worse.

>  			div_okay = 0;
> -			baud = 9600;
>  		}
>  		break;
>  	} /* priv->chip_type */
> @@ -1410,7 +1430,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  	return div_value;
>  }
>  
> -static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
> +static int change_speed(struct tty_struct *tty, struct usb_serial_port *port, speed_t old_baud)
>  {
>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
>  	u16 value;
> @@ -1418,7 +1438,7 @@ static int change_speed(struct tty_struct *tty, struct usb_serial_port *port)
>  	u32 index_value;
>  	int rv;
>  
> -	index_value = get_ftdi_divisor(tty, port);
> +	index_value = get_ftdi_divisor(tty, port, old_baud);
>  	value = (u16)index_value;
>  	index = (u16)(index_value >> 16);
>  	if (priv->chip_type == FT2232C || priv->chip_type == FT2232H ||
> @@ -1541,7 +1561,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
>  		if (priv->flags & ASYNC_SPD_MASK)
>  			dev_warn_ratelimited(&port->dev, "use of SPD flags is deprecated\n");
>  
> -		change_speed(tty, port);
> +		change_speed(tty, port, 9600);
>  	}
>  	mutex_unlock(&priv->cfg_lock);
>  	return 0;
> @@ -2790,9 +2810,12 @@ static void ftdi_set_termios(struct tty_struct *tty,
>  		/* Drop RTS and DTR */
>  		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
>  	} else {
> +		speed_t old_baud =
> +			old_termios ? tty_termios_baud_rate(old_termios) : 9600;

Use c_ospeed directly, and avoid the ternary operator.

> +
>  		/* set the baudrate determined before */
>  		mutex_lock(&priv->cfg_lock);
> -		if (change_speed(tty, port))
> +		if (change_speed(tty, port, old_baud))

But perhaps you should just pass in old_termios (or NULL in
set_serial_info()) so that you handle this in one place.

>  			dev_err(ddev, "%s urb failed to set baudrate\n", __func__);
>  		mutex_unlock(&priv->cfg_lock);
>  		/* Ensure RTS and DTR are raised when baudrate changed from 0 */

Johan
