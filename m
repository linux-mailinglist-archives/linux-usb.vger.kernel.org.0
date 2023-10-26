Return-Path: <linux-usb+bounces-2228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5287D8738
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 19:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CBEB1C20F35
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 17:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE30381D9;
	Thu, 26 Oct 2023 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="aUd7SAap";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="aUd7SAap"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D939381C4
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 17:07:21 +0000 (UTC)
Received: from mail.insite.cz (smtp.ivitera.com [88.101.85.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E8A194;
	Thu, 26 Oct 2023 10:07:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.insite.cz (Postfix) with ESMTP id 64EE650E2;
	Thu, 26 Oct 2023 19:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1698340036; bh=bRb34JF9ol3G3t0hJXHZMsR+CD8qc0TBLBInmS3pMlY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=aUd7SAapS1M7MM8LIEQMuyQ1SMXfYlg1gMaczGc5W5MXLzeK0cKWBxr3h9ysPvqwO
	 hrcM4XO2shjn26YOKvGcAeh+6LdvDFXt8aINj6DExJNA4xLzlSV6iLl+gfrsfW7FnZ
	 uWPZ/eg/I9eqvd6OSa7ufPa8Tn42LUCTLMEn+oxg=
Received: from mail.insite.cz ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7cwDMq8nmBC; Thu, 26 Oct 2023 19:07:16 +0200 (CEST)
Received: from [192.168.105.156] (unknown [192.168.100.40])
	(Authenticated sender: pavel)
	by mail.insite.cz (Postfix) with ESMTPSA id 1B8BD3B7F;
	Thu, 26 Oct 2023 19:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1698340036; bh=bRb34JF9ol3G3t0hJXHZMsR+CD8qc0TBLBInmS3pMlY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=aUd7SAapS1M7MM8LIEQMuyQ1SMXfYlg1gMaczGc5W5MXLzeK0cKWBxr3h9ysPvqwO
	 hrcM4XO2shjn26YOKvGcAeh+6LdvDFXt8aINj6DExJNA4xLzlSV6iLl+gfrsfW7FnZ
	 uWPZ/eg/I9eqvd6OSa7ufPa8Tn42LUCTLMEn+oxg=
Subject: Re: [PATCH V3] usb: gadget: f_uac1: add adaptive sync support for
 capture
To: Charles Yi <be286@163.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231026063313.1574618-1-be286@163.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <07bd9c40-90af-181f-13a5-3dfaa2484ba1@ivitera.com>
Date: Thu, 26 Oct 2023 19:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231026063313.1574618-1-be286@163.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Dne 26. 10. 23 v 8:33 Charles Yi napsal(a):
> UAC1 has it's own freerunning clock and can update Host about
> real clock frequency through feedback endpoint so Host can align
> number of samples sent to the UAC1 to prevent overruns/underruns.
> 
> Change UAC1 driver to make it configurable through additional
> 'c_sync' configfs file.
> 
> Default remains 'adaptive' with possibility to switch it
> to 'asynchronous'.
> 
> Signed-off-by: Charles Yi <be286@163.com>

IMO the patch adds isochronous asynchronous mode to UAC1, to complement 
the already implemented adaptive mode. The patch headline seems to 
suggest that adaptive mode is being added, IMO.

With regards,

Pavel.
> 
> ---------
> Changes in V3:
> - Changed sync mode of capture to adaptive as default.
> - Added implement of 'c_sync' through configfs file.
> ---------
> Changes in V2:
> - Updated the indentation of commit message.
> ---------
> ---
>   drivers/usb/gadget/function/f_uac1.c | 32 ++++++++++++++++++++++++++++
>   drivers/usb/gadget/function/u_uac1.h |  2 ++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
> index 6f0e1d803dc2..edf3c50766b8 100644
> --- a/drivers/usb/gadget/function/f_uac1.c
> +++ b/drivers/usb/gadget/function/f_uac1.c
> @@ -33,6 +33,8 @@
>   #define FUOUT_EN(_opts) ((_opts)->c_mute_present \
>   			|| (_opts)->c_volume_present)
>   
> +#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
> +
>   struct f_uac1 {
>   	struct g_audio g_audio;
>   	u8 ac_intf, as_in_intf, as_out_intf;
> @@ -227,6 +229,16 @@ static struct uac_iso_endpoint_descriptor as_iso_out_desc = {
>   	.wLockDelay =		cpu_to_le16(1),
>   };
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
>   static struct uac_format_type_i_discrete_descriptor as_in_type_i_desc = {
>   	.bLength =		0, /* filled on rate setup */
>   	.bDescriptorType =	USB_DT_CS_INTERFACE,
> @@ -280,6 +292,7 @@ static struct usb_descriptor_header *f_audio_desc[] = {
>   
>   	(struct usb_descriptor_header *)&as_out_ep_desc,
>   	(struct usb_descriptor_header *)&as_iso_out_desc,
> +	(struct usb_descriptor_header *)&as_fback_ep_desc,
>   
>   	(struct usb_descriptor_header *)&as_in_interface_alt_0_desc,
>   	(struct usb_descriptor_header *)&as_in_interface_alt_1_desc,
> @@ -1107,6 +1120,9 @@ static void setup_descriptor(struct f_uac1_opts *opts)
>   		f_audio_desc[i++] = USBDHDR(&as_out_type_i_desc);
>   		f_audio_desc[i++] = USBDHDR(&as_out_ep_desc);
>   		f_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
> +		if (EPOUT_FBACK_IN_EN(opts)) {
> +			f_audio_desc[i++] = USBDHDR(&as_fback_ep_desc);
> +		}
>   	}
>   	if (EPIN_EN(opts)) {
>   		f_audio_desc[i++] = USBDHDR(&as_in_interface_alt_0_desc);
> @@ -1317,6 +1333,12 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>   		ac_header_desc->baInterfaceNr[ba_iface_id++] = status;
>   		uac1->as_out_intf = status;
>   		uac1->as_out_alt = 0;
> +
> +		if (EPOUT_FBACK_IN_EN(audio_opts)) {
> +			as_out_ep_desc.bmAttributes =
> +			USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
> +			as_out_interface_alt_1_desc.bNumEndpoints++;
> +		}
>   	}
>   
>   	if (EPIN_EN(audio_opts)) {
> @@ -1354,6 +1376,12 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
>   			goto err_free_fu;
>   		audio->out_ep = ep;
>   		audio->out_ep->desc = &as_out_ep_desc;
> +		if (EPOUT_FBACK_IN_EN(audio_opts)) {
> +			audio->in_ep_fback = usb_ep_autoconfig(gadget, &as_fback_ep_desc);
> +			if (!audio->in_ep_fback) {
> +				goto err_free_fu;
> +			}
> +		}
>   	}
>   
>   	if (EPIN_EN(audio_opts)) {
> @@ -1596,6 +1624,7 @@ UAC1_ATTRIBUTE(u32, p_chmask);
>   UAC1_RATE_ATTRIBUTE(p_srate);
>   UAC1_ATTRIBUTE(u32, p_ssize);
>   UAC1_ATTRIBUTE(u32, req_number);
> +UAC1_ATTRIBUTE(u32, c_sync);
>   
>   UAC1_ATTRIBUTE(bool, p_mute_present);
>   UAC1_ATTRIBUTE(bool, p_volume_present);
> @@ -1618,6 +1647,7 @@ static struct configfs_attribute *f_uac1_attrs[] = {
>   	&f_uac1_opts_attr_p_srate,
>   	&f_uac1_opts_attr_p_ssize,
>   	&f_uac1_opts_attr_req_number,
> +	&f_uac1_opts_attr_c_sync,
>   
>   	&f_uac1_opts_attr_p_mute_present,
>   	&f_uac1_opts_attr_p_volume_present,
> @@ -1685,6 +1715,8 @@ static struct usb_function_instance *f_audio_alloc_inst(void)
>   
>   	opts->req_number = UAC1_DEF_REQ_NUM;
>   
> +	opts->c_sync = UAC1_DEF_CSYNC;
> +
>   	snprintf(opts->function_name, sizeof(opts->function_name), "AC Interface");
>   
>   	return &opts->func_inst;
> diff --git a/drivers/usb/gadget/function/u_uac1.h b/drivers/usb/gadget/function/u_uac1.h
> index f7a616760e31..d0a4b86bff5c 100644
> --- a/drivers/usb/gadget/function/u_uac1.h
> +++ b/drivers/usb/gadget/function/u_uac1.h
> @@ -27,6 +27,7 @@
>   #define UAC1_DEF_MAX_DB		0		/* 0 dB */
>   #define UAC1_DEF_RES_DB		(1*256)	/* 1 dB */
>   
> +#define UAC1_DEF_CSYNC		USB_ENDPOINT_SYNC_ADAPTIVE
>   
>   struct f_uac1_opts {
>   	struct usb_function_instance	func_inst;
> @@ -56,6 +57,7 @@ struct f_uac1_opts {
>   
>   	struct mutex			lock;
>   	int				refcnt;
> +	int				c_sync;
>   };
>   
>   #endif /* __U_UAC1_H */
> 

