Return-Path: <linux-usb+bounces-34514-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFogO4/esGkuoAIAu9opvQ
	(envelope-from <linux-usb+bounces-34514-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 04:16:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED5325B55C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 04:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 816203061211
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 03:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFCE310762;
	Wed, 11 Mar 2026 03:16:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D12F8BEE
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 03:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773198965; cv=none; b=kMQlu6pu4TGJ9runBcAsZVc2OtYzZqS13e26xxDvuomU+EQv/w3jhi58pVAQn3orVg/rPDxr8TNY09ScFHPdDvwvUsXtmn0XqdJF0+Vcd2E3IhEXmc+vJVkl2OtU1M2iHl6AfTrl9X7iHkTJeFK6pvSPEXcLjfDlQnKLJpNKJqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773198965; c=relaxed/simple;
	bh=ahgunm6RjJ45rALxOzEOAHo0szn8cJawPdR8mHctF/0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KGBMMzddyo2LKHmheHHKgMEDsBFdrWphezSnRkNggJbJITwsZIHNDsz6eda0Y2HsyAjTzp4W/oxJKpCFjdMqqi1U2WRuF+mHAJ9GrorbcdIXyvT5sU5BDamzPtmupJY9JioY6ZKtnNP33vhZoMd0vGoZquLyU4U3FIL+qQp/uig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-463c632f9a3so117000378b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 20:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198963; x=1773803763;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65pEcSDqCcXpUCIAduNM4QWmbGUnXV689BRrCjofxoY=;
        b=TOu2WZczdSHqfELzh8MqrP8suKVdCtpC8YN7TUfuWjI7+LH6LYb0P7bFcEHDwcAORS
         8TeufwCGBzYO4AY/kxlkCXNl5YjJaOPf5MJo8ukpqown2VsqZhMwxX2eRSRRuzm+IWkr
         /GNXgvE7NVEOq82p1wGkMVrQ2MeX8NxIpMigTUKWk2KqvGkFTSpqZg64dS9AkeWsaHhG
         dAzOTaUDLjUX3PoNixXWI4YYPMCDaR1vHFyIA/XrFB+I+GHlWSoCPL6E9NoM8bGx2NVq
         J9+28hBKetWREQVwTWXTIXMG/9D9ZYPB7egYIWm7yXckepPB6mJCzI2x7ZwJz7QtMq/m
         nf1w==
X-Forwarded-Encrypted: i=1; AJvYcCVRaQSAs8uld2ve3x/PQHA3N4WdlPpUthsIEXddW7YOAR/K2sA7hVeqpRwsSv6KwRkkCYL1IZoiKpU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfk5eM2MT4YwxBc7Au+FF2SxLVKjPmuPnSCYNIRLyol1mR+iq3
	JOR1ief0pY3/BlvnfYtKEr9OOXW2OYwRBj4wBDQAKAdeHVc1wigwceZK/3nThsAIy7FpaOXb85/
	Qq6BqSiHpzrGgPbubeDmGyNor7k0H/taWbnkX8jo2HMBy+wwNHKc9BgF6jvA=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2f05:b0:45f:2042:8fbe with SMTP id
 5614622812f47-467333eeb58mr703205b6e.13.1773198963511; Tue, 10 Mar 2026
 20:16:03 -0700 (PDT)
Date: Tue, 10 Mar 2026 20:16:03 -0700
In-Reply-To: <8b3636bc-3446-4b4c-a8cf-d940be933c4b@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b0de73.050a0220.381736.0007.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6ED5325B55C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34514-lists,linux-usb=lfdr.de,19bed92c97bee999e5db];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in usb_gadget_udc_reset

gadget gadget.0: Reset usage 1
gadget gadget.0: Reset #1, gadget ffff888027440c40 driver 0000000000000000
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
CPU: 1 UID: 0 PID: 6315 Comm: kworker/1:5 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/27/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_gadget_udc_reset+0x45/0x80 drivers/usb/gadget/udc/core.c:1201
Code: 4c 89 f7 48 c7 c6 a0 d2 fb 8b 48 89 da 4c 89 f9 e8 20 5b fd ff 49 83 c7 40 4c 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 ff e8 ed ea fb 00 4d 8b 1f 48 89 df 2e 2e
RSP: 0018:ffffc90003d77308 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888027440c40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000010 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed1017124923 R12: ffff888027440c40
R13: ffff888029fe250b R14: ffff888027440d58 R15: 0000000000000040
FS:  0000000000000000(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f168c5e3286 CR3: 0000000036838000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 set_link_state+0xad6/0xff0 drivers/usb/gadget/udc/dummy_hcd.c:471
 dummy_hub_control+0xa09/0x1a00 drivers/usb/gadget/udc/dummy_hcd.c:-1
 rh_call_control drivers/usb/core/hcd.c:652 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xdbe/0x1b50 drivers/usb/core/hcd.c:1538
 usb_start_wait_urb+0x12b/0x510 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 set_port_feature drivers/usb/core/hub.c:466 [inline]
 hub_port_reset+0x3c7/0x1820 drivers/usb/core/hub.c:3083
 hub_port_init+0x299/0x28c0 drivers/usb/core/hub.c:4939
 hub_port_connect drivers/usb/core/hub.c:5496 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x25d3/0x4f60 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xb02/0x1830 kernel/workqueue.c:3358
 worker_thread+0xa50/0xfc0 kernel/workqueue.c:3439
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_gadget_udc_reset+0x45/0x80 drivers/usb/gadget/udc/core.c:1201
Code: 4c 89 f7 48 c7 c6 a0 d2 fb 8b 48 89 da 4c 89 f9 e8 20 5b fd ff 49 83 c7 40 4c 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 ff e8 ed ea fb 00 4d 8b 1f 48 89 df 2e 2e
RSP: 0018:ffffc90003d77308 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888027440c40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000010 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed1017124923 R12: ffff888027440c40
R13: ffff888029fe250b R14: ffff888027440d58 R15: 0000000000000040
FS:  0000000000000000(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f168c5e3286 CR3: 0000000036838000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	4c 89 f7             	mov    %r14,%rdi
   3:	48 c7 c6 a0 d2 fb 8b 	mov    $0xffffffff8bfbd2a0,%rsi
   a:	48 89 da             	mov    %rbx,%rdx
   d:	4c 89 f9             	mov    %r15,%rcx
  10:	e8 20 5b fd ff       	call   0xfffd5b35
  15:	49 83 c7 40          	add    $0x40,%r15
  19:	4c 89 f8             	mov    %r15,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 ff             	mov    %r15,%rdi
  33:	e8 ed ea fb 00       	call   0xfbeb25
  38:	4d 8b 1f             	mov    (%r15),%r11
  3b:	48 89 df             	mov    %rbx,%rdi
  3e:	2e                   	cs
  3f:	2e                   	cs


Tested on:

commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15cd975a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16e44d52580000


