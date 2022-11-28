Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D421D63ABF7
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 16:10:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbiK1PKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 10:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiK1PKM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 10:10:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827991F9F9
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 07:10:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19F5D6120B
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 15:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D4CC433D6;
        Mon, 28 Nov 2022 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669648210;
        bh=wmE4sjEsTAqWgOwzwwmZxoinoddJV8/5M7QZzwsUSgA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qnrq6/Uo48yK0w+hiWpnVsF1agX03Wmui5zBuWiYpGaS+EyDCdRuyPnIeEzUk8kYE
         DqiA5O+igxG3QFo9ZB7Y0WzVVt//9yrrthSsdK6oNZwavulmz65npEEi0xZOpz710+
         JUfTGgIf7QrBq5uBpy8GLvpIDu4BaaS5s6ebDM7iAi7dk07J825ClOPQferKFl/fle
         GiRf/6OcAcIxT2HUEqYopWOUvqrvtjxEYbTyzxLXEnYetD1ILvzJZovm7TMlwRMimC
         dqzr3wjhHWjLYmQrN03mRXxBvTXQyKfj6lBsbE4BU2pql3iiDSYlbun+6M2zg9qkKv
         8D9ZmejQnReGQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozflo-0002ZZ-Cy; Mon, 28 Nov 2022 16:10:08 +0100
Date:   Mon, 28 Nov 2022 16:10:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <Y4TPUIYeclH+KCfl@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-4-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-4-pali@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:14PM +0200, Pali Rohár wrote:
> In preparation for following changes, extract divisor code for SIO chip
> into new function ftdi_sio_baud_to_divisor(), as is done for other
> chips.

Please spell out what you mean by "following changes".

You're also now using the new helper to set the fallback rate, which
should at least be mentioned as it looks like a separate and unnecessary
change currently.

> No functional change.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 45 ++++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index bfa601fc14fe..fe8a7c5fa0e9 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c

> @@ -1314,23 +1342,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
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
> +		if (div_value == (u32)-1) {
>  			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
>  				__func__,  baud);
> -			div_value = ftdi_sio_b9600;
>  			baud = 9600;
> +			div_value = ftdi_sio_baud_to_divisor(baud);
>  			div_okay = 0;
>  		}
>  		break;

This one too needs to be rebased, but you'll notice that.

Johan
