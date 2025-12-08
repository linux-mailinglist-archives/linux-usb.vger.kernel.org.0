Return-Path: <linux-usb+bounces-31267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47372CAC8AD
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 09:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13ED1303FE24
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 08:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7581E296BC2;
	Mon,  8 Dec 2025 08:47:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F41D2192F4
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765183647; cv=none; b=uo8mK4uliCusu1lhKmgzAlKH+W/CNOcth9nuJfC5UmSsmV7bskZzkqOk08I0GtD5x3tzvDA1sHWpoJrPuiAFQpm+EyEFLYbf6o/KEDtDXXVjCWqLwOAjOzjFflRv0B5MqqWdNoDaWJAQ8q1TegrczKw8q5QySZkJHzA4Ohoyjq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765183647; c=relaxed/simple;
	bh=ihnUjRDVz7IvFxHpXnG2hzi/Pd6GyqJSgESo2ypJRV4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=T3pdHr8BXK59ZhwjRgdf8qAQx6pI+A4bAdMUTpWYHN/FzeJ8hhlxq6qhmAbqs73kU0YbAo1oMv8GRh8vLZGo4ilj88zs4V3BVGdX8aGChMb4fF0c8lQzIW9v8PfnuH077r7gY9UZhbUAXd4irIhj1nvDughgSOZ4MHCvI+dyA6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7c982b11ccbso1140732a34.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 00:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765183645; x=1765788445;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGCYqsNkvZTyehNsH8OtSaP7Q2LaD7JciDZVUEAed3Y=;
        b=GzkCzsjWrJ++5HL/cZmPabJ1lDzPg8zeOylk1ySv04TUEJC3hWPIoP1plA5ZybXx9m
         3eaJaCeDo50Z93dNBE38usE/mZSzNPELY9GgVibk4tJXwrIjxQeoghFGXW2ZvwB5wKbz
         x51cGWQeFL7ElwbzK0oAkwD9dxOmF+2sHpXSEceeLpORJ6gM5ShD5YwxkUf1ZI1B5yOm
         UXr2GXSPm6CtYdiOVi0EAXEYqTM7XGo6VcYaFXekcWZPO4GGKoW9lI1f6t/CxSqMEuDL
         Fkd4i+aHf8wnbL5tiPqs2ymqnE2ykNvkf74GJxlTqIgFmySFlAIstRqbBvkR7OkhoiNi
         lI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/8NzdKsrz2BDo+xz/65F6U+3cuxuWWCYvRfSDEL9VefZs25bkqRadNwrMxR98AdEkVOw6/9oDaB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xyrGQHa4gMfFP13n3qiP4Xsw/ZbOyOSOCMkMqcBZfhdE4Mg9
	GHNPGOkVJXBMufFaZhAo2WUo6rfsA5XAJa2B5hrAtM2qs028/v7aU1cWscowEW5YfTAvLWVbiwQ
	b0sC2HVIDktzYji8TpYwwlZZ8c1KBzniZkGM8Q/hvir5MciBbW4+xLn7m3CE=
X-Google-Smtp-Source: AGHT+IG5VogNgX4Re39k7Gqj+zkKFQJj+QnIC80qt7KVfcqOyFpUpY/b3VRiko3SNG4abDUIjqQr6v3mmxi7Z8aDPIQykG4YfoFA
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2293:b0:657:70af:4e21 with SMTP id
 006d021491bc7-6599a8c3813mr3363688eaf.8.1765183644789; Mon, 08 Dec 2025
 00:47:24 -0800 (PST)
Date: Mon, 08 Dec 2025 00:47:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6936909c.a70a0220.38f243.0099.GAE@google.com>
Subject: [syzbot] [usb-storage?] WARNING in usb_stor_msg_common
From: syzbot <syzbot+4e26f67fa7f5bb2dafcc@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com, usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bc04acf4aeca Add linux-next specific files for 20251204
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10e6bcc2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9f785244b836412
dashboard link: https://syzkaller.appspot.com/bug?extid=4e26f67fa7f5bb2dafcc
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=110bb01a580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f2d7ef7b5470/disk-bc04acf4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ee299a9cd371/vmlinux-bc04acf4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ed3cdf46e7b2/bzImage-bc04acf4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4e26f67fa7f5bb2dafcc@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff888144371a00 submitted while active
WARNING: drivers/usb/core/urb.c:380 at 0x0, CPU#1: usb-storage/5993
Modules linked in:
CPU: 1 UID: 0 PID: 5993 Comm: usb-storage Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
RIP: 0010:usb_submit_urb+0x7e/0x18d0 drivers/usb/core/urb.c:380
Code: 89 f0 48 c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 87 b4 1f fb 49 83 3e 00 74 40 e8 fc 5f b9 fa 48 8d 3d 15 c4 c7 08 48 89 de <67> 48 0f b9 3a b8 f0 ff ff ff eb 11 e8 e1 5f b9 fa eb 05 e8 da 5f
RSP: 0018:ffffc900034672e0 EFLAGS: 00010293
RAX: ffffffff87089394 RBX: ffff888144371a00 RCX: ffff88807801bd00
RDX: 0000000000000000 RSI: ffff888144371a00 RDI: ffffffff8fd057b0
RBP: ffffc900034674b8 R08: 0000000000000002 R09: 0000000000000000
R10: ffffc900034673e0 R11: fffff5200068ce87 R12: 0000000000000c00
R13: ffff8880314b0fc8 R14: ffff888144371a08 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125af0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffff7d5bdc8 CR3: 000000007291a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 usb_stor_msg_common+0x27c/0x4b0 drivers/usb/storage/transport.c:143
 usb_stor_bulk_transfer_buf+0x151/0x2a0 drivers/usb/storage/transport.c:395
 ene_send_scsi_cmd+0x10d/0x5f0 drivers/usb/storage/ene_ub6250.c:502
 ene_get_card_type drivers/usb/storage/ene_ub6250.c:1843 [inline]
 ene_init+0x14f/0x380 drivers/usb/storage/ene_ub6250.c:2197
 ene_transport+0x39b6/0x4660 drivers/usb/storage/ene_ub6250.c:2310
 usb_stor_invoke_transport+0x10a/0x19c0 drivers/usb/storage/transport.c:611
 usb_stor_control_thread+0x450/0x8e0 drivers/usb/storage/usb.c:462
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x599/0xb30 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
----------------
Code disassembly (best guess):
   0:	89 f0                	mov    %esi,%eax
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 87 b4 1f fb       	call   0xfb1fb49c
  15:	49 83 3e 00          	cmpq   $0x0,(%r14)
  19:	74 40                	je     0x5b
  1b:	e8 fc 5f b9 fa       	call   0xfab9601c
  20:	48 8d 3d 15 c4 c7 08 	lea    0x8c7c415(%rip),%rdi        # 0x8c7c43c
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  34:	eb 11                	jmp    0x47
  36:	e8 e1 5f b9 fa       	call   0xfab9601c
  3b:	eb 05                	jmp    0x42
  3d:	e8                   	.byte 0xe8
  3e:	da                   	.byte 0xda
  3f:	5f                   	pop    %rdi


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

