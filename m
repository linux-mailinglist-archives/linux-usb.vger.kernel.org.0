Return-Path: <linux-usb+bounces-12085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC54992C3F4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 21:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7201EB21EA1
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 19:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6D617B04B;
	Tue,  9 Jul 2024 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GTdzbt6D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4BF17B022
	for <linux-usb@vger.kernel.org>; Tue,  9 Jul 2024 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720553892; cv=none; b=DDrX+IZZI12qNEVHNl3qwQu6+/ZbeixtR1WQrkHUYgzDzEEuIruqo7wjPItiRdroqQplU7vHe4dvaQ7Q0Mzm6aL2UKEjNWvzZWE/rGvj72217hz9lX9QATVWsylVzPTpfgsonKm2ravm6n7tCyhcInP/DEW/7/F1SCU3kXL6424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720553892; c=relaxed/simple;
	bh=aZGDDnoMG/Df7JC21hST6E7KySxJtKeWyt3KgLdI294=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=keT7/38VWxR2FVp+GH7sCyDvtc4ngmjEcrpHa8HqLk0E2TQ+6z7BhbGKPVE7bYq56RruTZR2mOlfOZSg/1wkcuFX97Mt7dvNyPRBsdBfAPoLjJx3GTrJGfQ3q87pbbQiyv5rHXPJs46zaRAdSZLPX4kgkW9oALN1ttr8hw7T5JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GTdzbt6D; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7eb41831704so19668639f.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Jul 2024 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720553888; x=1721158688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zm3hQRY8uz93xtaK2fqdUNltBkmPIjvamnTYb0ZY0Hs=;
        b=GTdzbt6D+qV+SJDDv5wlPaxIRsQLKO61GIEdwe0ieQ/T9gH9I8HDfTlo4oTP26fRzh
         WlLvK6P7BDrSBPTXMeH1NR+AvAAcGbzmF4ZV2tk3xMqx0Z9r8Pk1kmm2BmsPEP3DOaNB
         yepabAsJ3D1Nux8xmw0Ft0VLs7PTcdT5SNisw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553888; x=1721158688;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zm3hQRY8uz93xtaK2fqdUNltBkmPIjvamnTYb0ZY0Hs=;
        b=se0Y8IZIIvw7++XtT8Z9UWYIFa2mc6ynxxStgW+XMnmemjqkHpqtWwN5J4MLo+2Kpp
         U3A9CNX2NPSfihFlodu2NZSDUQvhYoA/jDMzI/PptQg3n4G45M+OKWBjEcNLAxwm544k
         6tlcN2mA3oaNT/quNSTWjW+lQFUnCCAZtIHIBsNKgbPL6AspciCLTRZjH8u2nw7jDo3z
         5j6mrSQnJ5WYdjKb+/tPU2fUDL+Sal2yyifeeohnKGADxsagmO9zq1d17xz9RL7YMyFS
         k71wkh6Gp40UeqVUocbs3G3ReFVIZA2LqoisfUQaboZE7GQ3okcseiNYi8L+XZX2tYNd
         khxA==
X-Forwarded-Encrypted: i=1; AJvYcCUQqW24sA7zCde0SI7oFZ/9yhfjSGZzijgt1tsabHf1OumPGmlQmAle4ZeZNA8LQzyiMvlfNwLpVvgTpqG3iZmoOuL8Ii9+iZQR
X-Gm-Message-State: AOJu0YyetVwcE81VQlRl4QcVTc/MKoXH4Wu5tinNcwhsYP3ngNd7RLdq
	I7TtuffM7KQDKH8Onb31ZGdsUzxvBabDgtueuiACwPQCHQgrwEJa3/VltRFfsDA=
X-Google-Smtp-Source: AGHT+IFfA9QfY79FcqiyI75GsSWuHyTxtSwB04Ey+hrqJjwf+Gbv7BNuQnKKoIo+k/kumVQy2l+/Lw==
X-Received: by 2002:a05:6602:3408:b0:7f9:3fd9:cbb with SMTP id ca18e2360f4ac-80001c0f1e8mr441610739f.1.1720553888233;
        Tue, 09 Jul 2024 12:38:08 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7ffe9accc19sm70463439f.20.2024.07.09.12.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 12:38:07 -0700 (PDT)
Message-ID: <e1b713a6-de8d-4df9-979e-12cb9876bf33@linuxfoundation.org>
Date: Tue, 9 Jul 2024 13:38:07 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: vhci-hcd: Do not drop references before new
 references are gained
To: Oliver Neukum <oneukum@suse.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240709113851.14691-1-oneukum@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240709113851.14691-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/24 05:38, Oliver Neukum wrote:
> At a few places the driver carries stale pointers
> to references that can still be used. Make sure that does not happen.
> This strictly speaking closes ZDI-CAN-22273, though there may be
> similar races in the driver.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Sorry I need a bit more explanation to follow the change you
are making. Also how did you find the problem?

> ---
>   drivers/usb/usbip/vhci_hcd.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 82650c11e451..302a89aeb258 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -745,6 +745,7 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>   	 *
>   	 */
>   	if (usb_pipedevice(urb->pipe) == 0) {
> +		struct usb_device *old;
>   		__u8 type = usb_pipetype(urb->pipe);
>   		struct usb_ctrlrequest *ctrlreq =
>   			(struct usb_ctrlrequest *) urb->setup_packet;
> @@ -755,14 +756,15 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>   			goto no_need_xmit;
>   		}
>   
> +		old = vdev->udev;
>   		switch (ctrlreq->bRequest) {
>   		case USB_REQ_SET_ADDRESS:
>   			/* set_address may come when a device is reset */
>   			dev_info(dev, "SetAddress Request (%d) to port %d\n",
>   				 ctrlreq->wValue, vdev->rhport);
>   
> -			usb_put_dev(vdev->udev);
>   			vdev->udev = usb_get_dev(urb->dev);
> +			usb_put_dev(old);
>   
>   			spin_lock(&vdev->ud.lock);
>   			vdev->ud.status = VDEV_ST_USED;
> @@ -781,8 +783,8 @@ static int vhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>   				usbip_dbg_vhci_hc(
>   					"Not yet?:Get_Descriptor to device 0 (get max pipe size)\n");
>   
> -			usb_put_dev(vdev->udev);
>   			vdev->udev = usb_get_dev(urb->dev);
> +			usb_put_dev(old);
>   			goto out;
>   
>   		default:
> @@ -1067,6 +1069,7 @@ static void vhci_shutdown_connection(struct usbip_device *ud)
>   static void vhci_device_reset(struct usbip_device *ud)
>   {
>   	struct vhci_device *vdev = container_of(ud, struct vhci_device, ud);
> +	struct usb_device *old = vdev->udev;
>   	unsigned long flags;
>   
>   	spin_lock_irqsave(&ud->lock, flags);
> @@ -1074,8 +1077,8 @@ static void vhci_device_reset(struct usbip_device *ud)
>   	vdev->speed  = 0;
>   	vdev->devid  = 0;
>   
> -	usb_put_dev(vdev->udev);
>   	vdev->udev = NULL;
> +	usb_put_dev(old);
>   
>   	if (ud->tcp_socket) {
>   		sockfd_put(ud->tcp_socket);

thanks,
-- Shuah


