Return-Path: <linux-usb+bounces-12360-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35AC93A3D9
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 17:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DD052845B1
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2024 15:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3737015747A;
	Tue, 23 Jul 2024 15:42:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698A155A52
	for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721749325; cv=none; b=P3L0sE4Eph6VK2bIymPa45p5yHKtOkKQ8bLzVcZD7CCARBEFAX90/zS8MVhe2Zruu82AnK0Fmuc2YSrQg1E02UGk4VdyhcmeDOHfZBT3FIP+jkBH77ZEV9rhe8sialuiUBeH7cZKhpXls9fSkL27N0uant+CYC3TrFrnaQX1P4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721749325; c=relaxed/simple;
	bh=vgGUOAu1hM8cAUi1Yk89H9HvzpWdTHnPsnFWLr28x4o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VwF/mqYOtDi/Ts0emQFcAdI0Y4lVYvACz2N8EIuneHlK2LfBVAQ4MHlojiSlJkFvpmK6gYIbBb2tZkHnQU0Qg/jb/C0QGdDCekCAXyibHD4OuNWTIHs4NTcvkRywL2MZ1EnBgiR1+KGJnTTEoFcRONVAF0aU8X8sRPug8FolzZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-81257dec573so913784439f.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jul 2024 08:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749323; x=1722354123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIuN6aqEu/2huV+UStekB4/p29gsX+QzKifHumVqvsE=;
        b=lEoK8B6AcrDyjX7YdK65FUSnqV7RGUymcaIun8hsTMVaGDnpi9bZSaoxEBoWJKBHTC
         EAxO4QfbRyRZ+hyPUYQcdfZ/6Eq4J1wAll046A7WH0zEmme90i0420cclwEjH+shqxc0
         JNxq/Dqvvx9p0Vgb7C+qFYJ+nUUiynlPaskX5UB2rYRaoG5il1f/MKd2ycz9oeTzqKIe
         mMAt5acSa7pJ1eFMJXCksC3XOcL2N4u/DYNdNHameLrx99LQVslVxcm1CMdlRAvI1HSx
         nEbnCS23zYeN23+eVwCMkC51WXQT78psA/tiTO1dgWLXsGR7yAl2BU1vOf9NdV9Y1M/t
         05gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKM/TaRan+pfMwgs3PUw3f+M9ftN4OCWI3P8vrxJP/280vE08tgA9gzzijyNd4GizYmqdAae4quhZ7i+FIuzRtT5DcIa9Ro8/2
X-Gm-Message-State: AOJu0Yz6LNjxoouNWjakuT5ZzkiQQ1zbAWRx0tNbd03OH5OC/G8G7nyP
	kr2t+g2fiQYqzEIaWAsm9HeK24Tqi9hk22mCHdS5TkNuNpd1t1gHmibsvzjdU9P+svgHbKw3pVB
	40t38TF8V/gSlXVF7kB2M0MkTHmGvPF92Wdv1SOD/kUJG+rfs58xGTqg=
X-Google-Smtp-Source: AGHT+IHRBUpdL7UD26IZcxq131aPVyCWXlzn2J2917ZwDIByMP5VySbVLLdE9xHaoWyVJj2tfu3htXH6j2VSIgIJ0E8bG8KbTezB
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:9817:b0:4c0:9a05:44d0 with SMTP id
 8926c6da1cb9f-4c28a09919fmr3435173.1.1721749323454; Tue, 23 Jul 2024 08:42:03
 -0700 (PDT)
Date: Tue, 23 Jul 2024 08:42:03 -0700
In-Reply-To: <ade15714-6aa3-4988-8b45-719fc9d74727@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d12fee061dec0042@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in uevent_show
From: syzbot <syzbot+edd9fe0d3a65b14588d5@syzkaller.appspotmail.com>
To: andriy.shevchenko@linux.intel.com, f.fainelli@gmail.com, 
	fancer.lancer@gmail.com, gregkh@linuxfoundation.org, 
	ilpo.jarvinen@linux.intel.com, jirislaby@kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, marcello.bauer@9elements.com, rafael@kernel.org, 
	stern@rowland.harvard.edu, sylv@sylv.io, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
INFO: task hung in uevent_show

INFO: task udevd:4562 blocked for more than 143 seconds.
      Not tainted 6.10.0-rc2-next-20240607-syzkaller-dirty #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:udevd           state:D stack:27128 pid:4562  tgid:4562  ppid:2403   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5192 [inline]
 __schedule+0xca6/0x2f50 kernel/sched/core.c:6529
 __schedule_loop kernel/sched/core.c:6606 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6621
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6678
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x5b8/0x9c0 kernel/locking/mutex.c:752
 device_lock include/linux/device.h:1009 [inline]
 uevent_show+0x188/0x3b0 drivers/base/core.c:2743
 dev_attr_show+0x53/0xe0 drivers/base/core.c:2437
 sysfs_kf_seq_show+0x23e/0x410 fs/sysfs/file.c:59
 seq_read_iter+0x4fa/0x12c0 fs/seq_file.c:230
 kernfs_fop_read_iter+0x41a/0x590 fs/kernfs/file.c:279
 new_sync_read fs/read_write.c:395 [inline]
 vfs_read+0x869/0xbd0 fs/read_write.c:476
 ksys_read+0x12f/0x260 fs/read_write.c:619
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7546015b6a
RSP: 002b:00007ffc5026dbf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 000055873fe1dfa0 RCX: 00007f7546015b6a
RDX: 0000000000001000 RSI: 000055873fe2b950 RDI: 0000000000000008
RBP: 000055873fe1dfa0 R08: 0000000000000008 R09: 0000000000000000
R10: 000000000000010f R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000003fff R14: 00007ffc5026e0d8 R15: 000000000000000a
 </TASK>

Showing all locks held in the system:
5 locks held by kworker/0:1/9:
1 lock held by khungtaskd/30:
 #0: ffffffff886b4c20 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:326 [inline]
 #0: ffffffff886b4c20 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:838 [inline]
 #0: ffffffff886b4c20 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x75/0x340 kernel/locking/lockdep.c:6689
2 locks held by getty/2461:
 #0: ffff88810e7a50a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: ffffc900000432f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xfc8/0x1490 drivers/tty/n_tty.c:2211
4 locks held by udevd/4562:
 #0: ffff888119d570a0 (&p->lock){+.+.}-{3:3}, at: seq_read_iter+0xde/0x12c0 fs/seq_file.c:182
 #1: ffff888116049488 (&of->mutex){+.+.}-{3:3}, at: kernfs_seq_start+0x4d/0x240 fs/kernfs/file.c:154
 #2: ffff88810ef83b48 (kn->active){.+.+}-{0:0}, at: kernfs_seq_start+0x71/0x240 fs/kernfs/file.c:155
 #3: ffff8881042f2190 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1009 [inline]
 #3: ffff8881042f2190 (&dev->mutex){....}-{3:3}, at: uevent_show+0x188/0x3b0 drivers/base/core.c:2743

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 30 Comm: khungtaskd Not tainted 6.10.0-rc2-next-20240607-syzkaller-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:91 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:117
 nmi_cpu_backtrace+0x27b/0x390 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x29c/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:223 [inline]
 watchdog+0xf86/0x1240 kernel/hung_task.c:379
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:144
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.10.0-rc2-next-20240607-syzkaller-dirty #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:unwind_next_frame+0x5de/0x23a0 arch/x86/kernel/unwind_orc.c:505
Code: 6c 24 05 48 b8 00 00 00 00 00 fc ff df 4c 89 ea 48 c1 ea 03 0f b6 04 02 4c 89 ea 83 e2 07 38 d0 7f 08 84 c0 0f 85 71 18 00 00 <45> 0f b6 74 24 05 31 ff 41 83 e6 07 44 89 f6 e8 2e 45 3e 00 45 84
RSP: 0018:ffffc9000009e490 EFLAGS: 00000246
RAX: 0000000000000000 RBX: ffffc9000009e510 RCX: ffffffff81151bc4
RDX: 0000000000000001 RSI: ffffffff81152c52 RDI: 0000000000000006
RBP: 0000000000000001 R08: 0000000000000006 R09: ffffffff81a5ce53
R10: ffffffff81a5ce45 R11: 0000000000000005 R12: ffffffff8a1e1764
R13: ffffffff8a1e1769 R14: 00000000000278ef R15: ffffc9000009e545
FS:  0000000000000000(0000) GS:ffff8881f6400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbd876d8de0 CR3: 00000001151aa000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 arch_stack_walk+0x100/0x170 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x95/0xd0 kernel/stacktrace.c:122
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:370 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:387
 kmalloc_noprof include/linux/slab.h:660 [inline]
 dummy_urb_enqueue+0x8d/0x8a0 drivers/usb/gadget/udc/dummy_hcd.c:1271
 usb_hcd_submit_urb+0x2d1/0x2090 drivers/usb/core/hcd.c:1533
 usb_submit_urb+0x87c/0x1730 drivers/usb/core/urb.c:581
 usb_start_wait_urb+0x103/0x4c0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x327/0x4b0 drivers/usb/core/message.c:154
 _usbctrl_vendorreq_sync+0xc6/0x1f0 drivers/net/wireless/realtek/rtlwifi/usb.c:42
 _usb_read_sync+0x11d/0x190 drivers/net/wireless/realtek/rtlwifi/usb.c:75
 rtl_read_dword drivers/net/wireless/realtek/rtlwifi/wifi.h:2911 [inline]
 read_efuse_byte+0x612/0x910 drivers/net/wireless/realtek/rtlwifi/efuse.c:182
 read_efuse+0x9a7/0xd60 drivers/net/wireless/realtek/rtlwifi/efuse.c:282
 efuse_read_all_map drivers/net/wireless/realtek/rtlwifi/efuse.c:648 [inline]
 rtl_efuse_shadow_map_update+0x23b/0x2b0 drivers/net/wireless/realtek/rtlwifi/efuse.c:494
 rtl_get_hwinfo+0xdb/0x880 drivers/net/wireless/realtek/rtlwifi/efuse.c:1224
 _rtl92cu_read_adapter_info drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c:334 [inline]
 rtl92cu_read_eeprom_info+0x2bc/0x2730 drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c:411
 rtl_usb_probe+0x915/0x24d0 drivers/net/wireless/realtek/rtlwifi/usb.c:1011
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:656
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:798
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:828
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:956
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1028
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:656
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:798
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:828
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:956
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1028
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e66/0x4f50 drivers/usb/core/hub.c:5903
 process_one_work+0x9fb/0x1b60 kernel/workqueue.c:3248
 process_scheduled_works kernel/workqueue.c:3329 [inline]
 worker_thread+0x6c8/0xf30 kernel/workqueue.c:3409
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:144
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


Tested on:

commit:         d35b2284 Add linux-next specific files for 20240607
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=163368a1980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=39f353a8458f74bb
dashboard link: https://syzkaller.appspot.com/bug?extid=edd9fe0d3a65b14588d5
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14750a19980000


