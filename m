Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DE62F5A7D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 06:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbhANFr6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 00:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbhANFr6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 00:47:58 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E3EC061575
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 21:47:18 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id md11so2500086pjb.0
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 21:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NdJMMT4DtSZ9q/lNgjRXKa/tiOz9gzIv2rKboQ8lGJ8=;
        b=BkZmP0EOnxXq71aZTqLGP4PJxULEc8yJ184CNTjgQ2QVdE/Du+2eB8Yqc5cliTtOdW
         l691JVp/PD7hR59783G14kIVdSf1v62ANxAhjve/kV0OoFwr+zYOaoKAwT70G9yoXDId
         RzE59l5MTKlQXmd9zeEjOgocAOxl/4z8xn41R8ev5kB6id+fFglSmJwFul+yWv6eXi4c
         zFznaKe1Db5Ab835hsA1UnxjcBzZiZfMeijSvAPrPL3pJuyoqE6hsxzOiipS9BF7z451
         W4/p/mKrN+4G06It379z3EYDs0ktylPWcCePNlaBKO3AMo3LiAlF6o1viYfXsheEWxAX
         oGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NdJMMT4DtSZ9q/lNgjRXKa/tiOz9gzIv2rKboQ8lGJ8=;
        b=RAHISUDz/V4EzUgbE0HKvy+N4fuyK+nojoz85plnnq8ElJlNMjAW91b/WxAll5chwu
         nPzY1iXyyHqvwbio0ke32P4r5E+GXHvFafYOnZHEBQ6Wr30fZ0efkTVv+S5JRDsVeXko
         w1gJ5zrIbxrtrTCjsXS3YGY8p7fSCmztWpsYtsfLuoemCngwCpSkwGUNiwTff2KnmrRg
         SZwd81oB+ObOjJ1yjZeaFKWY7bYIxIOCLlzCIizR18UdjbHNlJFSWYWdrbFWcd+vqOhc
         4D+ZTYBgI9G0IdgMM+03SfrdbTN/56kol7yApBVhNGzMMIEffX3cc51AeFXPUs+Ia5Ts
         ur+A==
X-Gm-Message-State: AOAM530hNwU1HdAOYAdy3Tbhqp4ziJQXyDqXCVflTu0++wauc0mO6nVo
        LntUwyrCtIJ+r3zcrWRm/OK9YvryUCc81Q==
X-Google-Smtp-Source: ABdhPJzvf0tuJg42XUc1Bz3aBB/FUnz8N5fRKAAkygabHOQy+fhaYhmEH5VBdD72okD5+usaMCJEDg==
X-Received: by 2002:a17:90b:400c:: with SMTP id ie12mr930556pjb.236.1610603238178;
        Wed, 13 Jan 2021 21:47:18 -0800 (PST)
Received: from b29397-desktop ([194.5.48.251])
        by smtp.gmail.com with ESMTPSA id gp14sm4502972pjb.6.2021.01.13.21.47.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 21:47:17 -0800 (PST)
Date:   Thu, 14 Jan 2021 13:47:08 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 05/11] usb: gadget: composite: Report various SSP
 sublink speeds
Message-ID: <20210114054708.GB18650@b29397-desktop>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <eb0386fdd5d87a858281e8006a72723d3732240f.1610592135.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb0386fdd5d87a858281e8006a72723d3732240f.1610592135.git.Thinh.Nguyen@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-01-13 18:53:14, Thinh Nguyen wrote:
> If a gadget supports SuperSpeed Plus, then it may operate in different
> sublink speeds. For example, if the gadget supports SuperSpeed Plus
> gen2x2, then it can support 2 sublink speeds gen1 and gen2. Inform the
> host of these speeds in the BOS descriptor.
> 

Hi Thinh,

I read USB 3.2 spec: ch9.6.2.5 SuperSpeedPlus USB Device Capability

Symmetric. Rx and Tx Sublinks have the same number of lanes and operate
at the same speed.
Asymmetric. Rx and Tx Sublink have different number of lanes and/or
operate at different speeds.

Why your below cases are all for symmetric, at least, the example 3
is asymmetric, it has different speed for sublink pairs?
Does your below cases are specification defined or user defined?

> Use 1 SSID if the gadget supports up to gen2x1, or not specified:
> - SSID 0 for symmetric RX/TX sublink speed of 10 Gbps.
> 
> Use 1 SSID if the gadget supports up to gen1x2:
> - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> 
> Use 2 SSIDs if the gadget supports up to gen2x2:
> - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.

Why SSID 0 is not 10Gbps?
> - SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.

Besides, would you give me an example what kinds of system design
will use below sublink speed?
- SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
- SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.

Peter


> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
> Changes in v6:
> - Rebase on Greg's usb-testing branch
> - Use gadget->max_ssp_rate instead of all the sublink attribute fields (now
>   removed) in usb_gadget
> - Use the updated macros
> - Update commit message
> Changes in v5:
> - Rebase on Felipe's testing/next branch
> - Changed Signed-off-by email to match From: email header
> Changes in v4:
> - None
> Changes in v3:
> - None
> Changes in v2:
> - None
> 
>  drivers/usb/gadget/composite.c | 80 +++++++++++++++++++++++-----------
>  1 file changed, 54 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index bc17302a9e85..72a9797dbbae 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -735,49 +735,77 @@ static int bos_desc(struct usb_composite_dev *cdev)
>  	/* The SuperSpeedPlus USB Device Capability descriptor */
>  	if (gadget_is_superspeed_plus(cdev->gadget)) {
>  		struct usb_ssp_cap_descriptor *ssp_cap;
> +		u8 ssac = 1;
> +		u8 ssic;
> +		int i;
>  
> -		ssp_cap = cdev->req->buf + le16_to_cpu(bos->wTotalLength);
> -		bos->bNumDeviceCaps++;
> +		if (cdev->gadget->max_ssp_rate == USB_SSP_GEN_2x2)
> +			ssac = 3;
>  
>  		/*
> -		 * Report typical values.
> +		 * Paired RX and TX sublink speed attributes share
> +		 * the same SSID.
>  		 */
> +		ssic = (ssac + 1) / 2 - 1;
>  
> -		le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SSP_CAP_SIZE(1));
> -		ssp_cap->bLength = USB_DT_USB_SSP_CAP_SIZE(1);
> +		ssp_cap = cdev->req->buf + le16_to_cpu(bos->wTotalLength);
> +		bos->bNumDeviceCaps++;
> +
> +		le16_add_cpu(&bos->wTotalLength, USB_DT_USB_SSP_CAP_SIZE(ssac));
> +		ssp_cap->bLength = USB_DT_USB_SSP_CAP_SIZE(ssac);
>  		ssp_cap->bDescriptorType = USB_DT_DEVICE_CAPABILITY;
>  		ssp_cap->bDevCapabilityType = USB_SSP_CAP_TYPE;
>  		ssp_cap->bReserved = 0;
>  		ssp_cap->wReserved = 0;
>  
>  		ssp_cap->bmAttributes =
> -			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, 1) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, 0));
> +			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_ATTRIBS, ssac) |
> +				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_IDS, ssic));
>  
>  		ssp_cap->wFunctionalitySupport =
>  			cpu_to_le16(FIELD_PREP(USB_SSP_MIN_SUBLINK_SPEED_ATTRIBUTE_ID, 0) |
>  				    FIELD_PREP(USB_SSP_MIN_RX_LANE_COUNT, 1) |
>  				    FIELD_PREP(USB_SSP_MIN_TX_LANE_COUNT, 1));
>  
> -		ssp_cap->bmSublinkSpeedAttr[0] =
> -			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
> -					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
> -					       USB_SSP_SUBLINK_SPEED_ST_SYM_RX) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
> -					       USB_SSP_SUBLINK_SPEED_LP_SSP) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
> -
> -		ssp_cap->bmSublinkSpeedAttr[1] =
> -			cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, 0) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
> -					       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST,
> -					       USB_SSP_SUBLINK_SPEED_ST_SYM_TX) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
> -					       USB_SSP_SUBLINK_SPEED_LP_SSP) |
> -				    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, 10));
> +		/*
> +		 * Use 1 SSID if the gadget supports up to gen2x1 or not
> +		 * specified:
> +		 * - SSID 0 for symmetric RX/TX sublink speed of 10 Gbps.
> +		 *
> +		 * Use 1 SSID if the gadget supports up to gen1x2:
> +		 * - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> +		 *
> +		 * Use 2 SSIDs if the gadget supports up to gen2x2:
> +		 * - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> +		 * - SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.
> +		 */
> +		for (i = 0; i < ssac + 1; i++) {
> +			u8 ssid;
> +			u8 mantissa;
> +			u8 type;
> +
> +			ssid = i >> 1;
> +
> +			if (cdev->gadget->max_ssp_rate == USB_SSP_GEN_2x1 ||
> +			    cdev->gadget->max_ssp_rate == USB_SSP_GEN_UNKNOWN)
> +				mantissa = 10;
> +			else
> +				mantissa = 5 << ssid;
> +
> +			if (i % 2)
> +				type = USB_SSP_SUBLINK_SPEED_ST_SYM_TX;
> +			else
> +				type = USB_SSP_SUBLINK_SPEED_ST_SYM_RX;
> +
> +			ssp_cap->bmSublinkSpeedAttr[i] =
> +				cpu_to_le32(FIELD_PREP(USB_SSP_SUBLINK_SPEED_SSID, ssid) |
> +					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSE,
> +						       USB_SSP_SUBLINK_SPEED_LSE_GBPS) |
> +					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_ST, type) |
> +					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LP,
> +						       USB_SSP_SUBLINK_SPEED_LP_SSP) |
> +					    FIELD_PREP(USB_SSP_SUBLINK_SPEED_LSM, mantissa));
> +		}
>  	}
>  
>  	return le16_to_cpu(bos->wTotalLength);
> -- 
> 2.28.0
> 

-- 

Thanks,
Peter Chen

