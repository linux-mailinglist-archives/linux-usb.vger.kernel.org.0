Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B65E29E040
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 02:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391188AbgJ2BN6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 21:13:58 -0400
Received: from z5.mailgun.us ([104.130.96.5]:29878 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730281AbgJ2BN5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 21:13:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603934036; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=3v5giW8N63c8Nh4IYAiZJNSwUxB/hCxFjqckHHRRmrg=; b=r4eejURJB4/pXYFqhgGFz6c9WP9bb6A1GToANuV3UFjAPI2kVoPYxGtNpWUsbrMNTV7LbyJo
 pvrfts9A1mKglBXtTuReC5GPpvybudhPcKurMIWKCZ2OHcOkDzXEdF2IhViFSPI9kPiixHQW
 4hW+g4qjsWCkvhW1uZfixnUZPIs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f99a7d3ff9aaeadc925bc0e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Oct 2020 17:18:11
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07765C43382; Wed, 28 Oct 2020 17:18:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6088C433F0;
        Wed, 28 Oct 2020 17:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C6088C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 28 Oct 2020 10:17:51 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH] usb: gadget: audio: Free requests only after callback
Message-ID: <20201028171738.GA1620@jackp-linux.qualcomm.com>
References: <20201027233138.13712-1-jackp@codeaurora.org>
 <20201028071503.GA21171@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028071503.GA21171@b29397-desktop>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Wed, Oct 28, 2020 at 07:15:31AM +0000, Peter Chen wrote:
> On 20-10-27 16:31:38, Jack Pham wrote:
> > As per the kernel doc for usb_ep_dequeue(), it states that "this
> > routine is asynchronous, that is, it may return before the completion
> > routine runs". And indeed since v5.0 the dwc3 gadget driver updated
> > its behavior to place dequeued requests on to a cancelled list to be
> > given back later after the endpoint is stopped.
> > 
> > The free_ep() was incorrectly assuming that a request was ready to
> > be freed after calling dequeue which results in a use-after-free
> > in dwc3 when it traverses its cancelled list. Fix this by moving
> > the usb_ep_free_request() call to the callback itself in case the
> > ep is disabled.
> > 
> > Fixes: eb9fecb9e69b0 ("usb: gadget: f_uac2: split out audio core")
> > Reported-and-tested-by: Ferry Toth <fntoth@gmail.com>
> > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > ---
> >  drivers/usb/gadget/function/u_audio.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> > index e6d32c536781..a3b557fad1fd 100644
> > --- a/drivers/usb/gadget/function/u_audio.c
> > +++ b/drivers/usb/gadget/function/u_audio.c
> > @@ -89,7 +89,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
> >  	struct snd_uac_chip *uac = prm->uac;
> >  
> >  	/* i/f shutting down */
> > -	if (!prm->ep_enabled || req->status == -ESHUTDOWN)
> > +	if (!prm->ep_enabled) {
> > +		usb_ep_free_request(ep, req);
> > +		return;
> > +	}
> > +
> > +	if (req->status == -ESHUTDOWN)
> >  		return;
> >  
> >  	/*
> > @@ -337,7 +342,6 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
> >  	for (i = 0; i < params->req_number; i++) {
> >  		if (prm->ureq[i].req) {
> >  			usb_ep_dequeue(ep, prm->ureq[i].req);
> > -			usb_ep_free_request(ep, prm->ureq[i].req);
> 
> Then, for normal base, eg, there is no pending request before calling
> free_ep, then, where these uac request will be freed?

We can see in this driver that prm->ureq[i].req != NULL will only be
true from either u_audio_start_capture() or u_audio_start_playback()
where after allocating the request it is immediately queued. So
generally the lifetime of the request is tied to its queued/pending
status.

But you bring up a good point, it's possible usb_ep_queue() could
have failed so we have to take care of the potential memory leak
since the completion wouldn't get called.

We should do free_request() either when ep_queue() fails or when
ep_dequeue() returns error. Do you have any preference? I'm leaning
toward catching it here in free_ep() as it's only one call site to take
care of instead of two ;-)

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
