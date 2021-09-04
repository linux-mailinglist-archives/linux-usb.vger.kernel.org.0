Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8AA400A48
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 09:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233895AbhIDHlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 03:41:46 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25252 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbhIDHll (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Sep 2021 03:41:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630741240; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=c4Ed+mXVjK0FdxSk942kk3XzA1xFm9pqPvFcD0KamV4=; b=TWXcCvpUF2WhsTKDZ2qzE3Qw84Uzkxmh5HyzljCwcoWT8CdD7064GPi4hmu5dwEEf3IJEm/d
 /WW3Y73OXWfrfxINUP/v1gENJIcspNx/ZpnlihWfzyG5wD5fv9L4RSwCx7DSqWlaLkK65igG
 /aL1fBpAYh6KHMhsjEfdfYlJYGQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 613322f540d2129ac1df5b49 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 04 Sep 2021 07:40:37
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F6F9C43460; Sat,  4 Sep 2021 07:40:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 511B1C4338F;
        Sat,  4 Sep 2021 07:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 511B1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Sat, 4 Sep 2021 00:40:32 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     "N. Chen" <takhv1@gmail.com>, linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: uac2/hid gadget issues on Win10 hosts
Message-ID: <20210904074032.GC3515@jackp-linux.qualcomm.com>
References: <CADA1JhOe89Q7iQtb7vwK6utigpKfo+UfuW6o2GdMBMo5rAz7=A@mail.gmail.com>
 <9f719bb8-2a9a-4a97-f25a-660d38a29555@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f719bb8-2a9a-4a97-f25a-660d38a29555@ivitera.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On Mon, Aug 23, 2021 at 03:17:11PM +0200, Pavel Hofman wrote:
> There is a problem with max packet size calculation for EP-IN. It has been
> discussed here recently
> https://www.spinics.net/lists/linux-usb/msg214615.html
> 
> The simple change in the post above fixed Win10 enumeration for me and
> another tester.

I faced the same error on Win10 and also tried the above patch and it
worked for me as well.  Are you planning to send a formal patch for it?
If so, you can add my

Tested-by: Jack Pham <jackp@codeaurora.org>

> Also, there is a problem with feedback value calculation which Win10 ignores
> and keeps sending the same amount of samples. The fix is to send number of
> samples per the actual packet, not per microframe for USB2. I have not
> posted the attached patch as the whole patchset will most likely be reverted
> for 5.15 https://www.spinics.net/lists/linux-usb/msg216042.html and I wanted
> to wait till the situation works out to avoid confusion. In the attached
> patch just change the ->c_srate_active to ->c_srate (the patch is on top of
> more changes for switching between multiple samplerates).

It doesn't look like any of the feedback EP changes got reverted for
5.14 / 5.15-rc1 so it looks like the dust has settled.  Are you going to
send the below patch formally as well?

Thanks!
Jack

> From 91dda032dd0958006a4e0a6f1f51526cefd95a1e Mon Sep 17 00:00:00 2001
> From: Pavel Hofman <pavel.hofman@ivitera.com>
> Date: Thu, 12 Aug 2021 18:03:36 +0200
> Subject: [PATCH 9/9] usb: gadget: u_audio: EP-OUT bInterval in fback frequency
> 
> Tests have revealed that Win10 and OSX UAC2 drivers require
> the feedback frequency to be based on the actual packet
> interval instead of on the USB2 microframe. Otherwise they
> ignore the feedback value. Linux snd-usb-audio driver
> detects the applied bitshift automatically.
> 
> The patch increases the bitshift in feedback frequency
> calculation with EP-OUT bInterval value.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
> ---
>  drivers/usb/gadget/function/u_audio.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
> index a7896fbbab36..c70bdb565153 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -98,11 +98,13 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
>  };
>  
>  static void u_audio_set_fback_frequency(enum usb_device_speed speed,
> +          struct usb_ep *out_ep,
>  					unsigned long long freq,
>  					unsigned int pitch,
>  					void *buf)
>  {
>  	u32 ff = 0;
> +	const struct usb_endpoint_descriptor *ep_desc;
>  
>  	/*
>  	 * Because the pitch base is 1000000, the final divider here
> @@ -130,8 +132,13 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
>  		 * byte fromat (that is Q16.16)
>  		 *
>  		 * ff = (freq << 16) / 8000
> +		 *
> +		 * Win10 and OSX UAC2 drivers require number of samples per packet
> +		 * in order to honor the feedback value.
> +		 * Linux snd-usb-audio detects the used bit shift automatically.
>  		 */
> -		freq <<= 4;
> +		ep_desc = out_ep->desc;
> +		freq <<= 4 + (ep_desc->bInterval - 1);
>  	}
>  
>  	ff = DIV_ROUND_CLOSEST_ULL((freq * pitch), 1953125);
> @@ -263,7 +270,7 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
>  		pr_debug("%s: iso_complete status(%d) %d/%d\n",
>  			__func__, status, req->actual, req->length);
>  
> -	u_audio_set_fback_frequency(audio_dev->gadget->speed,
> +	u_audio_set_fback_frequency(audio_dev->gadget->speed, audio_dev->out_ep,
>  				    params->c_srate_active, prm->pitch,
>  				    req->buf);
>  
> @@ -578,7 +585,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
>  	 * be meauserd at start of playback
>  	 */
>  	prm->pitch = 1000000;
> -	u_audio_set_fback_frequency(audio_dev->gadget->speed,
> +	u_audio_set_fback_frequency(audio_dev->gadget->speed, ep,
>  				    params->c_srate_active, prm->pitch,
>  				    req_fback->buf);
>  
> -- 
> 2.25.1
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
