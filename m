Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A8263AE28
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 17:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbiK1Q5L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 11:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiK1Q5K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 11:57:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA031D672
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 08:57:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB687B80E52
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 16:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE36C433D6;
        Mon, 28 Nov 2022 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669654625;
        bh=nH93I4l+5votS8+4dMHn25UhXbyWMK9z9vLs/v60LhI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SUAf53IYkjgD/yqoCg0H4+Wo0gpJe9jCv8v5edRZ8Ec6TLeQNSm1GeIIm1zKn8WZn
         wj7NlJdPZ28ad578xezgX3T98pHKOK3XDXz9jWz/Rkklp78Vzk/o6JwU7lbnXeSvWz
         dQOrSvKEzEQZA/w8x1EzzTqhWm23Yl1xqVCoezyKdtBaKR5K0OrtNmqN0PK5PA+tj/
         PrQMCUCMEoiV2DpOck7+r/M2G5SAYZMzdVzyO0CbF2qmV9qNP98o8Y5IfmBlmeFiyd
         O5VNEo4y1yJQOTcIPSCi6wk8GNZ0PAkwhPeAtPwtuzE38OBg2yxQLu0UBw+Vn6aUJq
         vzDKxAdxv0V8Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozhRH-00087E-C7; Mon, 28 Nov 2022 17:57:03 +0100
Date:   Mon, 28 Nov 2022 17:57:03 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 5/7] USB: serial: ftdi_sio: Fix baud rate rounding for
 ASYNC_SPD_CUST
Message-ID: <Y4ToX+mRmmDJSu5C@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-6-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-6-pali@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:16PM +0200, Pali Rohár wrote:
> To compute more accurate baud rate when user uses ASYNC_SPD_CUST API,
> use DIV_ROUND_CLOSEST() instead of just rounding down.
> 
> Rationale:
>   Application uses old API, so it computes divisor D for baud rate B.

s/old/deprecated/

>   The driver then tries to compute back the requested baud rate B, but
>   rounds down in the division.
> 
>   Using rounding to closest value instead should increate accuracy here.

typo: increase

> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 1ab6bf48516f..718c86db2900 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1333,7 +1333,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  	if (baud == 38400 &&
>  	    ((priv->flags & ASYNC_SPD_MASK) == ASYNC_SPD_CUST) &&
>  	     (priv->custom_divisor)) {
> -		baud = priv->baud_base / priv->custom_divisor;
> +		baud = DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);
>  		dev_dbg(dev, "%s - custom divisor %d sets baud rate to %d\n",
>  			__func__, priv->custom_divisor, baud);
>  	}

I'm having second thoughts about this one. The SPD_CUST hack should not
be used anymore, but it was supposed to be used to set the hardware
divisor directly. Someone was creative and reinterpreted this for for
the FTDI driver to mean software divisor instead. So instead of
understanding how the hardware determines rates from divisors, you know
needed knowledge of how the FTDI driver happens to work, including that
it rounds down. And now you're changing that again.

Perhaps we should just leave this as is. This interface has been
deprecated for decades and comes with a deprecated warning since several
years. Would be nice to drop it completely instead.

Johan
