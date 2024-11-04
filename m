Return-Path: <linux-usb+bounces-17053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E859BB6A9
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 14:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3A49B224E8
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 13:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E3514A91;
	Mon,  4 Nov 2024 13:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gBdn+2JF"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8188BEE
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728239; cv=none; b=nkTPOowmsPaQaWILfwQLRJe0TOKFhDNFjQ1DtuyF9c4lJi2LgKGV6XQfka14nbYm0zHgWqoRrjswcGA3CMqJWiZvepNs+HnnwFomnXZGtZH+sUpDMP1/bMGP8+0lvFbGv8HJLwoLuU9Gz9yP8J8EzGxlOQkRTFsZqPas0ggDFwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728239; c=relaxed/simple;
	bh=/rSzhwRtAdhGT8kPmq/SEVslJOM/EIxE9t6I6pIQ2Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gfj2EywWe8gGglW1hAjypuq3T5G1wsyr9GBNjtaDToGpS8HKCOFyTM0DGegPZGtGpyUeO4aU/kPG5nVUBZj7bLshIAkPN01KxQhBwMoSLMKc5+rtDP1U61hJjJLO9xCs+zfptH9CON+aDAxfMuhvKyhdG9LTf29PrRwE4n7576I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gBdn+2JF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730728236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6LQUUf7X8lZcCb5D+M+QKKhaiG6AGnyLY/BSrt+eFQ=;
	b=gBdn+2JFWGzS+ZuZTP7Jg6+s9D/0m1BlbqjjhZ1jiuPOuelxUF3ERsa2DSWO1UXVAxhopR
	6yBrvRGxAXRlTHIeq0TY+IrtudiRZG6eto2pY85DjTK0F+q1dfdGm3SeNi8kRalQ4GtZ5i
	Qyi16FGnj7QeBL2ZC0q3/kHMm49fJ3c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-EIO5DUYIPuKjvbj5JZ-MhA-1; Mon, 04 Nov 2024 08:50:34 -0500
X-MC-Unique: EIO5DUYIPuKjvbj5JZ-MhA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a0710ca24so307600666b.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 05:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728233; x=1731333033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6LQUUf7X8lZcCb5D+M+QKKhaiG6AGnyLY/BSrt+eFQ=;
        b=GQ57Ium1SopNOZ/7cQV3OOJEiVyO0Drw4NuNQAvaERlyB08htBQ0hB1Y4Cd9E69+GH
         FArPh00mjUSrHhajSFjrnLJH4xdcNjINt5z2BZmDlanalhx6/NAEEa47ghFuGcdbMCd0
         2ixnAtzrj62fMZd1ETMPlemROk7jM/0ETZ5p9yC5zz3SB0huy3SmOOJ++wq0AQU3XGqr
         W0GCEAbvqxJZBWcRlV1J4KWiLnXsBep5lRPhDX/jNQJhP2/48j/zSiUmohnIBsSFvRPf
         gIO1nWq0DFqUdU8MEqYBf5c4PrUZoSbfB2AcTKfpmyyRVMtURL6yl3uHcfNSiBZ0g+lC
         L/1A==
X-Forwarded-Encrypted: i=1; AJvYcCVFQ0qKSgDTILDZbHaAN56O+PiCvL2rfYH3zkz/iZdzaVmaMHYmvw5NV2KdK3GxpKwxNVwdZQ7NAEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztKiPF5Hau0mb5j6u8I9dVeWw6U7NDHBuFwyDOu/yduxsN+hmH
	osLtbpOlNZGy72Q5XEWdlgX3Rtv0PRs2HpsuuBBhILlIRoZ8mXQmunDfLzh4tVInA/wfs4YOqlM
	XPH5U0j7pEM0OI5coqf73t5g+fur3PH9hKHK1RwXeq6ehkBXBIYsEKVP4Pg==
X-Received: by 2002:a17:907:970e:b0:a9a:2a56:91e with SMTP id a640c23a62f3a-a9e3a574f2cmr1846708566b.6.1730728232707;
        Mon, 04 Nov 2024 05:50:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGopdOo66Tx26/OlD+wtkgB8IBZoM3N1TJQQqpplyg9WoT9v/7RUNNiwP3UuWMsOeOAqRUWw==
X-Received: by 2002:a17:907:970e:b0:a9a:2a56:91e with SMTP id a640c23a62f3a-a9e3a574f2cmr1846706166b.6.1730728232310;
        Mon, 04 Nov 2024 05:50:32 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565e0940sm554044166b.104.2024.11.04.05.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:50:31 -0800 (PST)
Message-ID: <c669e2fd-5c6e-4f8d-bee3-1af4abb8b61a@redhat.com>
Date: Mon, 4 Nov 2024 14:50:31 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] usb: misc: ljca: set small runtime autosuspend delay
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
 <20241104085056.652294-2-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241104085056.652294-2-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Nov-24 9:50 AM, Stanislaw Gruszka wrote:
> On some Lenovo platforms, the patch workarounds problems with ov2740
> sensor initialization, which manifest themself like below:
> 
> [    4.540476] ov2740 i2c-INT3474:01: error -EIO: failed to find sensor
> [    4.542066] ov2740 i2c-INT3474:01: probe with driver ov2740 failed with error -5
> 
> or
> 
> [    7.742633] ov2740 i2c-INT3474:01: chip id mismatch: 2740 != 0
> [    7.742638] ov2740 i2c-INT3474:01: error -ENXIO: failed to find sensor
> 
> and also by random failures of video stream start.
> 
> Issue can be reproduced by this script:
> 
> n=0
> k=0
> while [ $n -lt 50 ] ; do
> 	sudo modprobe -r ov2740
> 	sleep `expr $RANDOM % 5`
> 	sudo modprobe ov2740
> 	if media-ctl -p  | grep -q ov2740 ; then
> 		let k++
> 	fi
> 	let n++
> done
> echo Success rate $k/$n
> 
> Without the patch, success rate is approximately 15 or 50 tries.
> With the patch it does not fail.
> 
> This problem is some hardware or firmware malfunction, that can not be
> easy debug and fix. While setting small autosuspend delay is not perfect
> workaround as user can configure it to any value, it will prevent
> the failures by default.
> 
> Additionally setting small autosuspend delay should have positive effect
> on power consumption as for most ljca workloads device is used for just
> a few milliseconds flowed by long periods of at least 100ms of inactivity
> (usually more).
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Thank you so much for looking into this and fixing it!

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have also given this a test run on a "ThinkPad X1 Yoga Gen 8" and
everything there works at least as well as before:

Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740

Regards,

Hans

p.s.

I take it from the commit message that you have no clear idea what exactly is
happening in the failure case ?







> ---
>  drivers/usb/misc/usb-ljca.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
> index dcb3c5d248ac..062b7fb47114 100644
> --- a/drivers/usb/misc/usb-ljca.c
> +++ b/drivers/usb/misc/usb-ljca.c
> @@ -810,6 +810,7 @@ static int ljca_probe(struct usb_interface *interface,
>  	if (ret)
>  		goto err_free;
>  
> +	pm_runtime_set_autosuspend_delay(&usb_dev->dev, 10);
>  	usb_enable_autosuspend(usb_dev);
>  
>  	return 0;


