Return-Path: <linux-usb+bounces-34720-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG5XOIN5s2n6WwAAu9opvQ
	(envelope-from <linux-usb+bounces-34720-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:42:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C2A27CDA4
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 03:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E42130C4514
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 02:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7796347516;
	Fri, 13 Mar 2026 02:42:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A1346E68
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369726; cv=none; b=c30HnZIST6EpdhFh7KNBIwo/BTV+FK0EBoI0C33PKgwPEkDvF/eB5As4tgsMwYdHGhLac6QukElvi14+Xwlvjv3CMs1pPKjmcgUK2ZcK2c5Ok8NzawOkGHtMVrqQJloMNkBvAv7riL0ZsVt1jGvq3Ru4SWLfX6fwd5VTJkloeyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369726; c=relaxed/simple;
	bh=DNAciEZMrLT0C645Vwc2zYwe0JkNpYtDdzIm1lmabcI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=vB0I6QvSErDsJEgkPOweBHnpzXDXFkKB1PzTZs4bYz8etF3CQMQ0jrFdxFYabBoohyrAPFG05bDLgiDFJoV1nacFn0wMJ/11uIPQdFQ/QZRBNCeqwCZ0tZEW4DhKazXJVbnlH82jkA1YSXwbpnCnWRMxXs3G6MUOvAK3fXgiNyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bc657f0f3so25812454eaf.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 19:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773369723; x=1773974523;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmILu+4cE3DhCEXjxqW+wvHYwMun6VOLbl8Upz2nUp4=;
        b=DDstAQm8cLYxZB961wQ/xpOScn4ln6BL9WtEfvmUlKlPxN6zkN64nFaNoo1AoPS881
         9qsMErlry9IQCC+WT8iHm2iAzVWM28Q2q+3Zwoe6JARM+nP8DG6vu8ITQ4X945aZPaeG
         WtlWbgh01JRqXHiZIxaTud6x6m8VqDTI0DJF/I6dC3g4oz/AogeiHzcCtAEZy5MBVR5F
         jL3bmSibhu9fmQoKfjYlv9lX7SZoPEVPwH4VWuLT7I1cDGNs//r2kIlq9MibSEdc0w36
         8g679UMVGKOyeGGoMCB71lRNS8CKc6/E7KVNbfhitxRTHhfiSxroOuor8RwGxNShxbx3
         2zNw==
X-Forwarded-Encrypted: i=1; AJvYcCWh4QAYKhXcjjx+1e6C8oq8XUR70vRUF9b/vp0sl9PHtIcj6QwX8zdKgkwXjSwSO1BdBE3HpuQPeC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDJo7lGG1HaRX6svlW3S5jc+89xvnERW36e2bZ3uexXQCnwcMX
	hVNeDWZeLC22NBEeaPa2vbMtDJtGrYsRiZ2s788ZEM2pCbyxXZHrODoqVejssS8wPlCUxXPvyuV
	LwxEAyTPSytHGUpKm4LERDomuMh1/rwZG2ylVNbB6hjnPm0Z38bjD5lvD/bU=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4588:b0:679:be0c:8b54 with SMTP id
 006d021491bc7-67bda97ad7emr903136eaf.5.1773369723409; Thu, 12 Mar 2026
 19:42:03 -0700 (PDT)
Date: Thu, 12 Mar 2026 19:42:03 -0700
In-Reply-To: <b8357bfb-1df3-47a5-9187-85f67ea20289@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b3797b.050a0220.36eb34.0006.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34720-lists,linux-usb=lfdr.de,19bed92c97bee999e5db];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47C2A27CDA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in usb_gadget_udc_reset

raw-gadget.1 gadget.0: Dummy disconnect 0 reset 16, ints_enabled 1
raw-gadget.1 gadget.0: Inc usage: 1 X
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
CPU: 1 UID: 0 PID: 6645 Comm: kworker/1:10 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/27/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 6e 5c c0 fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 cb 74 26 fb 4d 8b 1e 48 89 df 2e e8
RSP: 0000:ffffc900045f64d0 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff88802702cc40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff8f6a51b7 R09: 1ffffffff1ed4a36
R10: dffffc0000000000 R11: ffffffff8b2104d0 R12: dffffc0000000000
R13: ffff888029a7850b R14: 0000000000000040 R15: 0000000000000010
FS:  0000000000000000(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feeb9ff20c0 CR3: 000000003a1fe000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 set_link_state+0xb30/0x1080 drivers/usb/gadget/udc/dummy_hcd.c:473
 dummy_hub_control+0xa09/0x1a00 drivers/usb/gadget/udc/dummy_hcd.c:-1
 rh_call_control drivers/usb/core/hcd.c:652 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:817 [inline]
 usb_hcd_submit_urb+0xdbe/0x1b50 drivers/usb/core/hcd.c:1538
 usb_start_wait_urb+0x12b/0x510 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 set_port_feature drivers/usb/core/hub.c:466 [inline]
 hub_port_reset+0x3c7/0x1820 drivers/usb/core/hub.c:3083
 hub_port_init+0xf50/0x28c0 drivers/usb/core/hub.c:5056
 usb_reset_and_verify_device+0x4ea/0x1af0 drivers/usb/core/hub.c:6215
 usb_reset_device+0x551/0xb40 drivers/usb/core/hub.c:6410
 sd_config+0x27f/0x15b0 drivers/media/usb/gspca/se401.c:221
 gspca_dev_probe2+0x81e/0x1450 drivers/media/usb/gspca/gspca.c:1529
 usb_probe_interface+0x668/0xc90 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c8/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb80 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x2110 drivers/usb/core/message.c:2208
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x3b0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x267/0xaf0 drivers/base/dd.c:661
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:803
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:833
 __device_attach_driver+0x2d4/0x4c0 drivers/base/dd.c:961
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c8/0x450 drivers/base/dd.c:1033
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1088
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb80 drivers/base/core.c:3689
 usb_new_device+0x9f8/0x16e0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a49/0x4f60 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xb02/0x1830 kernel/workqueue.c:3358
 worker_thread+0xa50/0xfc0 kernel/workqueue.c:3439
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 6e 5c c0 fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 cb 74 26 fb 4d 8b 1e 48 89 df 2e e8
RSP: 0000:ffffc900045f64d0 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff88802702cc40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff8f6a51b7 R09: 1ffffffff1ed4a36
R10: dffffc0000000000 R11: ffffffff8b2104d0 R12: dffffc0000000000
R13: ffff888029a7850b R14: 0000000000000040 R15: 0000000000000010
FS:  0000000000000000(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feeb9ff20c0 CR3: 0000000038f62000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	f3 0f 1e fa          	endbr64
   7:	41 56                	push   %r14
   9:	53                   	push   %rbx
   a:	49 89 f6             	mov    %rsi,%r14
   d:	48 89 fb             	mov    %rdi,%rbx
  10:	e8 6e 5c c0 fa       	call   0xfac05c83
  15:	49 83 c6 40          	add    $0x40,%r14
  19:	4c 89 f0             	mov    %r14,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 cb 74 26 fb       	call   0xfb267503
  38:	4d 8b 1e             	mov    (%r14),%r11
  3b:	48 89 df             	mov    %rbx,%rdi
  3e:	2e                   	cs
  3f:	e8                   	.byte 0xe8


Tested on:

commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=105044d6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12442602580000


