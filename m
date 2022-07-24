Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E34D57F4E0
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jul 2022 14:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiGXMGf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jul 2022 08:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGXMGe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jul 2022 08:06:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB48513DD1
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 05:06:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF602B80D63
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 12:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57941C3411E;
        Sun, 24 Jul 2022 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658664390;
        bh=dPziVs/SA29OjR05KZMpZ5V4Anm+rH329k7b03P/iuI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JxCwdP2m7EPidW2GCdgAqS8HfvkT7REbhtjrR486mhg7xTmzlhZ36bHTvBpLo7v8V
         Gve118wC8UMeFUMIzTgwczXDe+hjlDZHbtKg/Jfebw/uXRIlj4MkQgzgfPrUMH/0Iy
         i6a/Hi4/GCWutYihI84bcfb2YAKLWLxGwTww6DutShkaKqLaNvNGi5xE83zX/gicjz
         5kwdCP/c+le52sU2StQ+OCskVM6NmuNB9vvSkkc/S4y2k1TjkEq0blOaD2Tn0TY/GU
         bTI0BSqEHSMQGEbNn7q+zrBb/Va0+m/gAJxKn1t4IsNkJzTF0U6M8hiFERGv1kNtpn
         /yanabRY1Dnqw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oFaNa-0006V7-Ub; Sun, 24 Jul 2022 14:06:39 +0200
Date:   Sun, 24 Jul 2022 14:06:38 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <Yt01zjWx7VTWnQo9@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-4-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712115306.26471-4-kabel@kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 01:53:02PM +0200, Marek Behún wrote:
> From: Pali Rohár <pali@kernel.org>
> 
> In preparation for following changes, extract divisor code for SIO chip
> into new function ftdi_sio_baud_to_divisor(), as is done for other
> chips.
> 
> No functional change.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 36 ++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 717b97f4e094..5b109714612f 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1150,6 +1150,23 @@ static struct usb_serial_driver * const serial_drivers[] = {
>   * ***************************************************************************
>   */
>  
> +static int ftdi_sio_baud_to_divisor(int baud)
> +{
> +	switch (baud) {
> +	case 300: return ftdi_sio_b300;
> +	case 600: return ftdi_sio_b600;
> +	case 1200: return ftdi_sio_b1200;
> +	case 2400: return ftdi_sio_b2400;
> +	case 4800: return ftdi_sio_b4800;
> +	case 9600: return ftdi_sio_b9600;
> +	case 19200: return ftdi_sio_b19200;
> +	case 38400: return ftdi_sio_b38400;
> +	case 57600: return ftdi_sio_b57600;
> +	case 115200: return ftdi_sio_b115200;
> +	default: return -1;

Please add a line break after the colons.

Adding another enum for the invalid value might be preferable.

> +	}
> +}
> +
>  static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
>  {
>  	unsigned short int divisor;
> @@ -1286,7 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  {
>  	struct ftdi_private *priv = usb_get_serial_port_data(port);
>  	struct device *dev = &port->dev;
> -	u32 div_value = 0;
> +	int div_value = 0;

And don't change the type here.

>  	int div_okay = 1;
>  	int baud;
>  
> @@ -1309,23 +1326,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  		baud = 9600;
>  	switch (priv->chip_type) {
>  	case SIO: /* SIO chip */
> -		switch (baud) {
> -		case 300: div_value = ftdi_sio_b300; break;
> -		case 600: div_value = ftdi_sio_b600; break;
> -		case 1200: div_value = ftdi_sio_b1200; break;
> -		case 2400: div_value = ftdi_sio_b2400; break;
> -		case 4800: div_value = ftdi_sio_b4800; break;
> -		case 9600: div_value = ftdi_sio_b9600; break;
> -		case 19200: div_value = ftdi_sio_b19200; break;
> -		case 38400: div_value = ftdi_sio_b38400; break;
> -		case 57600: div_value = ftdi_sio_b57600;  break;
> -		case 115200: div_value = ftdi_sio_b115200; break;
> -		} /* baud */
> -		if (div_value == 0) {
> +		div_value = ftdi_sio_baud_to_divisor(baud);
> +		if (div_value == -1) {
>  			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
>  				__func__,  baud);
> -			div_value = ftdi_sio_b9600;
>  			baud = 9600;
> +			div_value = ftdi_sio_baud_to_divisor(baud);
>  			div_okay = 0;
>  		}
>  		break;

Johan
