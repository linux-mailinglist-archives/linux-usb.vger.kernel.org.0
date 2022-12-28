Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3A4A657202
	for <lists+linux-usb@lfdr.de>; Wed, 28 Dec 2022 03:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbiL1CJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Dec 2022 21:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbiL1CJd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Dec 2022 21:09:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67FFEBE11
        for <linux-usb@vger.kernel.org>; Tue, 27 Dec 2022 18:09:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 970C925B;
        Wed, 28 Dec 2022 03:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672193370;
        bh=fEyXzGizlZD7fXSpjsuJsiZRyfszhpF9+JLhw6oTE8Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dv88RnkTz5yoImhVLPiyz47KzHcsCb1HPJQ/FlXlur8VhLYcBHhekOoTabWh8EDo1
         zYKv4ZnPpy+k8jTr9ubo/dyNnJNkU90EBGv1lrkD2Uxn3pYZWs78mAHBQwNLDkz/FV
         oXk7cWlNbfLEL1dKsOStvZfprRbwIXgpa/kJ0Zw4=
Date:   Wed, 28 Dec 2022 04:09:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 3/3] usb: gadget: uvc: Allow disabling of interrupt
 endpoint
Message-ID: <Y6ulV6idkEeVgdXr@pendragon.ideasonboard.com>
References: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
 <20221205143758.1096914-4-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221205143758.1096914-4-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Mon, Dec 05, 2022 at 02:37:58PM +0000, Daniel Scally wrote:
> The f_uvc code includes an interrupt endpoint against the VideoControl
> interface. According to section 2.4.2 of the UVC specification however
> this endpoint is optional in at least some cases:
> 
> "This endpoint is optional, but may be mandatory under certain
> conditions"
> 
> The conditions enumerated are whether...
> 
> 1. The device supports hardware triggers
> 2. The device implements any AutoUpdate controls
> 3. The device implements any Asynchronous controls
> 
> As all of those things are implementation dependent, this endpoint
> might be unnecessary for some users. Check whether the user has
> requested it be disable via configfs and don't proceed with its

s/disable/disabled/

> instantiation if so.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 42 ++++++++++++++++++-----------
>  drivers/usb/gadget/function/uvc.h   |  1 +
>  2 files changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 49b7231742d6..76ec84d3a5fd 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -79,7 +79,7 @@ static struct usb_interface_descriptor uvc_control_intf = {
>  	.bDescriptorType	= USB_DT_INTERFACE,
>  	.bInterfaceNumber	= UVC_INTF_VIDEO_CONTROL,
>  	.bAlternateSetting	= 0,
> -	.bNumEndpoints		= 1,
> +	.bNumEndpoints		= 0,
>  	.bInterfaceClass	= USB_CLASS_VIDEO,
>  	.bInterfaceSubClass	= UVC_SC_VIDEOCONTROL,
>  	.bInterfaceProtocol	= 0x00,
> @@ -290,14 +290,16 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
>  		if (alt)
>  			return -EINVAL;
>  
> -		uvcg_info(f, "reset UVC interrupt endpoint\n");
> -		usb_ep_disable(uvc->interrupt_ep);
> +		if (!uvc->disable_interrupt_ep) {
> +			uvcg_info(f, "reset UVC interrupt endpoint\n");
> +			usb_ep_disable(uvc->interrupt_ep);
>  
> -		if (!uvc->interrupt_ep->desc)
> -			if (config_ep_by_speed(cdev->gadget, f, uvc->interrupt_ep))
> -				return -EINVAL;
> +			if (!uvc->interrupt_ep->desc)
> +				if (config_ep_by_speed(cdev->gadget, f, uvc->interrupt_ep))

Line wrap would be nice.

				if (config_ep_by_speed(cdev->gadget, f,
						       uvc->interrupt_ep))

> +					return -EINVAL;
>  
> -		usb_ep_enable(uvc->interrupt_ep);
> +			usb_ep_enable(uvc->interrupt_ep);
> +		}
>  
>  		if (uvc->state == UVC_STATE_DISCONNECTED) {
>  			memset(&v4l2_event, 0, sizeof(v4l2_event));
> @@ -375,7 +377,8 @@ uvc_function_disable(struct usb_function *f)
>  	uvc->state = UVC_STATE_DISCONNECTED;
>  
>  	usb_ep_disable(uvc->video.ep);
> -	usb_ep_disable(uvc->interrupt_ep);
> +	if (!uvc->disable_interrupt_ep)
> +		usb_ep_disable(uvc->interrupt_ep);
>  }
>  
>  /* --------------------------------------------------------------------------
> @@ -523,8 +526,10 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>  	control_size = 0;
>  	streaming_size = 0;
>  	bytes = uvc_iad.bLength + uvc_control_intf.bLength
> -	      + uvc_interrupt_ep.bLength + uvc_control_cs_ep.bLength
> -	      + uvc_streaming_intf_alt0.bLength;
> +	       + uvc_control_cs_ep.bLength + uvc_streaming_intf_alt0.bLength;

Wrong indentation.

> +
> +	if (!uvc->disable_interrupt_ep)
> +		bytes += uvc_interrupt_ep.bLength;
>  
>  	if (speed == USB_SPEED_SUPER) {
>  		bytes += uvc_ss_control_comp.bLength;
> @@ -569,7 +574,8 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>  	uvc_control_header->bInCollection = 1;
>  	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
>  
> -	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
> +	if (!uvc->disable_interrupt_ep)
> +		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
>  	if (speed == USB_SPEED_SUPER)
>  		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_control_comp);

This is the companion descriptor for the interrupt endpoint, it should
only be included if the interrupt endpoint is enabled. Same for
uvc_control_cs_ep.

>  
> @@ -656,12 +662,16 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>  			    (opts->streaming_maxburst + 1));
>  
>  	/* Allocate endpoints. */
> -	ep = usb_ep_autoconfig(cdev->gadget, &uvc_interrupt_ep);
> -	if (!ep) {
> -		uvcg_info(f, "Unable to allocate control EP\n");
> -		goto error;
> +	if (!opts->disable_interrupt_ep) {
> +		ep = usb_ep_autoconfig(cdev->gadget, &uvc_interrupt_ep);
> +		if (!ep) {
> +			uvcg_info(f, "Unable to allocate interrupt EP\n");
> +			goto error;
> +		}
> +		uvc->interrupt_ep = ep;
> +		uvc_control_intf.bNumEndpoints = 1;
>  	}
> -	uvc->interrupt_ep = ep;
> +	uvc->disable_interrupt_ep = opts->disable_interrupt_ep;

Given that you always test for !uvc->disable_interrupt_ep, how about
naming this enable_interrupt_ep and switching the tests ? I think
positive logic is more readable that double negation. I would then move
this line up, in order to test uvc->enable_interrupt_ep instead of
!opts->disable_interrupt_ep above.

>  
>  	if (gadget_is_superspeed(c->cdev->gadget))
>  		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 48b71e04c2b1..0d0ef9b90b1a 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -149,6 +149,7 @@ struct uvc_device {
>  	struct usb_ep *interrupt_ep;
>  	struct usb_request *control_req;
>  	void *control_buf;
> +	bool disable_interrupt_ep;
>  
>  	unsigned int streaming_intf;
>  

-- 
Regards,

Laurent Pinchart
