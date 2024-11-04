Return-Path: <linux-usb+bounces-17051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B05339BB67E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 14:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70588283AB4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 13:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B74B182B4;
	Mon,  4 Nov 2024 13:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WAhiYbbw"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F72513AC1
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730727605; cv=none; b=GtpO4Y2y2AtlgEstngRarHlHWsfESVlsCK/cs2HMcaEyC70a4mv4vx8DVsn3+m7FolPvlHUl+sCW1e3hmkNqtH07GHk8END40ncL3MBglLlohVADY4mfmUsOEGcOR+QXMEDvK4ZieZB8wMBZyJmYXegH63BYc/aouNE4gfXNYZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730727605; c=relaxed/simple;
	bh=9gxC9h6S3EiFhmhu/cadNuVULNtnVnJFllcnThHfjZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srRAjvn03T+Jew2OHXYQHkSN/mrbJZ+AO3d5godyDBESn2JBjBtnbfeXi4TZZYUJOZg1Mt0wN7vm0473YPlrhTsQvXaDRLD0ImzpyE/xyGNcMYjvOpyCiAyqpuMvi0AN4fbkxzVBjQABrEWGu6XNKZjI7Ft5S458vSAjK51b3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WAhiYbbw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730727602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzADOWrawgsVn5XhPwFPZBf8FcDLTQVqCU922gPDrEI=;
	b=WAhiYbbwzRDwD1TGlyhRcxVfMS4eSJ7gF4rwjvBaX0rqaa5J1y1iKYrEJ05uw0ixHhBVBS
	ekmh0FSJSP1glYsY2YuOTKAytw/SbhrE5uht6kvil4FxQ7WsUFjlkfHKs+/hU2JEvPWffd
	tX7stIXZqoHJ35N3M0My7e2z2mquHEA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-O5IU8I17MHOkYIl5Kn_Zgw-1; Mon, 04 Nov 2024 08:40:01 -0500
X-MC-Unique: O5IU8I17MHOkYIl5Kn_Zgw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5cbb635c3f3so4425523a12.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 05:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727600; x=1731332400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzADOWrawgsVn5XhPwFPZBf8FcDLTQVqCU922gPDrEI=;
        b=tQVKZntDtFP+cxiu3BT11/ilK9bbfcuoKfeW5ieTxIkHi61bHp9bhGt8eRedP/BlVQ
         tiu89j79g+/vWqMOrCGJ7wxv+nSIUR14UFk5C7wzuk+ofSdPzq/laU9MvN5y7wcsG3Qt
         wc7cual3w6GsUsZbWUgjfogn1i2bhGEBmZVXk92vdWmtLTRQKU9eRp/LmMuTJrR/1AT2
         eNRkOoqABuzHxAl2zTOfjchhEQIE99X6Tm4YniA/qYo/D7pR3qyVXcVgupycmdI9uVlS
         3CcsH63vwScDc1f8mr7WPcvA+p2Zs/VgbiKKx8jS4IKGp1UGC7YEWO/8HkMwPpFeD4nD
         /xtg==
X-Forwarded-Encrypted: i=1; AJvYcCWo8A4Rqtu9eesKyX0HOom2BuzLPUTO2kfvs/txheDN2E9q775L4N4ahxTkWyv0RfzBYBnUndjB4QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxelV+RBZL34mM4QbCRiB0lbTe+LcJgASVpsvS8uC0HjF0DC7bU
	dwzS2I7E89kvHX29JfSyK5pzEKqu5PSw5duYUkRMWiQb3OgQUjR4gpxy3E3yIN7D5/CT2b6ytcy
	X/quoU8gEwmAWait7R+7OReAeJCzW5PYoHNAq12PURVhzIEm3NJfDnYR83G0cQyvHzg==
X-Received: by 2002:a05:6402:514e:b0:5c9:85e8:ec8c with SMTP id 4fb4d7f45d1cf-5ceabf0d370mr12677784a12.6.1730727600274;
        Mon, 04 Nov 2024 05:40:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUiXoceojSJUeOz+6DO8mbzv/TqV9030Xps65Omq/Bev81Yw0ibbyuivBSIuBz9vdT/hG2JQ==
X-Received: by 2002:a05:6402:514e:b0:5c9:85e8:ec8c with SMTP id 4fb4d7f45d1cf-5ceabf0d370mr12677773a12.6.1730727599885;
        Mon, 04 Nov 2024 05:39:59 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7e9286sm4443241a12.86.2024.11.04.05.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:39:59 -0800 (PST)
Message-ID: <0e0d4146-a083-4263-a06b-c6277e89ddc5@redhat.com>
Date: Mon, 4 Nov 2024 14:39:57 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Nov-24 9:50 AM, Stanislaw Gruszka wrote:
> Do not mark interface as ready to suspend when we are still waiting
> for response messages from the device.
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/usb/misc/usb-ljca.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index 01ceafc4ab78..dcb3c5d248ac 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -332,9 +332,6 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
>  
>  	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
>  			   msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);
> -
> -	usb_autopm_put_interface(adap->intf);
> -
>  	if (ret < 0)
>  		goto out;
>  	if (transferred != msg_len) {
> @@ -353,6 +350,8 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
>  	ret = adap->actual_length;
>  
>  out:
> +	usb_autopm_put_interface(adap->intf);
> +

I'm afraid that this now does a double pm_runtime_put() on
usb_autopm_get_interface() failures. usb_autopm_get_interface() uses
pm_runtime_resume_and_get() which already does a pm_runtime_put()
on failure.

So you need to add a second out label which skips the new
location of the usb_autopm_put_interface(adap->intf); call
and jump to this second label on usb_autopm_get_interface()
failures.

With that fixed this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have also given this a test run on a "ThinkPad X1 Yoga Gen 8" and
everything there works at least as well as before:

Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740

Regards,

Hans




>  	spin_lock_irqsave(&adap->lock, flags);
>  	adap->ex_buf = NULL;
>  	adap->ex_buf_len = 0;


