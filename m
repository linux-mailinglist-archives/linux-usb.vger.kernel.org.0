Return-Path: <linux-usb+bounces-8695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBAD894250
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 18:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F2421C21819
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 16:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45AEE4F88B;
	Mon,  1 Apr 2024 16:51:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0728E4D137
	for <linux-usb@vger.kernel.org>; Mon,  1 Apr 2024 16:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711990282; cv=none; b=AmV91WVWLFcgihMK27gyQq/foGiGJTlloET983pv1WC/KU9vhMtSLHD7y5+YHAQTOppF5RJL3zdeGM0LBzaZiDkb/v7j07Xc7k8cXwzwz4NRJ85Y59uIybDNTv0v8Ye6E6Cs290Uj+Gd4ft4KjjBM/vbZfX87dW+UvByZwm442s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711990282; c=relaxed/simple;
	bh=b134JAC77FMnO5VxlSudPyxdcglNfx4NfOslCHwS9aI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fRXJMyBjOoMkiI+VW0K05OgIwlR8kPAy5WeBcJf2thlIHIa2Co2yvwD6vcwV6zMmDjUGhdJQuXvUN+rmK1pdYY+oL3PLk4LqNQepWMVw5YnlD31dg97nBwqiFVS9hBA+fy8vpz2PIz57wu31SDAAY5tqNlQmZ1dXeaJkvMF2p/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7cc01445f6bso491350739f.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Apr 2024 09:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711990280; x=1712595080;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vkvjymxxg5wlu7KGiYlh9jDRJahjKEj0y/WHqrnneu0=;
        b=JldOJ8CStTt7Mv+RSHEbhfUm3yWkZkxDQ7wUA7qssocNIAmWXCuEo84MuXCo8J6vTI
         yIZuHLp+nyvcaGFDr8cbtnFv9rqc0et0lp8+UGcwENjyZKwqaJI9/RrLfucX1YZrTMB8
         LZ1OmbTALjmYlk+3tmKLaFIIMBO2jTHmlGH6BAR15uCyBoAvNqqaUPm0q5oQLdPLu4Jq
         exXSDtwslb3dBTb2uubaq7KwLkZp/8EwVMfbN54OWber4Y57sUAJSJb+NV1M5YjklF4W
         cSiXQyZrEnP1l3fF+4Cm6VLzlXbIyldBcoDkMpLHAMwETdjHkZnt+Li58ueXov6+S3L0
         bH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnH9h5I0gY+/rYuXNbeptK9uVt/vE6H5Eh4MoPa7yi50IVmjeGj9a5/y36sx1QFWm8AuksDWXiPwlY83ADqSoPOKu9pVRFk8GG
X-Gm-Message-State: AOJu0YzGBUmbgVBYLriLDKNBJwYR/3LqRlit4ISdKejeOHpgogPz5PpL
	c0L/C1vtN+MCJhv17OTUQF1e/gRQ7fisrnm58op+P+ZkupD5fOJAMJZx1If3W2lM/P+Z5CbCnFc
	6PzWIGT6gYSTb1P2znsyUdAF80Tg+r53xr/GVe1X1XCF7FMYg+/sBB5g=
X-Google-Smtp-Source: AGHT+IHuZEWF0jczVQEcF2HgEW+9ZuUksHzQYEfFom9Q8LAyfWKK2icbujwxHY3HN0STsFrW/OMRYE0qXziSWD3zwHJdN1v4R5Yj
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2c90:b0:7cc:8980:5ae4 with SMTP id
 i16-20020a0566022c9000b007cc89805ae4mr551496iow.2.1711990280332; Mon, 01 Apr
 2024 09:51:20 -0700 (PDT)
Date: Mon, 01 Apr 2024 09:51:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000084b18706150bcca5@google.com>
Subject: [syzbot] [usb?] [sound?] KMSAN: uninit-value in line6_pod_process_message
From: syzbot <syzbot+7fb05ccf7b3d2f9617b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
	tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    486291a0e624 Merge tag 'drm-fixes-2024-03-30' of https://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13ab1129180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e2599baf258ef795
dashboard link: https://syzkaller.appspot.com/bug?extid=7fb05ccf7b3d2f9617b3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1299932d180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1101e52d180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ea2c2e416c4f/disk-486291a0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/83fdaf5e5783/vmlinux-486291a0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f674430b191/bzImage-486291a0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7fb05ccf7b3d2f9617b3@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in line6_pod_process_message+0x72f/0x7b0 sound/usb/line6/pod.c:201
 line6_pod_process_message+0x72f/0x7b0 sound/usb/line6/pod.c:201
 line6_data_received+0x5db/0x7e0 sound/usb/line6/driver.c:317
 __usb_hcd_giveback_urb+0x508/0x770 drivers/usb/core/hcd.c:1648
 usb_hcd_giveback_urb+0x157/0x720 drivers/usb/core/hcd.c:1732
 dummy_timer+0xd93/0x6b10 drivers/usb/gadget/udc/dummy_hcd.c:1987
 call_timer_fn+0x49/0x580 kernel/time/timer.c:1793
 expire_timers kernel/time/timer.c:1844 [inline]
 __run_timers kernel/time/timer.c:2418 [inline]
 __run_timer_base+0x84e/0xe90 kernel/time/timer.c:2429
 run_timer_base kernel/time/timer.c:2438 [inline]
 run_timer_softirq+0x3a/0x70 kernel/time/timer.c:2448
 __do_softirq+0x1c0/0x7d7 kernel/softirq.c:554
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:633 [inline]
 irq_exit_rcu+0x6a/0x130 kernel/softirq.c:645
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
 sysvec_apic_timer_interrupt+0x83/0x90 arch/x86/kernel/apic/apic.c:1043
 asm_sysvec_apic_timer_interrupt+0x1f/0x30 arch/x86/include/asm/idtentry.h:702
 native_safe_halt arch/x86/include/asm/irqflags.h:48 [inline]
 arch_safe_halt arch/x86/include/asm/irqflags.h:86 [inline]
 acpi_safe_halt+0x25/0x30 drivers/acpi/processor_idle.c:112
 acpi_idle_do_entry+0x22/0x40 drivers/acpi/processor_idle.c:573
 acpi_idle_enter+0xa1/0xc0 drivers/acpi/processor_idle.c:707
 cpuidle_enter_state+0xcb/0x250 drivers/cpuidle/cpuidle.c:267
 cpuidle_enter+0x7f/0xf0 drivers/cpuidle/cpuidle.c:388
 call_cpuidle kernel/sched/idle.c:155 [inline]
 cpuidle_idle_call kernel/sched/idle.c:236 [inline]
 do_idle+0x551/0x750 kernel/sched/idle.c:332
 cpu_startup_entry+0x65/0x80 kernel/sched/idle.c:430
 rest_init+0x1e8/0x260 init/main.c:732
 start_kernel+0x927/0xa70 init/main.c:1074
 x86_64_start_reservations+0x2e/0x30 arch/x86/kernel/head64.c:507
 x86_64_start_kernel+0x98/0xa0 arch/x86/kernel/head64.c:488
 common_startup_64+0x12c/0x137

Uninit was created at:
 slab_post_alloc_hook mm/slub.c:3804 [inline]
 slab_alloc_node mm/slub.c:3845 [inline]
 kmalloc_trace+0x578/0xba0 mm/slub.c:3992
 kmalloc include/linux/slab.h:628 [inline]
 line6_init_cap_control+0x4f1/0x770 sound/usb/line6/driver.c:700
 line6_probe+0xeae/0x1120 sound/usb/line6/driver.c:797
 pod_probe+0x79/0x90 sound/usb/line6/pod.c:522
 usb_probe_interface+0xd6f/0x1350 drivers/usb/core/driver.c:399
 really_probe+0x4db/0xd90 drivers/base/dd.c:656
 __driver_probe_device+0x2ab/0x5d0 drivers/base/dd.c:798
 driver_probe_device+0x72/0x890 drivers/base/dd.c:828
 __device_attach_driver+0x568/0x9e0 drivers/base/dd.c:956
 bus_for_each_drv+0x403/0x620 drivers/base/bus.c:457
 __device_attach+0x3c1/0x650 drivers/base/dd.c:1028
 device_initial_probe+0x32/0x40 drivers/base/dd.c:1077
 bus_probe_device+0x3dc/0x5c0 drivers/base/bus.c:532
 device_add+0x1475/0x1c90 drivers/base/core.c:3705
 usb_set_configuration+0x31c9/0x38d0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x109/0x2a0 drivers/usb/core/generic.c:254
 usb_probe_device+0x3a7/0x690 drivers/usb/core/driver.c:294
 really_probe+0x4db/0xd90 drivers/base/dd.c:656
 __driver_probe_device+0x2ab/0x5d0 drivers/base/dd.c:798
 driver_probe_device+0x72/0x890 drivers/base/dd.c:828
 __device_attach_driver+0x568/0x9e0 drivers/base/dd.c:956
 bus_for_each_drv+0x403/0x620 drivers/base/bus.c:457
 __device_attach+0x3c1/0x650 drivers/base/dd.c:1028
 device_initial_probe+0x32/0x40 drivers/base/dd.c:1077
 bus_probe_device+0x3dc/0x5c0 drivers/base/bus.c:532
 device_add+0x1475/0x1c90 drivers/base/core.c:3705
 usb_new_device+0x15ff/0x2470 drivers/usb/core/hub.c:2643
 hub_port_connect drivers/usb/core/hub.c:5512 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5652 [inline]
 port_event drivers/usb/core/hub.c:5812 [inline]
 hub_event+0x4ff8/0x72d0 drivers/usb/core/hub.c:5894
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa81/0x1bd0 kernel/workqueue.c:3335
 worker_thread+0xea5/0x1560 kernel/workqueue.c:3416
 kthread+0x3e2/0x540 kernel/kthread.c:388
 ret_from_fork+0x6d/0x90 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243

CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.9.0-rc1-syzkaller-00274-g486291a0e624 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
=====================================================


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

