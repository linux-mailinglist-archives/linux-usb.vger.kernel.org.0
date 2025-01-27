Return-Path: <linux-usb+bounces-19776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3098A1D1D5
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 08:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 085413A2D74
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 07:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024371FCCE2;
	Mon, 27 Jan 2025 07:58:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162CD172BD5
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964701; cv=none; b=mmOXKZ/jB16Tgx4RbXggRGNkJHt7BdkVO2L4aGfmiakGDcDLDW/lDLrFpnSsuvEJRoxE2MYRvrYgsDo2FamwnM4im5usl5FJUlM5JpRZSRt9mYbIUzk86uKPkkMH16xaX+UOh3bx0XouRt+hh2ZtuZOQESNRQIK9aRgdXJVVcZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964701; c=relaxed/simple;
	bh=VTTrmb1Ccp6o9yZuH6QuIztt1pHMgY/gGeyhaewGLcU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ez2ffK8AAU9nSzEyO7LIBYp6voBQeYl1KwEggJ6lJ2h5OKRnhS53aJRDiFJhKKTkar5pxSsvrMoi6SjMgKF/cOtwLf9NqXiENjvSnvNQDZPhAcMcovuM59amdQ9slWavdbBzu3DJhmj3hoI7tADGb4uiFkc183xuPr04XM8XVck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3cfc0ed3040so60366105ab.3
        for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 23:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737964699; x=1738569499;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cyiRBv18VPTg+PxAD1DhyVAWrWINQdEWtb3Bn3ht58Q=;
        b=HwIquB0Ps02ENWrfww8QIPAf9nvAS0TnVJjIteBnLHOqgq3wa/dxPNtnGFiGuH1/Gx
         QyJg7mMujFgvVJJBtzi8LpQxElHtMx/OX6styU+x4S4y1z3o7tqseJiOxQec0KDpgsx8
         VfTn+Z1C9PeFAFDcIPwqxZ3yphI9f25K2kV7DkVeF55+hO85D1Ls5JMv+29+UXYMeprZ
         Unio84a6s466YGzL1vRSTeYqT4uIb9oq9WND1hQmAroaLB9+bNjyf4Wo6TpQU68fOgY7
         AfAvPHXZbAfl2Z6D+tzSwpsh+is541iPJ/BDby9CB8CD+GYZzblelv4RqHvOy7cb6ojr
         l/VA==
X-Forwarded-Encrypted: i=1; AJvYcCXBrqgVYROXd+GfF90xzkeCQes8Za80G1g6bzdFSHgSHFXrCHtpyHtNIHYsgJzRYvSSBgUGXkXgWgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpHoK9+1mMO2eDvd+ho7gZsIJ1uKdPq1rWrN/gbLlOSngllvy8
	1oawXofhYH0m/8mpV7KxWN5SdSE288VQ6fjZJnVN1CUuTjUP1vk37hptQAfjLao6s2Qu63pu8yD
	iKFac1x0ATXvc/vgbIw4IEIOkhlS6rgFho7NfWVX8fuF/J9BSihHgEt8=
X-Google-Smtp-Source: AGHT+IHeV6gbjM853ghf+O99RZV5dFYaZmH8JbVKPf8AZyjPArCsauDkXB+iuFcjHffR5lz9uECZJc9Q6AJhrKFdoQunjWi3iDF2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1949:b0:3cf:bc71:94f9 with SMTP id
 e9e14a558f8ab-3cfbc719541mr130824095ab.20.1737964699320; Sun, 26 Jan 2025
 23:58:19 -0800 (PST)
Date: Sun, 26 Jan 2025 23:58:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67973c9b.050a0220.2eae65.0042.GAE@google.com>
Subject: [syzbot] [mm?] WARNING: ODEBUG bug in free_unref_page
From: syzbot <syzbot+5436ca1cdd0d80367019@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    70cd0576aa39 usb: hcd: Bump local buffer size in rh_string()
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=12323618580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8e4b3bd94cc7cf2d
dashboard link: https://syzkaller.appspot.com/bug?extid=5436ca1cdd0d80367019
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/612846dc004d/disk-70cd0576.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2adbdc698bbb/vmlinux-70cd0576.xz
kernel image: https://storage.googleapis.com/syzbot-assets/111a4615d3e0/bzImage-70cd0576.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5436ca1cdd0d80367019@syzkaller.appspotmail.com

------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff888130e20030 object type: work_struct hint: cfg80211_rfkill_block_work+0x0/0x30 net/wireless/core.c:316
WARNING: CPU: 1 PID: 22030 at lib/debugobjects.c:612 debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Modules linked in:
CPU: 1 UID: 0 PID: 22030 Comm: kworker/1:5 Not tainted 6.13.0-rc7-syzkaller-g70cd0576aa39 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 54 48 8b 14 dd 40 45 47 87 41 56 4c 89 e6 48 c7 c7 c0 39 47 87 e8 af b1 c0 fe 90 <0f> 0b 90 90 58 83 05 06 73 f7 07 01 48 83 c4 18 5b 5d 41 5c 41 5d
RSP: 0018:ffffc9000243f468 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000003 RCX: ffffc90010538000
RDX: 0000000000100000 RSI: ffffffff811f6866 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 00000000012c1108 R12: ffffffff87474060
R13: ffffffff87272fe0 R14: ffffffff86911680 R15: ffffc9000243f578
FS:  0000000000000000(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f11ff14b440 CR3: 0000000008ca0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x4b7/0x600 lib/debugobjects.c:1129
 free_pages_prepare mm/page_alloc.c:1134 [inline]
 free_unref_page+0x228/0xe40 mm/page_alloc.c:2659
 __folio_put+0x1e8/0x2d0 mm/swap.c:112
 device_release+0xa1/0x240 drivers/base/core.c:2567
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1e4/0x5a0 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3773
 rtl8187_disconnect+0x117/0x150 drivers/net/wireless/realtek/rtl818x/rtl8187/dev.c:1678
 usb_unbind_interface+0x1e2/0x960 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2305
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5905
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

