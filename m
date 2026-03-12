Return-Path: <linux-usb+bounces-34706-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBwQL/YFs2njRgAAu9opvQ
	(envelope-from <linux-usb+bounces-34706-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 19:29:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25183277266
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 19:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09143304973E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 18:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9512A3F165D;
	Thu, 12 Mar 2026 18:29:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046B23DBD6F
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773340145; cv=none; b=nJ8SI959XYiIQ8k1WhASbdP7OE2YlZEozXtYRjgBnpeAHdUIH/ZilfH+AEZjZv++vpyAOgcrgCPanPjXRYPK4CHi4HgoY1zKMlku5qTw8xBYqZCHBm9JSYpFQIGRfo1A0fzxfK6kV5PIlhw6ibtiMfDo6U7XXguSa1ODkQ59EiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773340145; c=relaxed/simple;
	bh=d/DP0+vJOcECsIzjX4QzSrE3anVwwolFAi7fW3G/joM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hMLT/EjZI80PdiR1YUu0ti0eVG2eyVnqtFN+Ujp1ig4VWfkcPUnwGR+PF3Fuo1Caf0hgCIW1wwQbw/TT846x0JDzVnTFBALhMQKDzKvqzDeVN1syiaNbRHVbFjeIXoXHFfM2/dY49pLU+zM3BW7k++dsbyrVIm8eBcPpuENnk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-464bbea2120so9814399b6e.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 11:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773340143; x=1773944943;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJ7QbcWa7DDuZX8xC1UJVHiqbPGwWNOJj7WjTfU8Las=;
        b=PdmDRIalB1/icS3jlArkHTRt1V/eaATNTnB1PEP4kx9HBUPuCRHYRcq9bSHdx18lQK
         3QkgquVg4q2hmbUHtZ92uf4QYmGmRHH3uwwWcvn+0ddtcKZht5uGGD/RzjjsUsHmXEDE
         Xq0acLEunBeDn6CHZBRX3e/8kCDswkaxEKBMhceaLomSZOGPwxvhV/7NDDJaYclCFJtm
         flLU0VRa2YMD8anPUBksXjs3lX5WhU/fxiQzRe4gDt4iUJz7hXQ75XyuFuqO7X6/RAs+
         tXdZEH+QfkXom5ZK8/ZtF+HjCT8KgBZ3FWvzjc6GHjwvhi0Ikhr6bEZe9tiBJNh4OWEZ
         wh2g==
X-Forwarded-Encrypted: i=1; AJvYcCXsBJ98yBsLXpqfGE7P90cJljeaRS63+1cPAFtWeUoRkeah4AzS5/EH3Mfx4sxbxg9LrjUC8jx4Qtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCqX3fHvzmWweW3ZSd3HmdXV/KIv/CwEEBy12sNKTy5/+Ya+H
	NrkhBcV6RclaqHv/mb4VUY6nHwcFqfDId6BwK1F7DJc3mz4ycsDn2wdpw4X3uMuNVrtGfZdoVab
	mwN4L2W4rkODLTPnu+8SmBTGv3gz12jirhQNkp67kIilVM4DILx1BDXu7wg4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:22a0:b0:672:a49f:128e with SMTP id
 006d021491bc7-67bda98fb5emr266907eaf.8.1773340143019; Thu, 12 Mar 2026
 11:29:03 -0700 (PDT)
Date: Thu, 12 Mar 2026 11:29:03 -0700
In-Reply-To: <76ea1412-ee4d-4eaf-b8a8-5866ad960b52@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b305ef.050a0220.24f2ac.0022.GAE@google.com>
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34706-lists,linux-usb=lfdr.de,19bed92c97bee999e5db];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 25183277266
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
general protection fault in usb_gadget_udc_reset

raw-gadget.1 gadget.3: Inc usage: 1 A
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
CPU: 1 UID: 0 PID: 5926 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/27/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1200
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 6e 5c c0 fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 cb 74 26 fb 4d 8b 1e 48 89 df 2e e8
RSP: 0018:ffffc90004197310 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888029ce8c40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff8f6a51b7 R09: 1ffffffff1ed4a36
R10: dffffc0000000000 R11: ffffffff8b2104d0 R12: 1ffff1100539d187
R13: ffff8880296b450b R14: 0000000000000040 R15: ffff888029ce8c40
FS:  0000000000000000(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f21940fcff8 CR3: 0000000038eda000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 set_link_state+0xa17/0x10c0 drivers/usb/gadget/udc/dummy_hcd.c:474
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
RSP: 0018:ffffc90004197310 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888029ce8c40 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff8f6a51b7 R09: 1ffffffff1ed4a36
R10: dffffc0000000000 R11: ffffffff8b2104d0 R12: 1ffff1100539d187
R13: ffff8880296b450b R14: 0000000000000040 R15: ffff888029ce8c40
FS:  0000000000000000(0000) GS:ffff88812643d000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f21940fcff8 CR3: 00000000348ae000 CR4: 00000000003526f0
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
console output: https://syzkaller.appspot.com/x/log.txt?x=153e775a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=162dd75a580000


