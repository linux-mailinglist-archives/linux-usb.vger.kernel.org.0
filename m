Return-Path: <linux-usb+bounces-21974-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8F1A6A871
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 15:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68C05982191
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 14:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF12222560;
	Thu, 20 Mar 2025 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="maky9Uhj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF742144C9
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480710; cv=none; b=cQUOk6Yw31paFlgukBv0erHIrZZ338vJqoBaqibP5IuzmCW+ijLF/SngLf/VU9cUKF9ybSPnFOdBtznxE0RFcLA2wDNsM4ikVl9OsV07e4jwfky19jEmb+hfAXwLlVpAhfXhOXK+RUNLF49My7INw7NpsCd3LFYeg9WxxwuQKcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480710; c=relaxed/simple;
	bh=F4KnFhSzOX6eIyHkk5hZbAmDvmdul5GOQycv8LDllbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1aEWgk8Q8qIjg/DdjA6S22ywQyBo8Nvq6im2ApasBEflV6LQH6MNHMFCF83sINKtLoH2bjLDtqyjchZCyzVnw32jTIhmM3X2y8Nhqh2wtdyeWWSk3P5BzfRWWqhpTTBQIdU7jB7KwqQwm06abjD8W/A89lde/S3Eimoh9Ggu4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=maky9Uhj; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e91d323346so8798756d6.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 07:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742480708; x=1743085508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NcufIoTquObc4xvWCnB60+ugCUZsUArli95nP/Pg8FY=;
        b=maky9Uhje3w22PFPZzsqOOZpe0FBdsqRk8zLWN4jEAWlz/oCpfVEjQ4K9Ym/hP+0qU
         coKT4dlLGqv0+Es24b02TTuW5Xm8jwLp6Zp+KRPfV/O6Ze7dlN/yqzUJDKENx9OyUEre
         J8n2UCGBJuI3734QQBfMqWL+00VRxsrU9nGprgw4RbWGTM/YNIT0SMmTaiunQKeIOgDe
         zAxqclnfdpKqkT15En3Z19FTfhGGq0h6TL3sdfieQnWtiWUJqXPcH6YmKvZ4IjF/hTn0
         L3Ay0+huKJXj4g8KgS7N5igke6LMK6jIus297DwDYkEGOxEVizJykWoNr0lLvAzETIm0
         dnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480708; x=1743085508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcufIoTquObc4xvWCnB60+ugCUZsUArli95nP/Pg8FY=;
        b=N9dO5HZW/m2pWngpSFpZms6D4+5Zar9xyJYhAXsnyUmksq/TnLs2Zrn8omIhBnGtYC
         p5RUV2hmujkLBLgxOm4QYrCs/IQ+zWNXyUy36271rlXac1d1bqUDz6iGjtAzidyhREha
         GrsU2pUtpGdcBp4+wn/QCtYqpgcw0ZRvnuADa2nrOz8otiDKj0VSkksmnY6KCbt2WoK4
         B+SyzHkwdX6icTgrEAG5NdXejkTiw/SmHYj+z2JAkugAUbqBOmtpGcM5NtA5aYCIpLuu
         yOue4HWR2uQR0gAsKHwF0g1hiiFTBb10N4gSr8JSvyjr0P/jqb8+Sahm9VOJqBgeVwdS
         1O0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1jsI4NjkMC1c80m2gAym+Y9YOuUZGWVX1w33DjuUCKbguem79AM4/5luo8pYoIN/vhM6OppsaBTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjmL+Tv45asOBw8Ws5eOqcXjAoL4WTAdjuWP9+v67mNsqBrH0I
	RcFvt3t2lqzt8CzEN6IXvjquXMhF46fWVmweUBvQNrkhfvMhxMo/DXQE9uZtQg==
X-Gm-Gg: ASbGncuWNt246RWLJdfuxhrVJ7x1FxZSUQvDY2fdSJeSJ2ewNRsUtDQeqZwPH6CG1I3
	LW8j/9EBeSirSn1mje3Y1jDCPTuZbWy6cMzmcxs54q4lSn96Y9ugmDdqJOZmabGhbUDhjj0y9cM
	9JJfdNXj/JZJ7U7lOr32OPY2GvPFFY6VcH34WardB/OIaYngei+7mW8ttwOiMkyyOVQUC02RO+w
	HzEbTI5z8WF6RMpUlJ1IzgCSeXLipEJtQajLaBLn5EMSqALJSQOti3Luf1A4JXk6V1YdfLTNHVn
	WyhdMbgx6ioqan+DWBkwNooOShcON22NjcBpds+UV8iYzrOx1ABl2dxE/LuZK0vxQZc9FoxxLUW
	4l6FlvLvm9WgpjoyDgtSz4znAWrAp4S1Q0ZFWmQ==
X-Google-Smtp-Source: AGHT+IHfUR49FUmIocj39iu24611PkyzTcnBbnp3e5L3vO6SSH1McNWe6SG8aTCWtlijcQKBijjCLA==
X-Received: by 2002:a05:6214:1d2f:b0:6e4:2e5b:8d3f with SMTP id 6a1803df08f44-6eb349d1a0bmr59972906d6.14.1742480708068;
        Thu, 20 Mar 2025 07:25:08 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade209beesm94796156d6.10.2025.03.20.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:25:07 -0700 (PDT)
Date: Thu, 20 Mar 2025 10:25:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: =?utf-8?B?55m954OB5YaJ?= <baishuoran@hrbeu.edu.cn>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kun Hu <huk23@m.fudan.edu.cn>, Jiaji Qin <jjtan24@m.fudan.edu.cn>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: WARNING in cm109_urb_irq_callback/usb_submit_urb
Message-ID: <a3f66f2e-a99e-47f2-a3ef-742b6903cc5d@rowland.harvard.edu>
References: <559eddf1.5c68.195b1d950ef.Coremail.baishuoran@hrbeu.edu.cn>
 <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62d91b68-2137-4a3a-a78a-c765402edd35@suse.com>

On Thu, Mar 20, 2025 at 02:35:23PM +0100, Oliver Neukum wrote:
> 
> 
> On 20.03.25 05:39, 白烁冉 wrote:
> > Dear Maintainers,
> > 
> > When using our customized Syzkaller to fuzz the latest Linux kernel, the following crash (94th)was triggered.
> > 
> 
> Hi,
> 
> is there a way to use the syzkaller for testing a patch?
> 
> 	Regards
> 		Oliver

> From 03d78ca8c47c8c888df7c7ae2c7109825799d236 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Thu, 20 Mar 2025 14:29:17 +0100
> Subject: [PATCH] USB: cm109: fix race between restarting and close
> 
> cm109_input_close() can race with cm109_restore_state()
> Hence cm109_submit_buzz_toggle() needs to check
> the shutdown flag
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/input/misc/cm109.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
> index 0cfe5d4a573c..8ae62b5e45f6 100644
> --- a/drivers/input/misc/cm109.c
> +++ b/drivers/input/misc/cm109.c
> @@ -348,6 +348,8 @@ static void cm109_submit_buzz_toggle(struct cm109_dev *dev)
>  	else
>  		dev->ctl_data->byte[HID_OR0] &= ~BUZZER_ON;
>  
> +	if (dev->shutdown)
> +		return;

This test must itself be subject to the same race, right?  There needs 
to be some kind of synchronization between the two tasks (i.e., a mutex, 
spinlock, or something similar).

Alan Stern

>  	error = usb_submit_urb(dev->urb_ctl, GFP_ATOMIC);
>  	if (error)
>  		dev_err(&dev->intf->dev,
> -- 
> 2.48.1

