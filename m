Return-Path: <linux-usb+bounces-18230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA149E8605
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 16:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B1C16476F
	for <lists+linux-usb@lfdr.de>; Sun,  8 Dec 2024 15:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3412155A4E;
	Sun,  8 Dec 2024 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ny25rnVj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64F13B2BB
	for <linux-usb@vger.kernel.org>; Sun,  8 Dec 2024 15:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733673068; cv=none; b=f5cpQW9GemNF43XBbxntzHZJEgMFrgnFqAJa2fMR39/nqJPWlnlj4nVva7HZPy02pLnR81QFyOlT5jt5Ne9RQNUFIPAXp4IWpTgf4M4YE0EJGnyKIS85EnqcJsff0krzMRTCY6xs6yL7+5uAEJybNEDDtlxUClT+VPph2c47Fxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733673068; c=relaxed/simple;
	bh=UyFYYH27LDaTAJVEZbsw8TVGhpvMENlsmXZHqvOZ6Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdB2EB0HFETU9NP/W8/NFXzMWTcUFQ5aKQq8FRlzbh1CJPA5Djek6wu1JnCAlZ6PfohlpQ17KTeTV4hn0JtJf5t628jXLPI0QTU8ICrvGQyYIjwwML8bTOuNFiF2f5aqL8IDB4ZmqS6meI9pgYjqG9V6KXsAXmIevaVpVYCQEos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ny25rnVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80421C4CED2;
	Sun,  8 Dec 2024 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733673068;
	bh=UyFYYH27LDaTAJVEZbsw8TVGhpvMENlsmXZHqvOZ6Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ny25rnVjvjNvSY8htKwLkgfSKHd+eESTRnN1ZLM8tQx6ibfRcOAJDHiKpjgXIQJNe
	 LyE07mZxOTp+IgRvWRdG3erBBkq+X5NH2ABjiD3VOUNFAKPmZ9jX0EEG8kSns+Koei
	 lE7ctDYxS0lAAAaA98JhikXb++o2vwcXAm0wLCi0=
Date: Sun, 8 Dec 2024 16:51:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	USB subsystem <linux-usb@vger.kernel.org>
Subject: Re: USB: workqueues stuck in 'D' state?
Message-ID: <2024120802-unwashed-repackage-5eb3@gregkh>
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

I can't duplicate this here running on your latest tree at all (it's a
"smaller" x86 box with only 64 cores.)  So I don't know what to suggest.
Are you using any USB devices on this thing, or is that just for
internal connections?

thanks,

greg k-h

