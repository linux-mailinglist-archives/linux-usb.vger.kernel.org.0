Return-Path: <linux-usb+bounces-19547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B227AA173FB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 22:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC143A2425
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 21:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34601EF082;
	Mon, 20 Jan 2025 21:12:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9EA19882F
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737407545; cv=none; b=fC2lpu8nY5IclUb3eAaeE4qk9twbV1dcDJfm7cDZx/+K+4OTD/md/Y44lW2N3x7CHA5O+DxRzodzgf5LI0cyOaPbg/0CEhXpVM6+qHoxKX1Fqg/H1S/gJrXhlT7QMZ7DMAZ7yg5RVr24aWv2jovyMSZWasoM6QCDedwpa01I5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737407545; c=relaxed/simple;
	bh=P1Ba1rcD0Nc4oilTFAtHhmWKWEDPBnaAN9C3zjtenps=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=d4YTUztT1uilMmGZiOVhDcaCpD2iBCp4mIOJbFHlayRimcR/ey9X+kZjPZHe3QcN//pubRhu2yl9CoAD7Z475RjW5eqhD014nkCkS+Mxj2Mh1ZHQUA6YvtnsiEPFFk5dqIUw+S4QCVFEMs0tpvcMOSvRvIWl+c6tX41DY4h04y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3a7e4bfae54so37596345ab.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 13:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737407543; x=1738012343;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2f9MBw0BrU0HAHs2d59ovPdDH3GAqQCYo8W/BYALYc=;
        b=eUUVtvmZ89Qlv+jx2mzAAC/Yib21h+aSF59t/lLSed0BRPLkK3GF5rLjyDVHn0D5Zt
         DkCdrWRUxDITfh+zft55HWdrYootYDhNZqvOhVamhoxqwB0nCBFOlbYW/0darcM8vu6y
         OKr13z+p9rK1LGPwF61wQ7jpakvoyri+3H8Vsvfhi/MXoQ/xi6fRalaYPEVOXue2koZr
         1kIbsFBU7cSxIBmdFkSKf+gUh4iCFWiByT0R0wCL1lEQTHSs9/F1Z+Mgy5LIyfd2ePic
         henPuDua7PQRMd1qN6Ji+y60NaWgXOfH2K72kmXEIBoBfCBPXMn7HOLX98GCoKHyq139
         DzdA==
X-Forwarded-Encrypted: i=1; AJvYcCUnA8yRnkFjsrsVevEglkPLyr17A9aPiOIlsxxrJ4TXD7pK9YOT6SIXfxfWFJAHcjbfkqLGnB+aSZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4rNZZnX2sw0eMwzxL8MxGtXxTRA5aO5bo2pHUyROjTQJ6eORM
	YfpM6JWz9+pO//TD3STRnLwpvEzktjD54VP6FLQYtXWRVPIB+/98UMOaWX7Pn4FD/ahzXBHsqny
	cbyR4D6jUxzD+99qEvMM3VcPBIwJEvaHljyC03eLHtuEnDstGenpliJE=
X-Google-Smtp-Source: AGHT+IGsd5mwdR0emO6VFTEq7pQ/GJ76f1fme2ovP7SDAfF+dErqevQi+SHBALXKsr4iktwSIJNi+5sZLmglqpKuh0DMJ6b9CLOI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d11:b0:3ce:6a31:141e with SMTP id
 e9e14a558f8ab-3cf743eb91dmr97669475ab.9.1737407542972; Mon, 20 Jan 2025
 13:12:22 -0800 (PST)
Date: Mon, 20 Jan 2025 13:12:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678ebc36.050a0220.15cac.0000.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in really_probe
From: syzbot <syzbot+da9bd8f1214e41d185a7@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ba39e420c0e9 usb: quirks: Add NO_LPM quirk for TOSHIBA Tra..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=102c5a18580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8e4b3bd94cc7cf2d
dashboard link: https://syzkaller.appspot.com/bug?extid=da9bd8f1214e41d185a7
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/265a56250bdd/disk-ba39e420.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d32373296f78/vmlinux-ba39e420.xz
kernel image: https://storage.googleapis.com/syzbot-assets/36171e097d69/bzImage-ba39e420.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+da9bd8f1214e41d185a7@syzkaller.appspotmail.com

option 4-1:0.85: GSM modem (1-port) converter detected
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 0 PID: 5252 at kernel/locking/mutex.c:564 __mutex_lock_common kernel/locking/mutex.c:564 [inline]
WARNING: CPU: 0 PID: 5252 at kernel/locking/mutex.c:564 __mutex_lock+0x369/0xa60 kernel/locking/mutex.c:735
Modules linked in:
CPU: 0 UID: 0 PID: 5252 Comm: kworker/0:4 Not tainted 6.13.0-rc7-syzkaller-gba39e420c0e9 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:564 [inline]
RIP: 0010:__mutex_lock+0x369/0xa60 kernel/locking/mutex.c:735
Code: d0 7c 08 84 d2 0f 85 6d 06 00 00 8b 0d 40 b1 63 03 85 c9 75 19 90 48 c7 c6 40 ea 27 87 48 c7 c7 a0 e8 27 87 e8 58 ef 2c fa 90 <0f> 0b 90 90 90 e9 f2 fd ff ff 4c 8d b5 60 ff ff ff 48 89 df 4c 89
RSP: 0018:ffffc9000202eeb0 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff88811986c518 RCX: ffffc90011138000
RDX: 0000000000100000 RSI: ffffffff811f6866 RDI: 0000000000000001
RBP: ffffc9000202eff0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: dffffc0000000000
R13: 0000000000000002 R14: 0000000000000000 R15: ffffc9000202ef30
FS:  0000000000000000(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33d1fffc CR3: 0000000118308000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 device_add+0x114b/0x1a70 drivers/base/core.c:3665
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:459
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:534
 usb_new_device+0xd09/0x1a20 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5523 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

