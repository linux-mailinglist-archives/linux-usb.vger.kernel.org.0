Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D08A3376915
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 18:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbhEGQyV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 12:54:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32166 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236947AbhEGQyV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 12:54:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620406395; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=urugWwmYOkfQqcgvTQ3pT58z8ylFiPxb2DtWctwMUKA=; b=HBZyprNxj0pIHo16cZz7uySI9+XkOBBDYa85IuPxbv5jlk+MlZDeMrePg2i3m1oZ7rZOZ8IT
 ylnPIAzNXEgdMak9x9XzFFz6pRRS3BtMF1b5WdonPr3DHPw32y5v0Fd9KptTphaGI5AMeGS2
 9CY/CZG6lvEy8T74h0z78v0//rQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6095706074f773a6642ceb57 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 07 May 2021 16:52:48
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F818C43148; Fri,  7 May 2021 16:52:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B97CC43143;
        Fri,  7 May 2021 16:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3B97CC43143
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Fri, 7 May 2021 09:52:40 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Li Jun <jun.li@nxp.com>, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, peter.chen@kernel.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com
Subject: Re: [PATCH v3 3/3] usb: core: hcd: use map_urb_for_dma for single
 step set feature urb
Message-ID: <20210507165240.GA29558@jackp-linux.qualcomm.com>
References: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
 <1620370682-10199-3-git-send-email-jun.li@nxp.com>
 <20210507154229.GA776548@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507154229.GA776548@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 07, 2021 at 11:42:29AM -0400, Alan Stern wrote:
> On Fri, May 07, 2021 at 02:58:02PM +0800, Li Jun wrote:
> > Use map_urb_for_dma() to improve the dma map code for single step
> > set feature request urb in test mode.
> > 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> > Change for v3:
> > - Correct the error handling if map_urb_for_dma() fails.
> > 
> > change for v2:
> > - Add this new patch to use map_urb_for_dma API to
> >   replace both of dma_map_single() calls, suggested by
> >   Jack Pham.
> > 
> >  drivers/usb/core/hcd.c | 15 +++++----------
> >  1 file changed, 5 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index d7eb9f179ca6..fa72697f4829 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
> > @@ -2159,16 +2159,11 @@ static struct urb *request_single_step_set_feature_urb(
> >  	usb_get_urb(urb);
> >  	atomic_inc(&urb->use_count);
> >  	atomic_inc(&urb->dev->urbnum);
> > -	urb->setup_dma = dma_map_single(
> > -			hcd->self.sysdev,
> > -			urb->setup_packet,
> > -			sizeof(struct usb_ctrlrequest),
> > -			DMA_TO_DEVICE);
> > -	urb->transfer_dma = dma_map_single(
> > -			hcd->self.sysdev,
> > -			urb->transfer_buffer,
> > -			urb->transfer_buffer_length,
> > -			DMA_FROM_DEVICE);
> > +	if (map_urb_for_dma(hcd, urb, GFP_KERNEL)) {
> > +		usb_put_urb(urb);
> 
> You need to call usb_free_urb() here.

Hi Alan,

Aren't usb_put_urb() and usb_free_urb() identical? The former appears
to just be a macro subsitution of the latter.

Jack

> > +		return NULL;
> > +	}
> > +
> >  	urb->context = done;
> >  	return urb;
> >  }
> > -- 
> > 2.25.1
> > 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
