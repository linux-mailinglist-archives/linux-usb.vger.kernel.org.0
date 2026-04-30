Return-Path: <linux-usb+bounces-36798-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNSpDneR82ky5AEAu9opvQ
	(envelope-from <linux-usb+bounces-36798-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 19:29:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A087B4A66DE
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 19:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B27D3018762
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 17:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B1F477992;
	Thu, 30 Apr 2026 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O7+vEVse";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ifb0qWhq"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C06477989
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 17:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777570098; cv=pass; b=D3XsgAHiQ8wSyBCH+/nhDMrimFrsn4o3u1GCyy76WE6lmfS3cVQTNB0OCE43dG6h2yGqTUXDkZ5FpH0AoQWzvfzcNnM9wsKMOXGRNtNvLtFdp6U94QHBJ00hVqwqdl3DNGxfVGsfE5h9K4050LkYzTXw0vhHOFRIIQyoqc4ISPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777570098; c=relaxed/simple;
	bh=yQ5/DU9Zb67KAroEzFpWa5KYDV8b3Zz7LsLafBIaOyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7iwC34A1mhWt7YRsXYUU2kOSQmAyhieOx9ynBbnRE7LaduUhDvHPEl2ZjUJdjPOek/Ns5q5WldvO0JsqoBTEn937Ux/Sr5YsZsdiCxrYmxxl7gWVRIABZYhhEU3PaFhhl3vK5qEynlG04viXBKrNDsWC2khPgPurgqXSAsQqPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O7+vEVse; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ifb0qWhq; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777570095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHSBa05eyX55A5lKDWA9ngkqEeC57jDR/L02RJaVQoM=;
	b=O7+vEVsebvPv5MUzwm/kmr1lTQw3sgXLyUFVMxjXbgXbf+L5UWuyrS+sU51Oei7OBB0Zjp
	mDYhvxW0hYF3KSK+jLKGt2x+S4Nx7A1WWGZrDFzXzgEDqlk2BojwEZJA9yPJSFBj0CcGLs
	yZUbNPiF9Yl0hHyQTs2Ouqma8CQX0aE=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-YbRxeMBFNcC1afBWOuN8Hw-1; Thu, 30 Apr 2026 13:28:12 -0400
X-MC-Unique: YbRxeMBFNcC1afBWOuN8Hw-1
X-Mimecast-MFC-AGG-ID: YbRxeMBFNcC1afBWOuN8Hw_1777570091
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6948d83a548so3759962eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 10:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777570091; cv=none;
        d=google.com; s=arc-20240605;
        b=g+Uhrib/L5HjZtYAkFm5nf0N15o6s57pRGBVGCoSZtnWj0J9rXSYpN0VTBmbt8mceS
         xcdSO6YloMPFqkLWwfnlQcC/ydhin3CEMuxXLlcH713UYtxuKNGVtkxAPvZPo4hxZddL
         +hjjtoyHXMOQyC1mYATD4C6ZKD4aoTlabMEXvqTMoxzfp9lYf2fjP3HiwtVc9xSVTidk
         F3FlJLcUrj57g/z3RxmYNSL74UhrWLfwjIHPvHGHzeLGIHdG3tN7J6F8SG+x8qPL/Rs5
         FWK5fc2rn5xuZ1jQl61EGgJ99CE0Vphp5jzsvaSFGo4+a8X5XvMOQotDq64HYo4c65/P
         cE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHSBa05eyX55A5lKDWA9ngkqEeC57jDR/L02RJaVQoM=;
        fh=+GXvQYVu0TfT1a/47MPt8CheX+bcEiMhbC1aHZ9TPoQ=;
        b=kjIlvUT7ymGSGP3cT1fYJ4f+tfalmagn/dxrUgWJDRR3CxpMoHoY1mcpYGBgONvobi
         SY1VrqtlLSmz/wVhdopiuDr4Eybo9sOhIHlQ09Rkbt9mVoIckOcBtPYbynGSWiCrVJM/
         jyvm7YpxfuYTpsjmQCiNqN+LGMUzHCGxheIF2TT546/0kI4It3p2TTzrFLlBEyyBNpES
         f9i4g0o1d5C+juBM5xX9vIDMQssr6/uuye1SL7je3U8Q1OK/uRR2XKG98XgP/SxfX2Ff
         H0Edp8/mmZ5FZp/yMeHgGY7bHw99RqRUtC+Le89vQvN1oOc5m85GDFNHFR/GysniAg8q
         A8WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777570091; x=1778174891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHSBa05eyX55A5lKDWA9ngkqEeC57jDR/L02RJaVQoM=;
        b=ifb0qWhqCaoL1mLutCWGnsWlqBTxhpPFwBX9oe2pt2kVQNR1b6dl7q5jDm6JJ/iSAW
         rI3ZW0mnznY8xgVc76pnnWl28ch428BpQM8YWyBkk7ocZ3PqFgwX+445DmvOLremZlIa
         ay/wuev12SGSQ+Ei0yGxw0of6qKqHtzysZ2AQzPmBdp+7eoHKpsPRJr3vf3GOaJwKUjI
         b+tdNrm1+MOTM0p8AiwukBBbgp6e7F8GRUQIXJ+SuWNTm4J+xV1yS928oFISSJVF7KgI
         ajHi3aWdJgKYzjxkzd0JbaceSkju0n5+f1+eagDVCmjWyXzzGrJyBXELvtrjLn3WUH7d
         MrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570091; x=1778174891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHSBa05eyX55A5lKDWA9ngkqEeC57jDR/L02RJaVQoM=;
        b=PsicFX/7QWV9N2R+RT1m+L2JZldn+dxWnMzucODJ+6u2BPtJbHHqadGTwlhXE3DHam
         1o5zaOiRJ5kgmDHcIdjb/YiS6OElivEmnBYrVDQxcveKijBINss2XslFmCmFZRas/50M
         Qgy1zzxmRvFmlvO5G/4GqTwRwQFaPHJ/rMiNdhEbQ2oC5drXa/LtsGGBlJc5j0m7smQi
         RYjz/h72fyApag/nhKcbzj+OFu5Wm0hOLEkXBMObaB4OZvhqoEzJIMD+jIgMv0jfYC5V
         UkssFOKuIBfkbp907AxRROk68iZT2qpiptFx9+54j8WorTGk16am6cQthnicSUL2mFgd
         rohQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eHRnnbXCMbBK2k8SQE2BPK/SjQK9RoWD4QlvL+yHRWWCKIbBiWd2egnV6hygMKDyN48AUboi4g0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWKzV3mY0fTt1glOb4UNwNC1AN05jAsJnf2wp7Xluo7XyaA82i
	+S8XlJtsBeeCrtLq5l0EH6Rop7d+yyjVMeGmB/pawdPXpuS0BPiBhVyselNNVqHZzwzcBsoKIJU
	RnHCt8gPty+zImhVGQdjI4pzM6zWCBLQt+JzAosOOmm+oY0GCwmQWDWaw4hvo+jaD7Y8mucdy1y
	pXwvOxNEC9lMgjWy8MEdrna39hh289cejrYu5x
X-Gm-Gg: AeBDieulE1hRn/IShd5RK2LcICTSL1QEQXJAY1Qvjni38qmsTzLuovePqfeKC6ibXAm
	831JzJAdYV2tRbMOApYIYkel7WRDSCPkvK7iU3hDzolefYoYvaGRS52aIFVcucS9mZqhhlqfBRB
	FJo5T2nC06AbBcm+WI7tVPUAWdEBvXa4K9WLqrH+PJ081r/cryKO2PW93QuBp0yJOezyNqJcwWt
	cyw0PYjsYVod7vcVPyqsBoNG/tKFfhXlCo1OcptpysdjXMThw==
X-Received: by 2002:a05:6820:80e:b0:694:8ad6:245f with SMTP id 006d021491bc7-6967a61a9aamr2214161eaf.43.1777570091140;
        Thu, 30 Apr 2026 10:28:11 -0700 (PDT)
X-Received: by 2002:a05:6820:80e:b0:694:8ad6:245f with SMTP id
 006d021491bc7-6967a61a9aamr2214146eaf.43.1777570090525; Thu, 30 Apr 2026
 10:28:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430014817.2006885-1-desnesn@redhat.com> <20260430104850.352bd946.michal.pecio@gmail.com>
In-Reply-To: <20260430104850.352bd946.michal.pecio@gmail.com>
From: Desnes Nunes <desnesn@redhat.com>
Date: Thu, 30 Apr 2026 14:27:59 -0300
X-Gm-Features: AVHnY4KZgZnB-7XFPYK6w0lqlUplABTiJS-wGXYWxUV52g9fieo6Gc7pBoalGh0
Message-ID: <CACaw+exdPSVSfdAob7+d-xH=JEjBbPpY_z1cPPU6rzXx4wUZpA@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci: bound wait command completion to avoid kdump deadlock
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, mathias.nyman@intel.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A087B4A66DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36798-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[desnesn@redhat.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Greetings Michal,

For starters, thank you very much for the thorough review.

On Thu, Apr 30, 2026 at 5:49=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Wed, 29 Apr 2026 22:48:17 -0300, Desnes Nunes wrote:
> > The following deadlock in the usb subsystem can be triggered during kdu=
mp:
> >
> > systemd-udevd[402]: usb3: Worker [419] processing SEQNUM=3D2194 is taki=
ng a long time
> > dracut-initqueue[432]: Timed out while waiting for udev queue to empty.
> > systemd-udevd[402]: usb3: Worker [419] processing SEQNUM=3D2194 killed
> > systemd-udevd[402]: usb3: Worker [419] terminated by signal 9 (KILL).
> > ...
> > kdump[720]: saving vmcore complete
> > ...
> > systemd-shutdown[1]: Rebooting.
> > INFO: task kworker/0:6:76 blocked for more than 122 seconds.
>
> That's suspiciously long indeed.
>
> >       Not tainted 6.12.0-223.2443_2475543665.el10.x86_64 #1
>
> Pretty old kernel, and distribution to boot.
> Have you tried 7.x, does the bug still exist?

Yes, v7.0 reproduces the same crash when xhci tries to access slot_id
at xhci_alloc_dev():
...
[   72.987601] systemd-udevd[246]: usb3: Worker [255] processing
SEQNUM=3D2193 is taking a long time
[  132.237566] dracut-initqueue[277]: Timed out while waiting for udev
queue to empty.
[  202.988014] systemd-udevd[246]: usb3: Worker [255] processing
SEQNUM=3D2193 killed
[  202.998059] systemd-udevd[246]: usb3: Worker [255] terminated by
signal 9 (KILL).
...
[  206.288378] kdump[569]: saving vmcore complete
...
[  206.821258] systemd-shutdown[1]: Rebooting.
[  246.858495] INFO: task kworker/0:1:11 blocked for more than 122 seconds.
[  246.865319]       Not tainted 7.0.0-clean #1
[  246.869663] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  246.877623] task:kworker/0:1     state:D stack:0     pid:11
tgid:11    ppid:2      task_flags:0x4208160 flags:0x00080000
[  246.888942] Workqueue: usb_hub_wq hub_event
[  246.893202] Call Trace:
[  246.895690]  <TASK>
[  246.897828]  __schedule+0x299/0x5c0
[  246.901378]  schedule+0x27/0x80
[  246.904572]  schedule_timeout+0xbd/0x100
[  246.908565]  __wait_for_common+0x97/0x1b0
[  246.912644]  ? __pfx_schedule_timeout+0x10/0x10
[  246.917252]  xhci_alloc_dev+0x9e/0x2b0
[  246.921068]  usb_alloc_dev+0x7a/0x3b0
[  246.924795]  hub_port_connect+0x285/0x960
[  246.928873]  hub_port_connect_change+0x94/0x290
[  246.933482]  port_event+0x4bb/0x840
[  246.937030]  hub_event+0x141/0x460
[  246.940489]  process_one_work+0x196/0x390
[  246.944569]  worker_thread+0x1af/0x320
[  246.948383]  ? __pfx_worker_thread+0x10/0x10
[  246.952724]  kthread+0xe3/0x120
[  246.955921]  ? __pfx_kthread+0x10/0x10
[  246.959736]  ret_from_fork+0x199/0x260
[  246.963550]  ? __pfx_kthread+0x10/0x10
[  246.967362]  ret_from_fork_asm+0x1a/0x30
[  246.971355]  </TASK>
[  369.738508] INFO: task systemd-shutdow:1 blocked for more than 122 secon=
ds.
[  369.745593]       Not tainted 7.0.0-clean #1
[  369.749935] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  369.757897] task:systemd-shutdow state:D stack:0     pid:1
tgid:1     ppid:0      task_flags:0x400100 flags:0x00080000
[  369.769128] Call Trace:
[  369.771616]  <TASK>
[  369.773752]  __schedule+0x299/0x5c0
[  369.777299]  schedule+0x27/0x80
[  369.780493]  schedule_preempt_disabled+0x15/0x30
[  369.785188]  __mutex_lock.constprop.0+0x547/0xac0
[  369.789974]  device_shutdown+0xac/0x1b0
[  369.793877]  kernel_restart+0x3a/0x70
[  369.797603]  __do_sys_reboot+0x147/0x240
[  369.801595]  do_syscall_64+0x11b/0x6a0
[  369.805407]  ? handle_mm_fault+0x110/0x350
[  369.809574]  ? do_user_addr_fault+0x206/0x680
[  369.814006]  ? irqentry_exit+0x7a/0x4d0
[  369.817907]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  369.823046] RIP: 0033:0x7fe2958da917
[  369.826684] RSP: 002b:00007ffc5c458618 EFLAGS: 00000206 ORIG_RAX:
00000000000000a9
[  369.834383] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fe2958=
da917
[  369.841639] RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee=
1dead
[  369.848893] RBP: 00007ffc5c458790 R08: 0000000000000069 R09: 00000000fff=
fffff
[  369.856148] R10: 0000000000000000 R11: 0000000000000206 R12: 00000000000=
00000
[  369.863402] R13: 0000000000000000 R14: 00007ffc5c4588b8 R15: 00000000000=
00000
[  369.870659]  </TASK>
[  369.872888] INFO: task systemd-shutdow:1 is blocked on a mutex
likely owned by task kworker/0:1:11.

# gdb vmlinux
...
Reading symbols from vmlinux...
(gdb) list *(xhci_alloc_dev+0x9e)
0xffffffff81d10fee is in xhci_alloc_dev (drivers/usb/host/xhci.c:4236).
4231        }
4232        xhci_ring_cmd_db(xhci);
4233        spin_unlock_irqrestore(&xhci->lock, flags);
4234
4235        wait_for_completion(command->completion);
4236        slot_id =3D command->slot_id;
4237
4238        if (!slot_id || command->status !=3D COMP_SUCCESS) {
4239            xhci_err(xhci, "Error while assigning device slot ID: %s\n"=
,
4240                 xhci_trb_comp_code_string(command->status));

> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
> > task:kworker/0:6     state:D stack:0     pid:76    tgid:76    ppid:2   =
   task_flags:0x4208060 flags:0x00004000
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >  <TASK>
> >  __schedule+0x2a5/0x630
> >  schedule+0x27/0x80
> >  schedule_timeout+0xbf/0x100
> >  __wait_for_common+0x95/0x1b0
> >  ? __pfx_schedule_timeout+0x10/0x10
> >  xhci_alloc_dev+0x9e/0x290
> >  usb_alloc_dev+0x77/0x3a0
> >  hub_port_connect+0x293/0x9a0
> >  hub_port_connect_change+0x94/0x260
> >  port_event+0x4d1/0x7f0
> >  hub_event+0x16f/0x480
> >  process_one_work+0x174/0x330
> >  worker_thread+0x256/0x3a0
> >  ? __pfx_worker_thread+0x10/0x10
> >  kthread+0xfa/0x240
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork+0x31/0x50
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork_asm+0x1a/0x30
> >  </TASK>
> > INFO: task systemd-shutdow:1 blocked for more than 122 seconds.
> >       Not tainted 6.12.0-223.2443_2475543665.el10.x86_64 #1
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
> > task:systemd-shutdow state:D stack:0     pid:1     tgid:1     ppid:0   =
   task_flags:0x400100 flags:0x00000002
> > Call Trace:
> >  <TASK>
> >  __schedule+0x2a5/0x630
> >  schedule+0x27/0x80
> >  schedule_preempt_disabled+0x15/0x30
> >  __mutex_lock.constprop.0+0x497/0x860
> >  device_shutdown+0xac/0x190
> >  kernel_restart+0x3a/0x70
> >  __do_sys_reboot+0x146/0x240
> >  do_syscall_64+0x7d/0x160
> >  ? devkmsg_write.cold+0x24/0x4a
> >  ? update_load_avg+0x7f/0x730
> >  ? __dequeue_entity+0x3ec/0x4a0
> >  ? update_load_avg+0x7f/0x730
> >  ? pick_next_task_fair+0x1e6/0x330
> >  ? finish_task_switch.isra.0+0x97/0x2a0
> >  ? rseq_get_rseq_cs+0x1d/0x220
> >  ? rseq_ip_fixup+0x8d/0x1d0
> >  ? arch_exit_to_user_mode_prepare.isra.0+0xa5/0xd0
> >  ? syscall_exit_to_user_mode+0x32/0x190
> >  ? do_syscall_64+0x89/0x160
> >  ? handle_mm_fault+0x110/0x370
> >  ? do_user_addr_fault+0x606/0x830
> >  ? exc_page_fault+0x7f/0x150
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7f32517d9917
> > RSP: 002b:00007ffc018d4fb8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a9
> > RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f32517d9917
> > RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
> > RBP: 00007ffc018d5130 R08: 0000000000000069 R09: 00000000ffffffff
> > R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
> > R13: 0000000000000000 R14: 00007ffc018d5258 R15: 0000000000000000
> >  </TASK>
> >
> > During crashkernel's boot, hub_event() takes usb_lock_device(hdev) of t=
he
> > root hub and keeps it for the whole hub processing loop, since it calls
> > hub_port_connect() -> usb_alloc_dev() -> xhci_alloc_dev(). If during kd=
ump
> > another device (e.g., a mis-initialized dGPU) hogs interrupts or DMAs, =
the
> > TRB_ENABLE_SLOT command will be blocked from completion in time, moving
> > the HC to an unstable condition (e.g., HSE in USBSTS).
>
> What specifically have you seen?

Right after xe and drm set the dGPU (Battlemage G31) during the boot
of the crashkernel, I see the `usb worker taking a long time`
messages.
Afterwards, kdump is able to capture a vmcore completely, the systems
tries to reboot and hangs with the xhci_alloc_dev() and
device_shutdown() stack traces I provided.

> If you have actually observed HSE (how?), maybe xhci-hcd could detect
> it automatically by the same means and clean up immediately.

That's exactly what I was expecting xhci-hcd to do when I first
started looking at this bug, however it does not detect it
automatically.

As for how I saw HSE, while testing the patch before submission, since
I already had the xhci lock, I just added a read of the usbsts before
calling xhci_hc_died(xhci):

...
-       wait_for_completion(command->completion);
-       slot_id =3D command->slot_id;
+       if (!wait_for_completion_timeout(command->completion,
+                                        msecs_to_jiffies(2 *
command->timeout_ms))) {
+        spin_lock_irqsave(&xhci->lock, tflags);
+        usbsts =3D readl(&xhci->op_regs->status);
+        xhci_err(xhci,
+            "TRB_ENABLE_SLOT: no command completion after %lums, USBSTS:%s=
\n",
+            2 * command->timeout_ms,
+            xhci_decode_usbsts(ststr, usbsts));
+        xhci_hc_died(xhci);
+        spin_unlock_irqrestore(&xhci->lock, tflags);
+    }
...

This debug version of the patch printed:

[   17.481330] xhci_hcd 0000:80:14.0: TRB_ENABLE_SLOT: no command
completion after 10000ms, USBSTS: 0x00000015 HCHalted HSE PCD

In the end, I didn't add the read of usbsts in the version I submitted
because not only xhci_hc_died(xhci) prints errors messages, but now
since slot_id is NULL, the next error messages will be printed; before
xhci_alloc_dev() safely returns 0 and the system reboots smootly.
I can add it to a v2 if it actually turns out to be necessary.

> > After vmcore gets captured, init calls device_shutdown() trying to
> > shut down the hub device, by also trying to take the same lock still
> > held by the hub kworker task.
> >
> > Avoid the deadlock by adding a 2x timeout for command completion
>
> nit: not a deadlock if X waits for Y and Y is just stuck by itself.

Noted!

> > before calling xhci_hc_died(). This gives enough time before marking
> > the host un- stable, dying and calling xhci_cleanup_command_queue();
> > which unblocks the hub worker into releasing the lock, allowing
> > device_shutdown() to proceed.
>
> Many functions which wait for command completion without timeouts.
> Patch this one and you will get stuck in the next.
> This shouldn't be happening in the first place. If a command doesn't
> complete normally in time then xhci_handle_command_timeout() should
> abort it, and if that times out too, then hc_died().

To come up with this timeout logic, I actually "borrowed" the idea
from the original commit described on Fixes c311e391a7efd ("xhci:
rework command timeout and cancellation,")
In the past, before the wait_for_completion rearrangement done in that
commit, this part of xhci_alloc_dev() code used to have calls to
wait_for_completion_interruptible_timeout() waiting for
XHCI_CMD_DEFAULT_TIMEOUT.
Furthermore, just to give another chance I added a bit more time by
putting `2 * command->timeout_ms` in the patch. However, I have tested
with XHCI_CMD_DEFAULT_TIMEOUT=3D5000ms and this also works.
If XHCI_CMD_DEFAULT_TIMEOUT it thought to be better, if this patch
gets approved, I can send a v2 with XHCI_CMD_DEFAULT_TIMEOUT instead
of 2x that.

> So not sure why this hasn't happened here.
> Is it reproducible? Can you try again with debug logs?

Always reproduceable - just need to issue `echo c >
/proc/sysrq-trigger` on the system.

> echo 'module xhci_hcd +p' >/proc/dynamic_debug/control

Actually, from the beginning of all my debugging I already had
`usbcore.dyndbg=3D+p xhci_hcd.dyndbg=3D+p xhci_pci.dyndbg=3D+p` on the
kernel cmdline, as well as on the crashkernel's
KDUMP_COMMANDLINE_APPEND at /etc/sysconfig/kdump.

On crashkernel's kexec-dmesg of the unpatched kernel I see multiple
doorbell rings stating the HSE:

...
[Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: Command timeout,
USBSTS: 0x00000015 HCHalted HSE PCD
[Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: Command timeout on
stopped ring
[Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: Turn aborted command
000000005921b827 to no-op
[Thu Apr 30 12:28:22 2026] xhci_hcd 0000:80:14.0: // Ding dong!
...

Whereas, on the patched kernel's kexec-dmesg.log only two rings happen.

FYI:
# lspci -k -vvv -s 0000:80:14.0
80:14.0 USB controller: Intel Corporation 800 Series PCH USB 3.1 xHCI
HC (rev 10) (prog-if 30 [XHCI])
    Subsystem: Intel Corporation Device 7270
    Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop-
ParErr- Stepping- SERR- FastB2B- DisINTx+
    Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium >TAbort-
<TAbort- <MAbort- >SERR- <PERR- INTx-
    Interrupt: pin A routed to IRQ 154
    IOMMU group: 20
    Region 0: Memory at 8000200000 (64-bit, non-prefetchable) [size=3D64K]
    Capabilities: [70] Power Management version 3
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D375mA
PME(D0-,D1-,D2-,D3hot+,D3cold+)
        Status: D3 NoSoftRst+ PME-Enable+ DSel=3D0 DScale=3D0 PME-
    Capabilities: [80] MSI: Enable+ Count=3D8/8 Maskable- 64bit+
        Address: 00000000fee00718  Data: 0000
    Capabilities: [90] Vendor Specific Information: Len=3D14 <?>
    Capabilities: [b0] Vendor Specific Information: Len=3D00 <?>
    Kernel driver in use: xhci_hcd
    Kernel modules: xhci_pci

> Regards,
> Michal

Hope to have answered all questions and concerns.
Please let me know what further action I should take for further investigat=
ion.

Best Regards,


