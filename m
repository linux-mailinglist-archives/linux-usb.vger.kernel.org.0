Return-Path: <linux-usb+bounces-1843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536367CD48D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 08:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04DB228146B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 06:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902EB6AD6;
	Wed, 18 Oct 2023 06:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mtSZR4fL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A50D2FF
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 06:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC369C433C7;
	Wed, 18 Oct 2023 06:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697610989;
	bh=ICMIHrTBTAHgmxtuCCuVYOVydvK715mq+jYj66A+810=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtSZR4fLQJbjYrqBZk8divJ2UoNW/TtBu06ULtJcOKJrECrZ6p8TwC4VvWcwkLqb9
	 6JhwhnmVC94+Sfly2I2YPO3xxU5qCCLuJMyC5R4nELTYfB6ts5pLcj4H2rq4j2nOzb
	 IVxcqEv5czaya8cny6yfxYQWznFkvgB6PvDf5Wrs=
Date: Wed, 18 Oct 2023 08:36:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Yi <be286@163.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_uac1: add adaptive sync support for
 capture
Message-ID: <2023101804-humiliate-extruding-c5b1@gregkh>
References: <20231018043907.1206817-1-be286@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018043907.1206817-1-be286@163.com>

On Wed, Oct 18, 2023 at 12:39:07PM +0800, Charles Yi wrote:
> UAC1 has it's own freerunning clock and can update Host about
> real clock frequency through feedback endpoint so Host can align
> number of samples sent to the UAC1 to prevent overruns/underruns.
> 
> Change UAC1 driver to make it configurable through additional
> 'c_sync' configfs file.
> 
> Default remains 'asynchronous' with possibility to switch it
> to 'adaptive'.
> 
> Signed-off-by: Charles Yi <be286@163.com>
> ---
>  drivers/usb/gadget/function/f_uac1.c | 30 ++++++++++++++++++++++++++++
>  drivers/usb/gadget/function/u_uac1.h |  2 ++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
> index 6f0e1d803dc2..7a6fcb40bb46 100644
> --- a/drivers/usb/gadget/function/f_uac1.c
> +++ b/drivers/usb/gadget/function/f_uac1.c
> @@ -33,6 +33,8 @@
>  #define FUOUT_EN(_opts) ((_opts)->c_mute_present \
>  			|| (_opts)->c_volume_present)
>  
> +#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
> +
>  struct f_uac1 {
>  	struct g_audio g_audio;
>  	u8 ac_intf, as_in_intf, as_out_intf;
> @@ -227,6 +229,16 @@ static struct uac_iso_endpoint_descriptor as_iso_out_desc = {
>  	.wLockDelay =		cpu_to_le16(1),
>  };
>  
> +static struct usb_endpoint_descriptor as_fback_ep_desc = {
> +	.bLength = USB_DT_ENDPOINT_SIZE,
> +	.bDescriptorType = USB_DT_ENDPOINT,
> +
> +	.bEndpointAddress = USB_DIR_IN,
> +	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
> +	.wMaxPacketSize = cpu_to_le16(3),
> +	.bInterval = 1,
> +};
> +
>  static struct uac_format_type_i_discrete_descriptor as_in_type_i_desc = {
>  	.bLength =		0, /* filled on rate setup */
>  	.bDescriptorType =	USB_DT_CS_INTERFACE,
> @@ -280,6 +292,7 @@ static struct usb_descriptor_header *f_audio_desc[] = {
>  
>  	(struct usb_descriptor_header *)&as_out_ep_desc,
>  	(struct usb_descriptor_header *)&as_iso_out_desc,
> +	(struct usb_descriptor_header *)&as_fback_ep_desc,
>  
>  	(struct usb_descriptor_header *)&as_in_interface_alt_0_desc,
>  	(struct usb_descriptor_header *)&as_in_interface_alt_1_desc,
> @@ -1107,6 +1120,9 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>  		f_audio_desc[i++] = USBDHDR(&as_out_type_i_desc);
>  		f_audio_desc[i++] = USBDHDR(&as_out_ep_desc);
>  		f_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
> +		if (EPOUT_FBACK_IN_EN(opts)) {
> +			f_audio_desc[i++] = USBDHDR(&as_fback_ep_desc);
> +		}
>  	}
>  	if (EPIN_EN(opts)) {
>  		f_audio_desc[i++] = USBDHDR(&as_in_interface_alt_0_desc);
> @@ -1317,6 +1333,12 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>  		ac_header_desc->baInterfaceNr[ba_iface_id++] = status;
>  		uac1->as_out_intf = status;
>  		uac1->as_out_alt = 0;
> +
> +		if (EPOUT_FBACK_IN_EN(audio_opts)) {
> +			as_out_ep_desc.bmAttributes =
> +			USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
> +			as_out_interface_alt_1_desc.bNumEndpoints++;
> +		}
>  	}
>  
>  	if (EPIN_EN(audio_opts)) {
> @@ -1354,6 +1376,12 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>  			goto err_free_fu;
>  		audio->out_ep = ep;
>  		audio->out_ep->desc = &as_out_ep_desc;
> +		if (EPOUT_FBACK_IN_EN(audio_opts)) {
> +			audio->in_ep_fback = usb_ep_autoconfig(gadget, &as_fback_ep_desc);
> +			if (!audio->in_ep_fback) {
> +				goto err_free_fu;
> +			}
> +		}
>  	}
>  
>  	if (EPIN_EN(audio_opts)) {
> @@ -1685,6 +1713,8 @@ static struct usb_function_instance *f_audio_alloc_inst(void)
>  
>  	opts->req_number = UAC1_DEF_REQ_NUM;
>  
> +	opts->c_sync = UAC1_DEF_CSYNC;
> +
>  	snprintf(opts->function_name, sizeof(opts->function_name), "AC Interface");
>  
>  	return &opts->func_inst;
> diff --git a/drivers/usb/gadget/function/u_uac1.h b/drivers/usb/gadget/function/u_uac1.h
> index f7a616760e31..c6e2271e8cdd 100644
> --- a/drivers/usb/gadget/function/u_uac1.h
> +++ b/drivers/usb/gadget/function/u_uac1.h
> @@ -27,6 +27,7 @@
>  #define UAC1_DEF_MAX_DB		0		/* 0 dB */
>  #define UAC1_DEF_RES_DB		(1*256)	/* 1 dB */
>  
> +#define UAC1_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
>  
>  struct f_uac1_opts {
>  	struct usb_function_instance	func_inst;
> @@ -56,6 +57,7 @@ struct f_uac1_opts {
>  
>  	struct mutex			lock;
>  	int				refcnt;
> +	int				c_sync;
>  };
>  
>  #endif /* __U_UAC1_H */
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

