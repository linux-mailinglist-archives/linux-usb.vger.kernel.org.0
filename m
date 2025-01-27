Return-Path: <linux-usb+bounces-19775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA2A1D002
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 05:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE4163A328E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 04:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9680515ADB4;
	Mon, 27 Jan 2025 04:10:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DF52907
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737951025; cv=none; b=HMnE+Pni9QKvyoyT06fIG1/SZHFKthUgqa1xqviimNud41jMHjZu733cgWbyfnzI3Sn3Q8geMXBi1eHRFY0BKr/i8CqfDm5EEvaaamA4mIHn6P2jw0Aj44bbAEpf+jy++BYcHhbUtm5R5+hTmz7U4vEobV1S+Iku5SoVnclUq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737951025; c=relaxed/simple;
	bh=tvowdBYllhxlr7bcKuPf6wZ+og6lO0LSb117DERmiAA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kR++hq3NGHCDjNsZFSLuw6jUvQkafDxEWR9mw3vE7lJFAjqRN4DtW1I55jhEEXQjBPTSgbD3kYHG6sCBQkRvc51Uxny7PpRYpsL0rfDTGEpyMoDcp/2AnwRTjfGBA00jLM9A+jYkQ/lTsZ3W+lpB3tTT3HlMX2l8Lge+0ooo9FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3cfba354f79so77014635ab.1
        for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 20:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737951022; x=1738555822;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6JbXUUjleEukDFreMaAs+FMdGEmOjaLEc3hpcCvnio=;
        b=Y7KCF8ZaxknDjpRFjov5/e9PGDQNemr/qckp7nOi/sIrlhRzwK0F7y/79Su4za6xgM
         6hjxCDsTVhVbjMqiJYBgwfhILQOyYA+dF7hh4zhmzV7WbXpNlCqQSF+v8YG4xUE0LnKI
         4lbCa/xhAuceJb9hQll5pt2TLN9p5TvI6qG+TTZ7sqIbi3w6ojg88elyIcvMSrCzmQEH
         vzKEDNrArDD9Ka6EM9tgU7GKCC8O5lt6FNH0q9TzVyc4Q3e7DNRfYNpO3MIxdjX1Ph+c
         yuW3pT7VrmOfYBRsQ+VN0131a1jS/ZV5HBVuWikqk18q5FPZI56Ye7I9CIqzJUVACX30
         zxEg==
X-Forwarded-Encrypted: i=1; AJvYcCVLGCS59t4FzmFc+yiuFweeYVDIrHYz4cIMN1eGqMVziIlpivrxV5uSNdw5oU8pBDlkOpERyyxthDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIJGNAGl0ciDpM0nk99SUb+6B10nB19ZHgkiLan40xPtnFIGpm
	LU9D8d4t8GOOM9ZKlp89Ub9q/uPZaETxMGAE0WaoEh/mwllpOYO8+pEIkCy3d/a5x5FGcMfg4OW
	i6nfy6YgO6NFfD4xcgtlNOua3kjgblmdbQwgtRzcip5ZeG1A66K6nykE=
X-Google-Smtp-Source: AGHT+IFVR9qjNhDRhsOVVf0VzvDNOHWR68NyUG3q85MIfrGcYotYeL5OplxvRG00xm9YPFsTMqqvU5Zc/Wd8lMqAmPeXuYVOiHY6
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:160b:b0:3cf:b3ee:59e8 with SMTP id
 e9e14a558f8ab-3cfb3ee5b5cmr176740045ab.7.1737951022723; Sun, 26 Jan 2025
 20:10:22 -0800 (PST)
Date: Sun, 26 Jan 2025 20:10:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6797072e.050a0220.2eae65.003f.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: stack-out-of-bounds Read in usb_check_int_endpoints
From: syzbot <syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    21266b8df522 Merge tag 'AT_EXECVE_CHECK-v6.14-rc1' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14bd9c24580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f9e008bfc27b14db
dashboard link: https://syzkaller.appspot.com/bug?extid=9c9179ac46169c56c1ad
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5249b29d55f2/disk-21266b8d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8413507597a1/vmlinux-21266b8d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9c84998b8cfb/bzImage-21266b8d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com

hid-thrustmaster 0003:044F:B65D.0004: hidraw0: USB HID v0.00 Device [HID 044f:b65d] on usb-dummy_hcd.2-1/input0
==================================================================
BUG: KASAN: stack-out-of-bounds in usb_check_int_endpoints+0x1fe/0x280 drivers/usb/core/usb.c:277
Read of size 1 at addr ffffc9000213e831 by task kworker/1:1/80

CPU: 1 UID: 0 PID: 80 Comm: kworker/1:1 Not tainted 6.13.0-syzkaller-04858-g21266b8df522 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 usb_check_int_endpoints+0x1fe/0x280 drivers/usb/core/usb.c:277
 thrustmaster_interrupts drivers/hid/hid-thrustmaster.c:176 [inline]
 thrustmaster_probe+0x47d/0xcb0 drivers/hid/hid-thrustmaster.c:347
 __hid_device_probe drivers/hid/hid-core.c:2713 [inline]
 hid_device_probe+0x3bf/0x710 drivers/hid/hid-core.c:2750
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 hid_add_device+0x3b6/0x520 drivers/hid/hid-core.c:2896
 usbhid_probe+0xb52/0xec0 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x641/0xbb0 drivers/usb/core/driver.c:396
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:291
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2651
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

The buggy address belongs to stack of task kworker/1:1/80
 and is located at offset 49 in frame:
 thrustmaster_probe+0x0/0xcb0

This frame has 2 objects:
 [32, 36) 'trans.i'
 [48, 49) 'ep_addr.i'

The buggy address belongs to the virtual mapping at
 [ffffc90002138000, ffffc90002141000) created by:
 copy_process+0x5d1/0x3d50 kernel/fork.c:2221

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1fa96
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 0000000000000000 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x2dc2(GFP_KERNEL|__GFP_HIGHMEM|__GFP_NOWARN|__GFP_ZERO), pid 51, tgid 51 (kworker/u8:3), ts 3826283846, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x292/0x710 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0x3e1/0x780 mm/mempolicy.c:2269
 vm_area_alloc_pages mm/vmalloc.c:3591 [inline]
 __vmalloc_area_node mm/vmalloc.c:3669 [inline]
 __vmalloc_node_range_noprof+0x9c9/0x1380 mm/vmalloc.c:3846
 alloc_thread_stack_node kernel/fork.c:314 [inline]
 dup_task_struct+0x444/0x8c0 kernel/fork.c:1116
 copy_process+0x5d1/0x3d50 kernel/fork.c:2221
 kernel_clone+0x226/0x8e0 kernel/fork.c:2803
 user_mode_thread+0x132/0x1a0 kernel/fork.c:2881
 call_usermodehelper_exec_work+0x5c/0x230 kernel/umh.c:171
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
page_owner free stack trace missing

Memory state around the buggy address:
 ffffc9000213e700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000213e780: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffc9000213e800: f1 f1 f1 f1 04 f2 01 f3 00 00 00 00 00 00 00 00
                                     ^
 ffffc9000213e880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffc9000213e900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================


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

