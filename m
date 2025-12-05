Return-Path: <linux-usb+bounces-31183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2196CA5C81
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 02:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 115F4316F94A
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 01:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A002066DE;
	Fri,  5 Dec 2025 01:02:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD55E7E0E8
	for <linux-usb@vger.kernel.org>; Fri,  5 Dec 2025 01:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764896544; cv=none; b=sZaL200ciJjFkQV2QHM0dUFVJ3/L5Clkp8q6B2Fs1c/vPtvcgItl3wTZ5DFVT3xSHeSE3/6wPr7NeWxqV5+2PXbFvTpPT2xG8XdbIoqpWc92SZoFfs1APpi600lpzosCuReKriE4RVrctgR3fPrHO/8A80tNveKP/MiOYQKHgpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764896544; c=relaxed/simple;
	bh=0q4rwlVYhqYbxWW9ZJ8VAHJTBSQDrRheWtIW65BUFI8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hlC/Zf77oyslgRrKoFZVNMih3uw1OTBEU8Svd8TXY//BlP2X1tAXpNBSkgdYL74e2biJKnDfJGDZSQFK1lP7hhGI8VFI1DbtURmqbx6bThQgqzmog19JtQgDezPtyR/voOtz8qwQlA2vyEKRl9Ti83PsUAUN7Mc5Y4LZUAzrDxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-450fd003480so2069496b6e.2
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 17:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764896541; x=1765501341;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HPdsiMfQtFN0CDoGFHu0QS5KMfcJQQ3r9oNbv5A9UFY=;
        b=PNGwmP1WyrQz5kZPkYnsgEKig+APFWtMH8mlfTLKO6bvpiCRJ5+7pBV+rm0puvfP/p
         ht20BXEYb2IAJL2UyHzrHAyT1+ffm+PsNep5OIiGHLVrZPlNVkRKbK7s3lf7IHbbmYmK
         hgzMruLIoA9ItXm3/Fss7143vLBXw/rKQFCtNaDuUPXfOP7AxeonY0u3rbSoBSLnaepJ
         rqSBophv5JTrgqX87kyMD976xA/K+J2OR/648FtWm8OERYau8tgKLLZ3csrvsjy/lJWy
         qngLLpCOrgjRpnrKOX7KijeB9RIbxDmgOI2H8OARzWFMOXySZj84K/OaHkdrWJDxr1xB
         W2PA==
X-Forwarded-Encrypted: i=1; AJvYcCVBzqfot2DmKXk/1tJgg2VvaanQRx9KP94xXKv45pMXCFsVu9IN36AeA71F/KSX9xFYFoLjcUTXXak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDXACZ7RiS77SpFtVNu7ypxcjIHz5kfzikCLt0W51kuIU90J6
	btdR043xoN0S/AwUkhaRvYyM3KI688+nmDRgLYslfErQp6GnGXH31OVw+6nXqUmYbn85UCn9wFn
	n0W1Cx/qOdwp4jXYNaZ3LORxpXR7IYv7QzKmAHEMhBKb0aNpD4WtmixYt0+8=
X-Google-Smtp-Source: AGHT+IEoXi47qAVAvv0Lx7D5AF40JncmZ+HQw73x48IjvdnOanGL49E5VnfENKpFgZBeo7sXBLK7TKof3tQsz+Ks0vaZkgmxifIH
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2195:b0:450:89ee:922c with SMTP id
 5614622812f47-45379d8b223mr2519361b6e.27.1764896541572; Thu, 04 Dec 2025
 17:02:21 -0800 (PST)
Date: Thu, 04 Dec 2025 17:02:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69322f1d.a70a0220.d98e3.01e2.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in ADDR_ctrl_msg/usb_submit_urb
From: syzbot <syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e69c7c175115 Merge tag 'timers_urgent_for_v6.18_rc8' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1620c512580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=14b6a9313e132a6b
dashboard link: https://syzkaller.appspot.com/bug?extid=427909a2e3b2f83d78cb
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2a7727a15216/disk-e69c7c17.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/07f937b0ef40/vmlinux-e69c7c17.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a2ace6f54a3d/bzImage-e69c7c17.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+427909a2e3b2f83d78cb@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 2-1: BOGUS control dir, pipe 80005680 doesn't match bRequestType c0
WARNING: CPU: 1 PID: 7927 at drivers/usb/core/urb.c:414 usb_submit_urb+0x114d/0x18b0 drivers/usb/core/urb.c:412
Modules linked in:
CPU: 1 UID: 0 PID: 7927 Comm: syz.1.9434 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x114d/0x18b0 drivers/usb/core/urb.c:412
Code: df 0f b6 44 05 00 84 c0 0f 85 2a 06 00 00 45 0f b6 45 00 48 c7 c7 c0 18 11 8c 48 8b 34 24 4c 89 fa 44 89 f1 e8 c4 d0 8f fa 90 <0f> 0b 90 90 49 bf 00 00 00 00 00 fc ff df e9 95 f2 ff ff 89 e9 80
RSP: 0018:ffffc9000cd575a0 EFLAGS: 00010246
RAX: 7bec10db12722900 RBX: ffff88802826fd00 RCX: 0000000000080000
RDX: ffffc9000fcd1000 RSI: 0000000000003d41 RDI: 0000000000003d42
RBP: 1ffff11007c64078 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bba684 R12: ffff88803d64a100
R13: ffff88803e3203c0 R14: 0000000080005680 R15: ffff88804c9092c0
FS:  0000000000000000(0000) GS:ffff888126238000(0063) knlGS:00000000f543db40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 00000000801c0018 CR3: 0000000040d46000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 ce6230_ctrl_msg+0x2c2/0x650 drivers/media/usb/dvb-usb-v2/ce6230.c:61
 ce6230_i2c_master_xfer+0x4ce/0x6d0 drivers/media/usb/dvb-usb-v2/ce6230.c:113
 __i2c_transfer+0x874/0x2170 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2317
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 compat_i2cdev_ioctl+0x5a8/0x5c0 drivers/i2c/i2c-dev.c:575
 __do_compat_sys_ioctl fs/ioctl.c:695 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:638 [inline]
 __ia32_compat_sys_ioctl+0x543/0x840 fs/ioctl.c:638
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xb6/0x2b0 arch/x86/entry/syscall_32.c:306
 do_fast_syscall_32+0x34/0x80 arch/x86/entry/syscall_32.c:331
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf704d539
Code: 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f543d55c EFLAGS: 00000206 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 0000000000000707
RDX: 0000000080000a40 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
   4:	10 07                	adc    %al,(%rdi)
   6:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
   a:	10 08                	adc    %cl,(%rax)
   c:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

