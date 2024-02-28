Return-Path: <linux-usb+bounces-7206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866286A7BB
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 06:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA3E7286C62
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 05:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0DA210ED;
	Wed, 28 Feb 2024 05:03:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6520B17
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709096599; cv=none; b=gwZ+ij/e58ULyksftPQgw5xoc5UA5RmVb4WTR5MpQmhQ4Qpdm3JpQ/J/u5hFGHU2FVDHvkynl6MYrxp42zcKJxfnzKFN1dkouWcH7MZK6GlpLnKBZhjdgXtGpWyCiTEJeb3ysA27mrWNIf7f0fqX4wNoHLI0QM9ZJvICmaltjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709096599; c=relaxed/simple;
	bh=IcJu0XYMy2/eKbfOW9/K+j1/WMkhTVyCV1cBVRPywU4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lNOO5dto4oQ7NzjuapO74TFDydyCGXmRdKqTp3/h+h6tyeQHC89UZtzkjcGKd+jLHT/wKQxPUPYnUR0ixfDQ4uTHg9hG4jYMsGOg4kAjH3/wNhDE8htyr5iVDH8wp/KE1uwO1C9RgyScixdGY8Y40EfJPQA192XcriVvE2Xy3Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7c784b01313so474480239f.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 21:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709096597; x=1709701397;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTOizF5wVcFTzMt2UNKgPkpTl3/Lnnj26VxalAGL3TI=;
        b=cuZ3RJo6eDZm+Bh3Vzas4pMz+myuDrFgIcZwbIcAhwwsGAcrF1v0pcZ5vj8/Bmnrd1
         x1ub4EjGIWDnifk0tQrQN1yMDUgNLmysQdihFnK5WaW5sP/RqjROjKfOPdjvwsOEwCQ3
         GapsfSLc64ej9QkmmWN+z5CaKLopLi6W8GQhhPRIS6i/oUMH7n8mctQNOJ2Mx/qqw2QV
         wkbytxKrd5dFErZdrJUk+uJ5lXs4jtDaptBUO6PnY6SN5ml1wlBD+MPnQtQmF5NppnbU
         ywH96tRPbOtV2Sd+B8QCxW5TxWLCDmpeTt/CfyHSLbIxILXJtAV1Xls8NC25MPTVg+J9
         jLCA==
X-Forwarded-Encrypted: i=1; AJvYcCWu6I02icYZkkRfUpnl78pZ1tCzBdi2r2V7EfMOTpTGUkFRV32oOGP8qXHNJUxs894IDoNDBf2m+eLx8Kkv2GOdwnBnPHeIdHaP
X-Gm-Message-State: AOJu0Yx6BY5Ymp97XDbGlHnvQ2j0mtMiMjDAuMEfoTRTuMlOySAeJakS
	dA7TETIRy2Zwsry8P+e6kxqzjMCnn1R/1mxLsysaD1jkD2dcnIJya0btDr/qI3jU3wbp+85J6nE
	m97sJXBL5fuk+Q4DPlbd27jZQwrXk64KABn9HDfDOh+Il3KVc7yStbKI=
X-Google-Smtp-Source: AGHT+IEFXwIUb1wWdKgRcdSYHr30xWPvKueyFjhf2d86D5Ca205szkfWxeElKGbEateWybgPAU4joHQxjOKEyfu23aoXvRSt7/Oe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2147:b0:365:38db:a585 with SMTP id
 d7-20020a056e02214700b0036538dba585mr897435ilv.1.1709096597167; Tue, 27 Feb
 2024 21:03:17 -0800 (PST)
Date: Tue, 27 Feb 2024 21:03:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008faf0a06126a0ffb@google.com>
Subject: [syzbot] [media?] [usb?] INFO: task hung in vb2_video_unregister_device
From: syzbot <syzbot+2622b51b35f91a00ea18@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, m.szyprowski@samsung.com, mchehab@kernel.org, 
	syzkaller-bugs@googlegroups.com, tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9abbc24128bc Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12073622180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=af5c6c699e57bbb3
dashboard link: https://syzkaller.appspot.com/bug?extid=2622b51b35f91a00ea18
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=132173d2180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d7ec54180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ce13ec3ed5ad/disk-9abbc241.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/256cbd314121/vmlinux-9abbc241.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0af86fb52109/Image-9abbc241.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2622b51b35f91a00ea18@syzkaller.appspotmail.com

INFO: task kworker/0:1:10 blocked for more than 143 seconds.
      Tainted: G    B              6.8.0-rc5-syzkaller-g9abbc24128bc #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:1     state:D stack:0     pid:10    tgid:10    ppid:2      flags:0x00000008
Workqueue: usb_hub_wq hub_event
Call trace:
 __switch_to+0x314/0x560 arch/arm64/kernel/process.c:553
 context_switch kernel/sched/core.c:5400 [inline]
 __schedule+0x1498/0x24b4 kernel/sched/core.c:6727
 __schedule_loop kernel/sched/core.c:6802 [inline]
 schedule+0xb8/0x19c kernel/sched/core.c:6817
 schedule_preempt_disabled+0x18/0x2c kernel/sched/core.c:6874
 __mutex_lock_common+0xbd8/0x21a0 kernel/locking/mutex.c:684
 __mutex_lock kernel/locking/mutex.c:752 [inline]
 mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:804
 vb2_video_unregister_device+0x11c/0x1dc drivers/media/common/videobuf2/videobuf2-v4l2.c:1269
 usbtv_video_free+0x4c/0x84 drivers/media/usb/usbtv/usbtv-video.c:970
 usbtv_disconnect+0x6c/0xc4 drivers/media/usb/usbtv/usbtv-core.c:138
 usb_unbind_interface+0x1a4/0x758 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x440/0x6a0 drivers/base/dd.c:1295
 device_release_driver+0x28/0x38 drivers/base/dd.c:1318
 bus_remove_device+0x314/0x3b4 drivers/base/bus.c:574
 device_del+0x480/0x87c drivers/base/core.c:3828
 usb_disable_device+0x354/0x760 drivers/usb/core/message.c:1416
 usb_disconnect+0x290/0x808 drivers/usb/core/hub.c:2267
 hub_port_connect drivers/usb/core/hub.c:5323 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5623 [inline]
 port_event drivers/usb/core/hub.c:5783 [inline]
 hub_event+0x18ec/0x435c drivers/usb/core/hub.c:5865
 process_one_work+0x694/0x1204 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x970/0xef4 kernel/workqueue.c:2787
 kthread+0x288/0x310 kernel/kthread.c:388
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
INFO: lockdep is turned off.


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

