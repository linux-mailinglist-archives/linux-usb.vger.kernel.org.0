Return-Path: <linux-usb+bounces-5646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC48428E4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 17:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8563928A56B
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 16:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD9386AD3;
	Tue, 30 Jan 2024 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cy/SV3Ri"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6186AEF
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706631094; cv=none; b=GdZHhRj7BgT/Jgwpj4r9xUbdVBAjgEW+660KjTFlk8fMUsbNWIsuJmRqDf0pTVEXIxr72GMGfZAS2QAvVaky93N2Ni+eGOKBFRh4NoEe/CCIt0ZagBbk3ZEnxyI23Yqt43xPX/tzSeP8V7zGZv4go23Dd86xASu2/FfiMBxuDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706631094; c=relaxed/simple;
	bh=sYWsCKIWnBM4AENxDQMd45ylfzFl6TepGmycJDjJUG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so/4pm75gF6pIT2Ys9LHvklLKOKRSSu+oRPxZAnnQryu0SNCE8ls1DO+QTL0KVox488vt3kX6Dy7gXWLzggZ8F2jlrjoXFyPpCgj5SSJ8aaesYTm9MypALpF41TYjppGJvBqpW75BW7+IIwSgV/MXy/bc3XKgmtvxy3+5f6ZOLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cy/SV3Ri; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7bc332d3a8cso221524039f.2
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 08:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706631090; x=1707235890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bycNLFVVPkFg+rgPX8u0j7Km8vshueoEwQ1p4ROc4C8=;
        b=Cy/SV3RiyoPPMsmVaZXxEHPO34JAkE/pIPClbSvwgwEMMpH2pD8NOiB6FzTJrGNlgO
         vf8DHoSLKJM7TOeTjXBdzaU7oKMfpXJCIh3K2xSvNaQWjIzCPdhtLUY3AYgxY0dx85VM
         hLc0O4O58mPqULm5omiC7o4MdwJ9xUcRl3YFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706631090; x=1707235890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bycNLFVVPkFg+rgPX8u0j7Km8vshueoEwQ1p4ROc4C8=;
        b=UwFaZSm4l4bxojMf6YreGEV2J1FgCb0CQ6nrl9AFhiIMQmCw7BjY2I1wIhLmgdq4gV
         OkM5kCsGY0DIlf/6+KtPRz8svyps4OXpqenPr25/tMeRBrywE3003INSRJLZ5NapUTi6
         Rt6pTrS7vNcQT2XC7wuQDwdtsFAkLfoyC969FS+IdA3I1yKyEc1F+mvA5bLC8sCDxqW0
         d2dq3DHIMnNFTF6uCa0kktuC5Nf8P/XaEmWtvMQjPV4W9wBs+ov902c1fDW0AsE2b4pE
         mpVPZa3R+VCoWMaYvSI8ilk9HHgB/832BJH6evtaAj95o3NocB++6AOyKOf4SUzkIa70
         zOKg==
X-Gm-Message-State: AOJu0YzDk5/jGSpFZiw+7/fgKm8/WdVm2UEzrwVYS2h7tnHLp01BcyDU
	95/73mtw6obVPoSwUqf0w6+d0GEr5AMqp+n7w3388yaVtSuV8v+oKuqBlw9jvfhlUO1JQXCXdL0
	=
X-Google-Smtp-Source: AGHT+IG5sSkp5z9PUe5cWJUnvBDvMkF79YkCb7M0iKqqHEhgc5zAuPWw8mr3XF3mNKLQkDLYuCx6Uw==
X-Received: by 2002:a05:6602:2d89:b0:7bf:b56c:ac25 with SMTP id k9-20020a0566022d8900b007bfb56cac25mr15008085iow.0.1706631090289;
        Tue, 30 Jan 2024 08:11:30 -0800 (PST)
Received: from localhost (110.41.72.34.bc.googleusercontent.com. [34.72.41.110])
        by smtp.gmail.com with UTF8SMTPSA id p5-20020a02b385000000b0046ebddc03fbsm2312569jan.33.2024.01.30.08.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 08:11:29 -0800 (PST)
Date: Tue, 30 Jan 2024 16:11:29 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: misc: onboard_hub: add support for XMOS XVF3500
Message-ID: <ZbkfsVr-1pOTa1ic@google.com>
References: <20240130-onboard_xvf3500-v1-0-51b5398406cb@wolfvision.net>
 <20240130-onboard_xvf3500-v1-2-51b5398406cb@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240130-onboard_xvf3500-v1-2-51b5398406cb@wolfvision.net>

Hi Javier,

I understand your motivation for using the onboard_usb_hub driver
for powering up a non-hub device, it feels a bit hacky to use it
as is though. Re-using the driver might be the right thing to do,
but then it should probably be renamed to onboard_usb_dev (or
similar) and do the hub specific bits as special case.

Greg, do you have any thoughts on this?

Also there is an implication that might not matter for the
XVF3500, but could for other non-hub devices with wakeup support:
by default the driver powers the hub/device down during suspend,
unless (in case of a hub) wakeup capable devices are connected.
This behavior can be changed through sysfs, but the default
would still be unexpected. In hindsight I think the default
should have been to keep the hub powered. Not sure if it's an
option to change the default at this point, since folks might
rely on it (I know systems that do, but those could be adapted).
We could possibly change the behavior for non-hub devices and
keep the device powered if wakeup is supported and enabled

m.

On Tue, Jan 30, 2024 at 01:26:57PM +0100, Javier Carrasco wrote:
> The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
> multicore controller for voice processing.
> 
> This device requires a specific power sequence, which consists of
> enabling the regulators that control the 3V3 and 1V0 device supplies,
> and a reset de-assertion after a delay of at least 100ns. Such power
> sequence is already supported by the onboard_hub driver, and it can be
> reused for non-hub USB devices as well.
> 
> Once in normal operation, the XVF3500 registers itself as a USB device,
> and it does not require any device-specific operations in the driver.
> 
> [1] https://www.xmos.com/xvf3500/
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  drivers/usb/misc/onboard_usb_hub.c | 2 ++
>  drivers/usb/misc/onboard_usb_hub.h | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> index 0dd2b032c90b..f16ea3053f84 100644
> --- a/drivers/usb/misc/onboard_usb_hub.c
> +++ b/drivers/usb/misc/onboard_usb_hub.c
> @@ -366,6 +366,7 @@ static struct platform_driver onboard_hub_driver = {
>  #define VENDOR_ID_REALTEK	0x0bda
>  #define VENDOR_ID_TI		0x0451
>  #define VENDOR_ID_VIA		0x2109
> +#define VENDOR_ID_XMOS		0x20B1
>  
>  /*
>   * Returns the onboard_hub platform device that is associated with the USB
> @@ -458,6 +459,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
> +	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 */
>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> index f360d5cf8d8a..1809c0923b98 100644
> --- a/drivers/usb/misc/onboard_usb_hub.h
> +++ b/drivers/usb/misc/onboard_usb_hub.h
> @@ -56,6 +56,11 @@ static const struct onboard_hub_pdata vialab_vl817_data = {
>  	.num_supplies = 1,
>  };
>  
> +static const struct onboard_hub_pdata xmos_xvf3500_data = {
> +	.reset_us = 1,
> +	.num_supplies = 2,
> +};
> +
>  static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
>  	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
> @@ -77,6 +82,7 @@ static const struct of_device_id onboard_hub_match[] = {
>  	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
>  	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
>  	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
> +	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
>  	{}
>  };
>  
> 
> -- 
> 2.39.2
> 

