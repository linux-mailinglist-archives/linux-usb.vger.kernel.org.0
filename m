Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F34B2AB31F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 10:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729684AbgKIJGo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 04:06:44 -0500
Received: from smtp.radex.nl ([178.250.146.7]:59290 "EHLO radex-web.radex.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgKIJGo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 04:06:44 -0500
Received: from [192.168.1.158] (cust-178-250-146-69.breedbanddelft.nl [178.250.146.69])
        by radex-web.radex.nl (Postfix) with ESMTPS id 7BA412406A;
        Mon,  9 Nov 2020 10:06:42 +0100 (CET)
From:   Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v3] usb: gadget: audio: Free requests only after callback
To:     Jack Pham <jackp@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
References: <20201029175949.6052-1-jackp@codeaurora.org>
Message-ID: <4ccfcf21-a69c-254a-7cae-edea33826700@gmail.com>
Date:   Mon, 9 Nov 2020 10:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201029175949.6052-1-jackp@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

Op 29-10-2020 om 18:59 schreef Jack Pham:
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
> Reported-and-tested-by: Ferry Toth<fntoth@gmail.com>
> Reviewed-and-tested-by: Peter Chen<peter.chen@nxp.com>
> Signed-off-by: Jack Pham<jackp@codeaurora.org>
> ---
> v3: Fixed incorrect 'req' parameter and added Peter's tag
>
> v2: call free_request() in case of ep_dequeue() failure
>
>   drivers/usb/gadget/function/u_audio.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index e6d32c536781..6e69ccf02c95 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -89,7 +89,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
>   	struct snd_uac_chip *uac = prm->uac;
>   
>   	/* i/f shutting down */
> -	if (!prm->ep_enabled || req->status == -ESHUTDOWN)
> +	if (!prm->ep_enabled) {
> +		usb_ep_free_request(ep, req);
> +		return;
> +	}
> +
> +	if (req->status == -ESHUTDOWN)
>   		return;
>   
>   	/*
> @@ -336,8 +341,9 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
>   
>   	for (i = 0; i < params->req_number; i++) {
>   		if (prm->ureq[i].req) {
> -			usb_ep_dequeue(ep, prm->ureq[i].req);
> -			usb_ep_free_request(ep, prm->ureq[i].req);
> +			if (usb_ep_dequeue(ep, prm->ureq[i].req))
> +				usb_ep_free_request(ep, prm->ureq[i].req);
> +			/* else will be freed in u_audio_iso_complete() */
>   			prm->ureq[i].req = NULL;
>   		}
>   	}

I retested this version on edison. It resolves also another issue where 
dwc3 (in gadget mode) was periodically resetting.

Thanks!

