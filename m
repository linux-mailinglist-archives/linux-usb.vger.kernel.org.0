Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7361631D57
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiKUJwa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbiKUJwC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:52:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154FD17410
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:51:38 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5F7674C;
        Mon, 21 Nov 2022 10:51:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669024296;
        bh=6kgL2dVSNymd04Mm216gOga6Rvb/jMPnk+F1EzLQS5U=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=AUc9jSUcojlm0zi/1hUwszrnafTm4QnLxE+U/gnsw+TC19aq21iKnRYIawESR/PaP
         DCf4f2X/2E9bUEybufMgPHDtVWTxYzJXBTXcxaLA7Ya+e6Sf87SBm+pk7ER0csJt1o
         q3bNSgwkRvSlPdnfu+gpWumT30NUcffnQ7dM9ByM=
Message-ID: <090c49e0-3f6c-52f4-d614-0d095eb78c1c@ideasonboard.com>
Date:   Mon, 21 Nov 2022 09:51:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/9] usb: gadget: uvc: Copy XU descriptors during
 .bind()
Content-Language: en-US
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-5-dan.scally@ideasonboard.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221121092517.225242-5-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all

On 21/11/2022 09:25, Daniel Scally wrote:
> Now that extension unit support is available through configfs we need
> to copy the descriptors for the XUs during uvc_function_bind() so that
> they're exposed to the usb subsystem.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v2:
>
> 	- none
>
>   drivers/usb/gadget/function/f_uvc.c | 35 +++++++++++++++++++++++++++++
>   drivers/usb/gadget/function/uvc.h   |  1 +
>   2 files changed, 36 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index eca5f36dfa74..e0a308f1355c 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -464,6 +464,25 @@ uvc_register_video(struct uvc_device *uvc)
>   		} \
>   	} while (0)
>   
> +#define UVC_COPY_XU_DESCRIPTOR(mem, dst, desc)					\
> +	do {									\
> +		*(dst)++ = mem;							\
> +		memcpy(mem, desc, 22); /* bLength to bNrInPins */		\
> +		mem += 22;							\
> +										\
> +		memcpy(mem, desc->baSourceID, desc->bNrInPins);			\
> +		mem += desc->bNrInPins;						\
> +										\
> +		memcpy(mem, &desc->bControlSize, 1);				\
> +		mem++;								\
> +										\
> +		memcpy(mem, desc->bmControls, desc->bControlSize);		\
> +		mem += desc->bControlSize;					\
> +										\
> +		memcpy(mem, &desc->iExtension, 1);				\
> +		mem++;								\
> +	} while (0)
> +


|I don't especially like UVC_COPY_XU_DESCRIPTOR(), but the need to vary 
the array size for baSourceID and bmControls plus the requirement for 
the struct to be copied to consecutive bytes of memory constrained it a 
bit. An alternative might be to replace baSourceID, bControlSize, 
bmControls and iExtension in struct uvcg_extension_unit_descriptor with 
a single flexible array member (called data[] or something). That would 
allow the copy to be a much more straight forward memcpy(mem, desc, 
desc->bLength); - but the cost would be reallocating the entire struct 
each time the baSourceID or bmControls attributes was changed. That 
might be a better method, but I thought I'd stick with this for this 
submission at least on the grounds that it's less confusing.|

>   static struct usb_descriptor_header **
>   uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>   {
> @@ -475,6 +494,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>   	const struct usb_descriptor_header * const *src;
>   	struct usb_descriptor_header **dst;
>   	struct usb_descriptor_header **hdr;
> +	struct uvcg_extension *xu;
>   	unsigned int control_size;
>   	unsigned int streaming_size;
>   	unsigned int n_desc;
> @@ -539,6 +559,13 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>   		bytes += (*src)->bLength;
>   		n_desc++;
>   	}
> +
> +	list_for_each_entry(xu, uvc->desc.extension_units, list) {
> +		control_size += xu->desc.bLength;
> +		bytes += xu->desc.bLength;
> +		n_desc++;
> +	}
> +
>   	for (src = (const struct usb_descriptor_header **)uvc_streaming_cls;
>   	     *src; ++src) {
>   		streaming_size += (*src)->bLength;
> @@ -565,6 +592,13 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
>   	uvc_control_header = mem;
>   	UVC_COPY_DESCRIPTORS(mem, dst,
>   		(const struct usb_descriptor_header **)uvc_control_desc);
> +
> +	list_for_each_entry(xu, uvc->desc.extension_units, list) {
> +		struct uvcg_extension_unit_descriptor *desc = &xu->desc;
> +
> +		UVC_COPY_XU_DESCRIPTOR(mem, dst, desc);
> +	}
> +
>   	uvc_control_header->wTotalLength = cpu_to_le16(control_size);
>   	uvc_control_header->bInCollection = 1;
>   	uvc_control_header->baInterfaceNr[0] = uvc->streaming_intf;
> @@ -988,6 +1022,7 @@ static struct usb_function *uvc_alloc(struct usb_function_instance *fi)
>   	uvc->desc.fs_streaming = opts->fs_streaming;
>   	uvc->desc.hs_streaming = opts->hs_streaming;
>   	uvc->desc.ss_streaming = opts->ss_streaming;
> +	uvc->desc.extension_units = &opts->extension_units;
>   
>   	streaming = config_group_find_item(&opts->func_inst.group, "streaming");
>   	if (!streaming)
> diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> index 40226b1f7e14..f1a016d20bb6 100644
> --- a/drivers/usb/gadget/function/uvc.h
> +++ b/drivers/usb/gadget/function/uvc.h
> @@ -143,6 +143,7 @@ struct uvc_device {
>   		const struct uvc_descriptor_header * const *fs_streaming;
>   		const struct uvc_descriptor_header * const *hs_streaming;
>   		const struct uvc_descriptor_header * const *ss_streaming;
> +		struct list_head *extension_units;
>   	} desc;
>   
>   	unsigned int control_intf;
