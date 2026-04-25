Return-Path: <linux-usb+bounces-36476-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EMbL0Ej7GlgUwAAu9opvQ
	(envelope-from <linux-usb+bounces-36476-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 04:13:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B142E464BAA
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 04:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21330300C57F
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2026 02:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6137C25A642;
	Sat, 25 Apr 2026 02:12:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549015A86D
	for <linux-usb@vger.kernel.org>; Sat, 25 Apr 2026 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777083169; cv=none; b=t2QUE5BB03yMFQiKIZ729Q81iCL741TJpluwdbatFbIoGkVzWzzk3OhLGl+lwILZ+t3Tm3Fu5lW4eAgk6AkDClwTlcmXkGmW/A+a/rd1qBGI6lflp7pK2aHZJLswHJOkdTRFgWDe+heOw2wVPSbfmHyVl71PKDzwzl48rS/h1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777083169; c=relaxed/simple;
	bh=IWgMe8s+AQbWmaFMfl/7KXrDy9bHO8MO2AXEI5Xd1EM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=U6P5puWMlG1GG1u7eHUlk0VI5/zCFwsajozG0hinmhBIMaPeCGG1wJdWQLcWXinygUJeIpW01g4X1TTTc0WqB6VO0ECDTk/stPXiJJo1JK1czXA5gNZOu1BhG/ztw1WOKgkzBKgy2Fv6K4+ZztNVF9JFn47Ft7OA2E3/XIlXDe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-696233b2816so3097472eaf.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2026 19:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777083162; x=1777687962;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rr2IepSP1DGPLr9difMNhjzKyF9Yh6uHOKDzF138jpk=;
        b=NeHkttMNcZODf2cmhw2RHX+MXEIrqGUOqs7p4R9MWzsdyMUOaQYsjJ36fzAtMMyvZ3
         mcGiK6/q3lyT+MlCEWyCXwN+XCto4ZSMXwaf8OxvjJNOV4a8ZBFoTlXFIZWSi9wky7So
         dnya27bSjxRaWBqOmdYTawqJ0CZIHSvRczqNIhKQ0qW7bZun3uwo8nWpxikuLykNkVV3
         Lw2nFGXLjh5e6OGxofDipaOMzvWOFJ3GnokRyCFTvulgF/DPHG9BJuVeeN7xJ6TdzpH5
         lXnplLNpEY2U+MbuvoO/xXSGPr0ScF9Z/Se5xPOuCJVyuGkDf8GtE2SlUJXw9ebZPl6c
         GW1w==
X-Forwarded-Encrypted: i=1; AFNElJ8C3SrSB3OAJxAFiuOlM4d1bCmiGIjrwkg/z8FxDjMqOFRIABHS3h6Yvi7tIKgXegoOoWbU8WaC4Vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynQE+BShSb34kVOscHq6glxg5SI4eyrGsuT8RKYgDht3J80/Xt
	2Wf0TQK2ZWhod9DMgpnRNbHYJABKdzXQCQkbhB8nYglOPgc2tUYMwJxqCXuxU0KQ0MwXb8mOFZb
	ybMU5+qUq/Su7jiW6RqhwBe9VfXzjGU2VXQLyfHbX7In7Xnxe5b84MUtx7hs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b0b:b0:67d:ea53:b9c8 with SMTP id
 006d021491bc7-69462e62450mr20912089eaf.18.1777083162786; Fri, 24 Apr 2026
 19:12:42 -0700 (PDT)
Date: Fri, 24 Apr 2026 19:12:42 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ec231a.a00a0220.7773.000c.GAE@google.com>
Subject: [syzbot] [usb?] memory leak in hub_event (4)
From: syzbot <syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B142E464BAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=ac5083db84233db3];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36476-lists,linux-usb=lfdr.de,2afd7e71155c7e241560];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email]

Hello,

syzbot found the following issue on:

HEAD commit:    dd6c438c3e64 Merge tag 'vfs-7.1-rc1.fixes' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15cf7702580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ac5083db84233db3
dashboard link: https://syzkaller.appspot.com/bug?extid=2afd7e71155c7e241560
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13cf7702580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17941c36580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dea6ab846ab3/disk-dd6c438c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/acebe380aa03/vmlinux-dd6c438c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2cdbd012d0d3/bzImage-dd6c438c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881277dc000 (size 2048):
  comm "kworker/0:2", pid 1783, jiffies 4294946784
  hex dump (first 32 bytes):
    ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
    00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00  ................
  backtrace (crc 20105372):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __kmalloc_cache_noprof+0x371/0x480 mm/slub.c:5410
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    usb_alloc_dev+0x36/0x4e0 drivers/usb/core/usb.c:651
    hub_port_connect drivers/usb/core/hub.c:5470 [inline]
    hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
    port_event drivers/usb/core/hub.c:5871 [inline]
    hub_event+0x14d0/0x2180 drivers/usb/core/hub.c:5953
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888128b06c00 (size 1024):
  comm "kworker/0:2", pid 1783, jiffies 4294946815
  hex dump (first 32 bytes):
    09 02 49 00 02 01 00 10 40 00 00 00 00 00 00 00  ..I.....@.......
    00 00 00 00 00 00 00 00 89 b8 69 09 81 88 ff ff  ..........i.....
  backtrace (crc b43c3ef8):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    usb_get_configuration+0xeb/0x2110 drivers/usb/core/config.c:940
    usb_enumerate_device drivers/usb/core/hub.c:2527 [inline]
    usb_new_device+0x1b4/0x300 drivers/usb/core/hub.c:2665
    hub_port_connect drivers/usb/core/hub.c:5567 [inline]
    hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
    port_event drivers/usb/core/hub.c:5871 [inline]
    hub_event+0x1723/0x2180 drivers/usb/core/hub.c:5953
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88810c3d5a50 (size 8):
  comm "kworker/0:2", pid 1783, jiffies 4294946815
  hex dump (first 8 bytes):
    80 b8 69 09 81 88 ff ff                          ..i.....
  backtrace (crc 66af3167):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    usb_get_configuration+0x11d/0x2110 drivers/usb/core/config.c:945
    usb_enumerate_device drivers/usb/core/hub.c:2527 [inline]
    usb_new_device+0x1b4/0x300 drivers/usb/core/hub.c:2665
    hub_port_connect drivers/usb/core/hub.c:5567 [inline]
    hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
    port_event drivers/usb/core/hub.c:5871 [inline]
    hub_event+0x1723/0x2180 drivers/usb/core/hub.c:5953
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff888113c25840 (size 64):
  comm "kworker/0:2", pid 1783, jiffies 4294946817
  hex dump (first 32 bytes):
    01 00 00 00 01 00 00 00 09 04 00 00 00 01 01 30  ...............0
    00 00 00 00 0a 00 00 00 9a b8 69 09 81 88 ff ff  ..........i.....
  backtrace (crc a90fa323):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __do_kmalloc_node mm/slub.c:5294 [inline]
    __kmalloc_noprof+0x3b7/0x550 mm/slub.c:5307
    kmalloc_noprof include/linux/slab.h:954 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    usb_parse_configuration drivers/usb/core/config.c:826 [inline]
    usb_get_configuration+0x88f/0x2110 drivers/usb/core/config.c:1002
    usb_enumerate_device drivers/usb/core/hub.c:2527 [inline]
    usb_new_device+0x1b4/0x300 drivers/usb/core/hub.c:2665
    hub_port_connect drivers/usb/core/hub.c:5567 [inline]
    hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
    port_event drivers/usb/core/hub.c:5871 [inline]
    hub_event+0x1723/0x2180 drivers/usb/core/hub.c:5953
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

BUG: memory leak
unreferenced object 0xffff88811d54a500 (size 256):
  comm "kworker/0:2", pid 1783, jiffies 4294946821
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 a5 54 1d 81 88 ff ff  ..........T.....
    08 a5 54 1d 81 88 ff ff 20 e7 41 83 ff ff ff ff  ..T..... .A.....
  backtrace (crc 85d09f91):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4574 [inline]
    slab_alloc_node mm/slub.c:4898 [inline]
    __kmalloc_cache_noprof+0x371/0x480 mm/slub.c:5410
    kmalloc_noprof include/linux/slab.h:950 [inline]
    kzalloc_noprof include/linux/slab.h:1188 [inline]
    device_private_init drivers/base/core.c:3536 [inline]
    device_add+0x73c/0xc70 drivers/base/core.c:3587
    usb_new_device.cold+0x115/0x626 drivers/usb/core/hub.c:2695
    hub_port_connect drivers/usb/core/hub.c:5567 [inline]
    hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
    port_event drivers/usb/core/hub.c:5871 [inline]
    hub_event+0x1723/0x2180 drivers/usb/core/hub.c:5953
    process_one_work+0x277/0x5b0 kernel/workqueue.c:3302
    process_scheduled_works kernel/workqueue.c:3385 [inline]
    worker_thread+0x255/0x4a0 kernel/workqueue.c:3466
    kthread+0x14e/0x1a0 kernel/kthread.c:436
    ret_from_fork+0x219/0x490 arch/x86/kernel/process.c:158
    ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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

