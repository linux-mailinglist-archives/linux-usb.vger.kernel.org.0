Return-Path: <linux-usb+bounces-33169-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id t4m1CLKwiGk3ugQAu9opvQ
	(envelope-from <linux-usb+bounces-33169-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:50:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6904F109524
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AB66301A739
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 15:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D9A36B07D;
	Sun,  8 Feb 2026 15:50:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2233B966
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 15:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770565804; cv=none; b=INGI/ZRTQT5xcL38jjx3MzFJI5RycFQb2Z6HV+c+p2rnRFwXZOz5MXP8pRylXsX7tKyOjLPIcr1RQgGy7Yw2RdAWVn4HhxIbpw79xxmZlYL7e6Q0eU9XCmjrK48CPKA2xc80rVA0XqxziXPIxUV5rUv0DBbFSb0yh1RTXwJ1ni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770565804; c=relaxed/simple;
	bh=vEK9MOTPqYGzX6nKPb3UYduzAcxcTI+kigCLURyJe/w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cLarlZjrDd6LixO9rUrRZrwef+ztwFkp1DphBedLc4xD/i0307vY/VjqFNkv23L9lIWpkI3D87C4gZQh5xrrmCQRA1TfX37C307Uxc14SQK8PBHMNaI8Qce1+iAud0LrfqLoaWIbj9PDxH8c+x8x6wD1BvoODYdIoQi9bt/P7KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45e94165d64so14499643b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 07:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770565803; x=1771170603;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JV6pODrWoHiyECv5epeDa5rs5R1kMBSrwjJeZEraRzI=;
        b=ic6GeefQSBmBbNsVXe8cdILUxRge3laKBGEO8abD9SnwDU+Szj0aUY1orMEOWnV/o3
         KMSesd3MIX7B4eoNd0mBwkf25lqUQeLekBuQscGeXSCLTF8iNEtedUyWWXoaZ27aih8v
         ja0H9cWSLcTio2YZhFCGyaX7C8uSa6IbFV8L6R1RztcLvH3dEFPJ5fVCnu1IYrc7OG/k
         o6ZGeS9AMo5e/y+d+QF/H3BDBgAG1633eYQ8r6SXLPEuGv8TrNvwE51lNkwR+4p8OFtJ
         Z7DdwDLkCPv9W5kUd2f6pv9mOhc2qFXJU8vR63e7rV9nOqNkvjSP+ApenOouZIgTgGBz
         t9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUqFu91bM3MrVZt8uH13LnGSVw5sDaBDRRFLy9+kWuG+V3AWTY0EZpdUhwN6p/drbHGF/rlbWkC9rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbT9OBqiOP98hdTWcrs9mbsjsw/Jrohr6AE/Fzl/vwG94XZ0Aw
	u041FBepS9sf/dFaTD6+eG6KviZ2RfXg36ar63IOAzB79ObkdRN2Sr5Hg9IGAMrlGE4oZaeMAcD
	d/EpcKPsOU8l0OaMHMjWxtBPTpyIOJ3sextvSwRcGhlN9WKQgtn/wjoTEwtg=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f010:b0:663:aff:6506 with SMTP id
 006d021491bc7-66d099c5c59mr4134366eaf.16.1770565803535; Sun, 08 Feb 2026
 07:50:03 -0800 (PST)
Date: Sun, 08 Feb 2026 07:50:03 -0800
In-Reply-To: <f48c3277-6a71-40c5-b055-c1b75b08ec54@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6988b0ab.050a0220.1ad825.0002.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
From: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
To: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,rowland.harvard.edu,googlegroups.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33169-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 6904F109524
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in usb_bulk_msg

INFO: task syz.3.17:4981 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.17        state:D stack:26904 pid:4981  tgid:4980  ppid:4531   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5260 [inline]
 __schedule+0xeb0/0x3e50 kernel/sched/core.c:6867
 __schedule_loop kernel/sched/core.c:6949 [inline]
 schedule+0xdd/0x390 kernel/sched/core.c:6964
 schedule_timeout+0x127/0x280 kernel/time/sleep_timeout.c:99
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
 usb_start_wait_urb+0x147/0x4c0 drivers/usb/core/message.c:64
 usb_bulk_msg+0x22b/0x580 drivers/usb/core/message.c:388
 send_request_dev_dep_msg_in drivers/usb/class/usbtmc.c:1350 [inline]
 usbtmc_read.cold+0x48d/0xfe7 drivers/usb/class/usbtmc.c:1408
 vfs_read+0x1e4/0xb30 fs/read_write.c:570
 ksys_read+0x12a/0x250 fs/read_write.c:715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x570 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fab75baaeb9
RSP: 002b:00007fab75a0f028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007fab75e25fa0 RCX: 00007fab75baaeb9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007fab75c18c1f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fab75e26038 R14: 00007fab75e25fa0 R15: 00007ffcbc60e758
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/1:0/23:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000018fca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab98198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab98198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810ab98198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
1 lock held by khungtaskd/30:
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6775
6 locks held by kworker/1:1/38:
 #0: ffff888103e88548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90000287ca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abb0198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abb0198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff88810529f198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88810529f198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff88810529e160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff88810529e160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
6 locks held by kworker/0:2/1069:
 #0: ffff888103e88548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90001d6fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab98198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab98198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888117f24198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff888117f24198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888117f21160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888117f21160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by klogd/2853:
 #0: ffff8881f56390d8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested kernel/sched/core.c:639 [inline]
 #0: ffff8881f56390d8 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock kernel/sched/sched.h:1580 [inline]
 #0: ffff8881f56390d8 (&rq->__lock){-.-.}-{2:2}, at: rq_lock kernel/sched/sched.h:1907 [inline]
 #0: ffff8881f56390d8 (&rq->__lock){-.-.}-{2:2}, at: __schedule+0x2c5/0x3e50 kernel/sched/core.c:6772
2 locks held by getty/2928:
 #0: ffff8881163f10a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000452f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1500 drivers/tty/n_tty.c:2211
1 lock held by syz.3.17/4981:
 #0: ffff888120d3a0d8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_read+0x14a/0x270 drivers/usb/class/usbtmc.c:1394
2 locks held by syz.4.18/5437:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
 #1: ffff888120d3a0d8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_open+0x4c8/0x950 drivers/usb/class/usbtmc.c:189
6 locks held by kworker/1:3/5441:
 #0: ffff888103e88548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000197fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af38198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af38198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff8881076c0198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff8881076c0198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888104af0160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888104af0160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by syz.5.19/5896:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
3 locks held by kworker/0:3/5899:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90003dafca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abb0198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abb0198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810abb0198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
1 lock held by syz.6.20/6352:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
1 lock held by syz.7.21/6809:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
3 locks held by kworker/0:4/6813:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90006557ca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af38198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af38198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810af38198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
3 locks held by kworker/0:5/6814:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000659fca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af50198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af50198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810af50198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
6 locks held by kworker/1:4/6815:
 #0: ffff888103e88548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900065afca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af50198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af50198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff88810529d198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88810529d198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888105285160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888105285160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by syz.8.22/7270:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 30 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x1d7/0x230 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:161 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x141/0x190 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:346 [inline]
 watchdog+0xcc3/0xfe0 kernel/hung_task.c:515
 kthread+0x3b3/0x730 kernel/kthread.c:463
 ret_from_fork+0x6c3/0xa20 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:82
Code: 3a a3 01 e9 53 e3 02 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 53 b3 12 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff89207e10 EFLAGS: 00000246
RAX: 000000000015142d RBX: ffffffff8922eac0 RCX: ffffffff8753acd5
RDX: 0000000000000000 RSI: ffffffff88dec96c RDI: ffffffff878e97a0
RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed103eac66c5
R10: ffff8881f563362b R11: 0000000000000000 R12: fffffbfff1245d58
R13: 0000000000000000 R14: ffffffff8accd4d0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88826896a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff97c59ce80 CR3: 000000011e9b8000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:767
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:191 [inline]
 do_idle+0x35b/0x4b0 kernel/sched/idle.c:332
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:430
 rest_init+0x251/0x260 init/main.c:757
 start_kernel+0x475/0x480 init/main.c:1206
 x86_64_start_reservations+0x24/0x30 arch/x86/kernel/head64.c:310
 x86_64_start_kernel+0x122/0x130 arch/x86/kernel/head64.c:291
 common_startup_64+0x13e/0x148
 </TASK>


Tested on:

commit:         da87d45b usb: typec: ucsi: Add Thunderbolt alternate m..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=172f065a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1481e7fa580000


