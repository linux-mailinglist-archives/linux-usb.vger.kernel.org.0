Return-Path: <linux-usb+bounces-32335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8B2D1FAD4
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 16:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5EBB3029224
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 15:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C98831961F;
	Wed, 14 Jan 2026 15:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M4XkYLRQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAB826CE04
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 15:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768403597; cv=none; b=d5pdo2DY10a1a+jU34NErrfHLRsdkz+a7wEvHQQGrRXdI+ve/vQaMajL0fKn+h0obDmJ2QcLV5Nh37zaIhOZo1Cfja4eUm1ePlvd/d8Pk3U2fn6qEI+TRLfc7Vg6kXYSif6899QfXxthY7nWIm8IuSvOnxvk7lrNPPlUbI34v3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768403597; c=relaxed/simple;
	bh=l5I3AxmbWrCz6ftaPVv03s84QfvGjrS2DoubwY2ukMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSJPzOrUERs/uhzejRZVHGKdT+B3DWflUwE+z3mQlMhM2Af5Kgzhnr7SEMrKSku0IF3O1sKZsxfwKJa/0ygxZEzImNaTqUSitx9gdcKGdve99h2yW41Q4FUE9RVi9ZRxe/HEfj2w22OfTcQ34b//HW8YS+hrjuT+iXAB9ATd1BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M4XkYLRQ; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee1a3ef624so53541121cf.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768403594; x=1769008394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4fmV0yuBCdZblsqZVK/Q09iHk02h7bHR/TgEOXsMY9A=;
        b=M4XkYLRQx5XD6PffCqu2+nU/Li2GkXLfm3YLg3sR7QH7UBSIbfsZNzdNDPm0duwyNU
         3ew+Xbtg8T+2jKASLxjSSScLwdAWSovKsKvnB8t0ofnZJKNsfCokEX7OrtKRoHY68VeG
         ZVr6uvHZDVr7osMAElnLAtSECo5fwKpak9JgCoeEh3jbNe0QH2OnWVOme1cOuy8ZwE3k
         LzAZy31znUsOYqZMsTs5SSUQLv8Dj0QDC6lJYqZZZaZQrUvZo+tnV7xZgSD/UEdLd5Yk
         kC9oe+ZqEAGPnB/oe91euwZRYxRXDVqmw2YfMmBe66qLnp5IcljC/rUfdjgs1dNDjlFv
         kXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403594; x=1769008394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fmV0yuBCdZblsqZVK/Q09iHk02h7bHR/TgEOXsMY9A=;
        b=Ot5UFMti197OhktVOzlVgI3E4RPFl81oMTnL9g4xNn1fVIUOGmMAd1wx8t1Ffo8olq
         KRrJM8JttSHVoy7R98SGkRZ4gdT/4cT2e7uFxKjpmyM18QKh7GjfFc62hldJZobCsZN5
         VKfQMxhR4gI0s2MrDNKpcaHMzTQknzFBjEnv2dpcmEnZ+SCoUloEKoKXfyT/qB/FioVG
         vLa673hz7e0sWeQwPu/W+6hCgxYKWtcDM4GdetXLDdir/9xDVPMKshRcTphLiQFHUXBg
         e/3VVYwGD2o0qyTP+le3KlygpjF9ED5j7VPG1OOuhiamy4Awzi+y2kTC+3crHfhDj36J
         /uMA==
X-Forwarded-Encrypted: i=1; AJvYcCX9sIgIFZPxel9EaIK7DkAjdXsXv04YtRzZzhYypiFKEeUOp6vQXpPo+nlGlCkay7GwE6qK77DbARo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyB5C/gSdu9GlU1C8LtAWx4r385WFipJIGqo+04GfkvTJa/IeB
	ZHFRjEeEctlas8vAfNIWXo815nqevU/ctrCh12eyOhLW7ooZkHN65WDjzJsKMsd1JA==
X-Gm-Gg: AY/fxX4qoVu63NWC5Pki/X9gp/04W8u+TDWvWsr/g7bl2sLJXeDaG0zhdLXP2i9rhdA
	H2riYr96j7bKI1kz6dCKsBW3NZxtABOojxUZ2f6/tDSywacskt/F/eRDXSNg62i38VD7vaykyay
	+M3nkK6YdyOTKARx3gq3PRDddxIQ/NlNCCtrjDqMJyQ7CeyLfD3R3pb2iEdBhIyK9rgNMKdFJlk
	weHGLEppP5ZJEPWTnAuBXZ9gLkZ/11rrAIK1aVJZ1SD53IBA7tGAFJvBkX0KxIQxS08kTBI+Kj8
	ekwHt0uxp7XM3JQaMx2tlS/1WeDxQc7cSTdo0eX88bsriEdKMzrDDUtd3tKbxu9ryaFa/XTOH9i
	YQEHkObMNG19fFgGlm3U1gEUI+SQuGs7LE69+kv5qT7aoO0ILVDOhvUE0a9Sa0cVna4lr1pJ4AD
	svoaazRXp3lvxl4Kr/lQkNHZwVKIofPSjWQZBqxiqZ
X-Received: by 2002:a05:622a:40cd:b0:4f1:cd0c:80f6 with SMTP id d75a77b69052e-501482643d5mr41298881cf.49.1768403593291;
        Wed, 14 Jan 2026 07:13:13 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772682besm179017236d6.50.2026.01.14.07.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:13:12 -0800 (PST)
Date: Wed, 14 Jan 2026 10:13:10 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ben Greear <greearb@candelatech.com>
Cc: Hillf Danton <hdanton@sina.com>, LKML <linux-kernel@vger.kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: Deadlock in usb subsystem on shutdown, 6.18.3+
Message-ID: <c52546af-e39e-4096-ad11-9b38bb2d5f7e@rowland.harvard.edu>
References: <20260114024506.2210-1-hdanton@sina.com>
 <dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dae8dc09-0e06-446a-b6dd-4c86ec423997@candelatech.com>

On Wed, Jan 14, 2026 at 06:36:41AM -0800, Ben Greear wrote:
> On 1/13/26 18:45, Hillf Danton wrote:
> > On Tue, 13 Jan 2026 16:21:07 -0800 Ben Greear wrote:
> > > Hello,
> > > 
> > > We caught a deadlock that appears to be in the USB code during shutdown.
> > > We do a lot of reboots and normally all goes well, so I don't think we
> > > can reliably reproduce the problem.
> > > 
> > > INFO: task systemd-shutdow:1 blocked for more than 180 seconds.
> > >         Tainted: G S         O        6.18.3+ #33
> > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > task:systemd-shutdow state:D stack:0     pid:1     tgid:1     ppid:0      task_flags:0x400100 flags:0x00080001
> > > Call Trace:
> > >    <TASK>
> > >    __schedule+0x46b/0x1140
> > >    schedule+0x23/0xc0
> > >    schedule_preempt_disabled+0x11/0x20
> > >    __mutex_lock.constprop.0+0x4f7/0x9a0
> > >    device_shutdown+0xa0/0x220
> > >    kernel_restart+0x36/0x90
> > >    __do_sys_reboot+0x127/0x220
> > >    ? do_writev+0x76/0x110
> > >    ? do_writev+0x76/0x110
> > >    do_syscall_64+0x50/0x6d0
> > >    entry_SYSCALL_64_after_hwframe+0x4b/0x53
> > > RIP: 0033:0x7fad03531087
> > > RSP: 002b:00007ffe137cf918 EFLAGS: 00000246 ORIG_RAX: 00000000000000a9
> > > RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fad03531087
> > > RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
> > > RBP: 00007ffe137cfac0 R08: 0000000000000069 R09: 0000000000000000
> > > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > > R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > >    </TASK>
> > > INFO: task systemd-shutdow:1 is blocked on a mutex likely owned by task kworker/4:1:16648.
> > 
> > This explains why the shutdown stalled.
> > 
> > > INFO: task kworker/4:2:1520 blocked for more than 360 seconds.
> > >         Tainted: G S         O        6.18.3+ #33
> > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > task:kworker/4:2     state:D stack:0     pid:1520  tgid:1520  ppid:2      task_flags:0x4288060 flags:0x00080000
> > > Workqueue: events __usb_queue_reset_device
> > > Call Trace:
> > >    <TASK>
> > >    __schedule+0x46b/0x1140
> > >    ? schedule_timeout+0x79/0xf0
> > >    schedule+0x23/0xc0
> > >    usb_kill_urb+0x7b/0xc0
> > >    ? housekeeping_affine+0x30/0x30
> > >    usb_start_wait_urb+0xd6/0x160
> > >    usb_control_msg+0xe2/0x140
> > >    hub_port_init+0x647/0xf70
> > >    usb_reset_and_verify_device+0x191/0x4a0
> > >    ? device_release_driver_internal+0x4a/0x200
> > >    usb_reset_device+0x138/0x280
> > >    __usb_queue_reset_device+0x35/0x50
> > >    process_one_work+0x17e/0x390
> > >    worker_thread+0x2c8/0x3e0
> > >    ? process_one_work+0x390/0x390
> > >    kthread+0xf7/0x1f0
> > >    ? kthreads_online_cpu+0x100/0x100
> > >    ? kthreads_online_cpu+0x100/0x100
> > >    ret_from_fork+0x114/0x140
> > >    ? kthreads_online_cpu+0x100/0x100
> > >    ret_from_fork_asm+0x11/0x20
> > >    </TASK>
> > > INFO: task kworker/4:1:16648 blocked for more than 360 seconds.
> > >         Tainted: G S         O        6.18.3+ #33
> > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > task:kworker/4:1     state:D stack:0     pid:16648 tgid:16648 ppid:2      task_flags:0x4288060 flags:0x00080000
> > > Workqueue: events __usb_queue_reset_device
> > > Call Trace:
> > >    <TASK>
> > >    __schedule+0x46b/0x1140
> > >    schedule+0x23/0xc0
> > >    usb_kill_urb+0x7b/0xc0
> > 
> > Kworker failed to kill urb within 300 seconds, so we know the underlying usb
> > hardware failed to response within 300s.
> > 
> > That said, the deadlock in the subject line is incorrect, but task hung due
> > to hardware glitch.

In fact, we do not know whether this was a hardware glitch or a software 
bug.

> In the case where hardware is not responding, shouldn't we just consider it
> dead and move on instead of deadlocking the whole OS?
> 
> In this case, the system was un-plugged from a KVM (usb mouse & keyboard)
> right around time of shutdown, so I guess that would explain why the USB device
> didn't respond.

You misunderstand.  What's failing is the USB host controller on the 
computer, not the attached (or unplugged) USB device.  If the host 
controller really had a hardware glitch then the host controller driver 
should have realized it and moved on.  It seems to me at least as likely 
that the problem is caused by a bug in the host controller driver rather 
than anything wrong with the hardware.

(Of course, it could be a combination of things going wrong: a glitch in 
the hardware that the driver wasn't expecting and is unable to cope 
with.  But even in that case, the proper solution would be to fix the 
driver since we can't fix the hardware.)

Unfortunately, we have no to tell from the log you collected which host 
controller driver encountered this problem.  Nor, unless you can 
replicate the problem, any way to track down exactly where in that 
driver the bug is -- or even any way to tell whether a proposed fix 
actually solves the problem.

Alan Stern

