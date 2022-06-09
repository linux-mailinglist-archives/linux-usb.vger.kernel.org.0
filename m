Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F01D544BF4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 14:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234862AbiFIM2G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 08:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238220AbiFIM17 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 08:27:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7AF13F69
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 05:27:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A6024B82D59
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 12:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2D9C34114;
        Thu,  9 Jun 2022 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654777674;
        bh=4zWmIuzaveCjfGj6bsFDRPiaXBvKYmrvO1tUI/f7e6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FLGFPKYc27kjyD0Letb08zbBarWFqOwamd7dMXb/z9HrePQCszBtqAzwA/N7rn6uF
         cTW8D6sEZJBddGKPTgnQwi9jD6J+v1XwsOEJU7M7wVlPtqZCfOomTgFklFHYmw6tbs
         wbvDym5DOtZrtbvAK8La0W49cgx4ffBG9vUxbjQRJGA/Skm7Btgtx8BdQe+nE+7Kt0
         Lq/f/tc86meYBKR3u0c7jd64PSo8lfcP1YzZc+53uri3W1iE7lWcmBHHgRQl/ifSun
         W6vNyfuJ0Jf72IZAs6bDwrbHZbpHs++tgeF45GtjN44SYIwSrovPwS86kW0oc41wwk
         IKCG41d/jNLiQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nzHGQ-0002Jj-9j; Thu, 09 Jun 2022 14:27:50 +0200
Date:   Thu, 9 Jun 2022 14:27:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Carlo Lobrano <c.lobrano@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Daniele Palmas <dnlplm@gmail.com>
Subject: Re: [PATCH v3] USB: serial: option: Add Telit LE910Cx 0x1250
 composition
Message-ID: <YqHnRmX3+uiobENy@hovoldconsulting.com>
References: <20220531102301.13435-1-c.lobrano@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220531102301.13435-1-c.lobrano@gmail.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 31, 2022 at 12:23:01PM +0200, Carlo Lobrano wrote:
> Add support for the following Telit LE910Cx composition:
> 
> 0x1250: rmnet, tty, tty, tty, tty
> 
> Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>
> ---
> v3: - fix subject prefix and modem name (s/LN910Cx/LE910Cx)
>     - more descriptive e-mail content
> v2: use RSVD in place of NCTRL for interface 0 (rmnet)

Thanks for the update (and thanks for reviewing, Daniele).

You forgot to include the lsusb output in v2 and v3 but I found it here:

	https://lore.kernel.org/r/20220528073445.50066-1-c.lobrano@gmail.com

>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 152ad882657d..cd9aa61ec801 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1275,6 +1275,8 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>  	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),	/* Telit LE910Cx (RNDIS) */
>  	  .driver_info = NCTRL(2) | RSVD(3) },
> +	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1250, 0xff),	/* Telit LE910Cx (rmnet) */
> +	  .driver_info = RSVD(0) },

Looks you can match on the interface SubClass and Protocol using
USB_DEVICE_INFO() and avoid using RSVD() here which is preferred when
possible.

>  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
>  	  .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>  	{ USB_DEVICE(TELIT_VENDOR_ID, 0x1261),

Care to respin a v4? You can keep Daniele's reviewed-by tag when
resending (i.e. include it before your SoB).

Johan
