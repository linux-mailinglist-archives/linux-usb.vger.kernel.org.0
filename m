Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A76457F50B
	for <lists+linux-usb@lfdr.de>; Sun, 24 Jul 2022 14:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235106AbiGXM0o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 Jul 2022 08:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbiGXM0b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 24 Jul 2022 08:26:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E2C1928C
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 05:26:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4BAE61090
        for <linux-usb@vger.kernel.org>; Sun, 24 Jul 2022 12:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F458C385A5;
        Sun, 24 Jul 2022 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658665578;
        bh=s1Ypgb1wPLf2ZS+wspXeR9vbOwPeKVtUGxU53HxCl9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c8ODdon5Qp79wLBybNMzBpRIa8ejvZEGpgF9tLN5yBQufm/463Bf1t8e+PfSsZipR
         FD6yDDTHayEyt5CA4Q84FyTLh2lOfTQ28Iczqv0mibkV00SKtEh1BExky1DrlCBf6i
         eIWOACoCee/I/Vf4AwJ3ZovdKA+6TnJ3hks4F4oRnp6YLV59OesEDxUi7x0h/B0ooe
         3+RIx10jDYLVTfKF6UMSKoMK8OUUiaTSk2QZbkIJz4qM6v8rSxlmjd87WeAGUk9Ao3
         vVaujdpAgQG3zdXm7yZY4a4G6RN3LYYSkdp9Md8MIrJWP7+6n2oOGgiTubKgotNwr/
         yL+j3SoXFsHNQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oFagl-0006a6-0x; Sun, 24 Jul 2022 14:26:27 +0200
Date:   Sun, 24 Jul 2022 14:26:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 5/7] USB: serial: ftdi_sio: Fix baud rate rounding for
 ASYNC_SPD_CUST
Message-ID: <Yt06c3mxupeNsT5X@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-6-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712115306.26471-6-kabel@kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 01:53:04PM +0200, Marek Behún wrote:
> From: Pali Rohár <pali@kernel.org>
> 
> To compute more accurate baud rate when user uses ASYNC_SPD_CUST API,
> use DIV_ROUND_CLOSEST() instead of just rounding down.
> 
> Rationale:
>   Application uses old API, so it computes divisor D for baud rate B.
> 
>   The driver then tries to compute back the requested baud rate B, but
>   rounds down in the division.
> 
>   Using rounding to closest value instead should increate accuracy here.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index cdbba1a9edd9..5db1293bb7a2 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1317,7 +1317,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  	if (baud == 38400 &&
>  	    ((priv->flags & ASYNC_SPD_MASK) == ASYNC_SPD_CUST) &&
>  	     (priv->custom_divisor)) {
> -		baud = priv->baud_base / priv->custom_divisor;
> +		baud = DIV_ROUND_CLOSEST(priv->baud_base, priv->custom_divisor);

Sure, why not, but this should only be used for the following debug
statement. (See next patch).

>  		dev_dbg(dev, "%s - custom divisor %d sets baud rate to %d\n",
>  			__func__, priv->custom_divisor, baud);
>  	}

Johan
