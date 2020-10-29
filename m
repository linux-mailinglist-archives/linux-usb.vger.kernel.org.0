Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5357E29F0B6
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 17:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgJ2QCt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 12:02:49 -0400
Received: from z5.mailgun.us ([104.130.96.5]:21796 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728560AbgJ2QCt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 12:02:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603987369; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=mwrkVzoPFVrb40b/lFDQN9OPUP730QXZl59lU+BuS4E=; b=gil/00/Odk2laesnc4HHFZWaNWCpLcAuo4kaHJdQO17/vHeyyBtweBByzkeOd2SMtc3ennQq
 tEKzyYwg48lIHDA6u1pfV4r0d08sXL5YZflkNCOufPzlF3jlmQL8ynrEs5VkWWZXtMOZDSW6
 bc18OZJ+ug2MDTDWOA3HxMPIbKs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f9ae777940cfd47f14663b0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Oct 2020 16:01:59
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4822CC43382; Thu, 29 Oct 2020 16:01:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0BA8AC433C9;
        Thu, 29 Oct 2020 16:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0BA8AC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Thu, 29 Oct 2020 09:01:43 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v2] usb: gadget: audio: Free requests only after callback
Message-ID: <20201029160143.GA31406@jackp-linux.qualcomm.com>
References: <20201029062144.3574-1-jackp@codeaurora.org>
 <20201029082424.GA30677@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029082424.GA30677@b29397-desktop>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 29, 2020 at 08:24:52AM +0000, Peter Chen wrote:
> On 20-10-28 23:21:44, Jack Pham wrote:
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
> > v2: call free_request() in case of ep_dequeue() failure
> > 
> >  drivers/usb/gadget/function/u_audio.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> > index e6d32c536781..6e69ccf02c95 100644
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
> > @@ -336,8 +341,9 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
> >  
> >  	for (i = 0; i < params->req_number; i++) {
> >  		if (prm->ureq[i].req) {
> > -			usb_ep_dequeue(ep, prm->ureq[i].req);
> > -			usb_ep_free_request(ep, prm->ureq[i].req);
> > +			if (usb_ep_dequeue(ep, prm->ureq[i].req))
> > +				usb_ep_free_request(ep, req);
> 
> There is a build error for "req", otherwise:
> 
> Reviewed-and-tested-by: Peter Chen <peter.chen@nxp.com>

Sorry, careless mistake!! Thanks for testing, V3 on its way.

Jack

> > +			/* else will be freed in u_audio_iso_complete() */
> >  			prm->ureq[i].req = NULL;
> >  		}
> >  	}
> > -- 
> > 2.24.0
> > 
