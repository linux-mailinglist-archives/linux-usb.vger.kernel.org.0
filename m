Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A28B40453A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 07:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350876AbhIIFzY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 01:55:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23274 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350865AbhIIFzW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 01:55:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631166853; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=lbt3DvzKOEJW+K5SaD9z+NWWYwdV8DR/Mslk2B3LGk8=; b=YDhGL2Cs260k4ThVIBweEc/n3hRU8C8AP0rtHaCaROVqzu/OGtMDAObb67Cdjzt8DHJ6GwMK
 6AdY9idLKo+f3jp90ODWvv8TEbgMtkLfo8hN3zWdFutf2dSr3IrnmkEhaRIvSwpA4gT3UXOA
 3RruAs5T8BrZQj/oM53nwA0PaEo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6139a17e37cdab60403c2b17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 05:54:06
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6E288C4360C; Thu,  9 Sep 2021 05:54:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11640C4338F;
        Thu,  9 Sep 2021 05:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 11640C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Wed, 8 Sep 2021 22:53:59 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Pawel Laszczak <pawell@cadence.com>
Subject: Re: [PATCH] usb: gadget: f_uac2: Add missing companion descriptor
 for feedback EP
Message-ID: <20210909055359.GA13295@jackp-linux.qualcomm.com>
References: <20210902014317.16775-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902014317.16775-1-jackp@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 01, 2021 at 06:43:17PM -0700, Jack Pham wrote:
> The f_uac2 function fails to enumerate when connected in SuperSpeed
> due to the feedback endpoint missing the companion descriptor.
> We can reuse the ss_epin_desc_comp descriptor and append it behind the
> ss_epin_fback_desc both in the static definition of the ss_audio_desc
> structure as well as its dynamic construction in setup_headers().
> 
> Fixes: 24f779dac8f3 ("usb: gadget: f_uac2/u_audio: add feedback endpoint support")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index 3c34995276e7..5c4917f157e2 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -597,6 +597,7 @@ static struct usb_descriptor_header *ss_audio_desc[] = {
>  	(struct usb_descriptor_header *)&ss_epout_desc_comp,
>  	(struct usb_descriptor_header *)&as_iso_out_desc,
>  	(struct usb_descriptor_header *)&ss_epin_fback_desc,
> +	(struct usb_descriptor_header *)&ss_epin_desc_comp,
>  
>  	(struct usb_descriptor_header *)&std_as_in_if0_desc,
>  	(struct usb_descriptor_header *)&std_as_in_if1_desc,
> @@ -773,8 +774,11 @@ static void setup_headers(struct f_uac2_opts *opts,
>  
>  		headers[i++] = USBDHDR(&as_iso_out_desc);
>  
> -		if (EPOUT_FBACK_IN_EN(opts))
> +		if (EPOUT_FBACK_IN_EN(opts)) {
>  			headers[i++] = USBDHDR(epin_fback_desc);
> +			if (epin_desc_comp)
> +				headers[i++] = USBDHDR(epin_desc_comp);
> +		}
>  	}
>  
>  	if (EPIN_EN(opts)) {

Please hold off on this change... there's another bug with f_uac2 in
SuperSpeed wherein the companion descriptors' wBytesPerInterval field
is currently 0 when they need to actually indicate the number of bytes
intended to be transferred per service interval.  As such this means
the ISOC IN, ISOC OUT and now the ISOC IN feedback should have their
own companion descriptors instead of sharing the same structure.

Will send a V2 series shortly.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
