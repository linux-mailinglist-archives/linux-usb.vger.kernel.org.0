Return-Path: <linux-usb+bounces-20959-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6259DA4133D
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 03:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 904547A357F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 02:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF31F19DF41;
	Mon, 24 Feb 2025 02:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NhxQWEag"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C5B198842
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 02:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740363290; cv=none; b=uQTzYzaWQ2qzrtwvaBk6Jw5m3qmfFPWtlXfeLs7TfoH6qtEYa3JFjEyJ6cqDi5OEYtcmACq2SnnuGb37CpyhBNPH/Fmqc1w3CEHxKVYpiYx/kyKUpHLfFkcxgljIv4XxaQvYPWxBVJBuhA7cmTS3Y0zgiq0q4JoKGtiE5wY4LEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740363290; c=relaxed/simple;
	bh=cGFyDb3wkw3IVB4YHib65YBYJhFniNIy4H5n+N6cuTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEtvATA1xZq8sKnFzZsIf9G5RhwyuoW5DRnacAzaCotrg+r788GGeg1M5d3OgxdiGgsAuu+GytU4VRzDPhHWM1K6EDTiKWkAE97KVnkcw9cpmGiWs+44DdpS5ei93f8ZavHmdoMvk4TTJjKWkF2EjGTHFaEDbND6+0W+/Jc0sM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NhxQWEag; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c07cd527e4so377744685a.3
        for <linux-usb@vger.kernel.org>; Sun, 23 Feb 2025 18:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740363287; x=1740968087; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o9a8p1TLqjqUec+1waZ0PqoZqvLxcStUv4ZO4Yaqd4Q=;
        b=NhxQWEag6dCa935UTygGOBpucwjgtok9kvt6u0P2P3ta4tesuGye13/L9b7BFyLMoy
         Q75iO48Dt5rrV5tYQ+Dy3lvdnj9cCoiHKg1G2Z9q54FSQa6ewRqKbMHMO/62jXeaDDf2
         Ab+S5v55BK2t8w4kcfAa/6bdH2YcmRbApCfHO98Rcm7IbVXLEAeclxdbG8TOcS2qa1RQ
         GuLzTQ+i0REVtiwmku77ASYLw1KjvpK867TnDgBfMhidd/ITgTK90uY11ObpkAG7FfFt
         jMVtoJtIJE98iSgvFPogEbVpqoFHWAhRYbkYEYpVSSyPSkcNP37GUupm1EcmX4nKUbcX
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740363287; x=1740968087;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9a8p1TLqjqUec+1waZ0PqoZqvLxcStUv4ZO4Yaqd4Q=;
        b=KaiuA4FRraD7hx+YS4bX2no7+XbXtnyzHp+84jZnSrhBndYo9PEY4jvxoTHpKB7yVj
         8BnEBymRPWZsq8lrV5NrLHTBaREa5JLSthUIXrKw/Tmnu91p5Sm0vtvPu3FqXqtGMKtF
         uRGoPwysDqE3irzWCd3Sy+ftZg3LFaSR+V9VJNL53E6Yofjk/aMKD1QWvWZLpz/w5hor
         453wiTAOHx5PDA6ETEv1c6vZ06ZaGJfrwkvLDNCUNUrYWuoOyp1NjeSF/acvTuE6vyWP
         U7APLGOsXGdN27OBfgFKD8HyJgIwcgbBiXOVID2phQTjDkOOahNhrQQQ+YCz/lEiLZyQ
         DKTA==
X-Forwarded-Encrypted: i=1; AJvYcCVnS0BSqsMEk8hRQdg12xV8rLyWOwuevs3zw6EK9sVJMMrDBASCYaruGfdX44s1avWV2iasdR7KIVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wvjRy/5/FkcVLcsXypk6MWYzHi+r+oAOgjo7Jv8mSUhSufIl
	6xm876+PV3dfujXGg8HqTETzCzS8a9PXJnRJ4tpL8OfIWbhFOfc9X+pCzjOw3g==
X-Gm-Gg: ASbGncvVDtUsGMszFg+X6duHFeksWVnOh+QQdjn3B9DYufayS28gds298KzNFJ36+Jr
	esWA7DC69dXuEpyx0VKy9PAeSSBBwte4wWY0kmJjzA4HrmE4tTF/l2TbaYbBTLAN/5ymnIjAd7U
	5aJodeNGuV0DEQQvYIUtrbgw4rLR0mxpxjL5OnJ2dmnALRktUxWN63ArdTDiMbhtzCDXwDb/aZs
	B0NsGCtjuhsaHANojcLSxgQffgvoVV2o+zp+oU3kV7pa0uKFXE4iwNRQTTDRQZoNJU4vHdDOIuY
	H9hvQuqYdGmTeowbAisprPm3l3s=
X-Google-Smtp-Source: AGHT+IGqf6u3zyPa7YaviLfJibT07SED0t/CvblWsVMGNvullM0tAESY8XdRd3k+WL6em7xhdDW7tg==
X-Received: by 2002:a05:620a:370e:b0:7c0:c0fc:c5c4 with SMTP id af79cd13be357-7c0cef0f362mr1278887785a.33.1740363287362;
        Sun, 23 Feb 2025 18:14:47 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::2dc7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65dcf88d6sm128097686d6.122.2025.02.23.18.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 18:14:46 -0800 (PST)
Date: Sun, 23 Feb 2025 21:14:43 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ma Ke <make24@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, elder@kernel.org, quic_zijuhu@quicinc.com,
	kekrby@gmail.com, oliver@neukum.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] USB: Skip resume if pm_runtime_set_active() fails
Message-ID: <46943a7b-db0e-4799-84e6-23a9d0c6ddfe@rowland.harvard.edu>
References: <20250224013325.2928731-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224013325.2928731-1-make24@iscas.ac.cn>

On Mon, Feb 24, 2025 at 09:33:25AM +0800, Ma Ke wrote:
> A race condition occurs during system suspend if interrupted between
> usb_suspend() and the parent device’s PM suspend (e.g., a power
> domain).

I don't understand exactly what you mean.  Is this supposed to be a 
scenario where a USB device is suspended during a system sleep 
transition, but before the device's parent can be suspended, the 
sleep transition is aborted?

>  This triggers PM resume workflows (via usb_resume()), but if
> parent device is already runtime-suspended, pm_runtime_set_active()
> fails.

In other words, before the device can be resumed the parent goes into 
runtime suspend?  I don't understand how that could happen.  The PM core 
is careful to make sure that unwanted runtime PM changes don't occur 
during system sleep/resume transitions.

And if somehow this can happen, doesn't that indicate the real problem 
lies in the PM core?  After all, why shouldn't the same sort of race 
condition affect a device on any bus, not just USB devices?

>  Subsequent operations like pm_runtime_enable() and interface
> unbinding may leave the USB device in an inconsistent state or trigger
> unintended behavior.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 98d9a82e5f75 ("USB: cleanup the handling of the PM complete call")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/usb/core/driver.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 460d4dde5994..7478fcc11fd4 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1624,11 +1624,17 @@ int usb_resume(struct device *dev, pm_message_t msg)
>  	status = usb_resume_both(udev, msg);
>  	if (status == 0) {
>  		pm_runtime_disable(dev);
> -		pm_runtime_set_active(dev);
> +		status = pm_runtime_set_active(dev);
> +		if (status) {
> +			pm_runtime_enable(dev);

The patch description says that pm_runtime_enable() following an 
unsuccessful pm_runtime_set_active() may trigger unintended behavior.  
So why does the patch do it?

Alan Stern

> +			goto out;
> +		}
> +
>  		pm_runtime_enable(dev);
>  		unbind_marked_interfaces(udev);
>  	}
>  
> +out:
>  	/* Avoid PM error messages for devices disconnected while suspended
>  	 * as we'll display regular disconnect messages just a bit later.
>  	 */
> -- 
> 2.25.1
> 

