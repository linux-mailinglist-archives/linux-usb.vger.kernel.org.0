Return-Path: <linux-usb+bounces-11469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6827C90FFF0
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 11:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92CD7B237A5
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2024 09:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4383F19ADB8;
	Thu, 20 Jun 2024 09:08:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE3171E7C
	for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874504; cv=none; b=moCo3qmtu6h+XYOugATSAHz2js+aOrAbLVid00imp6GCZ7h09RmnaQR5nGgNh+RhDOlEgM/B4Ysqt355EO2FiYj2iBLRFQnf+yym7Sp0WIUjfXYX7TxXwf8ale5v8PoRtirP0ps8j+TB8/L68BE2oauGC86DCvs/L2G8JgwTXrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874504; c=relaxed/simple;
	bh=RSzsSzCpc7P9raMm7NlFu3anSnHVxrrthjMHzdxpzRg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MZ3qjRBCNJ4rNzDL973mviw0PwVYp42/ReHOPKkjo11QbmWGlnsUFcPxvT6iSl9y8KoexzWCIgfEdiYQslVRILztbJNH7caB0yr5RwaUAL9A9RSUWnyP/lUpR7Tu4yz4ct2et4kHt+FOfw2fkVn8RYKYYC6S/s0Uz5BKskCvA6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-37597adfab4so6273215ab.2
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2024 02:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874501; x=1719479301;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJrw9A7rHEBRMICr3ppgDN1cORq1He91u4mw7Mw1cCU=;
        b=d8sbQ9ENK9ju+YDXlTnVH6WC6aZUCiE/DqXvKDWgTsTM14N+k5FpCdpLt0Kh98kTYT
         E7XKfca+h0m9HTmxpAlyQG+WfmuEFEdWXtlnPdx0PiuzJlStJFh3Oa8Cki8wSuXR2Hqt
         fUxOhTzG2fPhLy2owhnsyLyo3+3Y5y2s1GlUqIOBCSYP/C2diy59KQcyvZpq3RdoyO+w
         wPUKK1+WJOx5ckn4NBJVbyJgl9gaA73PopNoZNJZJXh8wlPLfQbSuReJndZwmP7RGrwW
         EAABMqR46vdfqMRvHZKwQeG0kzZsypj4/RNbKdnFzSSABcTjwNDMc8h5ALKWK3f/kCJU
         UjQw==
X-Forwarded-Encrypted: i=1; AJvYcCUcKylU5tmqPf3yxCvIeVVdPLf2qTDUfs/H6NONqGZU4cWIGDyzjicmCcfldpSkkTI3DjPi+2RSza8oC+p013Jz9zZV5SiOivHZ
X-Gm-Message-State: AOJu0YymIkkFTwbS0oJxU7108AZ/a5kO/MMPAyoG8hBaWU9tZJAFFFgY
	xgSpI69w3TESiTtBugPOhT7RkAJZcMjjW5Tvtb4D/cdISV8upjQIvcM4jU9guXt9UCyv0vGZDh2
	VgqEkOA9X3KdEzC9xLyZPdxvEm7yN74IJx4XUShwsbU5pXyN0/SiQMJY=
X-Google-Smtp-Source: AGHT+IGBgcJSV1PiSNNKCUci2n3ViSLiJat3LC5ZwHNnR1vjJxlLS3YgaXoV87PkBV+WicoeT2NX7uRd/VYhCL9mqsqjG0mIGqfM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c8c:b0:375:dad7:a664 with SMTP id
 e9e14a558f8ab-3761d7c4a0bmr2713545ab.6.1718874501276; Thu, 20 Jun 2024
 02:08:21 -0700 (PDT)
Date: Thu, 20 Jun 2024 02:08:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000ff9cb061b4ea872@google.com>
Subject: [syzbot] [usb?] INFO: task hung in wdm_release
From: syzbot <syzbot+973d01eb49b060b12e63@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2ccbdf43d5e7 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10cb5954980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa0ce06dcc735711
dashboard link: https://syzkaller.appspot.com/bug?extid=973d01eb49b060b12e63
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12a2cbfe980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=125f8ada980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/93525a95fe83/disk-2ccbdf43.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b9b895227ea2/vmlinux-2ccbdf43.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e825248a8e73/bzImage-2ccbdf43.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+973d01eb49b060b12e63@syzkaller.appspotmail.com

INFO: task syz-executor320:7035 blocked for more than 142 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00044-g2ccbdf43d5e7 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor320 state:D
 stack:24416 pid:7035  tgid:7034  ppid:5154   flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x17e8/0x4a20 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a4/0xd70 kernel/locking/mutex.c:752
 wdm_release+0x52/0x470 drivers/usb/class/cdc-wdm.c:764
 __fput+0x406/0x8b0 fs/file_table.c:422
 task_work_run+0x24f/0x310 kernel/task_work.c:180
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0xa27/0x27e0 kernel/exit.c:874
 do_group_exit+0x207/0x2c0 kernel/exit.c:1023
 get_signal+0x16a1/0x1740 kernel/signal.c:2909
 arch_do_signal_or_restart+0x96/0x860 arch/x86/kernel/signal.c:310
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0xc9/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feafc194719
RSP: 002b:00007feafc13f228 EFLAGS: 00000246
 ORIG_RAX: 00000000000000ca
RAX: fffffffffffffe00 RBX: 00007feafc21b1a8 RCX: 00007feafc194719
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007feafc21b1a8
RBP: 00007feafc21b1a0 R08: 00007feafc13f6c0 R09: 00007feafc13f6c0
R10: 0000000000000000 R11: 0000000000000246 R12: 00007feafc21b1ac
R13: 0023776172646968 R14: 6469682f7665642f R15: 00007ffc872c23c8
 </TASK>
INFO: task syz-executor320:7039 blocked for more than 143 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00044-g2ccbdf43d5e7 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor320 state:D
 stack:26384 pid:7039  tgid:7038  ppid:5155   flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x17e8/0x4a20 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6837
 rpm_resume+0x504/0x1670 drivers/base/power/runtime.c:834
 rpm_resume+0x8fe/0x1670 drivers/base/power/runtime.c:892
 __pm_runtime_resume+0x120/0x180 drivers/base/power/runtime.c:1172
 pm_runtime_resume_and_get include/linux/pm_runtime.h:430 [inline]
 usb_autopm_get_interface+0x22/0xf0 drivers/usb/core/driver.c:1819
 wdm_open+0x218/0x550 drivers/usb/class/cdc-wdm.c:730
 usb_open+0x225/0x300 drivers/usb/core/file.c:47
 chrdev_open+0x5b0/0x630 fs/char_dev.c:414
 do_dentry_open+0x95a/0x1720 fs/open.c:955
 do_open fs/namei.c:3650 [inline]
 path_openat+0x289f/0x3280 fs/namei.c:3807
 do_filp_open+0x235/0x490 fs/namei.c:3834
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1405
 do_sys_open fs/open.c:1420 [inline]
 __do_sys_openat fs/open.c:1436 [inline]
 __se_sys_openat fs/open.c:1431 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1431
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feafc193370
RSP: 002b:00007feafc13ed80 EFLAGS: 00000293
 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007feafc193370
RDX: 0000000000000002 RSI: 00007feafc13ee10 RDI: 00000000ffffff9c
RBP: 00007feafc13ee10 R08: 0000000000000000 R09: 00007feafc13eb97
R10: 0000000000000000 R11: 0000000000000293 R12: 00007feafc21b1ac
R13: 0023776172646968 R14: 6469682f7665642f R15: 00007ffc872c23c8
 </TASK>
INFO: task syz-executor320:7046 blocked for more than 145 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00044-g2ccbdf43d5e7 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor320 state:D
 stack:27360 pid:7046  tgid:7040  ppid:5153   flags:0x00000006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x17e8/0x4a20 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a4/0xd70 kernel/locking/mutex.c:752
 wdm_open+0x56/0x550 drivers/usb/class/cdc-wdm.c:715
 usb_open+0x225/0x300 drivers/usb/core/file.c:47
 chrdev_open+0x5b0/0x630 fs/char_dev.c:414
 do_dentry_open+0x95a/0x1720 fs/open.c:955
 do_open fs/namei.c:3650 [inline]
 path_openat+0x289f/0x3280 fs/namei.c:3807
 do_filp_open+0x235/0x490 fs/namei.c:3834
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1405
 do_sys_open fs/open.c:1420 [inline]
 __do_sys_openat fs/open.c:1436 [inline]
 __se_sys_openat fs/open.c:1431 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1431
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7feafc193370
RSP: 002b:00007feafc11dd80 EFLAGS: 00000293
 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007feafc193370
RDX: 0000000000000002 RSI: 00007feafc11de10 RDI: 00000000ffffff9c
RBP: 00007feafc11de10 R08: 0000000000000000 R09: 00007feafc11db97
R10: 0000000000000000 R11: 0000000000000293 R12: 00007feafc21b1bc
R13: 0023776172646968 R14: 6469682f7665642f R15: 00007ffc872c23c8
 </TASK>
INFO: task syz-executor320:7043 blocked for more than 146 seconds.
      Not tainted 6.10.0-rc3-syzkaller-00044-g2ccbdf43d5e7 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor320 state:D stack:25712 pid:7043  tgid:7042  ppid:5156   flags:0x00000006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0x17e8/0x4a20 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6837
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6894
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x6a4/0xd70 kernel/locking/mutex.c:752
 wdm_open+0x56/0x550 drivers/usb/class/cdc-wdm.c:715
 usb_open+0x225/0x300 drivers/usb/core/file.c:47
 chrdev_open+0x5b0/0x630 fs/char_dev.c:414
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/u8:0/11:
 #0: ffff8880b953e7d8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:559
 #1: ffff8880b9528948 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x441/0x770 kernel/sched/psi.c:988
 #2: ffff8880754f0768 (&rdev->wiphy.mtx){+.+.}-{3:3}, at: wiphy_lock include/net/cfg80211.h:5966 [inline]
 #2: ffff8880754f0768 (&rdev->wiphy.mtx){+.+.}-{3:3}, at: cfg80211_wiphy_work+0x35/0x260 net/wireless/core.c:424
1 lock held by khungtaskd/30:
 #0: ffffffff8e333fa0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:329 [inline]
 #0: ffffffff8e333fa0 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:781 [inline]
 #0: ffffffff8e333fa0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x55/0x2a0 kernel/locking/lockdep.c:6614
7 locks held by kworker/1:1/45:
 #0: ffff8880186e6948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff8880186e6948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc90000b57d00 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc90000b57d00 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffff888023f67190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1009 [inline]
 #2: ffff888023f67190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1fe/0x5150 drivers/usb/core/hub.c:5849
 #3: ffff88801aeaf190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1009 [inline]
 #3: ffff88801aeaf190 (&dev->mutex){....}-{3:3}, at: usb_remote_wakeup drivers/usb/core/hub.c:3840 [inline]
 #3: ffff88801aeaf190 (&dev->mutex){....}-{3:3}, at: hub_port_connect_change drivers/usb/core/hub.c:5647 [inline]
 #3: ffff88801aeaf190 (&dev->mutex){....}-{3:3}, at: port_event drivers/usb/core/hub.c:5821 [inline]
 #3: ffff88801aeaf190 (&dev->mutex){....}-{3:3}, at: hub_event+0x2117/0x5150 drivers/usb/core/hub.c:5903
 #4: ffff888023fba518 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3206 [inline]
 #4: ffff888023fba518 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_port_resume+0x2cc/0x2210 drivers/usb/core/hub.c:3764
 #5: ffff8880231af468 (hcd->address0_mutex){+.+.}-{3:3}, at: usb_reset_and_verify_device+0x319/0x1440 drivers/usb/core/hub.c:6120
 #6: ffffffff8ef1eed0 (ehci_cf_port_reset_rwsem){.+.+}-{3:3}, at: hub_port_reset+0x1f8/0x1b30 drivers/usb/core/hub.c:3021
2 locks held by getty/4851:
 #0: ffff88802d9000a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900031432f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x6b5/0x1e10 drivers/tty/n_tty.c:2201
6 locks held by kworker/0:3/5160:
 #0: ffff8880186e6948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff8880186e6948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc90004147d00 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc90004147d00 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffff888023fcf190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1009 [inline]
 #2: ffff888023fcf190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1fe/0x5150 drivers/usb/core/hub.c:5849
 #3: ffff88802401a518 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3206 [inline]
 #3: ffff88802401a518 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect drivers/usb/core/hub.c:5418 [inline]
 #3: ffff88802401a518 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 #3: ffff88802401a518 (&port_dev->status_lock){+.+.}-{3:3}, at: port_event drivers/usb/core/hub.c:5821 [inline]
 #3: ffff88802401a518 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_event+0x25b6/0x5150 drivers/usb/core/hub.c:5903
 #4: ffff88802301b668 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_connect drivers/usb/core/hub.c:5419 [inline]
 #4: ffff88802301b668 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 #4: ffff88802301b668 (hcd->address0_mutex){+.+.}-{3:3}, at: port_event drivers/usb/core/hub.c:5821 [inline]
 #4: ffff88802301b668 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_event+0x25f4/0x5150 drivers/usb/core/hub.c:5903
 #5: ffffffff8ef1eed0 (ehci_cf_port_reset_rwsem){.+.+}-{3:3}, at: hub_port_reset+0x1f8/0x1b30 drivers/usb/core/hub.c:3021
6 locks held by kworker/0:4/5186:
 #0: ffff8880186e6948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff8880186e6948 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc900042e7d00 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc900042e7d00 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffff888023fbf190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1009 [inline]
 #2: ffff888023fbf190 (&dev->mutex){....}-{3:3}, at: hub_event+0x1fe/0x5150 drivers/usb/core/hub.c:5849
 #3: 
ffff888023fca518 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3206 [inline]
ffff888023fca518 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect drivers/usb/core/hub.c:5418 [inline]
ffff888023fca518 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
ffff888023fca518 (&port_dev->status_lock){+.+.}-{3:3}, at: port_event drivers/usb/core/hub.c:5821 [inline]
ffff888023fca518 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_event+0x25b6/0x5150 drivers/usb/core/hub.c:5903
 #4: ffff8880238acd68 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_connect drivers/usb/core/hub.c:5419 [inline]
 #4: ffff8880238acd68 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 #4: ffff8880238acd68 (hcd->address0_mutex){+.+.}-{3:3}, at: port_event drivers/usb/core/hub.c:5821 [inline]
 #4: ffff8880238acd68 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_event+0x25f4/0x5150 drivers/usb/core/hub.c:5903
 #5: ffff8880b943e7d8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:559
7 locks held by kworker/1:6/5373:

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 30 Comm: khungtaskd Not tainted 6.10.0-rc3-syzkaller-00044-g2ccbdf43d5e7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 nmi_cpu_backtrace+0x49c/0x4d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:223 [inline]
 watchdog+0xfde/0x1020 kernel/hung_task.c:379
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 4532 Comm: klogd Not tainted 6.10.0-rc3-syzkaller-00044-g2ccbdf43d5e7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
RIP: 0010:lock_is_held_type+0x5/0x190 kernel/locking/lockdep.c:5810
Code: 90 90 eb b5 e8 2c fc ff ff 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 55 <41> 57 41 56 41 55 41 54 53 48 83 ec 10 65 48 8b 04 25 28 00 00 00
RSP: 0018:ffffc9000304f820 EFLAGS: 00000086
RAX: 0000000000000000 RBX: ffff8880b943f538 RCX: ffffc9000304f900
RDX: 0000000000000010 RSI: 00000000ffffffff RDI: ffff8880b943e7d8
RBP: 0000000000000010 R08: ffffffff8fad50af R09: 1ffffffff1f5aa15
R10: dffffc0000000000 R11: fffffbfff1f5aa16 R12: ffff8880b943e7c0
R13: ffff88807c71da00 R14: ffff8880b943e7c0 R15: dffffc0000000000
FS:  00007f923e470380(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055d767cc7e98 CR3: 000000007b90c000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 lock_is_held include/linux/lockdep.h:231 [inline]
 lockdep_assert_rq_held kernel/sched/sched.h:1397 [inline]
 ttwu_do_activate+0x9d/0x7e0 kernel/sched/core.c:3778
 ttwu_queue kernel/sched/core.c:4057 [inline]
 try_to_wake_up+0x884/0x1470 kernel/sched/core.c:4378
 autoremove_wake_function+0x16/0x110 kernel/sched/wait.c:384
 __wake_up_common kernel/sched/wait.c:89 [inline]
 __wake_up_common_lock+0x130/0x1e0 kernel/sched/wait.c:106
 sock_def_readable+0x20f/0x5b0 net/core/sock.c:3353
 unix_dgram_sendmsg+0x148e/0x1f80 net/unix/af_unix.c:2116
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg+0x221/0x270 net/socket.c:745
 __sys_sendto+0x3a4/0x4f0 net/socket.c:2192
 __do_sys_sendto net/socket.c:2204 [inline]
 __se_sys_sendto net/socket.c:2200 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2200
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f923e5d29b5
Code: 8b 44 24 08 48 83 c4 28 48 98 c3 48 98 c3 41 89 ca 64 8b 04 25 18 00 00 00 85 c0 75 26 45 31 c9 45 31 c0 b8 2c 00 00 00 0f 05 <48> 3d 00 f0 ff ff 76 7a 48 8b 15 44 c4 0c 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffd088564d8 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f923e5d29b5
RDX: 000000000000008b RSI: 00005563a644c180 RDI: 0000000000000003
RBP: 00005563a6447910 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000246 R12: 0000000000000013
R13: 00007f923e760212 R14: 00007ffd088565d8 R15: 0000000000000000
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

