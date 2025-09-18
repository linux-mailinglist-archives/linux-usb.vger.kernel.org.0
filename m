Return-Path: <linux-usb+bounces-26932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 047BDB28A28
	for <lists+linux-usb@lfdr.de>; Sat, 16 Aug 2025 05:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEB002A6F80
	for <lists+linux-usb@lfdr.de>; Sat, 16 Aug 2025 03:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB001A5BA2;
	Sat, 16 Aug 2025 03:08:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2F719D8A2
	for <linux-usb@vger.kernel.org>; Sat, 16 Aug 2025 03:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755313716; cv=none; b=OxgXjMUYa/DiZh/acSlE681KRHauC2ND0PMTRTL8pv0CQh+Nex/UzyCdh0boRwbRcXKRqxG8pfZT59jHNwK9IyMOkVS6XXk2O24kcXZuyscDXNl5JF9TmbDRcVFurpmzwJpKAyZ4AAZXvmfVY2RfZWlL/3XkrcKfOx8whFIp0r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755313716; c=relaxed/simple;
	bh=6pBJXU/MyKVUN754mqkMYqJusqO6bCVd8m2jj+ain6A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HCzC+XyitH1B6Kn74iApAFeg9v75yvKLYDLdvgvRM7cqVC7J8Asj++Umoqgs1m9qLlp2vBwtouxBfF+e5qxUAmNRiZ3PTK2xUkTL2cppkTwU5muHmHgkyYzef+M0d4w5KW5/l8avkemvh9y3OQFIZVkVyYBzMjHlfDp9hJsnkjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3e56ffea78fso35935005ab.1
        for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 20:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755313714; x=1755918514;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQu04VGbncgbNvJGFt4fFPJTftoQuHp4eSxa6rqNv6g=;
        b=kfZzIELDrpTGdgqtRkoG2McOlkTrkx1qbWjO9FDR8UI2BRibn5N/GO2qy9j3hBmViY
         qNvJNY2daUx4M9EgtD5sTIVljmgLYCm6D7UdT9OCNtd4DBVqHIpMMchLfIcwbMc/MTSJ
         DWDoaU2fb3XDvQv+aynpIqSOhyuU7ttBtr8TNzc33WO5DhYAdjTidzlW2ipzFTpljQoI
         xFFFuIjYmv1V1I4MtW+DpRUNt+f/xzgchAR6GPDL7lwkGgQMkHPIamqu0hzzuU65P0a5
         +DJ9phXDdTq9LXVXmJWP7aU7kZ7vH0BUADNlH37+KTw3UIVvLKPCLu8RUaZS0PH7heUq
         jSMA==
X-Forwarded-Encrypted: i=1; AJvYcCWGRLLodIdOUWpmVVOVEK3WMLCR5UbvK0m+MFprI9UdVNW3iupPXRgphRhUzdMhhsaQTcNGkzZ+6y0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEgNkfztGaiAkEsyUWu+RVXLVtAYIpKIUq/SvecUmT2RRu3HYF
	JEf96vHX6CxvT4IM1Irre+Waa0Iba130hVt0U8GLrHOaikRDUvsaaZSmfSoUAoS2Mcm6Q4bhbtg
	IPkMIUW//FdsZB7PbjTaSEFZpR+PRVGxDnz9S3uE+CRYvu3tcA2iFSS7zILQ=
X-Google-Smtp-Source: AGHT+IH01KqsKZsaEl291+FCpwACaxmXN2BvC+hTuP+uJXbLeXhOspYIQHHzl4hhfWwaRcRQQQ2gNgF1Ww5ZSpqBAzN/SG/vJgd6
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ea:b0:3e5:5466:1aa2 with SMTP id
 e9e14a558f8ab-3e57e7fd2b0mr79891595ab.10.1755313714003; Fri, 15 Aug 2025
 20:08:34 -0700 (PDT)
Date: Fri, 15 Aug 2025 20:08:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <689ff631.050a0220.e29e5.0035.GAE@google.com>
Subject: [syzbot] [usb?] UBSAN: shift-out-of-bounds in ax88772_bind
From: syzbot <syzbot+20537064367a0f98d597@syzkaller.appspotmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d7ee5bdce789 Merge tag 'firewire-fixes-6.17-rc1' of git://..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11835af0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=412ee2f8b704a5e6
dashboard link: https://syzkaller.appspot.com/bug?extid=20537064367a0f98d597
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d253a2580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/62d2c52c687a/disk-d7ee5bdc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f827f7b0a929/vmlinux-d7ee5bdc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0babf789124a/bzImage-d7ee5bdc.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+20537064367a0f98d597@syzkaller.appspotmail.com

asix 1-1:0.0 (unnamed net_device) (uninitialized): Failed to read reg index 0x0000: -71
asix 1-1:0.0 (unnamed net_device) (uninitialized): Error reading Medium Status register: ffffffb9
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/net/usb/asix_devices.c:679:27
shift exponent 240 is too large for 64-bit type 'unsigned long'
CPU: 1 UID: 0 PID: 6020 Comm: kworker/1:4 Not tainted 6.17.0-rc1-syzkaller-00116-gd7ee5bdce789 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/12/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:233
 __ubsan_handle_shift_out_of_bounds+0x386/0x410 lib/ubsan.c:494
 ax88772_init_mdio drivers/net/usb/asix_devices.c:679 [inline]
 ax88772_bind+0xdcf/0xfa0 drivers/net/usb/asix_devices.c:910
 usbnet_probe+0xa93/0x2870 drivers/net/usb/usbnet.c:1781
 usb_probe_interface+0x665/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2958/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


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

