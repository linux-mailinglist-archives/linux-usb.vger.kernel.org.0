Return-Path: <linux-usb+bounces-14788-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C8A96F63C
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 16:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9E33280DC3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 14:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66DA1D04B4;
	Fri,  6 Sep 2024 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nCdsvhQB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D81CFED6
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631516; cv=none; b=m9vrOCrhQ/pVsrEPoyiWsAeLkamHVz2CDtYDk4FZl8Fm1cT3noYVtYK/zNCMumop4SndMNZADU/62M5mDe5pLhKkGtQ8U4mSePqkJB7K1u1SsrJDJdKS+A0oH32tbaMnxZeFh8WNW8r1uXjcHRjWGrTSB9umA5hrK1WgfohEQlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631516; c=relaxed/simple;
	bh=uDsqCwfI7vgNpHZZKv4YKyigu7g1XnPzVrDBj+LKp/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nv5inMuVCwilk+nXJAe4TMgY0UoXUc8NkQjZ8Q+Jxr6Kj1n4N1IWxoFd9Gr2vlov8ve2piY9po6OIsia0Y9z7cWzbnMdERTTaZNRVQuAgKcjiuAYUNc+e8BNV/3MtxPY3DXgmNShJLEmLnkw5LgRybmFbeE46poakAtKYtpME+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nCdsvhQB; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-456757d8871so12813431cf.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 07:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725631513; x=1726236313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYHQBKYKAdtYaK3msJholEAcglrE+FLWhPy/VM+Wan0=;
        b=nCdsvhQBIR91eSViFw06twy4BxZkq1U9jJhjGFmMhHmlJGAVYMDzQuErrmbkZdhzUV
         4IdzX7RRt6YoPIycX78UYlrEK5oZamtGSPWEFlTP4dYSpjb7aLc0c9a5BSVeRgzciJgD
         nCYAEc/EyRI6mqZin6evNFpI3vD1U5fPJ6L5vtoXpFaRbwPv0XGE6i12Tw0t1i7bMAHj
         QxUnahjvixnfSP0Pyo8HnNPa+VLxCYSIGSsSRMwfrRsfA8EgJfzBjrcMnDOXTWkkvCoM
         UQipM8+09RDpWZBwX47nnfrw9HT7MlXcBPb/JBU3Eu6dGJz8S3vcm3Oqqyk7+4gKgWLQ
         Tvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631513; x=1726236313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYHQBKYKAdtYaK3msJholEAcglrE+FLWhPy/VM+Wan0=;
        b=kjhx4T2G7sxuHRu29Ec/l41W6RQdGLcxMZMnMeJbD4BCzCnV4LcVER5ciOKkBHgP4p
         LdSYxWzAZM/oTvT2hTPqWagurpq3hiBIY4OoOF1mHxqnwrg/62WPLdir+1qkxys/mrCQ
         NxvbW+p/+xI5sx5w90+wJPi0IH//RhV7zg2i5Dnz0kvT5DyUNVsU5LR8BnKyHprOCAAv
         obFlRONWBJTGKaf4QZ3eOZgKTiBb2xbvZ8n9wLIoFSDtUGSW8iID5TFy4hoRDiysiUqS
         Mz3nvi0SolB1CGjTmi9rEvh8hK6B6bMXJKKAgIeXZx59JTNBjEY2H4spVDj9K8n8szhR
         9CZA==
X-Forwarded-Encrypted: i=1; AJvYcCU8WNj7ARZ6IjyL4q/lYMpkYT3DWeWfpd3tZG058uHqy20pL5INxvZx3lB+96BzIGZmivn1mHQKvus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+bqcocS4nGa3KJY81CqmvQBRbTOiZuQOsekRt/k5zzMnd85pR
	JGi53F2tJ4wYR/8oPThTVLVMgmYh8XlKvl3RGcl9T80rO2lMkaHQdyLt8IyNCw==
X-Google-Smtp-Source: AGHT+IHc+O3QFitoD9IjyvM885Rga7Y3BitGXxq51ednYgodsGbuU6GgswPl3iUBCWpjqD0dX6dLqg==
X-Received: by 2002:a05:622a:30e:b0:458:a70:d9b8 with SMTP id d75a77b69052e-4580c6e1f2emr32207891cf.26.1725631513134;
        Fri, 06 Sep 2024 07:05:13 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24a8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4581dec188fsm193331cf.42.2024.09.06.07.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:05:12 -0700 (PDT)
Date: Fri, 6 Sep 2024 10:05:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Duan Chenghao <duanchenghao@kylinos.cn>
Cc: gregkh@linuxfoundation.org, pavel@ucw.cz, linux-pm@vger.kernel.org,
	niko.mauno@vaisala.com, stanley_chang@realtek.com, tj@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: Fix the issue of task recovery failure caused by
 USB status when S4 wakes up
Message-ID: <50249245-fae6-480c-ac00-7e3fef97390d@rowland.harvard.edu>
References: <20240906030548.845115-1-duanchenghao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906030548.845115-1-duanchenghao@kylinos.cn>

[Please make sure that the lines in your email message don't extend 
beyond 76 columns or so.]

Lots of things here seem to be wrong.

On Fri, Sep 06, 2024 at 11:05:48AM +0800, Duan Chenghao wrote:
> When a device is inserted into the USB port and an S4 wakeup is initiated,

There is no such thing as an S4 wakeup.  Do you mean wakeup from an S4 
suspend state?

> after the USB-hub initialization is completed, it will automatically enter suspend mode.

What will enter suspend mode?  The hub that the device was plugged into?
That should not happen.  The hub initialization code should detect that 
a new device was plugged in and prevent the hub from suspending.

> Upon detecting a device on the USB port, it will proceed with resume and set the hcd to the HCD_FLAG_WAKEUP_PENDING state.

HCD_FLAG_WAKEUP_PENDING is not a state.  It is a flag.

> During the S4 wakeup process, peripherals are put into suspend mode, followed by task recovery.

What do you mean by "task recovery"?  We don't need to recover any 
tasks.

What do you mean by "peripherals are put into suspend mode"?  That's not 
what happens.  Peripherals are set back to full power.

> However, upon detecting that the hcd is in the HCD_FLAG_WAKEUP_PENDING state,
> it will return an EBUSY status, causing the S4 suspend to fail and subsequent task recovery to not proceed.

What will return an EBUSY status?

Why do you say that S4 suspend will fail?  Aren't you talking about S4 
wakeup?

Can you provide a kernel log that explains these points and shows what 
problem you are trying to solve?

> This patch makes two modifications in total:
> 1. The set_bit and clean_bit operations for the HCD_FLAG_WAKEUP_PENDING flag of Hcd,
> which were previously split between the top half and bottom half of the interrupt,
> are now unified and executed solely in the bottom half of the interrupt.
> This prevents the bottom half tasks from being frozen during the S4 process,
> ensuring that the clean_bit process can proceed without interruption.

The name is "clear_bit" (with an 'r'), not "clean_bit".

> 2. Add a condition to the set_bit operation for the hcd status HCD_FLAG_WAKEUP_PENDING.
> When the hcd status is HC_STATE_SUSPENDED, perform the setting of the aforementioned status bit.
> This prevents a subsequent set_bit from occurring after the clean_bit if the hcd is in the resuming process.

hcd_bus_resume() clears that HCD_FLAG_WAKEUP_PENDING bit after calling 
hcd->driver->bus_resume().  After that point, usb_hcd_resume_root_hub() 
won't be called, so how can HCD_FLAG_WAKEUP_PENDING get set again?

Alan Stern

> Signed-off-by: Duan Chenghao <duanchenghao@kylinos.cn>
> ---
>  drivers/usb/core/hcd.c | 1 -
>  drivers/usb/core/hub.c | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 1ff7d901fede..a6bd0fbd82f4 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2389,7 +2389,6 @@ void usb_hcd_resume_root_hub (struct usb_hcd *hcd)
>  	spin_lock_irqsave (&hcd_root_hub_lock, flags);
>  	if (hcd->rh_registered) {
>  		pm_wakeup_event(&hcd->self.root_hub->dev, 0);
> -		set_bit(HCD_FLAG_WAKEUP_PENDING, &hcd->flags);
>  		queue_work(pm_wq, &hcd->wakeup_work);
>  	}
>  	spin_unlock_irqrestore (&hcd_root_hub_lock, flags);
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 4b93c0bd1d4b..7f847c4afc0d 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -3835,11 +3835,14 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
>  
>  int usb_remote_wakeup(struct usb_device *udev)
>  {
> +	struct usb_hcd  *hcd = bus_to_hcd(udev->bus);
>  	int	status = 0;
>  
>  	usb_lock_device(udev);
>  	if (udev->state == USB_STATE_SUSPENDED) {
>  		dev_dbg(&udev->dev, "usb %sresume\n", "wakeup-");
> +		if (hcd->state == HC_STATE_SUSPENDED)
> +			set_bit(HCD_FLAG_WAKEUP_PENDING, &hcd->flags);
>  		status = usb_autoresume_device(udev);
>  		if (status == 0) {
>  			/* Let the drivers do their thing, then... */
> -- 
> 2.34.1
> 
> 

