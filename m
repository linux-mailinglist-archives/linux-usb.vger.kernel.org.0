Return-Path: <linux-usb+bounces-18221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE19E7DF6
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 03:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9434F1888DBE
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 02:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9964317BD5;
	Sat,  7 Dec 2024 02:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZMTP0IXR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615829422
	for <linux-usb@vger.kernel.org>; Sat,  7 Dec 2024 02:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733536978; cv=none; b=KcWZ5VODC7vJe76tTEKuDRm+9a1lqV1Ji12PB/lcXhRvkC7cviBKk7eWWpQabNaf47CjkXB96uiT6EQjRN8Kj9eYh6T3+bYG+xY9WTFl2k4HVEfpOASuVVmQygV8v9+9INWz7cDFOFC0lzPLCcQhxVfzxvhanWVezAODvc9vnXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733536978; c=relaxed/simple;
	bh=MX6AL2PXvCUddcZm6bPMj3VDsfz+JC3fFzzQErt42Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5Wg1/RTBLi/gNXG4H+F24etF+nssqIYadFLqoCGx4ry5sg+8LfaE3ruQ4MpkLnFejLUp1E9LsCrjo/YDr18PyNMxJgJjFEOKfVXdorYusCwCHXmbGAdUSAwISZg9ygUcru1qAHl8N3woQI4YuDdHbaQRR+53ypwwUVpZTrBgPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZMTP0IXR; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4667931f14bso41573381cf.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 18:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1733536975; x=1734141775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiB6O7PlhtO75E8o7uTGHXDvInV4HFK7WMYXDid+W3M=;
        b=ZMTP0IXRGxiNzolkQVfn+ut2mdtXZWpE99fySHnGAwLQkWfFuVFufCbHi1j86nxOtJ
         CzdX9YKIkTwYYXQM0VJwOLiyULNvfn2g/fy9V8ZBh93jcW1DzyFi5D5adGM/hDb8GfbW
         ZknQFiDA4RYs2PDYINhb7fkSYO5P+7LZrdKV8mpP8Z39P997F9uwaW9qxH/u9TuwA4CI
         l+6rcK/zjkDKjJ8c3e+guEvqabt4d2NvUyn7rTD1MYU75LADpzZ+xbXhJ3X85OS3aWSG
         D21Ai4rsTiRsUgjCJx9ItswaUTSoyS6Lj0qnDWogOJ8crk1ATd17VCi85c5ltCILDPhd
         uVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733536975; x=1734141775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiB6O7PlhtO75E8o7uTGHXDvInV4HFK7WMYXDid+W3M=;
        b=MsrOKfTGbrkb0rRprLpY+aEn1Ve2o2aYtYroe0OeK+gjWy7/7qKNR2B6fh+kjsc4Xi
         OMKVker7kLV4gd1p1AwLU9v0CG9prMSeRz6Kn3kOIo231/iEm3TIgp30qPd1cAlDrvIg
         d09xvZ+mHFuHZYKBqIOs9ie9cYwGx9Cdxn0yuE8EA/Kv6yhuMXzONWWVTZLHN6w9d3mU
         A9nQTWWxUX1mGmno9F7BsNVB9AW6TIagpFxY7YwhQ01kvHn/KdKOhKn5OWaCN/uV5vr1
         t8y5lfOqPsGR69to9NAOm5tBcrFDGwqOoa1AupULTArfwUmv5f2zh8Rue/MHc6CpMMuQ
         2DBw==
X-Forwarded-Encrypted: i=1; AJvYcCVWG9mFw8WIDJVD4YHSdKbCP4qwV9cSR6TNTgtHFjMnEwtTqEmspR01P7yE8NqQ8X1A2QzZfFwKqqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNhtglOka5dPL9btEbp/r2gatWB0SdrXJz6Yf+4MtiNCuR4nN
	U0xM+ec+xZbRSMwgwRWobh3cUY5/BRCZgFzAQ0N5R8kCVJebQW7EXFzrbo49UAi1SjuiNdGLujY
	=
X-Gm-Gg: ASbGncslsBqJgSE7Jc+OSR93MdT3Fjjy5Lq69p/4hRakun7/GF6D53pxH620OriZq3+
	8qO1yYaGX2NZ4VLN2l09w823rEZIDp2pgsSiRRpT4xJiRm5CIq3oteYNhgnZqslzk1TfTUU5sS7
	WnHqQWYNImxwxT73bXja8RhzWW2wk8fPk+MYEXw8KFD5aXhJVrt0LnknlezfgeBc6GLQYLHdPwn
	ALw+OkS90FwoLUeS1K0vArKHLp/hsCw7MwcojuLS8+jkQMDfhc=
X-Google-Smtp-Source: AGHT+IE7J1c4rrMnkQ6gTFez34r3YXO2Y/CRdVOx6/s28nEDF5V0PkzlisbMoPoTdEJ19fYVxuPBig==
X-Received: by 2002:a05:622a:1ccd:b0:461:18fb:f0a2 with SMTP id d75a77b69052e-46734f3dee1mr121728621cf.52.1733536974746;
        Fri, 06 Dec 2024 18:02:54 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::a6b3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467296c8d1asm27257981cf.21.2024.12.06.18.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 18:02:53 -0800 (PST)
Date: Fri, 6 Dec 2024 21:02:51 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	USB subsystem <linux-usb@vger.kernel.org>
Subject: Re: USB: workqueues stuck in 'D' state?
Message-ID: <897f0c44-e0de-4185-ae4e-75fd6acc1211@rowland.harvard.edu>
References: <CAHk-=whPKnwZbbAp1MjogDP1aDYrCmQ63VC82+OnsLKy9M+gvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whPKnwZbbAp1MjogDP1aDYrCmQ63VC82+OnsLKy9M+gvg@mail.gmail.com>

On Fri, Dec 06, 2024 at 03:07:10PM -0800, Linus Torvalds wrote:
> So I'm not sure if this is new or not, but I *think* I would have
> noticed it earlier.
> 
> On my Ampere Altra (128-core arm64 system), I started seeing 'top'
> claiming a load average of roughly 2.3 even when idle, and it seems to
> be all due to this:
> 
>   $ ps ax | grep ' [DR] '
>     869 ?        D      0:00 [kworker/24:1+usb_hub_wq]
>    1900 ?        D      0:00 [kworker/24:7+pm]
> 
> where sometimes there are multiple of those 'pm' workers.
> 
> Doing a sysrq-w, I get this:
> 
>   task:kworker/24:3    state:D stack:0     pid:1308  tgid:1308  ppid:2
>      flags:0x00000008
>   Workqueue: pm pm_runtime_work
>   Call trace:
>    __switch_to+0xf4/0x168 (T)
>    __schedule+0x248/0x648
>    schedule+0x3c/0xe0
>    usleep_range_state+0x118/0x150
>    xhci_hub_control+0xe80/0x1090
>    rh_call_control+0x274/0x7a0
>    usb_hcd_submit_urb+0x13c/0x3a0
>    usb_submit_urb+0x1c8/0x600
>    usb_start_wait_urb+0x7c/0x180
>    usb_control_msg+0xcc/0x150
>    usb_port_suspend+0x414/0x510
>    usb_generic_driver_suspend+0x68/0x90
>    usb_suspend_both+0x1c8/0x290
>    usb_runtime_suspend+0x3c/0xb0
>    __rpm_callback+0x50/0x1f0
>    rpm_callback+0x70/0x88
>    rpm_suspend+0xe8/0x5a8
>    __pm_runtime_suspend+0x4c/0x130
>    usb_runtime_idle+0x48/0x68
>    rpm_idle+0xa4/0x358
>    pm_runtime_work+0xb0/0xe0
> 
>   task:kworker/24:7    state:D stack:0     pid:1900  tgid:1900  ppid:2
>      flags:0x00000208
>   Workqueue: pm pm_runtime_work
>   Call trace:
>    __switch_to+0xf4/0x168 (T)
>    __schedule+0x248/0x648
>    schedule+0x3c/0xe0
>    usleep_range_state+0x118/0x150
>    xhci_hub_control+0xe80/0x1090
>    rh_call_control+0x274/0x7a0
>    usb_hcd_submit_urb+0x13c/0x3a0
>    usb_submit_urb+0x1c8/0x600
>    usb_start_wait_urb+0x7c/0x180
>    usb_control_msg+0xcc/0x150
>    usb_port_suspend+0x414/0x510
>    usb_generic_driver_suspend+0x68/0x90
>    usb_suspend_both+0x1c8/0x290
>    usb_runtime_suspend+0x3c/0xb0
>    __rpm_callback+0x50/0x1f0
>    rpm_callback+0x70/0x88
>    rpm_suspend+0xe8/0x5a8
>    __pm_runtime_suspend+0x4c/0x130
> 
> so it seems to be all in that xhci_hub_control() path. I'm not seeing
> anything that has changed in the xhci driver in this merge window, so
> maybe this goes back further, and I just haven't noticed this odd load
> average issue before.
> 
> The call trace for the usb_hub_wq seems a lot less stable, but I've
> seen backtraces like
> 
>   task:kworker/24:1    state:D stack:0     pid:869   tgid:869   ppid:2
>      flags:0x00000008
>   Workqueue: usb_hub_wq hub_event
>   Call trace:
>    __switch_to+0xf4/0x168 (T)
>    __schedule+0x248/0x648
>    schedule+0x3c/0xe0
>    schedule_preempt_disabled+0x2c/0x50
>    __mutex_lock.constprop.0+0x478/0x968
>    __mutex_lock_slowpath+0x1c/0x38
>    mutex_lock+0x6c/0x88
>    hub_event+0x144/0x4a0
>    process_one_work+0x170/0x408
>    worker_thread+0x2cc/0x400
>    kthread+0xf4/0x108
>    ret_from_fork+0x10/0x20
> 
> But also just
> 
>   Workqueue: usb_hub_wq hub_event
>   Call trace:
>    __switch_to+0xf4/0x168 (T)
>    usb_control_msg+0xcc/0x150
> 
> or
> 
>   Workqueue: usb_hub_wq hub_event
>   Call trace:
>    __switch_to+0xf4/0x168 (T)
>    __schedule+0x248/0x648
>    schedule+0x3c/0xe0
>    schedule_timeout+0x94/0x120
>    msleep+0x30/0x50
> 
> so at a guess it's just some interaction with that 'pm' workqueue.
> 
> I did a reboot just to verify that yes, it happened again after a
> fresh boot. So it is at least *somewhat* consistently repeatable,
> although I wouldn't be surprised if it's some kind of timing-dependent
> race condition that just happens to trigger on this machine.
> 
> I could try to see if it's so consistent that I could bisect it, but
> before I start doing that, maybe just the backtraces makes somebody go
> "Ahh, that smells like XYZ"..
> 
> Hmm?

In the past (not recently) I have seen the system get into a loop, 
repeatedly suspending and resuming some device over and over.

What do you get if you enable dynamic debugging for usbcore?

Alan Stern

