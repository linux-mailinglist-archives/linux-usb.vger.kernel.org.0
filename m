Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6610D2E0033
	for <lists+linux-usb@lfdr.de>; Mon, 21 Dec 2020 19:43:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgLUSmn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Dec 2020 13:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgLUSmn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Dec 2020 13:42:43 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083CDC061257
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:42:03 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id b2so10583772edm.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Dec 2020 10:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=rXMVWWeWP8b0dhdZDjBVMDAbUIoGayZw6YAMx3ukLmI=;
        b=jWSndN99Bvk3VRauxG8QJEtCFS1GygumnT2A4MGvgxyJ/vPuHTFoYnaEmLY5wHys7a
         scVDU90qvvJzvi+g1WJdkHSfjQbcDcQBm4fEGlTCoH4KXDMBH3S5j6TSI/c+vvII7+Sd
         kNqnHPaL0yQznGlVnnd9rNT1I8YjtUsQhAOaf9hzh4GNG/jfE3Y0ToJLp8hA1gpNB6pQ
         bBLa0fnXz4tpinnusK/33WoMSCnypiz+Px/zdEpPRDMETXLhJD1OI2ykpCi5s09nv/oC
         YJWPsPkI0+CLdgLk0WVj3xikd9kBCnn6Sa+355Rss5rWSi2+xLDEycMeGYWpBKpovq0s
         Y4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=rXMVWWeWP8b0dhdZDjBVMDAbUIoGayZw6YAMx3ukLmI=;
        b=oVQlHGSZKi37CauMet0L6siBEzv1/aElEzRxGb7TqICGXdVA7kI1rO3sroXqUEnk0v
         BjwSCXjvIUbirxRBi46rIQ3n7wHlbpNE3DwQ2NHY7rw/dk7mGmNAfGkRF7tKaQJql/E/
         zy4h+z7xYaR2uz6saIxv/2AbGVKfgZiAeZvWislym5gb2GBul3pc1suz23MvhCXZG2ZL
         yEnLFudSgRX9YRb5Rrso0Ho3n/hlZwwycVtHtMXeVEEnVMNd7N8Ga5FODXkjUp7PW76s
         7aGDCuBbPHJMRMulP+aqQQNPIf8RsvULseV6TWqXL7kySiIYS9EYBnblPdOn4OBQHb31
         0zHA==
X-Gm-Message-State: AOAM533+5kpIwsD7j4cZrA4iSD8Ty6IJTBZ/x6MI9tozugc38y7RLhZ+
        hPhBfC+69obStFI05qCVhmaFBH123x794VLm
X-Google-Smtp-Source: ABdhPJxW0I7oJBf6vdEdEctjUbKX1vsOxoHqh0i3TGwQXEtiLRnQPQrbV4M8cnTsZup0ja6nafkCXA==
X-Received: by 2002:aa7:c753:: with SMTP id c19mr16619808eds.358.1608567336537;
        Mon, 21 Dec 2020 08:15:36 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id t16sm2129832eje.109.2020.12.21.08.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Dec 2020 08:15:35 -0800 (PST)
References: <20201029175949.6052-1-jackp@codeaurora.org>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jack Pham <jackp@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: audio: Free requests only after callback
In-reply-to: <20201029175949.6052-1-jackp@codeaurora.org>
Message-ID: <1jczz3b0ew.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 21 Dec 2020 17:15:35 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Thu 29 Oct 2020 at 18:59, Jack Pham <jackp@codeaurora.org> wrote:

> As per the kernel doc for usb_ep_dequeue(), it states that "this
> routine is asynchronous, that is, it may return before the completion
> routine runs". And indeed since v5.0 the dwc3 gadget driver updated
> its behavior to place dequeued requests on to a cancelled list to be
> given back later after the endpoint is stopped.
>
> The free_ep() was incorrectly assuming that a request was ready to
> be freed after calling dequeue which results in a use-after-free
> in dwc3 when it traverses its cancelled list. Fix this by moving
> the usb_ep_free_request() call to the callback itself in case the
> ep is disabled.
>
> Fixes: eb9fecb9e69b0 ("usb: gadget: f_uac2: split out audio core")
> Reported-and-tested-by: Ferry Toth <fntoth@gmail.com>
> Reviewed-and-tested-by: Peter Chen <peter.chen@nxp.com>

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
> v3: Fixed incorrect 'req' parameter and added Peter's tag
>
> v2: call free_request() in case of ep_dequeue() failure
>
>  drivers/usb/gadget/function/u_audio.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index e6d32c536781..6e69ccf02c95 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -89,7 +89,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
>  	struct snd_uac_chip *uac = prm->uac;
>  
>  	/* i/f shutting down */
> -	if (!prm->ep_enabled || req->status == -ESHUTDOWN)
> +	if (!prm->ep_enabled) {
> +		usb_ep_free_request(ep, req);
> +		return;
> +	}
> +
> +	if (req->status == -ESHUTDOWN)
>  		return;
>  
>  	/*
> @@ -336,8 +341,9 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
>  
>  	for (i = 0; i < params->req_number; i++) {
>  		if (prm->ureq[i].req) {
> -			usb_ep_dequeue(ep, prm->ureq[i].req);
> -			usb_ep_free_request(ep, prm->ureq[i].req);
> +			if (usb_ep_dequeue(ep, prm->ureq[i].req))
> +				usb_ep_free_request(ep, prm->ureq[i].req);
> +			/* else will be freed in u_audio_iso_complete() */
>  			prm->ureq[i].req = NULL;
>  		}
>  	}

