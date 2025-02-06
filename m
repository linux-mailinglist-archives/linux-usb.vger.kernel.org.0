Return-Path: <linux-usb+bounces-20221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE565A2A708
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 12:11:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60DC81696FD
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 11:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B61322E419;
	Thu,  6 Feb 2025 11:09:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661ED229B1C
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 11:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840165; cv=none; b=JE1+JqW+LwhfQjqWTJhdgkeyNNyJTDR6A/t8eNCjlKdWqHTAPctaxDopsIkhN/YF2QTwESVOdSj/jIswcxU+YQeQ5Zpm+3vE73P3AdM4kCaDF1mCuaoPixn7WXxW3vB3/iulJBaQwxlpilajoSzDE+/sQQ6J1/Nb5PcA56jsN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840165; c=relaxed/simple;
	bh=vcfKG+vEJ3y5hmH6jHCDKN3J62/zu+ijfYpaJl5qCdY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=tMeIpeEleEtfoc/+aJPKo8PcoYn5VBChQ7A302AaH0MKq9QZ3oEo0IAcFtrGb3qKkvRwDDHWrYcQRlm8v7IercN6IJfz9bN1yhkHQjvwxwLNm9mjohiE0bYSlX/lf4yVaQb2nSDsVXfcdjjDlm9Uxo4KYxxaAr7oX98qVp55mE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d04f20f2baso13578565ab.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Feb 2025 03:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738840162; x=1739444962;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUKthrRxk2aIdQt7vBtKYmsuH2URcZs1ZCCrTN32LMA=;
        b=dqMcUGh88uThCPQYblEHM9vKOi1wFIOocuf4x9epdWsIkR19e3qFRzBXOVQ3iOSb5K
         GT9/Li/s2uqe5OnLWGL2ZRPYdgMfxpTCEb3ZqrYdb3VCqxHJIPg+o6LfYkIVFo3znQvq
         5oJQV91hTacAWbfjmGPZAJcUHN3TfUYQA4APv+LlPLrZL/SqidlI2WTMBz1+F56hfI1i
         M7sNmqx0vyP4nkbYZxCzenwj2G5ZKX+V62NRGLK3oxgSfEPM+2PKVT8Qsv96eNhZwrNO
         LBxVZVnjoJdU53Mboim17HtdFwWFzbSfgSAm75KP0VwwzpTih81w0tB9Ptjx28HDQgBA
         sgUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ11sx4DdM03NtB10hI1pfXJNKebNEr8bQmOqb0zEQ1lQEoek+RPOZdCc/r0cOs/7IIGBtOS+MspA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvavvzk24I6SZQAlOekttK6eSTkurYCWYe09oAwCYCXzy+Ld0
	RPsynTBE5TavssOy+if6/FyUKs1z4zvbcss9Xf7B+KnWVBe4x/GHpYWBU3Ae59l2OZk0p99jULt
	QKyWlfcKcX+Tzko8XXQyzjTjs2+DoqH3o8jBTt10otC8jp8zikl7Bm7g=
X-Google-Smtp-Source: AGHT+IE3dHwcKA5EU01E8s7Rj3A4T38XhUnhIAmHPeYSnTTrSxn/8HcRlZh4ivvB23d815Xu4JNblZqXU+IOzqFCNZE56/MvST6R
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:184b:b0:3d0:e6c:e9c5 with SMTP id
 e9e14a558f8ab-3d04f937d0fmr69276535ab.21.1738840162456; Thu, 06 Feb 2025
 03:09:22 -0800 (PST)
Date: Thu, 06 Feb 2025 03:09:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a49862.050a0220.264083.0000.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in cxacru_cm/usb_submit_urb (2)
From: syzbot <syzbot+ccbbc229a024fa3e13b5@syzkaller.appspotmail.com>
To: accessrunner-general@lists.sourceforge.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    69e858e0b8b2 Merge tag 'uml-for-linus-6.14-rc1' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11851724580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d033b14aeef39158
dashboard link: https://syzkaller.appspot.com/bug?extid=ccbbc229a024fa3e13b5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=156903df980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13bc35f8580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-69e858e0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a53b888c1f3f/vmlinux-69e858e0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6b5e17edafc0/bzImage-69e858e0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ccbbc229a024fa3e13b5@syzkaller.appspotmail.com

usb 5-1: Product: syz
usb 5-1: Manufacturer: syz
usb 5-1: SerialNumber: syz
------------[ cut here ]------------
usb 5-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 1378 at drivers/usb/core/urb.c:504 usb_submit_urb+0xc4e/0x18c0 drivers/usb/core/urb.c:503
Modules linked in:
CPU: 0 UID: 0 PID: 1378 Comm: kworker/0:3 Not tainted 6.13.0-syzkaller-09760-g69e858e0b8b2 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xc4e/0x18c0 drivers/usb/core/urb.c:503
Code: f8 48 c1 e8 03 0f b6 04 18 84 c0 0f 85 b1 08 00 00 45 8b 07 48 c7 c7 20 63 b0 8c 48 8b 34 24 4c 89 e2 89 e9 e8 c3 a9 16 fa 90 <0f> 0b 90 90 48 8b 5c 24 30 41 89 dc 4c 89 e7 48 c7 c6 70 67 5a 8f
RSP: 0018:ffffc90002b8e7e8 EFLAGS: 00010246
RAX: af92b080481b1000 RBX: dffffc0000000000 RCX: ffff888034752440
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000003 R08: ffffffff818027c2 R09: 1ffff11003f8519a
R10: dffffc0000000000 R11: ffffed1003f8519b R12: ffff8880369aab40
R13: ffff8880368e2d00 R14: 0000000000000000 R15: ffffffff8cb0610c
FS:  0000000000000000(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055559475cca8 CR3: 0000000040ff8000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 cxacru_cm+0x3c8/0xe50 drivers/usb/atm/cxacru.c:649
 cxacru_card_status drivers/usb/atm/cxacru.c:760 [inline]
 cxacru_bind+0xcf9/0x1150 drivers/usb/atm/cxacru.c:1223
 usbatm_usb_probe+0x314/0x1d30 drivers/usb/atm/usbatm.c:1058
 cxacru_usb_probe+0x184/0x220 drivers/usb/atm/cxacru.c:1377
 usb_probe_interface+0x641/0xbb0 drivers/usb/core/driver.c:396
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:537
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:250
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:291
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:462
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:537
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5523 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x2d6d/0x5150 drivers/usb/core/hub.c:5905
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


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

