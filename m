Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 639502C52A5
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 12:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgKZLNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 06:13:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgKZLNV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Nov 2020 06:13:21 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E02AC0613D4
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 03:13:21 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id l1so1707120wrb.9
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2020 03:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=NvEMfEvwcm5zRFsnxgcxtRZO+3oCqzY0yjm/wKkd0wE=;
        b=IMHAIckMu0OrbV7XrRFzWBNq2SDLVxTwhAqhm8dXFCBbO4FWQkunemmkpcAKuouB9r
         qFLyHvQG8H6KC+R9ZjQuSKrGd2A16nyL8ystSQzYJI+zAolm8GpVmtsO5lbw8oloN+pb
         WlJi/XgJODnxwXTAUdf8UeKnSSODgISMYKCY3JXNHyslQ8JIwBl0/rQtogVlkv/wtSRt
         JzTez5VEDwgQEim3dLKbR7dS6o9iN3O8hayahJfaYYhcZtoRnTmFC7k+AZP8N9P31ULd
         v7Rr3g64O/zTDRuok54Tid0mwRM6GjoFBcpDbeYGxU9e0nhcqqykxJTYmGsgP/w8GcCv
         1skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=NvEMfEvwcm5zRFsnxgcxtRZO+3oCqzY0yjm/wKkd0wE=;
        b=s7cF18AWii++jU9X8bahMJxomWJ8CBjg3iDAkQoNKqSIbFhghGyxTsHPdSk+8sjKyG
         wVEhnWZ5JjaihtWRT6nGyU2mcwb+/VhkON+ATbk7Sm055typKEEK5GTl7IGU9HTdHuj9
         Zapml9QcMm3ChYuU4pvxo8q85GxUxEwwqoU9k3K/of1DTyW+qSE4lv40iTJ+nE2Aw7d5
         R2ZEM0j1/eSQwYq1aWetJ31zNlvD+66Sak8zI4UL4JeWxW4lgfY/JFcLxAuYj5bpe2kC
         36rehxprq5eptNVU/1u0ysmsndHuTKqzf7ZImTV0/K4JEmW6snC0rk7knD7+NTm3E2Og
         MMGA==
X-Gm-Message-State: AOAM533qWgXntWctLa0+ptu6T4CIeXxlweuQi+Hbf2y8GnJI8G0LgCMf
        HIsIaj7RlE+iir8fKgecZE+haARt/hctar8o
X-Google-Smtp-Source: ABdhPJxiiG85HJMYF87kPRTL0xO+W1sloF3QxfpXIMTRwECgM322aI3zya09m5UvmpTkQ2gH9BWfNA==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr3183175wrp.50.1606389199714;
        Thu, 26 Nov 2020 03:13:19 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id v1sm8577113wrr.48.2020.11.26.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 03:13:19 -0800 (PST)
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-3-git-send-email-ruslan.bilovol@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gschmottlach@gmail.com
Subject: Re: [PATCH 2/3] usb: gadget: f_uac2: add adaptive sync support for
 capture
In-reply-to: <1604794711-8661-3-git-send-email-ruslan.bilovol@gmail.com>
Message-ID: <1jeekg8j76.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 26 Nov 2020 12:13:17 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Sun 08 Nov 2020 at 01:18, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:

> Current f_uac2 USB OUT (aka 'capture') synchronization
> implements 'ASYNC' scenario which means USB Gadget has
> it's own freerunning clock and can update Host about
> real clock frequency through feedback endpoint so Host
> can align number of samples sent to the USB gadget to
> prevent overruns/underruns
>
> In case if Gadget can has no it's internal clock and
> can consume audio samples at any rate (for example,
> on the Gadget side someone records audio directly to
> a file, or audio samples are played through an
> external DAC as soon as they arrive), UAC2 spec
> suggests 'ADAPTIVE' synchronization type.
>
> Change UAC2 driver to make it configurable through
> additional 'c_sync' configfs file.
>
> Default remains 'asynchronous' with possibility to
> switch it to 'adaptive'
>
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  Documentation/ABI/testing/configfs-usb-gadget-uac2 |  1 +
>  Documentation/usb/gadget-testing.rst               |  1 +
>  drivers/usb/gadget/function/f_uac2.c               | 96 ++++++++++++++++++++--
>  drivers/usb/gadget/function/u_uac2.h               |  2 +
>  4 files changed, 91 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> index 2bfdd4e..4fbff96 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> @@ -7,6 +7,7 @@ Description:
>  		c_chmask - capture channel mask
>  		c_srate - capture sampling rate
>  		c_ssize - capture sample size (bytes)
> +		c_sync - capture synchronization type (async/adaptive)
>  		p_chmask - playback channel mask
>  		p_srate - playback sampling rate
>  		p_ssize - playback sample size (bytes)
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> index 2eeb3e9..360a7ca 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -728,6 +728,7 @@ The uac2 function provides these attributes in its function directory:
>  	c_chmask	capture channel mask
>  	c_srate		capture sampling rate
>  	c_ssize		capture sample size (bytes)
> +	c_sync		capture synchronization type (async/adaptive)
>  	p_chmask	playback channel mask
>  	p_srate		playback sampling rate
>  	p_ssize		playback sample size (bytes)
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index a57bf77..3187ad3 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -41,6 +41,7 @@
>  
>  #define EPIN_EN(_opts) ((_opts)->p_chmask != 0)
>  #define EPOUT_EN(_opts) ((_opts)->c_chmask != 0)
> +#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync == USB_ENDPOINT_SYNC_ASYNC)
>  
>  struct f_uac2 {
>  	struct g_audio g_audio;
> @@ -237,7 +238,7 @@ enum {
>  	.bDescriptorType = USB_DT_INTERFACE,
>  
>  	.bAlternateSetting = 1,
> -	.bNumEndpoints = 2,
> +	.bNumEndpoints = 1,
>  	.bInterfaceClass = USB_CLASS_AUDIO,
>  	.bInterfaceSubClass = USB_SUBCLASS_AUDIOSTREAMING,
>  	.bInterfaceProtocol = UAC_VERSION_2,
> @@ -270,7 +271,7 @@ enum {
>  	.bDescriptorType = USB_DT_ENDPOINT,
>  
>  	.bEndpointAddress = USB_DIR_OUT,
> -	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +	.bmAttributes = USB_ENDPOINT_XFER_ISOC,
>  	.wMaxPacketSize = cpu_to_le16(1023),
>  	.bInterval = 1,
>  };
> @@ -279,7 +280,7 @@ enum {
>  	.bLength = USB_DT_ENDPOINT_SIZE,
>  	.bDescriptorType = USB_DT_ENDPOINT,
>  
> -	.bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +	.bmAttributes = USB_ENDPOINT_XFER_ISOC,
>  	.wMaxPacketSize = cpu_to_le16(1024),
>  	.bInterval = 1,
>  };
> @@ -540,6 +541,19 @@ static void setup_descriptor(struct f_uac2_opts *opts)
>  		len += sizeof(io_out_ot_desc);
>  		ac_hdr_desc.wTotalLength = cpu_to_le16(len);
>  		iad_desc.bInterfaceCount++;
> +
> +		if (EPOUT_FBACK_IN_EN(opts)) {
> +			fs_epout_desc.bmAttributes |=
> +						USB_ENDPOINT_SYNC_ASYNC;
> +			hs_epout_desc.bmAttributes |=
> +						USB_ENDPOINT_SYNC_ASYNC;
> +			std_as_out_if1_desc.bNumEndpoints++;
> +		} else {
> +			fs_epout_desc.bmAttributes |=
> +						USB_ENDPOINT_SYNC_ADAPTIVE;
> +			hs_epout_desc.bmAttributes |=
> +						USB_ENDPOINT_SYNC_ADAPTIVE;
> +		}

Hi Ruslan,

First, thanks a lot for this series, it is very helpful

Instead of amending the descriptors, could you consider using comments like

/* .bNumEndpoints = DYNAMIC */

or

/* .bmAttributes = DYNAMIC */

It would help understand that the actual value of these parameters will be
determine at runtime, making the code easier to follow and maintain.

Also, I wonder if it would be difficult to add implicit feedback support
while at it ?

I'm asking this now because it could (possibly) change the driver params
(implicit is async as well)

>  	}
>  
>  	i = 0;
> @@ -564,7 +578,8 @@ static void setup_descriptor(struct f_uac2_opts *opts)
>  		fs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
>  		fs_audio_desc[i++] = USBDHDR(&fs_epout_desc);
>  		fs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
> -		fs_audio_desc[i++] = USBDHDR(&fs_epin_fback_desc);
> +		if (EPOUT_FBACK_IN_EN(opts))
> +			fs_audio_desc[i++] = USBDHDR(&fs_epin_fback_desc);
>  	}
>  	if (EPIN_EN(opts)) {
>  		fs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
> @@ -598,7 +613,8 @@ static void setup_descriptor(struct f_uac2_opts *opts)
>  		hs_audio_desc[i++] = USBDHDR(&as_out_fmt1_desc);
>  		hs_audio_desc[i++] = USBDHDR(&hs_epout_desc);
>  		hs_audio_desc[i++] = USBDHDR(&as_iso_out_desc);
> -		hs_audio_desc[i++] = USBDHDR(&hs_epin_fback_desc);
> +		if (EPOUT_FBACK_IN_EN(opts))
> +			hs_audio_desc[i++] = USBDHDR(&hs_epin_fback_desc);
>  	}
>  	if (EPIN_EN(opts)) {
>  		hs_audio_desc[i++] = USBDHDR(&std_as_in_if0_desc);
> @@ -706,11 +722,14 @@ static void setup_descriptor(struct f_uac2_opts *opts)
>  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
>  			return -ENODEV;
>  		}
> -		agdev->in_ep_fback = usb_ep_autoconfig(gadget,
> +		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
> +			agdev->in_ep_fback = usb_ep_autoconfig(gadget,
>  						       &fs_epin_fback_desc);
> -		if (!agdev->in_ep_fback) {
> -			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
> -			return -ENODEV;
> +			if (!agdev->in_ep_fback) {
> +				dev_err(dev, "%s:%d Error!\n",
> +					__func__, __LINE__);
> +				return -ENODEV;
> +			}
>  		}
>  	}
>  
> @@ -1057,11 +1076,68 @@ static void f_uac2_attr_release(struct config_item *item)
>  									\
>  CONFIGFS_ATTR(f_uac2_opts_, name)
>  
> +#define UAC2_ATTRIBUTE_SYNC(name)					\
> +static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
> +					 char *page)			\
> +{									\
> +	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
> +	int result;							\
> +	char *str;							\
> +									\
> +	mutex_lock(&opts->lock);					\
> +	switch (opts->name) {						\
> +	case USB_ENDPOINT_SYNC_ASYNC:					\
> +		str = "async";						\
> +		break;							\
> +	case USB_ENDPOINT_SYNC_ADAPTIVE:				\
> +		str = "adaptive";					\
> +		break;							\
> +	default:							\
> +		str = "unknown";					\
> +		break;							\
> +	}								\
> +	result = sprintf(page, "%s\n", str);				\
> +	mutex_unlock(&opts->lock);					\
> +									\
> +	return result;							\
> +}									\
> +									\
> +static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
> +					  const char *page, size_t len)	\
> +{									\
> +	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
> +	int ret = 0;							\
> +									\
> +	mutex_lock(&opts->lock);					\
> +	if (opts->refcnt) {						\
> +		ret = -EBUSY;						\
> +		goto end;						\
> +	}								\
> +									\
> +	if (!strncmp(page, "async", 5))					\
> +		opts->name = USB_ENDPOINT_SYNC_ASYNC;			\
> +	else if (!strncmp(page, "adaptive", 8))				\
> +		opts->name = USB_ENDPOINT_SYNC_ADAPTIVE;		\
> +	else {								\
> +		ret = -EINVAL;						\
> +		goto end;						\
> +	}								\
> +									\
> +	ret = len;							\
> +									\
> +end:									\
> +	mutex_unlock(&opts->lock);					\
> +	return ret;							\
> +}									\
> +									\
> +CONFIGFS_ATTR(f_uac2_opts_, name)
> +
>  UAC2_ATTRIBUTE(p_chmask);
>  UAC2_ATTRIBUTE(p_srate);
>  UAC2_ATTRIBUTE(p_ssize);
>  UAC2_ATTRIBUTE(c_chmask);
>  UAC2_ATTRIBUTE(c_srate);
> +UAC2_ATTRIBUTE_SYNC(c_sync);
>  UAC2_ATTRIBUTE(c_ssize);
>  UAC2_ATTRIBUTE(req_number);
>  
> @@ -1072,6 +1148,7 @@ static void f_uac2_attr_release(struct config_item *item)
>  	&f_uac2_opts_attr_c_chmask,
>  	&f_uac2_opts_attr_c_srate,
>  	&f_uac2_opts_attr_c_ssize,
> +	&f_uac2_opts_attr_c_sync,
>  	&f_uac2_opts_attr_req_number,
>  	NULL,
>  };
> @@ -1110,6 +1187,7 @@ static struct usb_function_instance *afunc_alloc_inst(void)
>  	opts->c_chmask = UAC2_DEF_CCHMASK;
>  	opts->c_srate = UAC2_DEF_CSRATE;
>  	opts->c_ssize = UAC2_DEF_CSSIZE;
> +	opts->c_sync = UAC2_DEF_CSYNC;
>  	opts->req_number = UAC2_DEF_REQ_NUM;
>  	return &opts->func_inst;
>  }
> diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
> index b503571..13589c3 100644
> --- a/drivers/usb/gadget/function/u_uac2.h
> +++ b/drivers/usb/gadget/function/u_uac2.h
> @@ -21,6 +21,7 @@
>  #define UAC2_DEF_CCHMASK 0x3
>  #define UAC2_DEF_CSRATE 64000
>  #define UAC2_DEF_CSSIZE 2
> +#define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
>  #define UAC2_DEF_REQ_NUM 2
>  
>  struct f_uac2_opts {
> @@ -31,6 +32,7 @@ struct f_uac2_opts {
>  	int				c_chmask;
>  	int				c_srate;
>  	int				c_ssize;
> +	int				c_sync;
>  	int				req_number;
>  	bool				bound;

