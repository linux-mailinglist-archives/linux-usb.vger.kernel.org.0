Return-Path: <linux-usb+bounces-33162-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /adhC8FPiGllnwQAu9opvQ
	(envelope-from <linux-usb+bounces-33162-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 09:56:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AFE10823C
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 09:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AC273001CF7
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 08:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681ED33CE8D;
	Sun,  8 Feb 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="azSJakgL"
X-Original-To: linux-usb@vger.kernel.org
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn [202.108.3.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722963EBF0E
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770540986; cv=none; b=OvzYKVMFIq+hBjGNNcNEpdM6TLYg1WVny0WH6ZwdNWuA2213QoKn+oo/5Qkw2uisYAoyLRZos+nCIAVZWuxmLNlB/r0eTINXbLzsfj65Ca0h2Ak4s8Fyxo3HIPDy1Omm/ZjS1c1mlgf64SMgvelgloCvKjNHyQYIMTTGNS5BUk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770540986; c=relaxed/simple;
	bh=XFWyiI7D3kkNMp1lVYO/VStbiRLRGzwtsbv2MYxdSTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyTc61Y9RIgX2sIzMHMA3nj9UA+nMT4+3sGT9FJJpxSZwKClfZ+5UB2Cvf2jJI9KxUMR0gTJeBhM3BujbudCwHlEC+hcIlH6PBKH5Lo+XkiF29KqvvW2FN1FzC3FHPkOWPLJWHmxEtQVUXbBtkAtXv2LTCsfXvSPA0J08k+hOcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=azSJakgL; arc=none smtp.client-ip=202.108.3.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1770540984;
	bh=ldJRcK6IWLTWioy1sdA9HoMhh1qeHhIYCHxmIMhDuEo=;
	h=From:Subject:Date:Message-ID;
	b=azSJakgLaUpYE+2TSjvPyKNF9sq8JKKsKe995Fhivy2x7pJm74g0Vh2zuayy1+ZNe
	 T2X5pn8PN4fbvUMEh7rcjANYCH9towsXLhlzdjPKYg1gzXbMGAGWnNy80+5a4vur7Z
	 NoXqcOVOGI5f5SACGgC7AKiHra2NLN34XwXndmnw=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
	by sina.com (10.54.253.33) with ESMTP
	id 69884F8D0000191C; Sun, 8 Feb 2026 16:55:44 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7478726685408
X-SMAIL-UIID: 68AB489C3C80453388431E8EF4D1D89D-20260208-165544-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Ben Greear <greearb@candelatech.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Date: Sun,  8 Feb 2026 16:55:30 +0800
Message-ID: <20260208085532.2639-1-hdanton@sina.com>
In-Reply-To: <69882e77.a00a0220.34fa92.003d.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,candelatech.com,suse.com,rowland.harvard.edu,vger.kernel.org,googlegroups.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33162-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sina.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: B4AFE10823C
X-Rspamd-Action: no action

> Date: Sat, 07 Feb 2026 22:34:31 -0800
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    da87d45b1951 usb: typec: ucsi: Add Thunderbolt alternate m..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=15ee9402580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
> dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137967fa580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142fab22580000
> 
If the hung can be reproduced with PREEMPT(full) instead of (voluntary), this is
a better case for spotting the reason why the underlying hardware failed to
response within two minutes.

> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/36cc3979cfa9/disk-da87d45b.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/8b9c4e01e1ee/vmlinux-da87d45b.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/071303491de6/bzImage-da87d45b.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
> 
> INFO: task syz.3.17:3963 blocked for more than 143 seconds.
>       Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.3.17        state:D stack:27256 pid:3963  tgid:3963  ppid:3514   task_flags:0x400040 flags:0x00080002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5260 [inline]
>  __schedule+0xeb0/0x3e50 kernel/sched/core.c:6867
>  __schedule_loop kernel/sched/core.c:6949 [inline]
>  schedule+0xdd/0x390 kernel/sched/core.c:6964
>  schedule_timeout+0x127/0x280 kernel/time/sleep_timeout.c:99
>  do_wait_for_common kernel/sched/completion.c:100 [inline]
>  __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
>  usb_start_wait_urb+0x147/0x4c0 drivers/usb/core/message.c:64
>  usb_bulk_msg+0x22b/0x580 drivers/usb/core/message.c:388
>  send_request_dev_dep_msg_in drivers/usb/class/usbtmc.c:1350 [inline]
>  usbtmc_read+0x5f4/0x10b0 drivers/usb/class/usbtmc.c:1409
>  vfs_read+0x1e4/0xb30 fs/read_write.c:570
>  ksys_read+0x12a/0x250 fs/read_write.c:715
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xc9/0x570 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f2b159faeb9
> RSP: 002b:00007ffc49719d68 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> RAX: ffffffffffffffda RBX: 00007f2b15c75fa0 RCX: 00007f2b159faeb9
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
> RBP: 00007f2b15a68c1f R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f2b15c75fac R14: 00007f2b15c75fa0 R15: 00007f2b15c75fa0
>  </TASK>
> 
> Showing all locks held in the system:
> 6 locks held by kworker/0:0/9:
>  #0: ffff88810569bd48 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc9000009fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
>  #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
>  #3: ffff88810ca9f198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #3: ffff88810ca9f198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
>  #4: ffff88810ca9c160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #4: ffff88810ca9c160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
>  #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
> 1 lock held by khungtaskd/30:
>  #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
>  #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
>  #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6775
> 6 locks held by kworker/1:1/38:
>  #0: ffff88810569bd48 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc90000287ca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
>  #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
>  #3: ffff888103eaf198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #3: ffff888103eaf198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
>  #4: ffff888103eab160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #4: ffff888103eab160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
>  #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
> 2 locks held by kworker/u8:10/1609:
>  #0: ffff888100089148 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc900022dfca8 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
> 2 locks held by kworker/u8:13/2771:
>  #0: ffff888100089148 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc9000406fca8 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
> 3 locks held by kworker/0:2/2820:
>  #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc900041afca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
>  #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
>  #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
> 2 locks held by getty/2925:
>  #0: ffff88811277a0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
>  #1: ffffc900000452f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1500 drivers/tty/n_tty.c:2211
> 1 lock held by syz.3.17/3963:
>  #0: ffff88811b42ccd8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_read+0x154/0x10b0 drivers/usb/class/usbtmc.c:1395
> 2 locks held by syz.4.18/4418:
>  #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
>  #1: ffff88811b42ccd8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_open+0x4c8/0x950 drivers/usb/class/usbtmc.c:189
> 1 lock held by syz.5.19/4873:
>  #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
> 3 locks held by kworker/1:3/4877:
>  #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc90006717ca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
>  #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
>  #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
> 1 lock held by syz.6.20/5329:
>  #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
> 6 locks held by kworker/0:3/5332:
>  #0: ffff88810569bd48 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc90006e57ca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
>  #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
>  #3: ffff888103ea8198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #3: ffff888103ea8198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
>  #4: ffff88810b6c3160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #4: ffff88810b6c3160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
>  #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
> 3 locks held by kworker/1:4/5738:
>  #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
>  #1: ffffc90005bafca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
>  #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
>  #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
>  #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
> 1 lock held by syz.7.21/5786:
>  #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
> 2 locks held by modprobe/5990:
> 
> =============================================
> 
> NMI backtrace for cpu 1
> CPU: 1 UID: 0 PID: 30 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(voluntary) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>  nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:113
>  nmi_trigger_cpumask_backtrace+0x1d7/0x230 lib/nmi_backtrace.c:62
>  trigger_all_cpu_backtrace include/linux/nmi.h:161 [inline]
>  __sys_info lib/sys_info.c:157 [inline]
>  sys_info+0x141/0x190 lib/sys_info.c:165
>  check_hung_uninterruptible_tasks kernel/hung_task.c:346 [inline]
>  watchdog+0xcc3/0xfe0 kernel/hung_task.c:515
>  kthread+0x3b3/0x730 kernel/kthread.c:463
>  ret_from_fork+0x6c3/0xa20 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
>  </TASK>
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 UID: 0 PID: 5991 Comm: modprobe Not tainted syzkaller #0 PREEMPT(voluntary) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
> RIP: 0010:hlock_class kernel/locking/lockdep.c:229 [inline]
> RIP: 0010:check_wait_context kernel/locking/lockdep.c:4879 [inline]
> RIP: 0010:__lock_acquire+0x341/0x2630 kernel/locking/lockdep.c:5187
> Code: 38 c7 44 0f 47 f8 80 be c6 00 00 00 02 44 0f 44 f8 41 83 c6 01 48 83 c3 28 44 3b b5 a0 0a 00 00 0f 8d b2 00 00 00 0f b7 43 20 <66> 25 ff 1f 0f b7 c0 48 0f a3 05 10 d5 42 0d 72 a9 44 8b 1d 27 81
> RSP: 0000:ffffc9000411f8a0 EFLAGS: 00000006
> RAX: 00000000000083c5 RBX: ffff888116cc6268 RCX: 0000000000000005
> RDX: 0000000000000001 RSI: ffff888116cc6240 RDI: 0000000000000000
> RBP: ffff888116cc57c0 R08: 0000000000000000 R09: 0000000000000007
> R10: 0000000000000005 R11: 0000000000000000 R12: ffff888116cc6330
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000005
> FS:  00007feb72295c80(0000) GS:ffff88826896a000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007feb724d4b45 CR3: 0000000122c10000 CR4: 00000000003506f0
> Call Trace:
>  <TASK>
>  lock_acquire kernel/locking/lockdep.c:5868 [inline]
>  lock_acquire+0x17c/0x330 kernel/locking/lockdep.c:5825
>  rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
>  rcu_read_lock include/linux/rcupdate.h:867 [inline]
>  page_table_check_set+0x2d3/0xa10 mm/page_table_check.c:112
>  __page_table_check_ptes_set+0x1db/0x230 mm/page_table_check.c:212
>  page_table_check_ptes_set include/linux/page_table_check.h:76 [inline]
>  set_ptes include/linux/pgtable.h:292 [inline]
>  set_pte_range+0x54f/0x630 mm/memory.c:5483
>  filemap_map_order0_folio mm/filemap.c:3856 [inline]
>  filemap_map_pages+0x91f/0x1df0 mm/filemap.c:3921
>  do_fault_around mm/memory.c:5713 [inline]
>  do_read_fault mm/memory.c:5746 [inline]
>  do_fault mm/memory.c:5889 [inline]
>  do_pte_missing mm/memory.c:4401 [inline]
>  handle_pte_fault mm/memory.c:6273 [inline]
>  __handle_mm_fault+0x1e8c/0x2d30 mm/memory.c:6411
>  handle_mm_fault+0x36d/0xa20 mm/memory.c:6580
>  do_user_addr_fault+0x5ae/0x11d0 arch/x86/mm/fault.c:1336
>  handle_page_fault arch/x86/mm/fault.c:1476 [inline]
>  exc_page_fault+0x66/0xc0 arch/x86/mm/fault.c:1532
>  asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:618
> RIP: 0033:0x7feb723976c0
> Code: 48 89 ef e8 b2 ec fe ff 85 c0 75 de 49 8b 47 08 80 38 2f 48 89 44 24 08 0f 85 8c 01 00 00 48 63 44 24 30 48 8d 15 80 d4 13 00 <0f> b6 1c 02 48 89 c7 48 8d 05 92 d4 13 00 48 01 c3 e8 ea e4 ff ff
> RSP: 002b:00007ffc4877cef0 EFLAGS: 00010246
> RAX: 0000000000000005 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: 00007feb724d4b40 RSI: 0000000000000000 RDI: 00007feb725309e0
> RBP: 00007feb724eec96 R08: 00007feb725309e0 R09: 0000000000000000
> R10: 000000000000006c R11: 0000000000000217 R12: 00007feb724ef1e4
> R13: ffffffffffffff88 R14: 0000000000000002 R15: 0000000000000000
>  </TASK>

