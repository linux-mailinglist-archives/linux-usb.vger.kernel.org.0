Return-Path: <linux-usb+bounces-34309-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBf+Lr/frmmoJgIAu9opvQ
	(envelope-from <linux-usb+bounces-34309-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:57:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391223B146
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A631304077F
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 14:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3F63D648A;
	Mon,  9 Mar 2026 14:55:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A263D34B2
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 14:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068104; cv=none; b=WXgJQDoBch/gjGJQZ9nwexewENlR1NK/4jW+Sn+2k6R02rgpjHLY2gFxzByxkK+P17wrVQ4wTQ+9u8RDT88/jB4bwJaMUANbpSA+F0XgIDGjVQrqOo9dahGYlWdS5/33KQi0uJNJDnOQ0YiuHFCoHpZypQjC3Z7pIzp9US3OAMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068104; c=relaxed/simple;
	bh=WCsSkQZ7J5MihV9wnmZ3L7wGLXb3UllWGXh1c9gEvGA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ivAs7gCzGIiejhEjvZfnVqGSemle0k8eu5ByvV6jTBrcVleotc3OBf9ddKI8VtpdYpJm+D1ALGweZLlD+QfDQDvF3sJujuEAtpdoYqjv3MX/2rjmoBV9AYdGHh1eoNjOcT9JsQdJdOR7nbaJRyVmRrdvFWPLmTEik8oWnfWjfC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67bb43260a2so10287504eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 07:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068102; x=1773672902;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LRF7kHjuijXcRNK8QQ3FqtWpzqp8sTLS+LWZM9q8u0=;
        b=kYPjbBgTFnVrp1x3m4IozGtr7wALEVqvx8nBVmXdW50WaGx0h0urpbezrobUMT94Qd
         00vb6Z4TtlVwIqwUBMVNmAVoBnaAYAco1pialwVgQyUarbgY6oDuNva3H3RzHeTHflId
         IfBAQzWukZxF24DWtYTmeVfZhjl9ahD+M0fX++vFxhaqqOjlXX0ORVN5tqljFFEX6v/e
         TbRoG8Tuz+eKmTxFtRL+b5iM3iED84yoxJBemQHP/qUVn62ySlSF8pvpbJlVp4aDG/2j
         XZrEB9PHzOipQQdlBlQDREFCSknZLQrY5kYbPldt5rmtceItFflhKIagXKT/fjLwXhjF
         pQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk+wy+tPehW/5kF0AW3Q8YMPL9QINzX6Hui4oDsqBaG+p57C5ulHnP8pwnyMtCyVIHC/nB123n5G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfAPE4Zrl0ED54DguUvvh7UqXlrdIFWAqfGBcUmzm8Y4/jOHG
	7wUYLgN607PgitvG9AVlnKNTQ769A52Xi57xGC2QivVzvaBIBiOZu9VRqzTZHxKSq8g5T1xwIak
	THyV9zL4SHWsXWPwkjvCCcUzvOl5eiEEw+mi7cOGyqfjeLxTS4dPIJh5BTI4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:62a:b0:674:3230:ff11 with SMTP id
 006d021491bc7-67b9bd5b792mr7859646eaf.64.1773068102197; Mon, 09 Mar 2026
 07:55:02 -0700 (PDT)
Date: Mon, 09 Mar 2026 07:55:02 -0700
In-Reply-To: <e9d9d118-e6fc-42de-847d-e58eaf7bcba5@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69aedf46.050a0220.310d8.0027.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 2391223B146
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-34309-lists,linux-usb=lfdr.de,19bed92c97bee999e5db];
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
	NEURAL_HAM(-0.00)[-0.900];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in usb_gadget_udc_reset

raw-gadget.0 gadget.1: Reset #2
usb 2-1: device descriptor read/64, error -32
gadget gadget.1: Reset #1, driver 0000000000000000
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
CPU: 0 UID: 0 PID: 5814 Comm: kworker/0:3 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_gadget_udc_reset+0x42/0x80 drivers/usb/gadget/udc/core.c:1201
Code: 01 00 00 4c 89 f7 48 c7 c6 a0 d2 fb 8b 4c 89 fa e8 23 5b fd ff 49 83 c7 40 4c 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 ff e8 f0 da fb 00 4d 8b 1f 48 89 df 2e 2e
RSP: 0018:ffffc90004be64c0 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888029e78c40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff8880348cba6c R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff5200097cc01 R12: ffff888029e78c40
R13: 1ffff110053ee2a1 R14: ffff888029e78d58 R15: 0000000000000040
FS:  0000000000000000(0000) GS:ffff88812633d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f16fca6890f CR3: 000000003df2e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 set_link_state+0x80b/0x1220 drivers/usb/gadget/udc/dummy_hcd.c:469
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
 usb_reset_and_verify_device+0x105d/0x1af0 drivers/usb/core/hub.c:6215
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
RIP: 0010:usb_gadget_udc_reset+0x42/0x80 drivers/usb/gadget/udc/core.c:1201
Code: 01 00 00 4c 89 f7 48 c7 c6 a0 d2 fb 8b 4c 89 fa e8 23 5b fd ff 49 83 c7 40 4c 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 ff e8 f0 da fb 00 4d 8b 1f 48 89 df 2e 2e
RSP: 0018:ffffc90004be64c0 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888029e78c40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffff8880348cba6c R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffff5200097cc01 R12: ffff888029e78c40
R13: 1ffff110053ee2a1 R14: ffff888029e78d58 R15: 0000000000000040
FS:  0000000000000000(0000) GS:ffff88812633d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f16fca6890f CR3: 000000003df2e000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	01 00                	add    %eax,(%rax)
   2:	00 4c 89 f7          	add    %cl,-0x9(%rcx,%rcx,4)
   6:	48 c7 c6 a0 d2 fb 8b 	mov    $0xffffffff8bfbd2a0,%rsi
   d:	4c 89 fa             	mov    %r15,%rdx
  10:	e8 23 5b fd ff       	call   0xfffd5b38
  15:	49 83 c7 40          	add    $0x40,%r15
  19:	4c 89 f8             	mov    %r15,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 ff             	mov    %r15,%rdi
  33:	e8 f0 da fb 00       	call   0xfbdb28
  38:	4d 8b 1f             	mov    (%r15),%r11
  3b:	48 89 df             	mov    %rbx,%rdi
  3e:	2e                   	cs
  3f:	2e                   	cs


Tested on:

commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=144e6016580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=131c375a580000


