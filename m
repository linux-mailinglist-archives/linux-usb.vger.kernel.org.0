Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FF8414D67
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 17:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236484AbhIVPxp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 11:53:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42681 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233129AbhIVPxp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Sep 2021 11:53:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632325935; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=/S10efTAtIEf6Q6vguThpcfQQAGYu5+Hts2tr4lAAII=; b=e0JYGAQfsJnm7QN7PwdS58tDHgIiqGlFQxFWnEjj47uQgjwWmn2irlA1dEofSzlLO1fb8Yvj
 H+dCRiBQUkqWSwzSe+svwSQbZ84BC8VeoieQF6Yyz3PO70r+eTnKLCrurf1Bwq/lqniXiehT
 Ll9SB0N+lNc6PjrwT78CSa0rZsI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 614b512d507800c880bb36f2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 15:52:13
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5554CC4360D; Wed, 22 Sep 2021 15:52:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 302D4C4338F;
        Wed, 22 Sep 2021 15:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 302D4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Wed, 22 Sep 2021 08:52:08 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     "N. Chen" <takhv1@gmail.com>, linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: uac2/hid gadget issues on Win10 hosts
Message-ID: <20210922155208.GE3515@jackp-linux.qualcomm.com>
References: <CADA1JhOe89Q7iQtb7vwK6utigpKfo+UfuW6o2GdMBMo5rAz7=A@mail.gmail.com>
 <9f719bb8-2a9a-4a97-f25a-660d38a29555@ivitera.com>
 <20210904074032.GC3515@jackp-linux.qualcomm.com>
 <b11414f0-1783-192e-2b79-066dd4c814d0@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b11414f0-1783-192e-2b79-066dd4c814d0@ivitera.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On Mon, Sep 06, 2021 at 02:43:25PM +0200, Pavel Hofman wrote:
> Hi Jack,
> 
> Dne 04. 09. 21 v 9:40 Jack Pham napsal(a):
> > Hi Pavel,
> > 
> > On Mon, Aug 23, 2021 at 03:17:11PM +0200, Pavel Hofman wrote:
> > > There is a problem with max packet size calculation for EP-IN. It has been
> > > discussed here recently
> > > https://www.spinics.net/lists/linux-usb/msg214615.html
> > > 
> > > The simple change in the post above fixed Win10 enumeration for me and
> > > another tester.
> > 
> > I faced the same error on Win10 and also tried the above patch and it
> > worked for me as well.  Are you planning to send a formal patch for it?
> > If so, you can add my
> > 
> > Tested-by: Jack Pham <jackp@codeaurora.org>
> > 
> > > Also, there is a problem with feedback value calculation which Win10 ignores
> > > and keeps sending the same amount of samples. The fix is to send number of
> > > samples per the actual packet, not per microframe for USB2. I have not
> > > posted the attached patch as the whole patchset will most likely be reverted
> > > for 5.15 https://www.spinics.net/lists/linux-usb/msg216042.html and I wanted
> > > to wait till the situation works out to avoid confusion. In the attached
> > > patch just change the ->c_srate_active to ->c_srate (the patch is on top of
> > > more changes for switching between multiple samplerates).
> > 
> > It doesn't look like any of the feedback EP changes got reverted for
> > 5.14 / 5.15-rc1 so it looks like the dust has settled.  Are you going to
> > send the below patch formally as well?
> > 
> 
> Thanks for testing the patch. I did not want to intrude into Jerome's plan.
> However, if Jerome is OK with the attached patch, I can submit it formally
> and continue with submitting more patches for Win10 support.
> 
> Thanks,
> 
> Pavel.

> From 26f5a49c2ddac2d5c52c4072bc756e7d15b47bc8 Mon Sep 17 00:00:00 2001
> From: Pavel Hofman <pavel.hofman@ivitera.com>
> Date: Mon, 6 Sep 2021 14:04:00 +0200
> Subject: [PATCH] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize

Thanks for this patch, it looks good to me.  Can you please send this as
a formal patch in its own mail so Greg & Felipe can properly take it?
Or if you like I can send it (if so I'd need to add my S-o-b as well).

Jack

> Async feedback patches broke enumeration on Windows 10 previously fixed
> by commit 789ea77310f0 ("usb: gadget: f_uac2: always increase endpoint
> max_packet_size by one audio slot").
> 
> While the existing calculation for EP OUT capture for async mode yields
> size+1 frame due to uac2_opts->fb_max > 0, playback side lost the +1
> feature.  Therefore the +1 frame addition must be re-introduced for
> playback. Win10 enumerates the device only when both EP IN and EP OUT
> max packet sizes are (at least) +1 frame.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
> Tested-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index ae29ff2b2b68..bdc7e6e78455 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -584,11 +584,17 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>  		ssize = uac2_opts->c_ssize;
>  	}
>  
> -	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
> +	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC)) {
> +	  // Win10 requires max packet size + 1 frame
>  		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
> -
> -	max_size_bw = num_channels(chmask) * ssize *
> -		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
> +		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
> +		max_size_bw = num_channels(chmask) * ssize *
> +			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))));
> +	} else {
> +		// adding 1 frame provision for Win10
> +		max_size_bw = num_channels(chmask) * ssize *
> +			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))) + 1);
> +	}
>  	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
>  						    max_size_ep));
>  
> -- 
> 2.25.1
> 
