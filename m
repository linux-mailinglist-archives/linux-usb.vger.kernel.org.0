Return-Path: <linux-usb+bounces-33161-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +X2+JH4uiGlskgQAu9opvQ
	(envelope-from <linux-usb+bounces-33161-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 07:34:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65E10802C
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 07:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4AA0130136B1
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 06:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E433451C1;
	Sun,  8 Feb 2026 06:34:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE4E17C211
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 06:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770532473; cv=none; b=K+w8YGerlW6W3nlMy4ppo4trkMnEAaSo5gdU4xYXFGMgwxnqxYSXG7LwZHnwysA6OzGQdAAwghsQkJje98bGCMzk4rAe/qR+s3nIrtTa/P/k4xC4RIJAkTJs36fPbAKWCTxW9DzCQE/f4vZVOnyLERw+URPRCwdhwaZ5FI2f+h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770532473; c=relaxed/simple;
	bh=zAHQlJdcrOTb/tryBbTwO64f1dYI/TPitz6s8CHv9uM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HpUL0NrolwJ04/Ahbly5SwkjhOBzwwtlrpQDz47HiWJKW6Jzdnwxox4KvhreL+uZomz+Vcf/QDE6TiCTWSRvxyH07J8XM9VodTw/T/CSBx5SbQfs4xpRNVhJyL3/UiEyAbSGwslIS/+25jFYtBoxy8b5IfFp8KFMavjC6KMAB0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-45f07dad7a8so3225877b6e.0
        for <linux-usb@vger.kernel.org>; Sat, 07 Feb 2026 22:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770532472; x=1771137272;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1d9OzBl7/9gSFlXtcsBTEF/oSVJcfxgSBEXagjGpPHc=;
        b=f2NsBAwgV2pKCnMAH97j9+lbd6nJTum64IIl/4L4F48wCvK3e+bl6uxTb6430RkWTO
         FkqTbJxlEZHkoI9QLc4brJk0HoslbxUiRSpdde2MxIC+p7Ew+iWmF5Pj3ySMBZb2N9Pf
         GdB8zLLeQFAKCC0J2eQPHj1bnUce9qluNf0dnj6/kPXBcJatrfsyh/yLMzQGYiB6q5Sk
         k/9Zw7A7NQQDjkTlrxd69goIgMIwIBVvOH2CxJnSH1rTAB6sVqPJ7a6s9B6jKlRsuA4T
         DH88G0x1ju9UpSz6l7rAV3Bwoqp7Phb3Y0jGkrgCTpKU53NZJP6ZsKS+E4Pm5fKgGufy
         uAVg==
X-Forwarded-Encrypted: i=1; AJvYcCVEcOXkWucvf3HuynbtNRGcGO9ttQw2rrIFuKsNJTKtUy/UWF44PxHo7b5yahtyWN+rIkslFHyO1D8=@vger.kernel.org
X-Gm-Message-State: AOJu0YykFywEVolLr4u/fI18rhcP3l5v8/cGfSEromu9avtWZMBBceLb
	pRk3CNgXgyA6YjwYnpTiU2HwOYebHDQ2zkoMqzyyD8UwyTRpFZEY42AHJcvSeuL053VIHsGwtul
	zPzrNa53krzd8vGf3STdzlwHjhNUmOjyfuRTeLk07sISK4WQIbqknqWHdxkc=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2299:b0:65f:6628:94fc with SMTP id
 006d021491bc7-66d0c667d64mr3514321eaf.63.1770532471700; Sat, 07 Feb 2026
 22:34:31 -0800 (PST)
Date: Sat, 07 Feb 2026 22:34:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69882e77.a00a0220.34fa92.003d.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
From: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33161-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,storage.googleapis.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,googlegroups.com:email,goo.gl:url]
X-Rspamd-Queue-Id: DB65E10802C
X-Rspamd-Action: no action

Hello,

syzbot found the following issue on:

HEAD commit:    da87d45b1951 usb: typec: ucsi: Add Thunderbolt alternate m..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15ee9402580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137967fa580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142fab22580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/36cc3979cfa9/disk-da87d45b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8b9c4e01e1ee/vmlinux-da87d45b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/071303491de6/bzImage-da87d45b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com

INFO: task syz.3.17:3963 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.17        state:D stack:27256 pid:3963  tgid:3963  ppid:3514   task_flags:0x400040 flags:0x00080002
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
 usbtmc_read+0x5f4/0x10b0 drivers/usb/class/usbtmc.c:1409
 vfs_read+0x1e4/0xb30 fs/read_write.c:570
 ksys_read+0x12a/0x250 fs/read_write.c:715
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xc9/0x570 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2b159faeb9
RSP: 002b:00007ffc49719d68 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007f2b15c75fa0 RCX: 00007f2b159faeb9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f2b15a68c1f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2b15c75fac R14: 00007f2b15c75fa0 R15: 00007f2b15c75fa0
 </TASK>

Showing all locks held in the system:
6 locks held by kworker/0:0/9:
 #0: ffff88810569bd48 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000009fca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff88810ca9f198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff88810ca9f198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff88810ca9c160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff88810ca9c160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
1 lock held by khungtaskd/30:
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff894da3a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6775
6 locks held by kworker/1:1/38:
 #0: ffff88810569bd48 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90000287ca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888103eaf198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff888103eaf198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff888103eab160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff888103eab160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
2 locks held by kworker/u8:10/1609:
 #0: ffff888100089148 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900022dfca8 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
2 locks held by kworker/u8:13/2771:
 #0: ffff888100089148 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc9000406fca8 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
3 locks held by kworker/0:2/2820:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc900041afca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810a7ae198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
2 locks held by getty/2925:
 #0: ffff88811277a0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000452f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x419/0x1500 drivers/tty/n_tty.c:2211
1 lock held by syz.3.17/3963:
 #0: ffff88811b42ccd8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_read+0x154/0x10b0 drivers/usb/class/usbtmc.c:1395
2 locks held by syz.4.18/4418:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
 #1: ffff88811b42ccd8 (&data->io_mutex){+.+.}-{4:4}, at: usbtmc_open+0x4c8/0x950 drivers/usb/class/usbtmc.c:189
1 lock held by syz.5.19/4873:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
3 locks held by kworker/1:3/4877:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90006717ca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810a7c6198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
1 lock held by syz.6.20/5329:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
6 locks held by kworker/0:3/5332:
 #0: ffff88810569bd48 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90006e57ca8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5899
 #3: ffff888103ea8198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #3: ffff888103ea8198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #4: ffff88810b6c3160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #4: ffff88810b6c3160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1006
 #5: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_register_dev+0x11d/0x570 drivers/usb/core/file.c:134
3 locks held by kworker/1:4/5738:
 #0: ffff888100071948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x11ae/0x1840 kernel/workqueue.c:3232
 #1: ffffc90005bafca8 ((work_completion)(&fw_work->work)){+.+.}-{0:0}, at: process_one_work+0x927/0x1840 kernel/workqueue.c:3233
 #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:895 [inline]
 #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_fail drivers/net/wireless/ath/ath9k/hif_usb.c:1161 [inline]
 #2: ffff88810ab4e198 (&dev->mutex){....}-{4:4}, at: ath9k_hif_usb_firmware_cb+0x3b2/0x530 drivers/net/wireless/ath/ath9k/hif_usb.c:1294
1 lock held by syz.7.21/5786:
 #0: ffffffff8a0d7bb0 (minor_rwsem){++++}-{4:4}, at: usb_open+0x23/0x220 drivers/usb/core/file.c:38
2 locks held by modprobe/5990:

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
CPU: 0 UID: 0 PID: 5991 Comm: modprobe Not tainted syzkaller #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/24/2026
RIP: 0010:hlock_class kernel/locking/lockdep.c:229 [inline]
RIP: 0010:check_wait_context kernel/locking/lockdep.c:4879 [inline]
RIP: 0010:__lock_acquire+0x341/0x2630 kernel/locking/lockdep.c:5187
Code: 38 c7 44 0f 47 f8 80 be c6 00 00 00 02 44 0f 44 f8 41 83 c6 01 48 83 c3 28 44 3b b5 a0 0a 00 00 0f 8d b2 00 00 00 0f b7 43 20 <66> 25 ff 1f 0f b7 c0 48 0f a3 05 10 d5 42 0d 72 a9 44 8b 1d 27 81
RSP: 0000:ffffc9000411f8a0 EFLAGS: 00000006
RAX: 00000000000083c5 RBX: ffff888116cc6268 RCX: 0000000000000005
RDX: 0000000000000001 RSI: ffff888116cc6240 RDI: 0000000000000000
RBP: ffff888116cc57c0 R08: 0000000000000000 R09: 0000000000000007
R10: 0000000000000005 R11: 0000000000000000 R12: ffff888116cc6330
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000005
FS:  00007feb72295c80(0000) GS:ffff88826896a000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007feb724d4b45 CR3: 0000000122c10000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 lock_acquire kernel/locking/lockdep.c:5868 [inline]
 lock_acquire+0x17c/0x330 kernel/locking/lockdep.c:5825
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:867 [inline]
 page_table_check_set+0x2d3/0xa10 mm/page_table_check.c:112
 __page_table_check_ptes_set+0x1db/0x230 mm/page_table_check.c:212
 page_table_check_ptes_set include/linux/page_table_check.h:76 [inline]
 set_ptes include/linux/pgtable.h:292 [inline]
 set_pte_range+0x54f/0x630 mm/memory.c:5483
 filemap_map_order0_folio mm/filemap.c:3856 [inline]
 filemap_map_pages+0x91f/0x1df0 mm/filemap.c:3921
 do_fault_around mm/memory.c:5713 [inline]
 do_read_fault mm/memory.c:5746 [inline]
 do_fault mm/memory.c:5889 [inline]
 do_pte_missing mm/memory.c:4401 [inline]
 handle_pte_fault mm/memory.c:6273 [inline]
 __handle_mm_fault+0x1e8c/0x2d30 mm/memory.c:6411
 handle_mm_fault+0x36d/0xa20 mm/memory.c:6580
 do_user_addr_fault+0x5ae/0x11d0 arch/x86/mm/fault.c:1336
 handle_page_fault arch/x86/mm/fault.c:1476 [inline]
 exc_page_fault+0x66/0xc0 arch/x86/mm/fault.c:1532
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:618
RIP: 0033:0x7feb723976c0
Code: 48 89 ef e8 b2 ec fe ff 85 c0 75 de 49 8b 47 08 80 38 2f 48 89 44 24 08 0f 85 8c 01 00 00 48 63 44 24 30 48 8d 15 80 d4 13 00 <0f> b6 1c 02 48 89 c7 48 8d 05 92 d4 13 00 48 01 c3 e8 ea e4 ff ff
RSP: 002b:00007ffc4877cef0 EFLAGS: 00010246
RAX: 0000000000000005 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 00007feb724d4b40 RSI: 0000000000000000 RDI: 00007feb725309e0
RBP: 00007feb724eec96 R08: 00007feb725309e0 R09: 0000000000000000
R10: 000000000000006c R11: 0000000000000217 R12: 00007feb724ef1e4
R13: ffffffffffffff88 R14: 0000000000000002 R15: 0000000000000000
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

