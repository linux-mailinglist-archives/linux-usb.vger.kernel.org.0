Return-Path: <linux-usb+bounces-33176-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLgSCsYFiWnD1AQAu9opvQ
	(envelope-from <linux-usb+bounces-33176-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 22:53:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5210A47A
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 22:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04DF3300A8CC
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 21:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5F934D4FD;
	Sun,  8 Feb 2026 21:53:04 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF67343D7F
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 21:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770587584; cv=none; b=kZvMpVeGT6G47QEgn7WNkQeAiykfFuSZcROHYu7D10N/37bX0Oa1VqOwFCgC/RPOa85NCnYibxddJNM38B33jT1mFtgrdx1hBNQFEQFuyaU6o67cEvLBvcquR1rThmNy+Pgc+7qvyQ1X2ut2aLn4JILz/IEB5O64NOkK9mEHOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770587584; c=relaxed/simple;
	bh=An1KHhzwDTVjSlUU8NzW4Yxd93ho8/sFqgBvdk4VKFA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z/HwmT7jkmBCshnGLNq8wUX0IMI4533nGjk/n9PSxoV83bGvw90wtEILEsduWUb/VIxWvydrM67ctB+wh1ynarHaUj4yAy0W7M73yS9pmdQeqB2vxpPTRAyyOBwUc23i7rS4haBGgDVIYKsUFEYJYYxa5U0L+LJoZNNMx5swuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-40a5fc701e9so13118366fac.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 13:53:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770587583; x=1771192383;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D7T8LwlyyNjiYlVgCNLp826nmtbNKximDRK+RqC9l4=;
        b=BXANn9ca8rpfWHyA8sFOl4UzVV4gPXwp+BiEA/M5+T7msvVNnV1W+TQ//ZL1eSXWF8
         DqO6RRAGvkMYJs++ooGkXOsHbwRmoEN1nNwjOQVxZgwy3OwbYzMskqC8W0QDjyqQUU5w
         ek7AEOYmkvQGGd2Scmxw0zzGk2E2I6k5axUd+tfZh51NfG9NDpZmxiuakLnsWvO56M0Y
         HFJJsSKbERPxUHBm56UA1mlNRDIt3JavWvS1TgE3UmLCZpI6lyFoyL1EsvPXdJMPEAy+
         wameoL0rYKmfxwoI4trjKte5YT9Faa0BljAIgcnDibmd+gOcB71Pj3O5znKLMqRWuq5A
         zwSA==
X-Forwarded-Encrypted: i=1; AJvYcCXqzIGINgL3R/IkzVm66/3Ccd/W+0yCJrpZMGuB7APqNYYtSYuQHFGekPRNHlt27xb0ZpuldBMJWnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqEx14ZWWyGobNs2eRAVIs/+X33IgKqQP3wbG7pvCzi99slgqS
	uu2f8lCC0YrBSiR09DYlXIFK9IdzmvgYhnGgZ3mF9xDF15tI8M3g//7qpDBC/+awMHBRxje9PhJ
	jnbCF/0qXmor6Hd74TuWWa3fg67GGJ4pX2U/Ic5HFRO8BnJMF11/2WyoiqPk=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:201:b0:662:c09a:903d with SMTP id
 006d021491bc7-66d0d6db262mr4212012eaf.79.1770587582900; Sun, 08 Feb 2026
 13:53:02 -0800 (PST)
Date: Sun, 08 Feb 2026 13:53:02 -0800
In-Reply-To: <f0d78b66-4022-4b65-ad38-86daec39bc7e@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <698905be.050a0220.3b3015.0061.GAE@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,rowland.harvard.edu,googlegroups.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33176-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7BA5210A47A
X-Rspamd-Action: no action

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in usb_bulk_msg

INFO: task syz.3.17:4974 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.17        state:D stack:27384 pid:4974  tgid:4973  ppid:4524   task_flags:0x400040 flags:0x00080002
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
 send_request_dev_dep_msg_in drivers/usb/class/usbtmc.c:1352 [inline]
 usbtmc_read.cold+0x59f/0x1075 drivers/usb/class/usbtmc.c:1410
 vfs_read+0x1e4/0xb30 fs/read_write.c:570
 ksys_read+0x12a/0x250 fs/read_write.c:715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x570 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fbce20eaeb9
RSP: 002b:00007fbce1f4f028 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007fbce2365fa0 RCX: 00007fbce20eaeb9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007fbce2158c1f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fbce2366038 R14: 00007fbce2365fa0 R15: 00007ffc4a036e78
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/0:0/9:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000009fca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af81198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af81198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810af81198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
3 locks held by kworker/0:1/10:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900000afca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abf9198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abf9198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810abf9198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
6 locks held by kworker/1:0/23:
 #0: ffff888105287548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000018fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abf9198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abf9198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff88811b56e198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88811b56e198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888106aed160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888106aed160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by khungtaskd/30:
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6775
6 locks held by kworker/1:1/65:
 #0: ffff888105287548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900005b7ca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abe1198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abe1198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888113911198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff888113911198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888113910160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888113910160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
3 locks held by kworker/1:2/1122:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90001dcfca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810abe1198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810abe1198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810abe1198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
2 locks held by getty/2924:
 #0: ffff88811286f0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000452f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1500 drivers/tty/n_tty.c:2211
6 locks held by kworker/0:2/3000:
 #0: ffff888105287548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900018efca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af99198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af99198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff88811bd0a198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88811bd0a198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888117864160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888117864160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by syz.3.17/4974:
 #0: ffff88811d6230d8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_read+0x14a/0x270 drivers/usb/class/usbtmc.c:1396
2 locks held by syz.4.18/5430:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
 #1: ffff88811d6230d8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_open+0x4c8/0x950 drivers/usb/class/usbtmc.c:189
1 lock held by syz.5.19/5887:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
1 lock held by syz.6.20/6345:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
6 locks held by kworker/1:4/6349:
 #0: ffff888105287548 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900051cfca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af81198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af81198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888117993198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff888117993198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888104ae9160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888104ae9160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by syz.7.21/6804:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
1 lock held by syz.8.22/7262:
 #0: ffffffff8a0d7bd0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
3 locks held by kworker/1:6/7266:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900077cfca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810af99198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810af99198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810af99198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 30 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(voluntary) 
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
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
RIP: 0010:__update_blocked_fair kernel/sched/fair.c:9868 [inline]
RIP: 0010:sched_balance_update_blocked_averages+0x456/0x1dd0 kernel/sched/fair.c:9963
Code: 00 00 49 8b 9e 98 01 00 00 48 89 84 24 90 00 00 00 0f 85 fb 07 00 00 48 8d bb 28 01 00 00 48 89 f8 48 c1 e8 03 42 80 3c 20 00 <0f> 85 84 0f 00 00 48 8b 44 24 70 48 03 83 28 01 00 00 48 89 c3 48
RSP: 0018:ffffc900001a8d50 EFLAGS: 00000046
RAX: 1ffffffff19a16dd RBX: ffffffff8cd0b5c0 RCX: ffffffff81897273
RDX: 1ffff1103eae7263 RSI: ffffffff878e9720 RDI: ffffffff8cd0b6e8
RBP: ffffc900001a8e20 R08: ffff8881f5739318 R09: fffffbfff1599a9a
R10: ffffffff8accd4d7 R11: ffff8881f5739208 R12: dffffc0000000000
R13: ffff8881f5739998 R14: ffff8881f5739180 R15: ffff8881f57392f8
FS:  0000000000000000(0000) GS:ffff888268a6a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd3354aae80 CR3: 000000011736a000 CR4: 00000000003506f0
Call Trace:
 <IRQ>
 update_nohz_stats kernel/sched/fair.c:12661 [inline]
 _nohz_idle_balance.isra.0+0x667/0x860 kernel/sched/fair.c:12729
 handle_softirqs+0x1dd/0x8f0 kernel/softirq.c:622
 __do_softirq kernel/softirq.c:656 [inline]
 invoke_softirq kernel/softirq.c:496 [inline]
 __irq_exit_rcu+0xed/0x150 kernel/softirq.c:723
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:739
 instr_sysvec_call_function_single arch/x86/kernel/smp.c:266 [inline]
 sysvec_call_function_single+0x8f/0xb0 arch/x86/kernel/smp.c:266
 </IRQ>
 <TASK>
 asm_sysvec_call_function_single+0x1a/0x20 arch/x86/include/asm/idtentry.h:704
RIP: 0010:pv_native_safe_halt+0xf/0x20 arch/x86/kernel/paravirt.c:82
Code: 4a a3 01 e9 53 e3 02 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 66 90 0f 00 2d 53 c3 12 00 fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90 90 90 90 90 90
RSP: 0018:ffffc9000013fe00 EFLAGS: 00000246
RAX: 0000000000df6769 RBX: ffff888101ecba80 RCX: ffffffff87539cd5
RDX: 0000000000000000 RSI: ffffffff88dec9ce RDI: ffffffff878e97a0
RBP: 0000000000000001 R08: 0000000000000001 R09: ffffed103eae66c5
R10: ffff8881f573362b R11: 0000000000000000 R12: ffffed10203d9750
R13: 0000000000000001 R14: ffffffff8accd4d0 R15: 0000000000000000
 arch_safe_halt arch/x86/include/asm/paravirt.h:107 [inline]
 default_idle+0x9/0x10 arch/x86/kernel/process.c:767
 default_idle_call+0x6c/0xb0 kernel/sched/idle.c:122
 cpuidle_idle_call kernel/sched/idle.c:191 [inline]
 do_idle+0x35b/0x4b0 kernel/sched/idle.c:332
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:430
 start_secondary+0x21d/0x2d0 arch/x86/kernel/smpboot.c:312
 common_startup_64+0x13e/0x148
 </TASK>


Tested on:

commit:         da87d45b usb: typec: ucsi: Add Thunderbolt alternate m..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11b0765a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=135aaa52580000


