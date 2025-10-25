Return-Path: <linux-usb+bounces-29642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A448C08D60
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 09:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD2B3BFB65
	for <lists+linux-usb@lfdr.de>; Sat, 25 Oct 2025 07:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577C92E3B06;
	Sat, 25 Oct 2025 07:30:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A3A2A1BB
	for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761377439; cv=none; b=A5pfn+NxuPqWwCMdO7UprZPBLQQ7SHHLoi8/t6Ocr6WkqvUkQKER3gc8fVthN1tOSzaViXsVZlE7aQCWJlkn/+upy4C4N9p7mvsdzH1ceKVV3l32JqM8j4AMUEudRhjPq/yLY0l6NToIzSPdH7iKpXnQYkKW8E9CNQ/vHsBcYpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761377439; c=relaxed/simple;
	bh=V5DbhJ3p5YS8+9eLZS01P5LRa/zmeVk1OVEyxPRZzl4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=E5m8mU288h0rsD8/DTIK79UfT63TgeCnq6DiD1KtXPv4SKzrlazUxSNSB1fJyrqrvSnwzdSFmeujc0ELTXiUDZbL/CJhV1jOmIicGYKUFcUtnVBWpuqKfXqrXlQQuklvY+qHnlDYatm0rLsMEIxz4PgJ2osDIA+T26o1BgfNN9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-431d999ebe8so82965685ab.1
        for <linux-usb@vger.kernel.org>; Sat, 25 Oct 2025 00:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761377436; x=1761982236;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POFvTDzbXwXj/l9eq54nh96eLr+2+uDRoglNtiSjB/E=;
        b=YPuUL+UoxEXscv/FxVFC63kt5bM7g/K9DkLwKOGw0Savn+SjKsK5Fy3pEvDg+G0KZT
         DD4643CL+YDwfJOxGkwho99InlCI2Qe2U7eKScDMqYwotqrRdb90Blay2Y89Kv39owkU
         Yfmfau/wzfEB8uVI0ozS6GXLp/unUt37JhYuIccMdS8tkgc1n7uNYBaJwRmgPMeeXvb7
         kU/b9Ybgsk0sLQS+NlKAVbjMRcQfWGyB5f/pVZEIT6UbkBEoPoTfOS4UrgFHYjnWkONW
         m65AOBvCbJUo6ttk9eczv6D0x7R6ts3UrR8J19y0x3iczQXqrEqSui5tazg0onjEH5MJ
         /h2g==
X-Forwarded-Encrypted: i=1; AJvYcCXGtjL+juu7mjE6gHOs66FkFV/bKbG65VM7zWyyAH2WJ9OY0k7rR8ueTKs4BnAHLOUWxwKpTmwOj7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqGhbLc2WXILmVLCXla0HvBHN9JBUv8CFGNWPW9lXUD2P6UMsJ
	PJKT2e4nbbTh+aGWzaPC3YxvY5qUCHxE5/wD9YVaAWtjK/+1NRbo5/qjTIJ3Hey8ueVt/GyhQ8V
	xHMzF483wYvQ4VpM5UKphKfO8A8aAkOn/BX0GvfXG/QlkRWrkwt+uTlia5SY=
X-Google-Smtp-Source: AGHT+IHCqHFoXgOB0tUs0J97Ri8/hsEWPqr36q4oCGb93VuLnd5QtoYo9JEFh4WoS5fiTpXJ4s93WoC5OxmJaEeZd4+Xdz0yGsbA
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fca:b0:42f:946f:8eb4 with SMTP id
 e9e14a558f8ab-430c527bca5mr386037055ab.21.1761377436540; Sat, 25 Oct 2025
 00:30:36 -0700 (PDT)
Date: Sat, 25 Oct 2025 00:30:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68fc7c9c.050a0220.346f24.023c.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset (4)
From: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    566771afc7a8 Merge tag 'v6.18-rc2-smb-server-fixes' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13956e7c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8345ce4ce316ca28
dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/52417ef1f782/disk-566771af.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/66730a263bf1/vmlinux-566771af.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1fe0762efb1f/bzImage-566771af.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com

usb 1-1: new full-speed USB device number 6 using dummy_hcd
usb 1-1: unable to read config index 0 descriptor/all
usb 1-1: can't read configurations, error -110
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000008: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000040-0x0000000000000047]
CPU: 1 UID: 0 PID: 5869 Comm: kworker/1:4 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1195
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 3e 6b fb fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 bb 22 5d fb 4d 8b 1e 48 89 df 2e 2e
RSP: 0018:ffffc900051b7260 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888143b54c40 RCX: dffffc0000000000
RDX: ffffc9001a01b000 RSI: 0000000000002b35 RDI: 0000000000002b36
RBP: ffff8880305aa66c R08: ffffffff8ed62877 R09: 1ffffffff1dac50e
R10: dffffc0000000000 R11: fffffbfff1dac50f R12: ffff888143b54c40
R13: 1ffff11004eceaa1 R14: 0000000000000040 R15: 1ffff1102876a987
FS:  0000000000000000(0000) GS:ffff888126efc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fce4efb4f98 CR3: 000000004a02e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 set_link_state+0x80b/0x1220 drivers/usb/gadget/udc/dummy_hcd.c:469
 dummy_hub_control+0xcc0/0x1760 drivers/usb/gadget/udc/dummy_hcd.c:2327
 rh_call_control drivers/usb/core/hcd.c:656 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:821 [inline]
 usb_hcd_submit_urb+0xde9/0x1a80 drivers/usb/core/hcd.c:1542
 usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 set_port_feature drivers/usb/core/hub.c:470 [inline]
 hub_port_reset+0x390/0x1740 drivers/usb/core/hub.c:3082
 hub_port_init+0x2b0/0x2800 drivers/usb/core/hub.c:4938
 hub_port_connect drivers/usb/core/hub.c:5495 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2532/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:usb_gadget_udc_reset+0x27/0x60 drivers/usb/gadget/udc/core.c:1195
Code: 90 90 90 f3 0f 1e fa 41 56 53 49 89 f6 48 89 fb e8 3e 6b fb fa 49 83 c6 40 4c 89 f0 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <80> 3c 08 00 74 08 4c 89 f7 e8 bb 22 5d fb 4d 8b 1e 48 89 df 2e 2e
RSP: 0018:ffffc900051b7260 EFLAGS: 00010202
RAX: 0000000000000008 RBX: ffff888143b54c40 RCX: dffffc0000000000
RDX: ffffc9001a01b000 RSI: 0000000000002b35 RDI: 0000000000002b36
RBP: ffff8880305aa66c R08: ffffffff8ed62877 R09: 1ffffffff1dac50e
R10: dffffc0000000000 R11: fffffbfff1dac50f R12: ffff888143b54c40
R13: 1ffff11004eceaa1 R14: 0000000000000040 R15: 1ffff1102876a987
FS:  0000000000000000(0000) GS:ffff888126efc000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fce4efb4f98 CR3: 000000004a02e000 CR4: 00000000003526f0
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
  10:	e8 3e 6b fb fa       	call   0xfafb6b53
  15:	49 83 c6 40          	add    $0x40,%r14
  19:	4c 89 f0             	mov    %r14,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1) <-- trapping instruction
  2e:	74 08                	je     0x38
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 bb 22 5d fb       	call   0xfb5d22f3
  38:	4d 8b 1e             	mov    (%r14),%r11
  3b:	48 89 df             	mov    %rbx,%rdi
  3e:	2e                   	cs
  3f:	2e                   	cs


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

