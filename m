Return-Path: <linux-usb+bounces-10748-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0208D767C
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jun 2024 16:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064A91F22586
	for <lists+linux-usb@lfdr.de>; Sun,  2 Jun 2024 14:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FDA433BE;
	Sun,  2 Jun 2024 14:58:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF799B64B
	for <linux-usb@vger.kernel.org>; Sun,  2 Jun 2024 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717340303; cv=none; b=iDI7wu/vJXvVcuw1aIf2ht2wYeKV9a8UrvP5BWI7+Vmk0rdv6vpbOss5vk66l1rO42DQnjL5UCIVAd/uZg000zME80Za+DIIP2RJWBpGReTPUzNHCOVqHYKh0rcJ75L85S37XS/AAfCBV3WjQBigNfqqRZ1CEC8QMsfoxgZBWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717340303; c=relaxed/simple;
	bh=bjJPdf7dw0Sf6rurcvAlXGRwiUG9jRONYEu3C1jnDHg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RNJH2n38AkKzfhcR1aaKH2UBIwqSUOWKX812U40c+zY1DBr1r0JhPt2QdvNEvds9iNH3G42XnUHyL7wBzNMPQm6IEd5yQPdQrCyXm5gb109fFJH0y9GHB+InCe+s0iWjRaVk7SAtr8ttuKHQF1/z3CouNanWi1eXDNMuxQXLADc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-374890dfd20so25673325ab.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Jun 2024 07:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717340300; x=1717945100;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXAe+wheLfgmXaA9x02qenehw5PKgosPomur6/BLUeE=;
        b=g93qL9LMDFAt26oPYZA75GUA04HDYFMtlQjiGoDXuKRP/ak6/zvIALWXb+J0vWXY2J
         6Q4TLhZGQfmSHQGUj5rkO1vkpYRpHvWqCSVszxI5lts5WiH6UGUhkmRdVShjNOyRZiPx
         idZT61f+L4ftKl9eb++kaq4mflmO8pqSW08Tq39wRTquDCRIswW1fSly4WHqAJuD4Wr7
         k5IsmA2aV2zpV3NRLRyHAzX3Ybj5mWG3EAjCePpV6PCPj5ZFwyV5Z8TdX7SC04A9z5/u
         fEALDPl9vTjKqxDIx2XLjE3VMlZSvrfx6SQ+SgXeDIzrCro0YTb2CyM/uy3baLnj4voo
         L2qg==
X-Forwarded-Encrypted: i=1; AJvYcCUDmk1VWNh6PX73PSoDYcIM2F7WqxsVj1Na2dJ680BeX7zjrXg1TneFpV0z8vkPbC6xViWMPsf2A0kbe8aGGN3Ah6mkJyybCjr2
X-Gm-Message-State: AOJu0Yz713po+Q42Gt2G0VHbXsLaez++3/vV92wUXXeyDj4Md9xMkm6Q
	2/Oh/aDi+GHtNsbkNJU4ajLqTPSsAQdTt/BX4uK9ulXY/77uU1Quv57HrNtrirOn5er16v9JX2E
	8Sx32C0gmAZy/GlYDsjcO/GV4kF0g0a0JEMPxdm7yowsRWl6HFSDTCkw=
X-Google-Smtp-Source: AGHT+IHAjqUqgzaoxrFK0mz0r7Fs0J6DG898yFfUzkuTn0Vyoly1TNLjErWcjMj6mVGr/o/Tp7aKhGrGvLb+BzgYsqL/YzRMAcAv
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c4:b0:374:70ae:e876 with SMTP id
 e9e14a558f8ab-3748b96cb5bmr4149855ab.1.1717340300169; Sun, 02 Jun 2024
 07:58:20 -0700 (PDT)
Date: Sun, 02 Jun 2024 07:58:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008cec8b0619e97267@google.com>
Subject: [syzbot] [usb?] INFO: rcu detected stall in __mod_timer (5)
From: syzbot <syzbot+ab28cee83cdcfd7f87ca@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e0cce98fe279 Merge tag 'tpmdd-next-6.10-rc2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=177cdeaa980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9016f104992d69c
dashboard link: https://syzkaller.appspot.com/bug?extid=ab28cee83cdcfd7f87ca
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126531d6980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b27be6980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/95b83b8b8ae7/disk-e0cce98f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/32dac8e3cf35/vmlinux-e0cce98f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d2d8cd0ff617/bzImage-e0cce98f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ab28cee83cdcfd7f87ca@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: {
 0-....
 } 2684 jiffies s: 7217 root: 0x1/.
rcu: blocking rcu_node structures (internal RCU debug):

Sending NMI from CPU 1 to CPUs 0:
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
NMI backtrace for cpu 0
CPU: 0 PID: 5141 Comm: kworker/0:4 Not tainted 6.10.0-rc1-syzkaller-00021-ge0cce98fe279 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:check_kcov_mode kernel/kcov.c:173 [inline]
RIP: 0010:write_comp_data kernel/kcov.c:236 [inline]
RIP: 0010:__sanitizer_cov_trace_switch+0xa4/0x120 kernel/kcov.c:341
Code: 8b 00 00 00 4c 8b 4c 24 20 65 4c 8b 1c 25 00 d5 03 00 31 d2 eb 08 48 ff c2 49 39 d2 74 71 4c 8b 74 d6 10 65 8b 05 64 b8 6d 7e <a9> 00 01 ff 00 74 11 a9 00 01 00 00 74 de 41 83 bb 1c 16 00 00 00
RSP: 0018:ffffc90000006558 EFLAGS: 00000002
RAX: 0000000000010103 RBX: 000000000000006c RCX: ffff88802bab0000
RDX: 0000000000000004 RSI: ffffffff8f94f9c0 RDI: 000000000000006c
RBP: ffffc90000006670 R08: 0000000000000001 R09: ffffffff8b7f87ef
R10: 0000000000000006 R11: ffff88802bab0000 R12: 1ffffffff1796ff0
R13: ffffffff8bcb7f84 R14: 0000000000000074 R15: ffff000000000500
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f697c661b81 CR3: 000000001cbe8000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 format_decode+0xdcf/0x1bb0 lib/vsprintf.c:2685
 vsnprintf+0x14f/0x1da0 lib/vsprintf.c:2776
 sprintf+0xda/0x120 lib/vsprintf.c:3028
 print_time kernel/printk/printk.c:1327 [inline]
 info_print_prefix+0x16b/0x310 kernel/printk/printk.c:1353
 record_print_text kernel/printk/printk.c:1402 [inline]
 printk_get_next_message+0x6da/0xbe0 kernel/printk/printk.c:2855
 console_emit_next_record kernel/printk/printk.c:2895 [inline]
 console_flush_all+0x410/0xfd0 kernel/printk/printk.c:2994
 console_unlock+0x13b/0x4d0 kernel/printk/printk.c:3063
 vprintk_emit+0x5a6/0x770 kernel/printk/printk.c:2345
 dev_vprintk_emit+0x2ae/0x330 drivers/base/core.c:4951
 dev_printk_emit+0xdd/0x120 drivers/base/core.c:4962
 _dev_err+0x122/0x170 drivers/base/core.c:5017
 wdm_int_callback+0x41f/0xac0 drivers/usb/class/cdc-wdm.c:269
 __usb_hcd_giveback_urb+0x373/0x530 drivers/usb/core/hcd.c:1648
 dummy_timer+0x830/0x45d0 drivers/usb/gadget/udc/dummy_hcd.c:1987
 __run_hrtimer kernel/time/hrtimer.c:1687 [inline]
 __hrtimer_run_queues+0x59b/0xd50 kernel/time/hrtimer.c:1751
 hrtimer_interrupt+0x396/0x990 kernel/time/hrtimer.c:1813
 local_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1032 [inline]
 __sysvec_apic_timer_interrupt+0x110/0x3f0 arch/x86/kernel/apic/apic.c:1049
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0x52/0xc0 arch/x86/kernel/apic/apic.c:1043
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0xd8/0x140 kernel/locking/spinlock.c:194
Code: 9c 8f 44 24 20 42 80 3c 23 00 74 08 4c 89 f7 e8 6e c3 6a f6 f6 44 24 21 02 75 52 41 f7 c7 00 02 00 00 74 01 fb bf 01 00 00 00 <e8> c3 77 d4 f5 65 8b 05 f4 c1 72 74 85 c0 74 43 48 c7 04 24 0e 36
RSP: 0018:ffffc900000079c0 EFLAGS: 00000206
RAX: 11152d5d5b553100 RBX: 1ffff92000000f3c RCX: ffffffff8172c78a
RDX: dffffc0000000000 RSI: ffffffff8bcaba80 RDI: 0000000000000001
RBP: ffffc90000007a50 R08: ffffffff92fa85c7 R09: 1ffffffff25f50b8
R10: dffffc0000000000 R11: fffffbfff25f50b9 R12: dffffc0000000000
R13: 1ffff92000000f38 R14: ffffc900000079e0 R15: 0000000000000246
 __mod_timer+0xb89/0xeb0 kernel/time/timer.c:1186
 call_timer_fn+0x18e/0x650 kernel/time/timer.c:1792
 expire_timers kernel/time/timer.c:1843 [inline]
 __run_timers kernel/time/timer.c:2417 [inline]
 __run_timer_base+0x66a/0x8e0 kernel/time/timer.c:2428
 run_timer_base kernel/time/timer.c:2437 [inline]
 run_timer_softirq+0x103/0x170 kernel/time/timer.c:2448
 handle_softirqs+0x2c4/0x970 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu+0xf4/0x1c0 kernel/softirq.c:637
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0xa6/0xc0 arch/x86/kernel/apic/apic.c:1043
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:console_flush_all+0xaad/0xfd0 kernel/printk/printk.c:3000
Code: ff ff e8 16 d0 1f 00 90 0f 0b 90 e9 d8 f8 ff ff e8 08 d0 1f 00 e8 b3 f0 0f 0a 4d 85 f6 74 b6 e8 f9 cf 1f 00 fb 48 8b 44 24 70 <42> 0f b6 04 38 84 c0 48 8b 7c 24 30 0f 85 22 02 00 00 0f b6 1f 31
RSP: 0018:ffffc9000431e480 EFLAGS: 00000293
RAX: 1ffff92000863cdc RBX: 0000000000000000 RCX: ffff88802bab0000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc9000431e630 R08: ffffffff81764624 R09: 1ffffffff25f50be
R10: dffffc0000000000 R11: fffffbfff25f50bf R12: ffffffff8eb226b8
R13: ffffffff8eb22660 R14: 0000000000000200 R15: dffffc0000000000
 console_unlock+0x13b/0x4d0 kernel/printk/printk.c:3063
 vprintk_emit+0x5a6/0x770 kernel/printk/printk.c:2345
 dev_vprintk_emit+0x2ae/0x330 drivers/base/core.c:4951
 dev_printk_emit+0xdd/0x120 drivers/base/core.c:4962
 _dev_info+0x122/0x170 drivers/base/core.c:5020
 wdm_create+0x1284/0x16d0 drivers/usb/class/cdc-wdm.c:1119
 wdm_probe+0x21e/0x300 drivers/usb/class/cdc-wdm.c:1165
 usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x856/0xbf0 drivers/base/core.c:3721
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:294
 really_probe+0x2b8/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x856/0xbf0 drivers/base/core.c:3721
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d6a/0x5150 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
INFO: NMI handler (nmi_cpu_backtrace_handler) took too long to run: 5.801 msecs
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: nonzero urb status received: -71
cdc_wdm 5-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 5-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: nonzero urb status received: -71
cdc_wdm 3-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 3-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: wdm_int_callback - usb_submit_urb failed with result -1
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: nonzero urb status received: -71
cdc_wdm 1-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 1-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: wdm_int_callback - usb_submit_urb failed with result -1
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: nonzero urb status received: -71
cdc_wdm 2-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 2-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: nonzero urb status received: -71
cdc_wdm 4-1:1.0: wdm_int_callback - 0 bytes
cdc_wdm 4-1:1.0: wdm_int_callback - usb_submit_urb failed with result -19


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

