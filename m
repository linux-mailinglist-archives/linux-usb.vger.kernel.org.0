Return-Path: <linux-usb+bounces-16604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D929ACC3A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 16:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48A022846CF
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 14:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FC71BFE10;
	Wed, 23 Oct 2024 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LTQmnv+L"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03491B86CC
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729693542; cv=none; b=mRKbDrXL7n4RJh0SWrhUfNlNj01xNxN0OxD4Xvo9kUGMZiLgaZrS2q3X9W7/OXaCyxA0WxaVc2PUE/D85enoE5jB6vxBZNgFnlF9ih3mGvkHQVYvm4Xtcd5EIOjl+y3yTEDddigWVs8pp6RHKAbAgJE8Pw8Eq+9V41D9fQyWXUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729693542; c=relaxed/simple;
	bh=mldi5V/iyoRjQuEdXOitTnbsaq+TjOnrAbgtqHLTJ30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3QI3YibkFZVKuj1RbkU0OeAYkhfpYGIuE7Vc4eRM5zvQU/ZzgjBe6zHcSPy/pw3h+mjy9LQIBuJypEBe3B3dJAo7U4DF8M9QskZYiwDU9c7+K3JwxYVBrlI7trFhnE6NIVuO91sY+TeH/XwLHRoRi27c2UdemJ2cX05pCRJBig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LTQmnv+L; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ebc1af8f10so1578636eaf.2
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729693540; x=1730298340; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B1TunOSUY+zMcZnzhxxb/mRlqYBNrCsm3sL0XW/YmUg=;
        b=LTQmnv+LpP/v7T2vSnTNuMJ8LuXEnxQqYc8rOVbkPiILlqMjBe1uhCTGizMJNVy0So
         erdYqBniZsUeL2D9ccHvFLpqa6qL+m8cI/OSz9RGmoJFuNjE/WCoG4e2/6lidD0A/7CR
         2HrJiIDQ7RdGEqavxKbnl5gG4I6e3WiQxb1/OFtdUPYFUplHzMWyKNwa8EM4Cnojr86N
         x1TdpXkCvdn3TNEFOs1pwTiTPG00fQPKhCZhO60dWhWhXXE1rRKbEMm26PFsIx6Q7uF5
         1uvE/cbaptODY5iPh63fz87IERLqmL2C36/9K8ilV6+yAhOLSBzMr2a//XznKVCQqyKj
         PFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729693540; x=1730298340;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1TunOSUY+zMcZnzhxxb/mRlqYBNrCsm3sL0XW/YmUg=;
        b=Ipy7D+oRXJjPgy4yhZic6oEp61lJK7Ku8dA6YdnHUmc4hKl1EJ92aBvIxAJy1lNDcQ
         FhJopFX97c+fSj4LKzSqFZzmMr28DZlGTQeVctP769Z5vegGVvdXl9XDkOt+BdQ78g0F
         Gb2BEZyBaKB0/ciCdYDBpN1EgxJZPl3jRdgHLbfR866cdoNG2VQOz81tNym0JwVZDdbz
         GWKPtGqVzfwi0MqwUjkH0lpSX+t0U/r59wFHyDKDwtMoSRVVczTBDHF3IAyC2cNEmw7G
         jV6h2aiTACg2F8zJhH5/2VXQ4rEgKZ11jdYdc1b2UQT1bcU+QSrTojIqdJC7E6QlmBRe
         xCQw==
X-Forwarded-Encrypted: i=1; AJvYcCVm6EK8KQ2MIxxp4ax9UV68DW+NYZpmOYrqTzDefsgsv7kf/MWtVsZr8T/5HXFE1roP08vfNTL9SUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkCmv5nLkXGjV+ZoCdU8pEnv8i3YPtj0wem+ywJiXrZoFoV+XO
	AOI0IK049RWLDQ6LDJJhgkPLnQdfM40S3xD20d8/iCpEYuvGVjWYSns7KuhwHA==
X-Google-Smtp-Source: AGHT+IHYKkMzrgJ8geOTyZkUGs29y+cOzXjZq6Vwva4wzvjm6iVhWr15fLwm/y6UHA0sXzEu/VeScg==
X-Received: by 2002:a05:6358:63a9:b0:1c2:f60c:7347 with SMTP id e5c5f4694b2df-1c3d81bc7fbmr163166555d.27.1729693539921;
        Wed, 23 Oct 2024 07:25:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-460d3d71664sm41141291cf.71.2024.10.23.07.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 07:25:39 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:25:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: huanglei814 <huanglei814@163.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	huanglei <huanglei@kylinos.cn>
Subject: Re: [PATCH v4] usb: core: adds support for PM control of specific
 USB dev skip suspend.
Message-ID: <561a32d3-a37a-4b16-a214-8f4bacc17b8a@rowland.harvard.edu>
References: <20241023034457.13241-1-huanglei814@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023034457.13241-1-huanglei814@163.com>

On Wed, Oct 23, 2024 at 11:44:57AM +0800, huanglei814 wrote:
> From: huanglei <huanglei@kylinos.cn>
> 
> All USB devices are brought into suspend power state after system suspend.
> It is desirable for some specific manufacturers buses to keep their devices
> in normal state even after system suspend.

Here you should explain _why_ this is desirable.  People will want to 
know, so that they can judge whether this is a good thing to do.

> Signed-off-by: huanglei <huanglei@kylinos.cn>
> ---
> v3->v4:
> - Cancel SUSPENDED state judgment when enter suspend，because udev will not enter.
> - Change "usb-skip-suspend" to "usb-never-suspend"
> - Change dev_err to dev_info.
> - Remove Kconfig option, it's redundant indeed.
> - Update commit message style.
> v2->v3:
> - Rebase and update commit message.
> v1->v2:
> - Change to bool type for skip_suspend.
> - Kconfig remove "default n", 'n' is the default.
> ---
>  drivers/usb/core/driver.c    | 8 ++++++++
>  drivers/usb/host/xhci-plat.c | 5 +++++
>  include/linux/usb.h          | 7 +++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 0c3f12daac79..93137c7c34df 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1583,6 +1583,11 @@ int usb_suspend(struct device *dev, pm_message_t msg)
>  	struct usb_device	*udev = to_usb_device(dev);
>  	int r;
>  
> +	if (udev->bus->skip_suspend && (msg.event == PM_EVENT_SUSPEND)) {
> +		dev_info(dev, "abort suspend\n");
> +		return 0;

Do you really need this message at all?  Maybe it should be dev_dbg, 
because it's useful only to developers, not to normal users.

Also, you're not really aborting the suspend; you're skipping it.

> +	}
> +
>  	unbind_no_pm_drivers_interfaces(udev);
>  
>  	/* From now on we are sure all drivers support suspend/resume
> @@ -1619,6 +1624,9 @@ int usb_resume(struct device *dev, pm_message_t msg)
>  	struct usb_device	*udev = to_usb_device(dev);
>  	int			status;
>  
> +	if (udev->bus->skip_suspend && (msg.event == PM_EVENT_RESUME))
> +		return 0;
> +
>  	/* For all calls, take the device back to full power and
>  	 * tell the PM core in case it was autosuspended previously.
>  	 * Unbind the interfaces that will need rebinding later,
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index ecaa75718e59..35062aa19a32 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -265,6 +265,11 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>  		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
>  			xhci->quirks |= XHCI_SKIP_PHY_INIT;
>  
> +		if (device_property_read_bool(tmpdev, "usb-never-suspend")) {

Hmmm.  "usb-never-suspend" implies that the bus won't even be put into 
runtime suspend, but that's not what you mean.  What you really mean is 
more like "stay-powered-during-system-suspend", but that name is a bit 
long.  Maybe you can think of something better.

Also, this sounds more like the manufacturer's policy decision rather 
than a hardware limitation.  Is that correct?  If it is, I doubt that 
the setting really belongs in DT.

> +			hcd_to_bus(hcd)->skip_suspend = true;
> +			hcd_to_bus(xhci->shared_hcd)->skip_suspend = true;
> +		}
> +
>  		device_property_read_u32(tmpdev, "imod-interval-ns",
>  					 &xhci->imod_interval);
>  	}
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 672d8fc2abdb..c854d1f622ec 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -487,6 +487,13 @@ struct usb_bus {
>  	struct mon_bus *mon_bus;	/* non-null when associated */
>  	int monitored;			/* non-zero when monitored */
>  #endif
> +
> +	bool skip_suspend;		/* All USB devices are brought into suspend
> +					 * power state after system suspend. It is
> +					 * desirable for some specific manufacturers
> +					 * buses to keep their devices in normal
> +					 * state even after system suspend.
> +					 */

This is not a good comment.  It doesn't say what the skip_suspend flag 
means.  You don't need to explain the reason for the flag here; just 
explain what it does.

Alan Stern

>  };
>  
>  struct usb_dev_state;
> -- 
> 2.17.1
> 
> 

