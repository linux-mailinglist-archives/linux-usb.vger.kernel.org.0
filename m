Return-Path: <linux-usb+bounces-32880-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEA9Miz1eWnT1AEAu9opvQ
	(envelope-from <linux-usb+bounces-32880-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 12:38:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1074FA0995
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 12:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48936301AD28
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949AD345758;
	Wed, 28 Jan 2026 11:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNTw6483"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229042EFD86;
	Wed, 28 Jan 2026 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600269; cv=none; b=mOPv7tWb3bNV986rTrakB3sheUttSZdM/Twki6rH0MqY5GT2uosvm2b0T0yaQ7hDFBr0SqGHohGUewE+ewH3XrEjAgk4SDTDa0IWvkeJ5biRSPu8jJu0/g55FdNHWZAPMVaNPLRIgpB2onCQjq4yg4eX9S5HTqzB2G9h7/iEiYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600269; c=relaxed/simple;
	bh=qkYetsuRw+AffcqWhxHffavKbxMeepSiCGvFXgXuejo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSNKJYvosATCbPkiIT6nSsi+ro0LKtAu44MifweWbC2DOHM09+ASmbhjEwcVLVSZ1RExpm2qfr8sJhQc6gBgoB6eJL2/v8fKsZCl0n1gp923Xy9+mhk9mCGz9/cx8N+7mKOayPpDTAoidArbHyl6WkcMM3us8U+v1WulZ+Y2fEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNTw6483; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BAEC16AAE;
	Wed, 28 Jan 2026 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769600268;
	bh=qkYetsuRw+AffcqWhxHffavKbxMeepSiCGvFXgXuejo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNTw6483M1E2AQBAyMVeODT1qM3/gJAhwdFi7rUBxpjZ52UviqiKKZ0sIabp68x43
	 rWR19BcgG+0nr0/8YzemoyObnGSWMGi++A5FWDZ8Zz0VtVa+9qGG/AwDGNKjWurYLN
	 CeeOtIHMZW5ShhcUE6LNEdJg97mcum+3uVqA4xoTscZHdwD0Ut58NshNXeOxRM3O+m
	 JXAwWZfb12GBTMTjX2FWhhyMRj7aAdEWWzPOdP/hPm2/2pth+lYjXJ/7Oz944KYmlU
	 RhYBjdhcWB2q1caYb/2Q9ba1kKjYO83dqaDkRDm9tYQ9U4u546X0la1NsShCAsj2x+
	 NOFNRVyP7sHMw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vl3rf-000000007zW-3AJH;
	Wed, 28 Jan 2026 12:37:40 +0100
Date: Wed, 28 Jan 2026 12:37:39 +0100
From: Johan Hovold <johan@kernel.org>
To: syzbot <syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in
 qt2_read_bulk_callback (2)
Message-ID: <aXn1A7IjYbcQuFhh@hovoldconsulting.com>
References: <69795995.050a0220.c9109.0028.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69795995.050a0220.c9109.0028.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=d51c584a7396ddf1];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32880-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,c63f59479d561970dc2b];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 1074FA0995
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:34:29PM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    615aad0f61e0 Add linux-next specific files for 20260126
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1761a05a580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d51c584a7396ddf1
> dashboard link: https://syzkaller.appspot.com/bug?extid=c63f59479d561970dc2b
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145d6bfa580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14dac98a580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5318e5f027be/disk-615aad0f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d165e561fa49/vmlinux-615aad0f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/fb0e01c90aa5/bzImage-615aad0f.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c63f59479d561970dc2b@syzkaller.appspotmail.com
> 
> Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
> CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/13/2026
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:__queue_work+0xa2/0xf90 kernel/workqueue.c:2269
> Code: 11 31 ff 89 ee e8 4e f4 37 00 85 ed 0f 85 ef 0c 00 00 e8 01 f0 37 00 4d 8d b7 c0 01 00 00 4c 89 f0 48 c1 e8 03 48 89 44 24 28 <42> 0f b6 04 20 84 c0 0f 85 22 0d 00 00 4c 89 34 24 41 8b 2e 89 ee
> RSP: 0018:ffffc900000077f8 EFLAGS: 00010002
> RAX: 0000000000000038 RBX: 0000000000000008 RCX: ffff88801dafdac0
> RDX: 0000000000000100 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffff88803642c01f R09: 1ffff11006c85803
> R10: dffffc0000000000 R11: ffffed1006c85804 R12: dffffc0000000000
> R13: ffff88803642c018 R14: 00000000000001c0 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff8881252b4000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fef907e8600 CR3: 000000000e54a000 CR4: 00000000003526f0
> Call Trace:
>  <IRQ>
>  queue_work_on+0x106/0x1d0 kernel/workqueue.c:2405
>  qt2_process_read_urb drivers/usb/serial/quatech2.c:541 [inline]
>  qt2_read_bulk_callback+0xe96/0x1030 drivers/usb/serial/quatech2.c:574
>  __usb_hcd_giveback_urb+0x376/0x540 drivers/usb/core/hcd.c:1657
>  dummy_timer+0xbbd/0x45d0 drivers/usb/gadget/udc/dummy_hcd.c:1995
>  __run_hrtimer kernel/time/hrtimer.c:1785 [inline]
>  __hrtimer_run_queues+0x529/0xc30 kernel/time/hrtimer.c:1849
>  hrtimer_run_softirq+0x182/0x5a0 kernel/time/hrtimer.c:1866
>  handle_softirqs+0x22a/0x7c0 kernel/softirq.c:626
>  __do_softirq kernel/softirq.c:660 [inline]
>  invoke_softirq kernel/softirq.c:496 [inline]
>  __irq_exit_rcu+0x5f/0x150 kernel/softirq.c:727
>  irq_exit_rcu+0x9/0x30 kernel/softirq.c:743
>  instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
>  sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1056
>  </IRQ>
>  <TASK>

This looks like it could be related to commit d000422a46aa ("tty:
tty_port: add workqueue to flip TTY buffer") in Greg's tty-next branch,
which was reverted yesterday:

	https://lore.kernel.org/lkml/2026012739-compile-bling-3779@gregkh/

Someone who knows the syzbot interface can probably verify and close
this as fixed.

Johan

