Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49CC5B6DD6
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 14:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbiIMM7U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 08:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbiIMM7J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 08:59:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40ECF41D20
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 05:59:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 01427B80E5F
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 12:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE40C433C1;
        Tue, 13 Sep 2022 12:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663073941;
        bh=Xzzj7gTqOi+NXgUgstlI5GsjTuTPUzXgqIjHbYFb49c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IYm3bVklqEOK5QhNZ6dVgH1/oALGmA/LCfy6rNvyct6zW99ZKLfwxmeVP5KfFFQSC
         T9P+9bcAJWbA7kCdTN6n/6BaB4YfgbBt3OjP49WpGbH1nhxS+n5xKVEtPt6RxoMkC1
         S9t5KzyhWYramym4EeFRT3OIxvgQd5AQuov4XuCRPwYFbwCyNvyKrkiZacLahgXppu
         004EedGr10Y7BjRSQWKpJBB7chuVQFG0Xa+VWF1gS4dTHxJMYp5V9she8sF9SyMuk7
         zw5TwljwpSp4n5qauMP8VLcF2mp3SvCE6iETpmAp3H4Bq0CJCuyaVtMo496xiQYkcl
         7BHzFGsk/Gbng==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY5VF-0003ex-8H; Tue, 13 Sep 2022 14:59:01 +0200
Date:   Tue, 13 Sep 2022 14:59:01 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: GFP_KERNEL in reset_resume()
Message-ID: <YyB+lTC2GKgL3ZAL@hovoldconsulting.com>
References: <20220907132040.7747-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907132040.7747-1-oneukum@suse.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 07, 2022 at 03:20:40PM +0200, Oliver Neukum wrote:
> All instances of reset_resume() are potential
> parts of the block IO path. Use GFP_NOIO.

Please be more verbose here. I have to think through this every time it
is brought up, and I'm not even sure it's actually an issue any more.

Furthermore, if this is indeed still a problem, then this should be
fixed in a central place using memalloc_noio_save().

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/serial/ch341.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index af01a462cc43..3d4f68d58513 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -137,7 +137,7 @@ static int ch341_control_in(struct usb_device *dev,

And this helper is not only used in the reset path.

>  	r = usb_control_msg_recv(dev, 0, request,
>  				 USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
>  				 value, index, buf, bufsize, DEFAULT_TIMEOUT,
> -				 GFP_KERNEL);
> +				 GFP_NOIO);
>  	if (r) {
>  		dev_err(&dev->dev, "failed to receive control message: %d\n",

Johan
