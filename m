Return-Path: <linux-usb+bounces-33174-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG0+MkXziGnqzQQAu9opvQ
	(envelope-from <linux-usb+bounces-33174-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:34:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BDD10A1CA
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 798D9300B9DA
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 20:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3B3342CB6;
	Sun,  8 Feb 2026 20:34:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B436E26CE2C
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770582843; cv=none; b=lkOsfCkHPoUIO0cHJ5AaYs+A6EWsyBUml4cT3iOg+wYMKhfEJLgDiXlTZY0XkwFqgid9Bxy75rkQJDI2OrvzTyj+/6oLqoRJ2FP7Zfyufi39EwSqe8K8jE0st9Vu5Bqjhtf59teyD8hNvlltkecXpsYtjHJf5yYesaoscEawJ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770582843; c=relaxed/simple;
	bh=srIIk7IcHMdo/TwFDp3nqlp6oz+dYObo8XucW47q6Fc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=aaCXiqsz7+36fKKd5dDRQu2GRwidLHuZM1Dhe5c2l7P4lMnPXxtaVENOiV1qglUEEI8Q99rllkPedJa5YWJvJVLn3mT24/aM/3JKVeIcY043+xuBS4cPCVfnAYOPs3tjTj/uMoA3j//fBCK0LQrY8eUaqWkDh+B09oyTRGruF1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6630b0a016aso15301983eaf.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 12:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770582842; x=1771187642;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEIXnNANGGGMY5UOJqGGeBPh7A+CGJzTWrdDf5YQbGc=;
        b=Hrsc8MPEmjNqCOmCCrFLR1oM/6uqHOF8i++WRqM0fgCpVuipZ0KG+RMLTlfoH7aHoN
         H7NUnWiZp/Xci7BTPA8bOiklJx/eOYEsFMWEm3bdMtVJLogx0hxPDJnLGl3sLQ/tcw/R
         xJDAtzLdgdiXgwR1+8OfWbyG0u+AspAM1mC0x0VvXLKQT/qVVTz+dZfwJtmZB3A78Jd5
         qhH66NV/+9zTerzc4xc9nTSc8sKzp0bGqjcSVmkzA406IZt5J6m6v4EF+A+PdeeV/SGs
         /v4L/9HLOPjr/x1qBVs2QtMl4rI+zS57lsALzXpY7ZjZV5B/ryrij6SjOPCm9Uxx+DDM
         Bdaw==
X-Forwarded-Encrypted: i=1; AJvYcCXOAao5fW0E76Yz4OUyE5AIgIyHREYEyj0pqpdN5iyR3M7pT0HOlAlGvFYPWTVcz46ppttQOEItqds=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdEoRTIKNEjbGWRnC6byZzDlN/CiG5XiwigKOp6r8WwduXmak
	IsXVbxHS3Wmw3FpHmiH5Q0f5zUq0cj/8UE7BN8qvzKarqmk9A2XiWh62radl5+9lS1/2uLKkWgH
	Izb3q4ZGKLw3qMQQT3wIHZj2HjVwi1EpYFs2gyec3QfHJ9zN9RREYAiX2DS4=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:806:b0:66a:adbb:31bf with SMTP id
 006d021491bc7-66d0c94efbamr4747648eaf.62.1770582842603; Sun, 08 Feb 2026
 12:34:02 -0800 (PST)
Date: Sun, 08 Feb 2026 12:34:02 -0800
In-Reply-To: <d19d2ca8-4759-488a-a39e-0198ca037dfb@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6988f33a.050a0220.3b3015.0060.GAE@google.com>
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
	TAGGED_FROM(0.00)[bounces-33174-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: E2BDD10A1CA
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in usb_bulk_msg

INFO: task syz.3.17:4978 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.17        state:D stack:27432 pid:4978  tgid:4976  ppid:4527   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5260 [inline]
 __schedule+0xeb0/0x3e50 kernel/sched/core.c:6867
 __schedule_loop kernel/sched/core.c:6949 [inline]
 schedule+0xdd/0x390 kernel/sched/core.c:6964
 schedule_timeout+0x127/0x280 kernel/time/sleep_timeout.c:99
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
 usb_start_wait_urb+0x157/0x270 drivers/usb/core/message.c:67
 usb_bulk_msg+0x22b/0x580 drivers/usb/core/message.c:394
 send_request_dev_dep_msg_in drivers/usb/class/usbtmc.c:1350 [inline]
 usbtmc_read.cold+0x48d/0xfe7 drivers/usb/class/usbtmc.c:1408
 vfs_read+0x1e4/0xb30 fs/read_write.c:570
 ksys_read+0x12a/0x250 fs/read_write.c:715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x570 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7eff6393aeb9
RSP: 002b:00007eff63797028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007eff63bb5fa0 RCX: 00007eff6393aeb9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007eff639a8c1f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007eff63bb6038 R14: 00007eff63bb5fa0 R15: 00007ffcb37c7118
 </TASK>

Showing all locks held in the system:
6 locks held by kworker/0:0/9:
 #0: ffff8881056f0548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000009fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab0c198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab0c198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888117bc9198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff888117bc9198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff88811edf8160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff88811edf8160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
6 locks held by kworker/1:0/23:
 #0: ffff8881056f0548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000018fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab9c198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab9c198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff88811d544198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88811d544198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff88811d545160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff88811d545160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by khungtaskd/30:
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6775
3 locks held by kworker/1:2/700:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90001a2fca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab0c198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab0c198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810ab0c198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
2 locks held by getty/2922:
 #0: ffff8881012830a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000452f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1500 drivers/tty/n_tty.c:2211
6 locks held by kworker/0:2/2989:
 #0: ffff8881056f0548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900017dfca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810a7f4198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810a7f4198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff88810f39e198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88810f39e198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888105b6d160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888105b6d160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
3 locks held by kworker/1:3/3481:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000183fca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810a7f4198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810a7f4198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810a7f4198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
1 lock held by syz.3.17/4978:
 #0: ffff88811db8bcd8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_read+0x14a/0x270 drivers/usb/class/usbtmc.c:1394
2 locks held by syz.4.18/5433:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
 #1: ffff88811db8bcd8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_open+0x4c8/0x950 drivers/usb/class/usbtmc.c:189
1 lock held by syz.5.19/5891:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
6 locks held by kworker/0:3/6183:
 #0: ffff8881056f0548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90004f6fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abb4198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abb4198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888117bce198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff888117bce198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888117bca160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888117bca160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by syz.6.20/6348:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
1 lock held by syz.7.21/6805:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
3 locks held by kworker/0:4/6809:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90006a77ca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab9c198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab9c198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810ab9c198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
1 lock held by syz.8.22/7265:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
3 locks held by kworker/1:5/7269:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90007cffca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abb4198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abb4198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810abb4198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294

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
RIP: 0010:arch_static_branch arch/x86/include/asm/jump_label.h:37 [inline]
RIP: 0010:native_write_msr arch/x86/include/asm/msr.h:139 [inline]
RIP: 0010:wrmsrq arch/x86/include/asm/msr.h:199 [inline]
RIP: 0010:native_apic_msr_write arch/x86/include/asm/apic.h:212 [inline]
RIP: 0010:native_apic_msr_write+0x28/0x40 arch/x86/include/asm/apic.h:206
Code: 90 90 f3 0f 1e fa 8d 87 30 ff ff ff 83 e0 ef 74 20 89 f8 83 e0 ef 83 f8 20 74 16 c1 ef 04 31 d2 89 f0 8d 8f 00 08 00 00 0f 30 <66> 90 e9 11 a9 e8 05 e9 0c a9 e8 05 89 f6 31 d2 89 cf e9 a1 af 65
RSP: 0018:ffffc90000007ec8 EFLAGS: 00000046
RAX: 0000000002db1b93 RBX: ffff8881f5623d00 RCX: 0000000000000838
RDX: 0000000000000000 RSI: 0000000002db1b93 RDI: 0000000000000038
RBP: 0000000002db1b93 R08: 0000000000000005 R09: 000000000000003f
R10: 0000000000000020 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000020 R15: ffff8881f56280c0
FS:  0000000000000000(0000) GS:ffff88826896a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fae4eb19e80 CR3: 000000011c80c000 CR4: 00000000003506f0
Call Trace:
 <IRQ>
 apic_write arch/x86/include/asm/apic.h:409 [inline]
 lapic_next_event+0x10/0x20 arch/x86/kernel/apic/apic.c:418
 clockevents_program_event+0x26e/0x360 kernel/time/clockevents.c:334
 tick_program_event+0xa9/0x140 kernel/time/tick-oneshot.c:48
 hrtimer_interrupt+0x3e9/0x8c0 kernel/time/hrtimer.c:1916
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1045 [inline]
 __sysvec_apic_timer_interrupt+0x109/0x3c0 arch/x86/kernel/apic/apic.c:1062
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1056 [inline]
 sysvec_apic_timer_interrupt+0x8a/0xb0 arch/x86/kernel/apic/apic.c:1056
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:697
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:82
Code: 4a a3 01 e9 53 e3 02 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 53 c3 12 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffffff89207e10 EFLAGS: 00000246
RAX: 0000000000e57769 RBX: ffffffff8922eac0 RCX: ffffffff87539cd5
RDX: 0000000000000000 RSI: ffffffff88dec98e RDI: ffffffff878e97a0
RBP: 0000000000000000 R08: 0000000000000001 R09: ffffed103eac66c5
R10: ffff8881f563362b R11: 0000000000000000 R12: fffffbfff1245d58
R13: 0000000000000000 R14: ffffffff8accd4d0 R15: 0000000000000000
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
console output: https://syzkaller.appspot.com/x/log.txt?x=15a95402580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11095402580000


