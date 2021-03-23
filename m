Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8703457C1
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 07:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhCWGZ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 02:25:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:18207 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCWGZu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Mar 2021 02:25:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616480750; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=xAtJAW22wshljF0u7U/N/2tn/kZSmDX0sMzuBmxR0jk=; b=MY5JIz7EzpZeYqS6+nIKQQGFgKs1LOOBVOHAw0IMvLZYy5FiVc2bS/TE+m7EMWpg//EdyyJK
 Vj0f3U95TZqJp+0B6BduBwURRdvXl2/1Ozdb+4L5hkp34gLU/JHDeCwZMuIDMVD2XBQYBig6
 g1sU/XzecqRM9RF1EbP/tDmishk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 605989ed5d70193f887c25d0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Mar 2021 06:25:49
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7A62C43461; Tue, 23 Mar 2021 06:25:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0002C433CA;
        Tue, 23 Mar 2021 06:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0002C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Mon, 22 Mar 2021 23:25:42 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH] usb: gadget: Stall OS descriptor request for unsupported
 functions
Message-ID: <20210323062542.GA17922@jackp-linux.qualcomm.com>
References: <1616464217-2650-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616464217-2650-1-git-send-email-wcheng@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Wesley,

On Mon, Mar 22, 2021 at 06:50:17PM -0700, Wesley Cheng wrote:
> From: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> 
> Hosts which request "OS descriptors" from gadgets do so during
> the enumeration phase and before the configuration is set with
> SET_CONFIGURATION. Composite driver supports OS descriptor
> handling in composite_setup function. This requires to pass
> signature field, vendor code, compatibleID and subCompatibleID
> from user space.
> 
> For USB compositions that contain functions which don't implement os
> descriptors, Windows is sending vendor specific requests for os
> descriptors and composite driver handling this request with invalid
> data. With this invalid info host resetting the bus and never
> selecting the configuration and leading enumeration issue.
> 
> Fix this by bailing out from the OS descriptor setup request
> handling if the functions does not have OS descriptors compatibleID.
> 
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/gadget/composite.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 72a9797..473edda6 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -1945,6 +1945,12 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>  				buf[6] = w_index;
>  				/* Number of ext compat interfaces */
>  				count = count_ext_compat(os_desc_cfg);
> +				/*
> +				 * Bailout if device does not
> +				 * have ext_compat interfaces.
> +				 */
> +				if (count == 0)
> +					break;
>  				buf[8] = count;
>  				count *= 24; /* 24 B/ext compat desc */
>  				count += 16; /* header */

Do we still need this fix? IIRC we had this change in our downstream
kernel to fix the case when dynamically re-configuring ConfigFS, i.e.
changing the composition of functions wherein none of the interfaces
support OS Descriptors, so this causes count_ext_compat() to return
0 and results in the issue described in $SUBJECT.

But I think this is more of a problem of an improperly configured
ConfigFS gadget. If userspace instead removes the config from the
gadget's os_desc subdirectory that should cause cdev->os_desc_config to
be set to NULL and hence composite_setup() should never enter this
handling at all, right?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
