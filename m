Return-Path: <linux-usb+bounces-32529-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ew0AktwcGktYAAAu9opvQ
	(envelope-from <linux-usb+bounces-32529-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:20:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EE251FB3
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 07:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E83CE822297
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 11:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6DB423A71;
	Tue, 20 Jan 2026 11:33:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f80.google.com (mail-oa1-f80.google.com [209.85.160.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DE6423157
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768908810; cv=none; b=UIcU2OnncwB3sOhBYOzS9/8TCkXI2ei3ltwmjMb9Ecn8+3zu4Gb28SsHB16wgkeTdWdXFtj5FyjEqo8pNLtc9OcNUv3XlfMWX8DOREPXLPo/m7BziKzeU7/A7PsUF4x68eouoCZ0MUnFBPjHgVjhYiYHQDrjioaf4RU4AJp2+DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768908810; c=relaxed/simple;
	bh=c8OGHlK4BBtriCcGmUNZmXndbqceT2s3iCv3i2RXnEk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kd8NUUjCWcydFvP1GgX6YQ7A7wp0HfGe25o+l49nboUYeu3EzGSPn848GMTtYULYp4sLZk4NwsVzL5qJ4QCz/8CQr3EyYJNN1fHWyxJFZB9Aq3BLfnTodtvGh9sa36GPIOgIZXwse3aFVKNepF2WR6mMR0GKr+4fX9nZ2Sb2t8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f80.google.com with SMTP id 586e51a60fabf-4040b9ea153so6746639fac.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 03:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908807; x=1769513607;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sn9Yh8qMYa4QuWPShr6nGLHX87DgFa+xeRwt2QGLZPU=;
        b=iuMyU+idGSyvGqAlzycOL+A5XM0cytJmGgVMds7sggod2P5Rg2q86/u5tPlXArTUFC
         pHOBj+tGovl4GkXBdDUjHgXLHYzqFVSaEbEmDjfKYXrsYwAnYiuMlZSYVEPlk3Y5mCZB
         tVm57xwnRHEPpXH+6eNbRaXZX03zjrb0f6y4oIHLWHN2Dy2pmmgRdwoGFxFkDdeqIKsA
         und4NLapoOJ5/zmDHDvJooB2OCBf7TVlA8C5VaBY17gBOZgXT555FQ6k3WQL4wXfIeFn
         XelBRtgKsrKF3210iOPPDTfZniTuInn005N4CYakDJSs9HjUIlN9nJ3r9oNmwf/djrQB
         p6gg==
X-Forwarded-Encrypted: i=1; AJvYcCU3+SnLqc6WBor7HioQrjeYERkwub1VAiDt3hQSZLhB2mybOwpAAwppY+rlsMTwAl1NLRZGnjw+w+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMrCaIPDtK4ZO7ixLP1Nx9IPxnszTXJUgOIH65nrqm2enXZWWL
	qBCO20uTOJHwtIYIUcawGWEhIZfMa0UQLCLiQWNFFljw/HKreZDK8qhrgxZ03/kwGZ4l7MO2MXn
	sgg1lsOwr57weYDFZhnRPk1Q4OY0GtboR5/yZ8H3/k8uUnC8hzb+7hFMmlyo=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:bb8a:0:b0:661:1b82:ff3c with SMTP id
 006d021491bc7-6611b830a0fmr4025842eaf.18.1768908807464; Tue, 20 Jan 2026
 03:33:27 -0800 (PST)
Date: Tue, 20 Jan 2026 03:33:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696f6807.050a0220.4cb9c.0010.GAE@google.com>
Subject: [syzbot] [usb?] KASAN: slab-use-after-free Read in event_handler
From: syzbot <syzbot+62c1aa73226b3ac3b107@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, shuah@kernel.org, syzkaller-bugs@googlegroups.com, 
	valentina.manea.m@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=c33bf4a3a0c7a4f1];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : No valid SPF, No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,zenithal.me,vger.kernel.org,kernel.org,googlegroups.com,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32529-lists,linux-usb=lfdr.de,62c1aa73226b3ac3b107];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,syzkaller.appspot.com:url,appspotmail.com:email,goo.gl:url,storage.googleapis.com:url];
	REDIRECTOR_URL(0.00)[goo.gl];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 62EE251FB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

syzbot found the following issue on:

HEAD commit:    24d479d26b25 Linux 6.19-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12d11852580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c33bf4a3a0c7a4f1
dashboard link: https://syzkaller.appspot.com/bug?extid=62c1aa73226b3ac3b107
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f0555f920605/disk-24d479d2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ae277d28fcd2/vmlinux-24d479d2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b4f8db4a51a6/bzImage-24d479d2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+62c1aa73226b3ac3b107@syzkaller.appspotmail.com

vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: relea[   23.071571][   T13] vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
vhci_hcd vhci_hcd.15: stop threads
vhci_hcd vhci_hcd.15: release socket
vhci_hcd vhci_hcd.15: disconnect device
==================================================================
BUG: KASAN: slab-use-after-free in __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
BUG: KASAN: slab-use-after-free in _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:162
Read of size 1 at addr ffff8881477add10 by task kworker/u8:1/13

CPU: 0 UID: 0 PID: 13 Comm: kworker/u8:1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: usbip_event event_handler
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xba/0x230 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 __kasan_check_byte+0x2a/0x40 mm/kasan/common.c:574
 kasan_check_byte include/linux/kasan.h:402 [inline]
 lock_acquire+0x84/0x330 kernel/locking/lockdep.c:5842
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x40/0x60 kernel/locking/spinlock.c:162
 rt_mutex_slowunlock+0xbf/0x8b0 kernel/locking/rtmutex.c:1417
 spin_unlock_irqrestore include/linux/spinlock_rt.h:122 [inline]
 __wake_up_common_lock+0x18a/0x1e0 kernel/sched/wait.c:127
 event_handler+0x3cb/0x4b0 drivers/usb/usbip/usbip_event.c:96
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xaec/0x17a0 kernel/workqueue.c:3340
 worker_thread+0x89f/0xd90 kernel/workqueue.c:3421
 kthread+0x726/0x8b0 kernel/kthread.c:463
 ret_from_fork+0x51b/0xa40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>

Allocated by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5657 [inline]
 __kmalloc_noprof+0x235/0x7c0 mm/slub.c:5669
 kmalloc_noprof include/linux/slab.h:961 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 __usb_create_hcd+0x67/0x920 drivers/usb/core/hcd.c:2570
 vhci_hcd_probe+0x104/0x3f0 drivers/usb/usbip/vhci_hcd.c:1378
 platform_probe+0xf9/0x190 drivers/base/platform.c:1446
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0xac0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:831
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:959
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c8/0x450 drivers/base/dd.c:1031
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1086
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb80 drivers/base/core.c:3689
 platform_device_add+0x46a/0x800 drivers/base/platform.c:757
 platform_device_register_full+0x46c/0x570 drivers/base/platform.c:885
 vhci_hcd_init+0x1e9/0x390 drivers/usb/usbip/vhci_hcd.c:1557
 do_one_initcall+0x250/0x840 init/main.c:1378
 do_initcall_level+0x104/0x190 init/main.c:1440
 do_initcalls+0x59/0xa0 init/main.c:1456
 kernel_init_freeable+0x2a6/0x3d0 init/main.c:1688
 kernel_init+0x1d/0x1d0 init/main.c:1578
 ret_from_fork+0x51b/0xa40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Freed by task 1:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2540 [inline]
 slab_free mm/slub.c:6670 [inline]
 kfree+0x1bb/0x8f0 mm/slub.c:6878
 vhci_hcd_probe+0x258/0x3f0 drivers/usb/usbip/vhci_hcd.c:1415
 platform_probe+0xf9/0x190 drivers/base/platform.c:1446
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0xac0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:831
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:959
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
 __device_attach+0x2c8/0x450 drivers/base/dd.c:1031
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1086
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:574
 device_add+0x7b6/0xb80 drivers/base/core.c:3689
 platform_device_add+0x46a/0x800 drivers/base/platform.c:757
 platform_device_register_full+0x46c/0x570 drivers/base/platform.c:885
 vhci_hcd_init+0x1e9/0x390 drivers/usb/usbip/vhci_hcd.c:1557
 do_one_initcall+0x250/0x840 init/main.c:1378
 do_initcall_level+0x104/0x190 init/main.c:1440
 do_initcalls+0x59/0xa0 init/main.c:1456
 kernel_init_freeable+0x2a6/0x3d0 init/main.c:1688
 kernel_init+0x1d/0x1d0 init/main.c:1578
 ret_from_fork+0x51b/0xa40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 insert_work+0x3d/0x330 kernel/workqueue.c:2180
 __queue_work+0xcfd/0xff0 kernel/workqueue.c:2335
 queue_work_on+0x106/0x1c0 kernel/workqueue.c:2386
 usb_rh_urb_dequeue drivers/usb/core/hcd.c:849 [inline]
 unlink1+0x34c/0x3f0 drivers/usb/core/hcd.c:1584
 usb_hcd_unlink_urb+0xda/0x1d0 drivers/usb/core/hcd.c:1621
 usb_kill_urb+0x10b/0x2f0 drivers/usb/core/urb.c:717
 hub_quiesce+0x210/0x320 drivers/usb/core/hub.c:1412
 hub_suspend+0x7e8/0x9b0 drivers/usb/core/hub.c:4008
 usb_suspend_interface drivers/usb/core/driver.c:1323 [inline]
 usb_suspend_both+0x31f/0x1310 drivers/usb/core/driver.c:1445
 usb_runtime_suspend+0x58/0x110 drivers/usb/core/driver.c:1997
 __rpm_callback+0x2be/0x7a0 drivers/base/power/runtime.c:406
 rpm_callback drivers/base/power/runtime.c:460 [inline]
 rpm_suspend+0x87d/0x16e0 drivers/base/power/runtime.c:698
 __pm_runtime_suspend+0x12c/0x1a0 drivers/base/power/runtime.c:1167
 pm_runtime_autosuspend include/linux/pm_runtime.h:415 [inline]
 usb_runtime_idle+0x76/0x90 drivers/usb/core/driver.c:2034
 rpm_idle+0x383/0x8d0 drivers/base/power/runtime.c:550
 pm_runtime_work+0x11e/0x1b0 drivers/base/power/runtime.c:995
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xaec/0x17a0 kernel/workqueue.c:3340
 worker_thread+0x89f/0xd90 kernel/workqueue.c:3421
 kthread+0x726/0x8b0 kernel/kthread.c:463
 ret_from_fork+0x51b/0xa40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

Second to last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 insert_work+0x3d/0x330 kernel/workqueue.c:2180
 __queue_work+0xcfd/0xff0 kernel/workqueue.c:2335
 queue_work_on+0x106/0x1c0 kernel/workqueue.c:2386
 rh_call_control drivers/usb/core/hcd.c:711 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:821 [inline]
 usb_hcd_submit_urb+0x11db/0x1b50 drivers/usb/core/hcd.c:1542
 usb_start_wait_urb+0x12b/0x510 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
 get_port_status drivers/usb/core/hub.c:607 [inline]
 hub_ext_port_status+0x116/0x820 drivers/usb/core/hub.c:624
 usb_hub_port_status drivers/usb/core/hub.c:674 [inline]
 hub_activate+0x6eb/0x1a80 drivers/usb/core/hub.c:1185
 process_one_work kernel/workqueue.c:3257 [inline]
 process_scheduled_works+0xaec/0x17a0 kernel/workqueue.c:3340
 worker_thread+0x89f/0xd90 kernel/workqueue.c:3421
 kthread+0x726/0x8b0 kernel/kthread.c:463
 ret_from_fork+0x51b/0xa40 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

The buggy address belongs to the object at ffff8881477ac000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 7440 bytes inside of
 freed 8192-byte region [ffff8881477ac000, ffff8881477ae000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1477a8
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x500000000000040(head|node=1|zone=2)
page_type: f5(slab)
raw: 0500000000000040 ffff88813fe27280 dead000000000122 0000000000000000
raw: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0500000000000040 ffff88813fe27280 dead000000000122 0000000000000000
head: 0000000000000000 0000000000020002 00000000f5000000 0000000000000000
head: 0500000000000003 ffffea00051dea01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 22636347125, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x228/0x280 mm/page_alloc.c:1884
 prep_new_page mm/page_alloc.c:1892 [inline]
 get_page_from_freelist+0x28bb/0x2950 mm/page_alloc.c:3945
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5240
 alloc_pages_mpol+0xd1/0x380 mm/mempolicy.c:2486
 alloc_slab_page mm/slub.c:3075 [inline]
 allocate_slab+0x86/0x3a0 mm/slub.c:3248
 new_slab mm/slub.c:3302 [inline]
 ___slab_alloc+0xaf8/0x13d0 mm/slub.c:4656
 __slab_alloc+0xc5/0x1f0 mm/slub.c:4779
 __slab_alloc_node mm/slub.c:4855 [inline]
 slab_alloc_node mm/slub.c:5251 [inline]
 __do_kmalloc_node mm/slub.c:5656 [inline]
 __kmalloc_noprof+0x15e/0x7c0 mm/slub.c:5669
 kmalloc_noprof include/linux/slab.h:961 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 __usb_create_hcd+0x67/0x920 drivers/usb/core/hcd.c:2570
 vhci_hcd_probe+0x1e6/0x3f0 drivers/usb/usbip/vhci_hcd.c:1394
 platform_probe+0xf9/0x190 drivers/base/platform.c:1446
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0xac0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x320 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x240 drivers/base/dd.c:831
 __device_attach_driver+0x279/0x430 drivers/base/dd.c:959
 bus_for_each_drv+0x25b/0x2f0 drivers/base/bus.c:500
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8881477adc00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881477adc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff8881477add00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff8881477add80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8881477ade00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

