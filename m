Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F95565AB8B
	for <lists+linux-usb@lfdr.de>; Sun,  1 Jan 2023 21:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjAAUZN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Jan 2023 15:25:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjAAUZM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 1 Jan 2023 15:25:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DFE263C
        for <linux-usb@vger.kernel.org>; Sun,  1 Jan 2023 12:25:11 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 219A25BA;
        Sun,  1 Jan 2023 21:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672604708;
        bh=OgwMG/f98J6lnJa74DbfxWHfLVLdrLKyd35bV7sH3ss=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=FyqXJC5EBieJqtu7cvhc3LeEAJvK2+OqiBk8lk1BQKraYh7Es0+KNPCzpar7yYZ8T
         xEakpFKK91BIuVrIS+Eu+4egEg5af1ID6yNYiCrqsTeqlyDmk9zKU3dC25loV3f6tW
         WP77BMisJkGgNm6p7X6Re83RlSXL9fGXomz5KGp0=
Message-ID: <f8dd473b-a4f9-29d5-201b-631029dc226d@ideasonboard.com>
Date:   Sun, 1 Jan 2023 20:25:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] usb: gadget: uvc: Rename uvc_control_ep
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
References: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
 <20221205143758.1096914-2-dan.scally@ideasonboard.com>
 <Y6ujGxxWd5ffq7qY@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <Y6ujGxxWd5ffq7qY@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurent - thank you for the review!

On 28/12/2022 01:59, Laurent Pinchart wrote:
> Hi Dan,
>
> Thank you for the patch.
>
> On Mon, Dec 05, 2022 at 02:37:56PM +0000, Daniel Scally wrote:
>> The f_uvc code defines an endpoint named "uvc_control_ep" but it
>> is configured with a non-zero endpoint address and has its
>> bmAttributes flagged as USB_ENDPOINT_XFER_INT - this cannot be the
>> VideoControl interface's control endpoint, as the default endpoint
>> 0 is used for that purpose. This is instead the optional interrupt
>> endpoint that can be contained by a VideoControl interface.
>>
>> Rename the variables to make that clear.
>>
>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> ---
>>   drivers/usb/gadget/function/f_uvc.c | 24 ++++++++++++------------
>>   drivers/usb/gadget/function/uvc.h   |  2 +-
>>   2 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
>> index 6e196e06181e..49b7231742d6 100644
>> --- a/drivers/usb/gadget/function/f_uvc.c
>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> @@ -86,7 +86,7 @@ static struct usb_interface_descriptor uvc_control_intf = {
>>   	.iInterface		= 0,
>>   };
>>   
>> -static struct usb_endpoint_descriptor uvc_control_ep = {
>> +static struct usb_endpoint_descriptor uvc_interrupt_ep = {
>>   	.bLength		= USB_DT_ENDPOINT_SIZE,
>>   	.bDescriptorType	= USB_DT_ENDPOINT,
>>   	.bEndpointAddress	= USB_DIR_IN,
>> @@ -290,14 +290,14 @@ uvc_function_set_alt(struct usb_function *f, unsigned interface, unsigned alt)
>>   		if (alt)
>>   			return -EINVAL;
>>   
>> -		uvcg_info(f, "reset UVC Control\n");
>> -		usb_ep_disable(uvc->control_ep);
>> +		uvcg_info(f, "reset UVC interrupt endpoint\n");
>> +		usb_ep_disable(uvc->interrupt_ep);
> Technically it's called the "VideoControl Interrupt Endpoint", but that
> would be quite long, and given that UVC has a single interrupt endpoint
> in all interfaces, I think the name is fine.
>
>>   
>> -		if (!uvc->control_ep->desc)
>> -			if (config_ep_by_speed(cdev->gadget, f, uvc->control_ep))
>> +		if (!uvc->interrupt_ep->desc)
>> +			if (config_ep_by_speed(cdev->gadget, f, uvc->interrupt_ep))
>>   				return -EINVAL;
>>   
>> -		usb_ep_enable(uvc->control_ep);
>> +		usb_ep_enable(uvc->interrupt_ep);
>>   
>>   		if (uvc->state == UVC_STATE_DISCONNECTED) {
>>   			memset(&v4l2_event, 0, sizeof(v4l2_event));
>> @@ -375,7 +375,7 @@ uvc_function_disable(struct usb_function *f)
>>   	uvc->state = UVC_STATE_DISCONNECTED;
>>   
>>   	usb_ep_disable(uvc->video.ep);
>> -	usb_ep_disable(uvc->control_ep);
>> +	usb_ep_disable(uvc->interrupt_ep);
>>   }
>>   
>>   /* --------------------------------------------------------------------------
>> @@ -511,7 +511,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>>   	 * uvc_iad
>>   	 * uvc_control_intf
>>   	 * Class-specific UVC control descriptors
>> -	 * uvc_control_ep
>> +	 * uvc_interrupt_ep
>>   	 * uvc_control_cs_ep
>>   	 * uvc_ss_control_comp (for SS only)
> Shouldn't you also rename those two variables ?


Yes, I hadn't realised that they were related. That's fixed in the v2.

>
> Ideally I would also rename struct uvc_control_endpoint_descriptor and
> UVC_DT_CONTROL_ENDPOINT_SIZE, but those are exposed to userspace :-(
>
>>   	 * uvc_streaming_intf_alt0
>> @@ -523,7 +523,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>>   	control_size = 0;
>>   	streaming_size = 0;
>>   	bytes = uvc_iad.bLength + uvc_control_intf.bLength
>> -	      + uvc_control_ep.bLength + uvc_control_cs_ep.bLength
>> +	      + uvc_interrupt_ep.bLength + uvc_control_cs_ep.bLength
>>   	      + uvc_streaming_intf_alt0.bLength;
>>   
>>   	if (speed == USB_SPEED_SUPER) {
>> @@ -569,7 +569,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>>   	uvc_control_header->bInCollection = 1;
>>   	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
>>   
>> -	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_ep);
>> +	UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
>>   	if (speed == USB_SPEED_SUPER)
>>   		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_control_comp);
>>   
>> @@ -656,12 +656,12 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
>>   			    (opts->streaming_maxburst + 1));
>>   
>>   	/* Allocate endpoints. */
>> -	ep = usb_ep_autoconfig(cdev->gadget, &uvc_control_ep);
>> +	ep = usb_ep_autoconfig(cdev->gadget, &uvc_interrupt_ep);
>>   	if (!ep) {
>>   		uvcg_info(f, "Unable to allocate control EP\n");
>>   		goto error;
>>   	}
>> -	uvc->control_ep = ep;
>> +	uvc->interrupt_ep = ep;
>>   
>>   	if (gadget_is_superspeed(c->cdev->gadget))
>>   		ep = usb_ep_autoconfig_ss(cdev->gadget, &uvc_ss_streaming_ep,
>> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
>> index 40226b1f7e14..48b71e04c2b1 100644
>> --- a/drivers/usb/gadget/function/uvc.h
>> +++ b/drivers/usb/gadget/function/uvc.h
>> @@ -146,7 +146,7 @@ struct uvc_device {
>>   	} desc;
>>   
>>   	unsigned int control_intf;
>> -	struct usb_ep *control_ep;
>> +	struct usb_ep *interrupt_ep;
>>   	struct usb_request *control_req;
>>   	void *control_buf;
>>   
