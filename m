Return-Path: <linux-usb+bounces-34613-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOgRGfDBsWmdFAAAu9opvQ
	(envelope-from <linux-usb+bounces-34613-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 20:26:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC23F2694B3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 20:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FA2C3160165
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 19:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A91375ACC;
	Wed, 11 Mar 2026 19:25:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C06B32E151
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257107; cv=none; b=ZqhUmKgVuEYcC5r7+YlRDrN7Fch/wF0oMmMibofN+yNQ0WPG32ZXKJBWVfUUBVndqhLfcZTnVzyGTXYrVxN0iU7EedtoUijtcndjy+axVEHwUbTlEJZNA4hcZIOMmyfqfIGFq9qtxtrupV7NlW4zoZbg+1cNibjyrtDXO3r22AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257107; c=relaxed/simple;
	bh=5XQj3kq0wHZwXcs5i+jcCqwXK04orIRBaBoLFjd47vY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Q4Jk2JC+f67mMvzdEPKq4a3olnPnkHxbgwyH4IioiCmF3niobjc1CyM3ta/wRG/tQU95pLtH3bkGlD0L3yKrH/aOe49mfn08QswbXksFfiQ7lH7rcg+hNmfqzPQG6b0ykYNk/UODQTQo01IMmW5GQsKTNaNLYRZg42SvqdyklyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bbb4e5f24so1872621eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 12:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257104; x=1773861904;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJQph4XJJmxnaiQXMldYgS9zURQDscqV+k0yblvreGU=;
        b=c0MXdkubRkgrYL0+rAWzRY862Qpx0M6PXYKWLU0HoKhLCvwFyTU2LCAModQV4qF7M5
         ZUxcdkCsannUP5rid+cruon9mYz83BkDPDR0SsO3077Qnz8vEvYEVirWtayuMinIFgua
         fYKpHyOm7Vs7xPSzVwUdHi7UMLcddAlQcAkTzZYWTJPwzlew1GHmjsQOw3opnlBqHAMa
         1vvgoQ27tiGkmYWer2tVu0Nc5g3vZ2Z2oQKecaPs+ai2NFXNzdJOY1rS36q4RYMvuRg9
         JWQSDC2ByYFcp1E5NKoMsjQIJkncMBaCiV2lpWGrV73W4IwOSskAHFx/5rQnohOgWd+U
         e9eg==
X-Forwarded-Encrypted: i=1; AJvYcCUqmcHE0p80XtQtRZCzEllHVdCFYHF9OSNGtm2kYKuC/LJAxZ1RD/N5y3klZdzh4t+VhP43Zb8ckz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7QnyuNPdB98/AFdfhp+4aB4bpqeWexHcMCrwUZQ4b/ZQSJMeJ
	q6h9eAVXXlkC+oK97gzf5BoBMUqHwo+POo8A6J+mW9VLYUoGSW2zMgdanfOMz4g4VzypF9+Z/YV
	LpAgrlIQfCt+q3YqqFxNbvyACwg0w8sRd0X4mr3mXtaQWky6FG/C0eH1hyI4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2222:b0:676:84e2:1551 with SMTP id
 006d021491bc7-67bc8acb0cfmr2421897eaf.76.1773257104206; Wed, 11 Mar 2026
 12:25:04 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:25:04 -0700
In-Reply-To: <497b1bab-984c-43d7-9ef0-6614d2c1b426@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b1c190.a00a0220.707e5.0002.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34613-lists,linux-usb=lfdr.de,19bed92c97bee999e5db];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC23F2694B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in usb_gadget_udc_reset

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
CPU: 0 UID: 0 PID: 5896 Comm: kworker/0:3 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/27/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 6e 5c c0 fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 cb 74 26 fb 4d 8b 1e 48 89 df 2e e8
RSP: 0000:ffffc90004e97308 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888027e5cc40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff888027e5c000 R08: ffffffff8f6a4fb7 R09: 1ffffffff1ed49f6
R10: dffffc0000000000 R11: ffffffff8b2104d0 R12: ffff888027e5cc3c
R13: ffff888027e5cbc0 R14: 0000000000000040 R15: 1ffff11004fcb987
FS:  0000000000000000(0000) GS:ffff88812633d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558766fe1070 CR3: 000000003a8c8000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 set_link_state+0x81b/0x1340 drivers/usb/gadget/udc/dummy_hcd.c:473
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
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 6e 5c c0 fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 cb 74 26 fb 4d 8b 1e 48 89 df 2e e8
RSP: 0000:ffffc90004e97308 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888027e5cc40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff888027e5c000 R08: ffffffff8f6a4fb7 R09: 1ffffffff1ed49f6
R10: dffffc0000000000 R11: ffffffff8b2104d0 R12: ffff888027e5cc3c
R13: ffff888027e5cbc0 R14: 0000000000000040 R15: 1ffff11004fcb987
FS:  0000000000000000(0000) GS:ffff88812633d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000558766fe1070 CR3: 0000000038c0e000 CR4: 00000000003526f0
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
console output: https://syzkaller.appspot.com/x/log.txt?x=143d04d6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1686575a580000


