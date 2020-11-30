Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3D52C80B6
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 10:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgK3JOC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 04:14:02 -0500
Received: from z5.mailgun.us ([104.130.96.5]:63097 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727818AbgK3JOC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 04:14:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606727624; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SdkfUaGEnsQaKGcSRPesjSEXe34DQXrgiTsCu4nbNRc=; b=XB8X8wUruZQY51PHmK3gB9hZlwk2ReLZqviI9r3k0awjqXWogsAB7E8NUuurO4+ZC4E9d17J
 a2Fj4RbzNzQ4Gktwe3XApeTmb7/lUCLZJYipacMEzX2j4RPYaDEqgiEojcv+I4hcv8ilcF2B
 8g3Nchlo46g3JPuIs7QQruAxmOo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fc4b7a222377520ee49e427 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 09:13:06
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2ADE1C43462; Mon, 30 Nov 2020 09:13:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C6D5C433ED;
        Mon, 30 Nov 2020 09:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7C6D5C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Mon, 30 Nov 2020 01:13:00 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, peter.chen@nxp.com, willmcvicker@google.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "taehyun.cho" <taehyun.cho@samsung.com>,
        stable <stable@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] USB: gadget: f_fs: add SuperSpeed Plus support
Message-ID: <20201130091259.GB31406@jackp-linux.qualcomm.com>
References: <20201127140559.381351-1-gregkh@linuxfoundation.org>
 <20201127140559.381351-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127140559.381351-5-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 27, 2020 at 03:05:58PM +0100, Greg Kroah-Hartman wrote:
> From: "taehyun.cho" <taehyun.cho@samsung.com>
> 
> Setup the descriptors for SuperSpeed Plus for f_fs. This allows the
> gadget to work properly without crashing at SuperSpeed rates.
> 
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: taehyun.cho <taehyun.cho@samsung.com>
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/gadget/function/f_fs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 046f770a76da..a34a7c96a1ab 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1327,6 +1327,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
>  		struct usb_endpoint_descriptor *desc;
>  
>  		switch (epfile->ffs->gadget->speed) {
> +		case USB_SPEED_SUPER_PLUS:
>  		case USB_SPEED_SUPER:
>  			desc_idx = 2;
>  			break;
> @@ -3222,6 +3223,10 @@ static int _ffs_func_bind(struct usb_configuration *c,
>  	func->function.os_desc_n =
>  		c->cdev->use_os_string ? ffs->interfaces_count : 0;
>  
> +	if (likely(super)) {
> +		func->function.ssp_descriptors =
> +			usb_copy_descriptors(func->function.ss_descriptors);
> +	}
>  	/* And we're done */
>  	ffs_event_add(ffs, FUNCTIONFS_BIND);
>  	return 0;
> -- 

Hi Greg,

FWIW I had sent a very similar patch[1] a while back (twice in fact)
but got no response about it. Looks like Taehyun's patch already went
through Google for this, I assume it must be working on their Android
kernels so I've no problem with you or Felipe taking this instead.

Only one difference with my patch though is mine additionally clears the
func->function.ssp_descriptors member to NULL upon ffs_func_unbind() as
otherwise it could lead to a dangling reference in case the function is
re-bound and userspace does not issue SS descriptors the next time.
Realistically I don't think that's possible, except maybe when fuzzing?

[1] https://patchwork.kernel.org/project/linux-usb/patch/20201027230731.9073-1-jackp@codeaurora.org/

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
