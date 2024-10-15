Return-Path: <linux-usb+bounces-16243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE399F0A6
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 17:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C43E31C20963
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 15:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598EC1CBA09;
	Tue, 15 Oct 2024 15:06:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805AE1CB9E4
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729004797; cv=none; b=GnlugR5PfB/EaiRgrec1K1QiibRgDVh9mk246UTN2nLy6XQ0egKQcuU3msknrnG5wDsMhauwNDIGdKgzQ45CrsyliVLOWmUcKHNZlOIJYAbrSaTZzuOjvioZgOC6W76j3a/1ZMLY1w41ugqGOEch1BXRQODigZugNgydZHhCXuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729004797; c=relaxed/simple;
	bh=b9zVKdALyR6FWRIF6AKtu09YPYWfPIVFFqBz4fku8Yc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kDL8/q5MnFICFtvV9WxfM2oRcLje3w/aFoit8Yvqrb3hhXFa+IDNO2Jl3/z/9Rr/lk8/4+gxyVT0vicFmmoGI7CfzpDCN1iEip6Qjgc6YWHZFJuR0ozar7v53rFwLTUy2tdP6Pgq6NXyPbpddVJTTEKzPxNourPa+cJFG6yX0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3bea901ffso46202285ab.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 08:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729004793; x=1729609593;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gydL3BY4I0CKdYtAxwRQGGcBCrph7RK9zLofddZFDME=;
        b=EA3gEClB3rP7i8zFQnqWOmIwP0FblNLZK5OW392u74d9ofOS89D04DzgTHemxvtI6A
         VjJfZH1z0xMgxyqzQ2f3q2D++9GB6OtxV3r7EUGgXti6FSTkQnhGXOYCFjpBhZ+SinPD
         1atz0ruAj35xrbrngarWiSw7yBloKmDmPU9cDIwFbCw5AARWZ/XJPc2Fqg7lp/qZA1kH
         TA0T88SJG019idlb1NGqGAHe6r8TwZvQmAvLvDZxyRotf1NtYFu6KKqDxwKJr1RBIaJ5
         wQXlbvTp1NEjBmzHVOcJfzpSgdKwIRawLOMZebYaA0QrPcccQWvBKzhPsadaWw8VyRY8
         YInw==
X-Forwarded-Encrypted: i=1; AJvYcCV+4bPDV2hd7kcZShVNowSWyfvFYXD2rNMZ4eK3aa2bhSndx7I4j+kNWqHk7DBGpd1oMWJ6AHKHKzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HfpEyH2S1J683jY++j/q/7Lx64fCjmMKVTBgc6XwMmIQkBGu
	fDrLnHtmX4ah5VZZzGkUhEROw59E32E98bAD3G8iTCspqnpeFaj0858jGTVrawTxOWJrCt51nPH
	DHQm3aYwzceVpUB05hPR3fSOUPx+zE9RPbuEvIEZ7qmkujF8uU5FMJ6g=
X-Google-Smtp-Source: AGHT+IHhTzZNijy5n5VZt2U5pWpwZHIW5JojnZ+4VyClCEylWpYHdSdJJxxOiHTqjpok1/r2A7uBppatDi8LNSpyx3caccQRYVBe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c88:b0:3a2:aed1:1285 with SMTP id
 e9e14a558f8ab-3a3bccade28mr106527975ab.0.1729004793376; Tue, 15 Oct 2024
 08:06:33 -0700 (PDT)
Date: Tue, 15 Oct 2024 08:06:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670e84f9.050a0220.d5849.0008.GAE@google.com>
Subject: [syzbot] [mm?] WARNING: ODEBUG bug in __folio_put (2)
From: syzbot <syzbot+0f138d82bfc86d146253@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d73dc7b182be USB: chaoskey: Fix possible deadlock chaoskey..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15e94727980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
dashboard link: https://syzkaller.appspot.com/bug?extid=0f138d82bfc86d146253
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e94727980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1f9e1e81549a/disk-d73dc7b1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5360843a122/vmlinux-d73dc7b1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3476aef56fd6/bzImage-d73dc7b1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0f138d82bfc86d146253@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff888131d037c8 object type: timer_list hint: rtl_ips_nic_off_wq_callback+0x0/0x680 drivers/net/wireless/realtek/rtlwifi/ps.c:283
WARNING: CPU: 1 PID: 36 at lib/debugobjects.c:514 debug_print_object+0x1a3/0x2b0 lib/debugobjects.c:514
Modules linked in:
CPU: 1 UID: 0 PID: 36 Comm: kworker/1:1 Not tainted 6.12.0-rc1-syzkaller-00028-gd73dc7b182be #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: usb_hub_wq hub_event

RIP: 0010:debug_print_object+0x1a3/0x2b0 lib/debugobjects.c:514
Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 54 48 8b 14 dd c0 fc 46 87 41 56 4c 89 e6 48 c7 c7 20 f0 46 87 e8 2e d5 c3 fe 90 <0f> 0b 90 90 58 83 05 ad 76 ff 07 01 48 83 c4 18 5b 5d 41 5c 41 5d
RSP: 0000:ffffc90000267418 EFLAGS: 00010282

RAX: 0000000000000000 RBX: 0000000000000003 RCX: ffffffff811ab159
RDX: ffff888102ad57c0 RSI: ffffffff811ab166 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffffffff8746f6c0
R13: ffffffff872a8e00 R14: ffffffff840306a0 R15: ffffc90000267528
FS:  0000000000000000(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d8de234978 CR3: 0000000008ca0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:989 [inline]
 debug_check_no_obj_freed+0x4b8/0x600 lib/debugobjects.c:1019
 free_pages_prepare mm/page_alloc.c:1115 [inline]
 __free_pages_ok+0x244/0xa20 mm/page_alloc.c:1250
 __folio_put+0x1cd/0x250 mm/swap.c:126
 device_release+0xa1/0x240 drivers/base/core.c:2575
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3783
 rtl_usb_disconnect+0x41c/0x5a0 drivers/net/wireless/realtek/rtlwifi/usb.c:1079
 usb_unbind_interface+0x1e8/0x970 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
 device_del+0x396/0x9f0 drivers/base/core.c:3864
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903


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

