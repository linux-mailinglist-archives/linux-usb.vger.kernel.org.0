Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9504DA118
	for <lists+linux-usb@lfdr.de>; Tue, 15 Mar 2022 18:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350546AbiCOR1T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Mar 2022 13:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350543AbiCOR1Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 13:27:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187A248E79
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 10:26:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AAADA615A2
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 17:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C896C340EE;
        Tue, 15 Mar 2022 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647365162;
        bh=Ij4oiFcgoMgMx5C5TPSOMZBFORHOmbZ8CQV6BwrUosE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V7JsfvLYHr9M1VDy4puiSX//sOIjTRX5Xh3KFWxNzDgBO7fk5oytj5RZD49FNgAra
         IdJyri8WTDOEgIrz8XzVooPh+y1I6YbXk00NPhXaLD+rUud8U1GUH6MWJzHkVdUKHI
         KcUYAhGa3fLGQJXo2jkchP0lvVTnwY7tqJ/avvPc=
Date:   Tue, 15 Mar 2022 18:25:58 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc:     linux-usb@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Kalle Valo <kvalo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Helmut Schaa <helmut.schaa@googlemail.com>,
        Duncan Sands <duncan.sands@free.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Olav Kongas <ok@artecdesign.ee>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH v2 03/10] usb: rework usb_maxpacket() and deprecate its
 third argument
Message-ID: <YjDMJs/LU/lVAaku@kroah.com>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-1-mailhol.vincent@wanadoo.fr>
 <20220306075524.706660-4-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220306075524.706660-4-mailhol.vincent@wanadoo.fr>
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 06, 2022 at 04:55:17PM +0900, Vincent Mailhol wrote:
> This is a transitional patch with the goal of changing the prototype
> of usb_maxpacket() from:
> | static inline __u16
> | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> 
> into:
> | static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)
> 
> The third argument of usb_maxpacket(): is_out gets removed because it
> can be derived from its second argument: pipe using
> usb_pipeout(pipe). Furthermore, in the current version,
> ubs_pipeout(pipe) is called regardless in order to sanitize the is_out
> parameter.
> 
> In order to make a smooth change, we first deprecate the is_out
> parameter by simply ignoring it (using a variadic function) and will
> remove it latter, once all the callers get updated.
> 
> Finally, the body of the function is reworked in order not to reinvent
> the wheel and just relies on the usb_pipe_endpoint() helper function
> instead.
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
>  include/linux/usb.h | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 200b7b79acb5..588aa7dc3d10 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1969,30 +1969,12 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
>  	return eps[usb_pipeendpoint(pipe)];
>  }
>  
> -/*-------------------------------------------------------------------------*/
> -
> -static inline __u16
> -usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> +static inline u16 usb_maxpacket(struct usb_device *dev, int pipe,
> +				/* int is_out deprecated */ ...)

No need to change from udev->dev, right?

>  {
> -	struct usb_host_endpoint	*ep;
> -	unsigned			epnum = usb_pipeendpoint(pipe);
> -
> -	if (is_out) {
> -		WARN_ON(usb_pipein(pipe));
> -		ep = udev->ep_out[epnum];
> -	} else {
> -		WARN_ON(usb_pipeout(pipe));
> -		ep = udev->ep_in[epnum];
> -	}
> -	if (!ep)
> -		return 0;
> -
> -	/* NOTE:  only 0x07ff bits are for packet size... */
> -	return usb_endpoint_maxp(&ep->desc);
> +	return usb_endpoint_maxp(&usb_pipe_endpoint(dev, pipe)->desc);

The change to use usb_pipe_endpoint() can be done separately.

Let's make these in tiny steps so that we can easily roll things back if
things are not working.

thanks,

greg k-h
