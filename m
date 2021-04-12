Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7826935D037
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 20:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236562AbhDLSXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 14:23:00 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49491 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhDLSXA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Apr 2021 14:23:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618251762; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=f/o4ov2Jql6eVLjbIpnOsJ8HOvc1P4ttTTS/pqsiqqA=; b=NQwmes9A4YbaeeD0n0m/qxlikgUG/6B+2dSEXEFdPUM0KtasguWNI7TE5hRcYhGfCDn1weYY
 LV6848to+NrxzW5QI8t2L3Ot0FY4sdxCCKMIddADDV8O1710iCsYgwDo/tmOrV86u+Jm0C3K
 8VF4QU06JlmzLiO5iQGX7x4pElc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60748fdcf34440a9d4cbdfc6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 12 Apr 2021 18:22:20
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DFDEFC433C6; Mon, 12 Apr 2021 18:22:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57C13C433C6;
        Mon, 12 Apr 2021 18:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57C13C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Mon, 12 Apr 2021 11:22:16 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Li Jun <jun.li@nxp.com>, peter.chen@kernel.org
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH 1/2] usb: host: move EH SINGLE_STEP_SET_FEATURE
 implementation to core
Message-ID: <20210412182215.GC17922@jackp-linux.qualcomm.com>
References: <1618212134-20416-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618212134-20416-1-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jun & Peter,

On Mon, Apr 12, 2021 at 03:22:13PM +0800, Li Jun wrote:
> From: Peter Chen <peter.chen@nxp.com>
> 
> It is needed at USB Certification test for Embedded Host 2.0, and
> the detail is at CH6.4.1.1 of On-The-Go and Embedded Host Supplement
> to the USB Revision 2.0 Specification. Since other USB 2.0 capable
> host like XHCI also need it, so move it to HCD core.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> Signed-off-by: Jun Li <jun.li@nxp.com>
> ---
>  drivers/usb/core/hcd.c      | 134 ++++++++++++++++++++++++++++++++++
>  drivers/usb/host/ehci-hcd.c |   4 ++
>  drivers/usb/host/ehci-hub.c | 139 ------------------------------------
>  drivers/usb/host/ehci-q.c   |   2 +-
>  include/linux/usb/hcd.h     |  13 +++-
>  5 files changed, 151 insertions(+), 141 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 6119fb41d736..d7eb9f179ca6 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2110,6 +2110,140 @@ int usb_hcd_get_frame_number (struct usb_device *udev)
>  	return hcd->driver->get_frame_number (hcd);
>  }
>  
> +/*-------------------------------------------------------------------------*/
> +#ifdef CONFIG_USB_HCD_TEST_MODE
> +
> +static void usb_ehset_completion(struct urb *urb)
> +{
> +	struct completion  *done = urb->context;
> +
> +	complete(done);
> +}
> +/*
> + * Allocate and initialize a control URB. This request will be used by the
> + * EHSET SINGLE_STEP_SET_FEATURE test in which the DATA and STATUS stages
> + * of the GetDescriptor request are sent 15 seconds after the SETUP stage.
> + * Return NULL if failed.
> + */
> +static struct urb *request_single_step_set_feature_urb(
> +	struct usb_device	*udev,
> +	void			*dr,
> +	void			*buf,
> +	struct completion	*done)
> +{
> +	struct urb *urb;
> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> +	struct usb_host_endpoint *ep;
> +
> +	urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!urb)
> +		return NULL;
> +
> +	urb->pipe = usb_rcvctrlpipe(udev, 0);
> +	ep = (usb_pipein(urb->pipe) ? udev->ep_in : udev->ep_out)
> +				[usb_pipeendpoint(urb->pipe)];
> +	if (!ep) {
> +		usb_free_urb(urb);
> +		return NULL;
> +	}
> +
> +	urb->ep = ep;
> +	urb->dev = udev;
> +	urb->setup_packet = (void *)dr;
> +	urb->transfer_buffer = buf;
> +	urb->transfer_buffer_length = USB_DT_DEVICE_SIZE;
> +	urb->complete = usb_ehset_completion;
> +	urb->status = -EINPROGRESS;
> +	urb->actual_length = 0;
> +	urb->transfer_flags = URB_DIR_IN;
> +	usb_get_urb(urb);
> +	atomic_inc(&urb->use_count);
> +	atomic_inc(&urb->dev->urbnum);
> +	urb->setup_dma = dma_map_single(
> +			hcd->self.sysdev,
> +			urb->setup_packet,
> +			sizeof(struct usb_ctrlrequest),
> +			DMA_TO_DEVICE);
> +	urb->transfer_dma = dma_map_single(
> +			hcd->self.sysdev,
> +			urb->transfer_buffer,
> +			urb->transfer_buffer_length,
> +			DMA_FROM_DEVICE);

Maybe better to replace both of these dma_map_single() calls with
one call to usb_hcd_map_urb_for_dma(hcd, urb, GFP_KERNEL)? 

> +	urb->context = done;
> +	return urb;
> +}

Thanks,
Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
