Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BCC4677B3
	for <lists+linux-usb@lfdr.de>; Fri,  3 Dec 2021 13:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380953AbhLCM6a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Dec 2021 07:58:30 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:41265 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380910AbhLCM63 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Dec 2021 07:58:29 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id D68D4580106;
        Fri,  3 Dec 2021 07:55:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 03 Dec 2021 07:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=T/gdT262onMBLVgAhbjdaWayAvj
        FH/5d9zLA6s4pRb8=; b=l5MYBUm/0bcCftj7SVoyFcu9+7nJopx39PzXivMKcro
        O12fZeufKaVmKe3ixmxqRQAKVYYaGlRfUYXxb2gGaH23WJK/8zYNL9vZLom9asy9
        LOTaz9SUjQu2p8rdiKYDMzVuNBSEMdUfM+Mz7RDwsYr3wnhO7/7ZyJkBwcbOnYC1
        6yCz2zwb9LlwK3A4CiUvKtSPoiy4S20Khrve7b9ZrkaFjWlQN80shGoou8U6Fj9j
        om/tmnYMEy/+z+YdQ/Uu3C5ms9otheaIjnZkqKD4OHDOAVgQpiyIhuTphCbpkjPv
        ZgyN7j5Pa4KN5Io+V0cVEgHnclTXYHeIdoNjEvCWvjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=T/gdT2
        62onMBLVgAhbjdaWayAvjFH/5d9zLA6s4pRb8=; b=Y7iL/ufxBhzr3UU275WTXd
        EcyWeESkCtEdaIgZm8kebJ8QEktzUcXleJLXsbluqkiDVWElKG4ER47L/06tLFAp
        UiUS6Bg/VOkJEaB9QBuqy5aUhr7mAk60TRcBa6IYC1hvm4rvVSKS+S93wZelUvME
        0ZCKtR7Qk7ytCcY9hE6Jv2WhTVyuMyge9Nut/t1stCJw0Cjclg8E/BeXRBDDZ9sF
        7zyvNs55cVZ1h2EvrPn65ur/qvwnTr7dFk0zXtuX++34H2HYPv0Xcw0nbc4QQXqp
        zTfaa4/nERwjxCZBVsm7Ywpub0nKhHh705qRxA1oVk/k2Kj64N0WCgXy7JngBpfw
        ==
X-ME-Sender: <xms:qBOqYeW6bDiA6d6_7LFfr2Jflc6icSF45mZ62CJ0pTiFN_GKDrUMIw>
    <xme:qBOqYaltR9-wDATdX33nz3roGekr_dwdez3VDbKt8hrhxFXq2i0jNGcDxJhyqo7vW
    D5KcL2pBTCC2w>
X-ME-Received: <xmr:qBOqYSbfG9v-PHZdhkUQUgLGlS-X_D6izpQz6NGIkmuAj3PAN75090h7-Z-o6YDtI2xwbHGZoDUYQDWjkidATL4x1zTXXnrN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhm
X-ME-Proxy: <xmx:qBOqYVWTRUWDzroRa5BiOKjfqEP798cZ3e2RjKBjPI982FGXSRZNBQ>
    <xmx:qBOqYYndncWPBdG6VRL-Kt5SZ28c7OOXaSMZG8PGw9e86B1-s3enng>
    <xmx:qBOqYacFc4IMeovJWGB_7QntOQ7N-nRxwv2p13gugxA5nV_plt2xYw>
    <xmx:qBOqYRfkSrtQoiJOnGl28Tw8jV3h5RCgTot2_NPwbuy3eF5gMbqTCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 07:55:04 -0500 (EST)
Date:   Fri, 3 Dec 2021 13:55:01 +0100
From:   Greg KH <greg@kroah.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: uvc: use pump call conditionally
Message-ID: <YaoTpQ0nNa+sUQ/y@kroah.com>
References: <20211202005852.3538102-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202005852.3538102-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 02, 2021 at 01:58:52AM +0100, Michael Grzeschik wrote:
> Preparing the usb request is not very expensive, when using
> scatter gather. In that case we can even remove the overhead
> of the extra pump worker and call the pump function directly.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_v4l2.c  |  8 +++++--
>  drivers/usb/gadget/function/uvc_video.c | 28 +++++++++++++++++++------
>  drivers/usb/gadget/function/uvc_video.h |  2 ++
>  3 files changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a2c78690c5c288..020b4adc7840e0 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -169,8 +169,12 @@ uvc_v4l2_qbuf(struct file *file, void *fh, struct v4l2_buffer *b)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (uvc->state == UVC_STATE_STREAMING)
> -		schedule_work(&video->pump);
> +	if (uvc->state == UVC_STATE_STREAMING) {
> +		if (!video->queue.use_sg)
> +			schedule_work(&video->pump);
> +		else
> +			uvcg_video_pump(video);

Wouldn't it be easier to understand this if you flip the if test around:
		if (video->queue.use_sg)
			uvcg_video_pump(video);
		else
			schedule_work(&video->pump);
?

Negagive logic is never fun to read...

Also, are you sure that sg really is not expensive on all systems?  What
did you test this on, and what was the results?

thanks,

greg k-h
