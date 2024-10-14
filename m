Return-Path: <linux-usb+bounces-16187-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A999D419
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 17:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8E8BB24696
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2024 15:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171D01C729B;
	Mon, 14 Oct 2024 15:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fNN7CBpZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10171B4F17
	for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728921407; cv=none; b=nMge7OnNFuYE3cpoK2YeEyVks5KMWUuM3tYGGUDwCgn2Ry2FgOhAUcSr7eC5aFOGdWhcGX8ZFSBi1NXsXktSpq7jKJTHJYxBaWYVjInnosuqDWskVq6n/Z6+0HlII0pY0zAPNwF7VolpKsODQys8TIAnHCesO+92+x/Evq+Trg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728921407; c=relaxed/simple;
	bh=Rbd/ChyGTacobL4pWk0kh3qA0AC/MXgdsddJsO3lpNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRV2E/HzQVFhEHPniSbldrKIEAjYHCXmUY+DmDLUIQEXdRAHN6niIb/TNYCreNNmMW+LDcQDu+LQ4EnrV1892HADO5e5YdcV8C0es7ikbela59JBCS6cK9np6pucOFlbFLJV4Rbsd/1f4l54aWM0rDr1DmOFxLQwhnc5ku288SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fNN7CBpZ; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cbcc2bd7fcso29337586d6.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2024 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728921404; x=1729526204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=be1hrvlUsBpjG6CtOzQIeoA7DeG52DJehIShe6TxuJg=;
        b=fNN7CBpZ+RHAZ0Qde8Z82kQspHHC2JsPP0FsUXRE7FgRmaJkoLc/xJo9nj+65HVti1
         Uewm9bZnst7sddSWiFiqNzY6mVbexJfZCEvNQfkb4deuv0kkCRPLAxm+d40WpSAS/a4T
         OvBFMAUspub0j8RP4UfEM/XxsVgmgpdPgsixkBVSb+U4fEufjWHAeG2aHXetfyQftHjm
         28x3OSP/6hxlCvrOUIrOBbQRaaHSPfyeczzk6u3LXdaAeceThqBuvRKNdnC4VMyGhJU2
         +5TeoWhYhKv3ygVqq7326U/HTszG9SNTkod7SA+RGOQMxocMYnqmV5cca9p/zdLkDatt
         OJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728921404; x=1729526204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=be1hrvlUsBpjG6CtOzQIeoA7DeG52DJehIShe6TxuJg=;
        b=KUNdAbfJZo8M+X/m/wLP8p5j8Tuu7TA/hmcRA1fOK5KDz88KNrp+te+ochxlRmM0rw
         hMlkAV9+3MKRUwPzfJ+GONGbAzuB51v1OR9+OlWtMywX/0UVVWTu4FZ7x0TyU0GAc7ka
         ZlfPlqfdwtp/FNQXEuLogrJe4rjzw/k/nsSpmlniDT/rdtQNk4m7x1315jdOG1hND/LO
         95P4M/VG7wb9tpwOSevsLs2fgMngVSK1vgTkItPDpXkxLbiiTt/JR6cHPXkVsNTLZ5vy
         K7wRETPEW/c8V2bOyToc+IRdtqBgfP/vAkpMwQM320nA6FvAUmtnsJVsSqFmdtMl2mt5
         9NWA==
X-Forwarded-Encrypted: i=1; AJvYcCVukdDvW0qQGNznKlp5ygAXGOAqu9TiBT/eMbKnI6iCQJ+kZQ8BWViU3MA+r/P9fq7WnLjfwlc/EP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRwysk2ZoACS59EkB0qRtZOgsqzbWgJf6zlnC/6NhvHx1RHpzl
	zHRjAqyxviH2wuF1gUijdhGWKuQN3ao8oAUVIxlbxNLgS92XwVSfJ9esUeTutw==
X-Google-Smtp-Source: AGHT+IGdot33FySr+PpKn3xDNoWp1lPSKAmLfTIJ2M3YboljTXEQHme1fTL63RXssphS6RehdMyzzg==
X-Received: by 2002:a05:6214:5b06:b0:6cb:d1ae:27a6 with SMTP id 6a1803df08f44-6cbf0095668mr170844676d6.24.1728921403730;
        Mon, 14 Oct 2024 08:56:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::c666])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe8608bf1sm47088546d6.91.2024.10.14.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 08:56:43 -0700 (PDT)
Date: Mon, 14 Oct 2024 11:56:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	mathias.nyman@intel.com, yajun.deng@linux.dev,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com,
	niko.mauno@vaisala.com, andreyknvl@gmail.com,
	christophe.jaillet@wanadoo.fr, tj@kernel.org,
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com,
	ricardo@marliere.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	badhri@google.com, albertccwang@google.com, quic_wcheng@quicinc.com,
	pumahsu@google.com
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system
 sleep
Message-ID: <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014085816.1401364-6-guanyulin@google.com>

On Mon, Oct 14, 2024 at 08:50:29AM +0000, Guan-Yu Lin wrote:
> Sharing a USB controller with another entity via xhci-sideband driver
> creates power management complexities. To prevent the USB controller
> from being inadvertently deactivated while in use by the other entity, a
> usage-count based mechanism is implemented. This allows the system to
> manage power effectively, ensuring the controller remains available
> whenever needed.
> 
> Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
> ---
>  drivers/usb/core/driver.c         | 10 ++++++++++
>  drivers/usb/core/hcd.c            |  1 +
>  drivers/usb/core/usb.c            |  1 +
>  drivers/usb/dwc3/core.c           | 13 +++++++++++++
>  drivers/usb/dwc3/core.h           |  8 ++++++++
>  drivers/usb/host/xhci-plat.c      | 10 ++++++++++
>  drivers/usb/host/xhci-plat.h      |  7 +++++++
>  sound/usb/qcom/qc_audio_offload.c |  3 +++
>  8 files changed, 53 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index e713cf9b3dd2..eb85cbb1a2ff 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -1583,6 +1583,11 @@ int usb_suspend(struct device *dev, pm_message_t msg)
>  	struct usb_device	*udev = to_usb_device(dev);
>  	int r;
>  
> +	if (msg.event == PM_EVENT_SUSPEND && usb_sideband_check(udev)) {
> +		dev_dbg(dev, "device accessed via sideband\n");
> +		return 0;
> +	}

I'm not so sure about this.  By returning early, you prevent the drivers 
bound to this device from suspending.  But they can't operate properly 
when the system is in a low-power mode.  Won't that cause problems?

Maybe this really belongs in usb_suspend_device(), and its counterpart 
belongs in usb_resume_device().

> +
>  	unbind_no_pm_drivers_interfaces(udev);
>  
>  	/* From now on we are sure all drivers support suspend/resume
> @@ -1619,6 +1624,11 @@ int usb_resume(struct device *dev, pm_message_t msg)
>  	struct usb_device	*udev = to_usb_device(dev);
>  	int			status;
>  
> +	if (msg.event == PM_EVENT_RESUME && usb_sideband_check(udev)) {
> +		dev_dbg(dev, "device accessed via sideband\n");
> +		return 0;
> +	}
> +
>  	/* For all calls, take the device back to full power and
>  	 * tell the PM core in case it was autosuspended previously.
>  	 * Unbind the interfaces that will need rebinding later,
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 1ff7d901fede..9876b3940281 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2593,6 +2593,7 @@ struct usb_hcd *__usb_create_hcd(const struct hc_driver *driver,
>  	timer_setup(&hcd->rh_timer, rh_timer_func, 0);
>  #ifdef CONFIG_PM
>  	INIT_WORK(&hcd->wakeup_work, hcd_resume_work);
> +	refcount_set(&hcd->sb_usage_count, 0);

Did I miss something?  I didn't notice this field in any of the earlier 
patches.  Was it already created by the prerequisite series?  If so, why 
didn't that series do this initialization?

>  #endif
>  
>  	INIT_WORK(&hcd->died_work, hcd_died_work);
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 0b4685aad2d5..d315d066a56b 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -671,6 +671,7 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
>  	dev->state = USB_STATE_ATTACHED;
>  	dev->lpm_disable_count = 1;
>  	atomic_set(&dev->urbnum, 0);
> +	refcount_set(&dev->sb_usage_count, 0);

And doesn't this belong in the 3/5 patch, the one that creates the 
sb_usage_count field?

Alan Stern

