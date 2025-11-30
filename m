Return-Path: <linux-usb+bounces-31052-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1943EC95413
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 20:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4D97342293
	for <lists+linux-usb@lfdr.de>; Sun, 30 Nov 2025 19:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF632C178D;
	Sun, 30 Nov 2025 19:41:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2828000B
	for <linux-usb@vger.kernel.org>; Sun, 30 Nov 2025 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764531688; cv=none; b=AqnluFmytsezZCo5rL5IMFJ63/btZnsOp781bjsqiAazF9hLV9cLQDaD/InYuw/9eS2YzIPJ3NQZ0nmkyyBDW0cuY7a7XadV1Yso0zN+EUSyzQ1Ly1TIbA5/3W/taRn+LTBRocTQBmErbw8GZuLUYNgewIINHUN9+iL3vFiC0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764531688; c=relaxed/simple;
	bh=Y9+lc28z824Px+SX9SSjoFzVv7k3uaCBTivkz/KFmDY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kORRvLsSwHjcUwxUBOPDFssaJoKM01US0DoSlpcVHDGYHNcmwG0V/RB3Rfw3wMFpVZ32JMyJb4Wv7v3altXZYNOXTIVolVoQmovVztKQIw2dIFVi8ZLOLAdmGN9oaTkcbAFvUp4/M5CGvpVtOG2MX51zXyz7Yw9gkyGV9uIuSoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-43322b98837so33891755ab.2
        for <linux-usb@vger.kernel.org>; Sun, 30 Nov 2025 11:41:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531685; x=1765136485;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZ8yoruI0/UqgPNJ8wyDOIBw0EtRm4jXgwWARQ7nI1g=;
        b=cP0ecIPQaepg3l6ARZYhkqzAI2fboCy91eCTlP1f8+iYi4sRUxt3G8tn3WgUkD/Fn1
         0xKF/6O7jaoTLbAQbX6h6uYsh1Zyj8aHSJ2+p16B0PRPG+oEl3HZntIxRuZY2yOs7UoC
         6DUdql8+EwCkqclGFCuyXhDPmxEiJylHT7kfaA4ql9Eeyzqa7qMpGnBMWEV71qAEMYjQ
         azdCSSWrALw5KSlWQTvLpa/uyeYEZdWNUGOlhp07n2+RzNBNmuC2idWZfbr0v/RH5a14
         DG3rfT/jI7qUxA3rT0sDRK7CbXAD4bt9SxXZ65yw7jOmi3e7i346v77z31djZ+PzMFr0
         oLWg==
X-Forwarded-Encrypted: i=1; AJvYcCUiE8N0OcOQzGits4+R/0sTr26p776CR/5seXP01fZG+NnITNxO0DSTY98NkzUPm24Q+HLDq6kWs3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4JbjXwcBPvIoFq3syegat4icQ3pHBhtvWXlsMFA496N8IvFRh
	Y/Hn9Oj52AwGwFL0ovKQY/8iA6F8J4FgaGomG68squLV5JoZp2T/xyNMn3woe1wDUblrWNWTFiM
	oaooMyFZN8Rr3gsX06hO9v6C/RX+Jamn86aTGlw7DSv5Ow9psNss/CXTG+qk=
X-Google-Smtp-Source: AGHT+IEo9XaLofKqMh0eO3FCJCBzwolvS0JEraH7Bazj4ARLuIm/fncy5erRgyMCZZNpW1KNObkWHgcD7EhK6L/oW/o3J6gjhxrN
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c28:b0:433:2597:8cc with SMTP id
 e9e14a558f8ab-435b98e6bd8mr348161055ab.29.1764531685668; Sun, 30 Nov 2025
 11:41:25 -0800 (PST)
Date: Sun, 30 Nov 2025 11:41:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <692c9de5.050a0220.2ffa18.0016.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in usb_start_wait_urb
From: syzbot <syzbot+e6a50a2e7cbb4f775d04@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7d31f578f323 Add linux-next specific files for 20251128
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=119c8192580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec890b8333fce099
dashboard link: https://syzkaller.appspot.com/bug?extid=e6a50a2e7cbb4f775d04
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17bdbcb4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1413b0c2580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9bcc6eb60940/disk-7d31f578.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/895bc1bfae48/vmlinux-7d31f578.xz
kernel image: https://storage.googleapis.com/syzbot-assets/48f15e4679f3/bzImage-7d31f578.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e6a50a2e7cbb4f775d04@syzkaller.appspotmail.com

------------[ cut here ]------------
usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
WARNING: drivers/usb/core/urb.c:414 at 0x0, CPU#0: syz.0.17/6025
Modules linked in:
CPU: 0 UID: 0 PID: 6025 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x111c/0x18d0 drivers/usb/core/urb.c:412
Code: b8 00 00 00 00 00 fc ff df 0f b6 44 05 00 84 c0 0f 85 a7 05 00 00 45 0f b6 45 00 48 8b 3c 24 48 8b 74 24 20 4c 89 fa 44 89 f1 <67> 48 0f b9 3a 49 bf 00 00 00 00 00 fc ff df e9 b7 f2 ff ff 89 e9
RSP: 0018:ffffc90003487820 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8880726bb700 RCX: 0000000080000280
RDX: ffff888071228200 RSI: ffffffff8c3575e0 RDI: ffffffff8fcf8fd0
RBP: 1ffff1100e666078 R08: 00000000000000c0 R09: 0000000000000000
R10: ffffc90003487920 R11: fffff52000690f30 R12: ffff888076835100
R13: ffff8880733303c0 R14: 0000000080000280 R15: ffff888071228200
FS:  00007fe073fd66c0(0000) GS:ffff888125a03000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000001480 CR3: 000000007ecd2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_start_wait_urb+0x115/0x4f0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 dib0700_ctrl_rd drivers/media/usb/dvb-usb/dib0700_core.c:95 [inline]
 dib0700_i2c_xfer_legacy drivers/media/usb/dvb-usb/dib0700_core.c:315 [inline]
 dib0700_i2c_xfer+0xba7/0xf70 drivers/media/usb/dvb-usb/dib0700_core.c:361
 __i2c_transfer+0x871/0x2110 drivers/i2c/i2c-core-base.c:-1
 i2c_transfer+0x25b/0x3a0 drivers/i2c/i2c-core-base.c:2317
 i2cdev_ioctl_rdwr+0x460/0x740 drivers/i2c/i2c-dev.c:306
 i2cdev_ioctl+0x64b/0x820 drivers/i2c/i2c-dev.c:467
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe07318f749
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe073fd6038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fe0733e5fa0 RCX: 00007fe07318f749
RDX: 0000200000000200 RSI: 0000000000000707 RDI: 0000000000000004
RBP: 00007fe073213f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe0733e6038 R14: 00007fe0733e5fa0 R15: 00007ffe02ef2178
 </TASK>
----------------
Code disassembly (best guess):
   0:	b8 00 00 00 00       	mov    $0x0,%eax
   5:	00 fc                	add    %bh,%ah
   7:	ff                   	(bad)
   8:	df 0f                	fisttps (%rdi)
   a:	b6 44                	mov    $0x44,%dh
   c:	05 00 84 c0 0f       	add    $0xfc08400,%eax
  11:	85 a7 05 00 00 45    	test   %esp,0x45000005(%rdi)
  17:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  1b:	48 8b 3c 24          	mov    (%rsp),%rdi
  1f:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
  24:	4c 89 fa             	mov    %r15,%rdx
  27:	44 89 f1             	mov    %r14d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	49 bf 00 00 00 00 00 	movabs $0xdffffc0000000000,%r15
  36:	fc ff df
  39:	e9 b7 f2 ff ff       	jmp    0xfffff2f5
  3e:	89 e9                	mov    %ebp,%ecx


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

