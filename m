Return-Path: <linux-usb+bounces-9581-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B68AD4A1
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 21:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0964E1C213B5
	for <lists+linux-usb@lfdr.de>; Mon, 22 Apr 2024 19:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E74F1552E8;
	Mon, 22 Apr 2024 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gDiJctJX"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366E8155307
	for <linux-usb@vger.kernel.org>; Mon, 22 Apr 2024 19:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713812947; cv=none; b=UDmIDTAdQfty3aGk6reVPI6BJV2dMTXHqlqRa1bJ7/0v0T5EHMUVAiZGjSVUPY06QPB4qrS1lkWsLEyEuChqmxJ3Pf1CdbLQlth9Jw/okqhF7nSfvPhRNFsr2oNudxChDZBm8YEG97SrdF8KVV+gmFlOepEwUblMgVvmdjRDPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713812947; c=relaxed/simple;
	bh=23XUtMpu01UxCSaxx2AfdDxI5QxqhDbbANr3AafvRTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Yv/rWvAxOctNBAA6kb/xj1SytSX7qzFIhWzdNBXHMpRnA8/tKZUdk4FkL3ZOcx7q8LZeiqxIhhhV/8fxT/TjrmxMNiGEDtTkIFyRyp1iTpdmK8UC3qawIP/a0riXgdx+bLbLHmIhwM4cM3MidkG90nQQPkVOXTKCXTE1RZa5ZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gDiJctJX; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713812944;
	bh=23XUtMpu01UxCSaxx2AfdDxI5QxqhDbbANr3AafvRTc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=gDiJctJXtNWZB36fPBvXre9rdVUgcjrxyXAWDIIJfsB79RGi/JdH8lj/cg+5xVPCh
	 PqIDlJ+3bREvgi/t6gKVb3vVM73Rb4bVKd5Xr1nMYCPsHNXwPM9DDv9Lgsz6wsJXel
	 FNQOdjH2phrvH+fm7wbE8UuxiCxUVvLtPLkNWpFJa7F8eLGHNjLojEtJlnMrkGvXOj
	 FvTaVzo8xI062QyjU2DiwbcyNlv8ieffjnmM9rLeUCJOhurjbipiYl1piGWiHbODbA
	 4XmRXO2f1YilgnE6H/RTGawhGiAE1BN5QSkfkEU52s9ywn7AA1G6kog/7IYRx1PGu7
	 YX928eUs7OBug==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4C5D137811CD;
	Mon, 22 Apr 2024 19:09:04 +0000 (UTC)
Message-ID: <ee546f65-2f72-40ac-9b10-aea469e9ebab@collabora.com>
Date: Mon, 22 Apr 2024 21:09:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: composite: fix OS descriptors w_value logic
To: Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240404100635.3215340-1-peter@korsgaard.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <20240404100635.3215340-1-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Peter,

W dniu 4.04.2024 o 12:06, Peter Korsgaard pisze:
> The OS descriptors logic had the high/low byte of w_value inverted, causing
> the extended properties to not be accessible for interface != 0.

Out of curiosity - did you run into problems running some USB gadget,
and if yes, what was it? Or is this patch a result of a code and documentation
review without actually running a gadget?

> 
>  From the Microsoft documentation:
> https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/microsoft-os-1-0-descriptors-specification
> 
> OS_Desc_CompatID.doc (w_index = 0x4):
> 
> - wValue:
> 
>    High Byte = InterfaceNumber.  InterfaceNumber is set to the number of the
>    interface or function that is associated with the descriptor, typically
>    0x00.  Because a device can have only one extended compat ID descriptor,
>    it should ignore InterfaceNumber, regardless of the value, and simply
>    return the descriptor.
> 
>    Low Byte = 0.  PageNumber is used to retrieve descriptors that are larger
>    than 64 KB.  The header section is 16 bytes, so PageNumber is set to 0 for
>    this request.
> 
> We currently do not support >64KB compat ID descriptors, so verify that the
> low byte is 0.
> 
> OS_Desc_Ext_Prop.doc (w_index = 0x5):
> 
> - wValue:
> 
>    High byte = InterfaceNumber.  The high byte of wValue is set to the number
>    of the interface or function that is associated with the descriptor.
> 
>    Low byte = PageNumber.  The low byte of wValue is used to retrieve
>    descriptors that are larger than 64 KB.  The header section is 10 bytes, so
>    PageNumber is set to 0 for this request.
> 

FWIW w_value is:

u16 w_value = le16_to_cpu(ctrl->wValue);

Regards,

Andrzej


> We also don't support >64KB extended properties, so verify that the low byte
> is 0 and use the high byte for the interface number.
> 
> Fixes: 37a3a533429e ("usb: gadget: OS Feature Descriptors support")
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   drivers/usb/gadget/composite.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 0ace45b66a31..0e151b54aae8 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -2112,7 +2112,7 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>   			buf[5] = 0x01;
>   			switch (ctrl->bRequestType & USB_RECIP_MASK) {
>   			case USB_RECIP_DEVICE:
> -				if (w_index != 0x4 || (w_value >> 8))
> +				if (w_index != 0x4 || (w_value & 0xff))
>   					break;
>   				buf[6] = w_index;
>   				/* Number of ext compat interfaces */
> @@ -2128,9 +2128,9 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>   				}
>   				break;
>   			case USB_RECIP_INTERFACE:
> -				if (w_index != 0x5 || (w_value >> 8))
> +				if (w_index != 0x5 || (w_value & 0xff))
>   					break;
> -				interface = w_value & 0xFF;
> +				interface = w_value >> 8;
>   				if (interface >= MAX_CONFIG_INTERFACES ||
>   				    !os_desc_cfg->interface[interface])
>   					break;


