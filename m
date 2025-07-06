Return-Path: <linux-usb+bounces-25395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8BAF0D77
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 10:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB0921706E4
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 08:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656F4231A3F;
	Wed,  2 Jul 2025 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="xxsV++rw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F46521B9DB
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443544; cv=none; b=JLezQ8ekUHH+X+e8x/ukbmI053myNtsM9rqFnR56u7EbcAkWF29iT+KVuBAqXEvgKrs01M21+fCd+jUXKp2Ku8loXn074wnNSGvq1xoX9OFO49EHswa1xwfJB+j726t60+/dvnmMGhxFiJrBovpEvcJmjs34nPlaaTsj66zOLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443544; c=relaxed/simple;
	bh=5KgS7MO/b2GC5ilCsSbZ6UJCLKaGK0zyS46A6lK35k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1JMAMMJAKP0P2ixbwbJmxwBT5dt39bpkf+0lVtB6rFkYHp80kfWlzsAxb5sF0BSVOiQcyv5+F3q8eWUWDga2cpaQB0ezqxyZfCNwqv0ntOuZZPee6H2pNdraLv69nT89LIDniTbqiJZ591JPrKBHF8xTdeupITzophOcgCCmKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=xxsV++rw; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751443536;
	bh=nlp3e6UAhv4/Zx6xE2yNYyfVng5Cp+Gu2i91HFEf6cs=;
	h=From:Subject:Date:Message-ID;
	b=xxsV++rw6/i2hNSDtbS5bzOIj1t6UTT+6dNMAf97aHGcsDxCySWijXio1YoMfd+yQ
	 /HGAZasPWjCQwfRyBP55lIAki3NUZDEjcJW45RdnntOocswAuxoiMOlBksyOkLDV2A
	 i5yOlHx3kAjWA/FQP6cimZ/T2cHd3/N3f5yaXaYI=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 6864E84500003028; Wed, 2 Jul 2025 16:05:26 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6232346816221
X-SMAIL-UIID: 96F80F98301F4707838049E63F5E2F15-20250702-160526-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Boqun Feng <boqun.feng@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
Date: Wed,  2 Jul 2025 16:05:14 +0800
Message-ID: <20250702080515.2160-1-hdanton@sina.com>
In-Reply-To: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 01 Jul 2025 17:50:28 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10d1f88c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=66357ac5b0466f16
> dashboard link: https://syzkaller.appspot.com/bug?extid=d630bd89141124cc543e
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/b005e1db0f8c/disk-1343433e.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/cb3aa8bfd514/vmlinux-1343433e.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e01227599a09/bzImage-1343433e.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com
> 
> INFO: task kworker/0:0:9 blocked for more than 143 seconds.
>       Not tainted 6.16.0-rc4-next-20250630-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/0:0     state:D stack:21240 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00004000
> Workqueue: events_power_efficient hub_init_func2
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5313 [inline]
>  __schedule+0x16f5/0x4d00 kernel/sched/core.c:6696
>  __schedule_loop kernel/sched/core.c:6774 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6789
>  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6846
>  __mutex_lock_common kernel/locking/mutex.c:679 [inline]
>  __mutex_lock+0x724/0xe80 kernel/locking/mutex.c:747
>  device_lock include/linux/device.h:884 [inline]
>  hub_activate+0xb7/0x1ea0 drivers/usb/core/hub.c:1096
>  process_one_work kernel/workqueue.c:3239 [inline]
>  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
>  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
>  kthread+0x70e/0x8a0 kernel/kthread.c:463
>  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>

Due to lockdep_set_novalidate_class(&dev->mutex) in device_initialize(),
task hung instead of deadlock is reported once more.

	kworker/0:0:9		kworker/0:5:5923
	---			---
	hub_init_func2()	usb_disconnect()
				device_lock()
	device_lock()		hub_disconnect()
				hub_quiesce()
				flush_delayed_work(&hub->init_work);
	*** DEADLOCK ***

> INFO: task kworker/1:0:24 blocked for more than 143 seconds.
>       Not tainted 6.16.0-rc4-next-20250630-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:0     state:D stack:22792 pid:24    tgid:24    ppid:2      task_flags:0x4288060 flags:0x00004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5313 [inline]
>  __schedule+0x16f5/0x4d00 kernel/sched/core.c:6696
>  __schedule_loop kernel/sched/core.c:6774 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6789
>  schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
>  do_wait_for_common kernel/sched/completion.c:100 [inline]
>  __wait_for_common kernel/sched/completion.c:121 [inline]
>  wait_for_common kernel/sched/completion.c:132 [inline]
>  wait_for_completion+0x2bf/0x5d0 kernel/sched/completion.c:153
>  __flush_work+0x9b9/0xbc0 kernel/workqueue.c:4247
>  flush_work kernel/workqueue.c:4268 [inline]
>  flush_delayed_work+0x13e/0x190 kernel/workqueue.c:4290
>  hub_quiesce+0x1f0/0x330 drivers/usb/core/hub.c:1421
>  hub_disconnect+0xc8/0x470 drivers/usb/core/hub.c:1821
>  usb_unbind_interface+0x26b/0x910 drivers/usb/core/driver.c:458
>  device_remove drivers/base/dd.c:569 [inline]
>  __device_release_driver drivers/base/dd.c:1272 [inline]
>  device_release_driver_internal+0x4d6/0x7c0 drivers/base/dd.c:1295
>  bus_remove_device+0x34d/0x410 drivers/base/bus.c:579
>  device_del+0x511/0x8e0 drivers/base/core.c:3880
>  usb_disable_device+0x3e9/0x8a0 drivers/usb/core/message.c:1418
>  usb_disconnect+0x330/0x950 drivers/usb/core/hub.c:2349
>  hub_port_connect drivers/usb/core/hub.c:5411 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5711 [inline]
>  port_event drivers/usb/core/hub.c:5871 [inline]
>  hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5953
>  process_one_work kernel/workqueue.c:3239 [inline]
>  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
>  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
>  kthread+0x70e/0x8a0 kernel/kthread.c:463
>  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> INFO: task kworker/1:4:5881 blocked for more than 144 seconds.
>       Not tainted 6.16.0-rc4-next-20250630-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/1:4     state:D stack:21304 pid:5881  tgid:5881  ppid:2      task_flags:0x4208060 flags:0x00004000
> Workqueue: events_power_efficient hub_init_func2

Ditto, deadlock with kworker/1:0:24

> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5313 [inline]
>  __schedule+0x16f5/0x4d00 kernel/sched/core.c:6696
>  __schedule_loop kernel/sched/core.c:6774 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6789
>  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6846
>  __mutex_lock_common kernel/locking/mutex.c:679 [inline]
>  __mutex_lock+0x724/0xe80 kernel/locking/mutex.c:747
>  device_lock include/linux/device.h:884 [inline]
>  hub_activate+0xb7/0x1ea0 drivers/usb/core/hub.c:1096
>  process_one_work kernel/workqueue.c:3239 [inline]
>  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
>  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
>  kthread+0x70e/0x8a0 kernel/kthread.c:463
>  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> INFO: task kworker/0:5:5923 blocked for more than 144 seconds.
>       Not tainted 6.16.0-rc4-next-20250630-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/0:5     state:D stack:20840 pid:5923  tgid:5923  ppid:2      task_flags:0x4288060 flags:0x00004000
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5313 [inline]
>  __schedule+0x16f5/0x4d00 kernel/sched/core.c:6696
>  __schedule_loop kernel/sched/core.c:6774 [inline]
>  schedule+0x165/0x360 kernel/sched/core.c:6789
>  schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
>  do_wait_for_common kernel/sched/completion.c:100 [inline]
>  __wait_for_common kernel/sched/completion.c:121 [inline]
>  wait_for_common kernel/sched/completion.c:132 [inline]
>  wait_for_completion+0x2bf/0x5d0 kernel/sched/completion.c:153
>  __flush_work+0x9b9/0xbc0 kernel/workqueue.c:4247
>  flush_work kernel/workqueue.c:4268 [inline]
>  flush_delayed_work+0x13e/0x190 kernel/workqueue.c:4290
>  hub_quiesce+0x1f0/0x330 drivers/usb/core/hub.c:1421
>  hub_disconnect+0xc8/0x470 drivers/usb/core/hub.c:1821
>  usb_unbind_interface+0x26b/0x910 drivers/usb/core/driver.c:458
>  device_remove drivers/base/dd.c:569 [inline]
>  __device_release_driver drivers/base/dd.c:1272 [inline]
>  device_release_driver_internal+0x4d6/0x7c0 drivers/base/dd.c:1295
>  bus_remove_device+0x34d/0x410 drivers/base/bus.c:579
>  device_del+0x511/0x8e0 drivers/base/core.c:3880
>  usb_disable_device+0x3e9/0x8a0 drivers/usb/core/message.c:1418
>  usb_disconnect+0x330/0x950 drivers/usb/core/hub.c:2349
>  hub_port_connect drivers/usb/core/hub.c:5411 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5711 [inline]
>  port_event drivers/usb/core/hub.c:5871 [inline]
>  hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5953
>  process_one_work kernel/workqueue.c:3239 [inline]
>  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
>  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
>  kthread+0x70e/0x8a0 kernel/kthread.c:463
>  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> 
> Showing all locks held in the system:
> 3 locks held by kworker/0:0/9:
>  #0: ffff88801a882148 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
>  #0: ffff88801a882148 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3322
>  #1: ffffc900000e7bc0 ((work_completion)(&(&hub->init_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3215 [inline]
>  #1: ffffc900000e7bc0 ((work_completion)(&(&hub->init_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3322
>  #2: ffff888023888198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #2: ffff888023888198 (&dev->mutex){....}-{4:4}, at: hub_activate+0xb7/0x1ea0 drivers/usb/core/hub.c:1096
> 5 locks held by kworker/1:0/24:
>  #0: ffff8880216a2148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
>  #0: ffff8880216a2148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3322
>  #1: ffffc900001e7bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3215 [inline]
>  #1: ffffc900001e7bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3322
>  #2: ffff8880287da198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #2: ffff8880287da198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5899
>  #3: ffff888026f14198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #3: ffff888026f14198 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xf8/0x950 drivers/usb/core/hub.c:2340
>  #4: ffff888078818160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #4: ffff888078818160 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
>  #4: ffff888078818160 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
> 1 lock held by khungtaskd/31:
>  #0: ffffffff8e33bee0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
>  #0: ffffffff8e33bee0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
>  #0: ffffffff8e33bee0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6770
> 2 locks held by getty/5593:
>  #0: ffff8880308ca0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
>  #1: ffffc9000331b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
> 3 locks held by kworker/1:4/5881:
>  #0: ffff88801a882148 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
>  #0: ffff88801a882148 ((wq_completion)events_power_efficient){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3322
>  #1: ffffc90004347bc0 ((work_completion)(&(&hub->init_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3215 [inline]
>  #1: ffffc90004347bc0 ((work_completion)(&(&hub->init_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3322
>  #2: ffff888026f14198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #2: ffff888026f14198 (&dev->mutex){....}-{4:4}, at: hub_activate+0xb7/0x1ea0 drivers/usb/core/hub.c:1096
> 5 locks held by kworker/0:5/5923:
>  #0: ffff8880216a2148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
>  #0: ffff8880216a2148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3322
>  #1: ffffc90004587bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3215 [inline]
>  #1: ffffc90004587bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3322
>  #2: ffff8881443e8198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #2: ffff8881443e8198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5899
>  #3: ffff888023888198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #3: ffff888023888198 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xf8/0x950 drivers/usb/core/hub.c:2340
>  #4: ffff88807a6b6160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
>  #4: ffff88807a6b6160 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
>  #4: ffff88807a6b6160 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
> 
> =============================================
> 
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.16.0-rc4-next-20250630-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
>  nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
>  trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
>  check_hung_uninterruptible_tasks kernel/hung_task.c:307 [inline]
>  watchdog+0xfee/0x1030 kernel/hung_task.c:470
>  kthread+0x70e/0x8a0 kernel/kthread.c:463
>  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 5820 Comm: syz-executor Not tainted 6.16.0-rc4-next-20250630-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:arch_static_branch arch/x86/include/asm/jump_label.h:36 [inline]
> RIP: 0010:native_write_msr arch/x86/include/asm/msr.h:139 [inline]
> RIP: 0010:wrmsrq arch/x86/include/asm/msr.h:199 [inline]
> RIP: 0010:native_apic_msr_write+0x39/0x50 arch/x86/include/asm/apic.h:212
> Code: 74 2a 83 ff 30 74 25 eb 10 81 ff d0 00 00 00 74 1b 81 ff e0 00 00 00 74 13 c1 ef 04 81 c7 00 08 00 00 89 f9 89 f0 31 d2 0f 30 <66> 90 c3 cc cc cc cc cc f3 0f 1e fa 89 f6 31 d2 e9 42 c9 93 03 66
> RSP: 0018:ffffc90004027af8 EFLAGS: 00000046
> RAX: 0000000000010001 RBX: ffff8880b8623900 RCX: 0000000000000838
> RDX: 0000000000000000 RSI: 0000000000010001 RDI: 0000000000000838
> RBP: 0000000000000001 R08: 0000000000000000 R09: ffffffff81ae7cae
> R10: 0000000000000003 R11: ffffffff817054a0 R12: 0000000010004b7f
> R13: dffffc0000000000 R14: 0000000000010001 R15: 0000000000000020
> FS:  000055555dbfe500(0000) GS:ffff8881259e4000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f9d3dd81178 CR3: 000000007685a000 CR4: 00000000003526f0
> Call Trace:
>  <TASK>
>  apic_write arch/x86/include/asm/apic.h:405 [inline]
>  lapic_next_event+0x11/0x20 arch/x86/kernel/apic/apic.c:416
>  clockevents_program_event+0x1cc/0x360 kernel/time/clockevents.c:334
>  hrtimer_start_range_ns+0xda6/0x1080 kernel/time/hrtimer.c:1330
>  hrtimer_start_expires include/linux/hrtimer.h:277 [inline]
>  hrtimer_sleeper_start_expires kernel/time/hrtimer.c:2023 [inline]
>  do_nanosleep+0x191/0x600 kernel/time/hrtimer.c:2097
>  hrtimer_nanosleep+0x169/0x360 kernel/time/hrtimer.c:2147
>  __do_sys_clock_nanosleep kernel/time/posix-timers.c:1399 [inline]
>  __se_sys_clock_nanosleep+0x2ee/0x380 kernel/time/posix-timers.c:1376
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f14d39c11a3
> Code: 1f 84 00 00 00 00 00 83 ff 03 74 7b 83 ff 02 b8 fa ff ff ff 49 89 ca 0f 44 f8 80 3d 9e 43 1c 00 00 74 14 b8 e6 00 00 00 0f 05 <f7> d8 c3 66 2e 0f 1f 84 00 00 00 00 00 48 83 ec 28 48 89 54 24 10
> RSP: 002b:00007ffc771e7aa8 EFLAGS: 00000202 ORIG_RAX: 00000000000000e6
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f14d39c11a3
> RDX: 00007ffc771e7ac0 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: 000000001cc70deb R09: 7fffffffffffffff
> R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffc771e7f10
> R13: 0000000000000004 R14: 00007ffc771e7afc R15: 00007ffc771e7b90
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

