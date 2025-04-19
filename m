Return-Path: <linux-usb+bounces-23241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0476FA940B3
	for <lists+linux-usb@lfdr.de>; Sat, 19 Apr 2025 03:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF4BC446F6E
	for <lists+linux-usb@lfdr.de>; Sat, 19 Apr 2025 01:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B065960B8A;
	Sat, 19 Apr 2025 01:02:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9404B136327
	for <linux-usb@vger.kernel.org>; Sat, 19 Apr 2025 01:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745024547; cv=none; b=XGWaHP4NBeTs4ljJPRHfrc632Kk+eA50oEIymcpbgPC1bpnaDN1B2mfGtgiMg5pt8C5dRvsuQ5nvCe/rwqgtdz380a71QyWgzugT8lU+KLDHW9LJU/vK3rIc+oDlBwGkOkj3QVsegc0KD6x/CspfXUi8y5jl9M5/KZlwgWKT8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745024547; c=relaxed/simple;
	bh=RQVgUugy963GmRAuIU24mwoQ3JAxGFCjrlsCxUcM66k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FN5MBVRmYawRX0QFRbiKbYCB3AjELhv8w3dN1y4eohoX1YmkOg8MoV18UAXE9/A6FBvmNUpVRBqJewvpugigEK+3dkMWwNdmsC5uH04nzU5nhjEdCCdP1x3ElrpfELfuHdH26Fmz9ujM70hgbCsOHwxg7luAUkeSHCppvCXndZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d43d3338d7so42707575ab.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745024544; x=1745629344;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hM6P49dJm6vl0w3v7GjFV81UKDrPm3M8REUpMzZgx8Y=;
        b=UJOvMaPYQeUnFW7fEA7jInU7+Ixc6kSKOFbURHR1I9vcE6CUHQ+Tz8xO5u9iEj+/e0
         xwsTvnHx8onwkm+bNen+IUKlC5FSpQkJDPjPswJC7KfgFGD9D1C6Sj9RQsWA3yo+ihq+
         KCUiEqzSKa3qknyL4GaLKsFSBHKkBsiucY6G4thQi4StUMlClQxelDC4qIutLCeqjrp2
         lglMR8BAodI1lRwSuHZ+fApy1FwzCfXMn3e3hMo/Lj9wVOF9Uxa4IA3CEtzCCVEvYSBk
         K04ixzSzi2l4ES2O9LAVWhyrmmAD+ZKgqPHVD8PLE2eg9AVjX99UcJMBOuuW4TBd/jbo
         1OZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVE7tFIDxaoMgacxGs85Vs76hvQ+F6yyADHjeE9SnFYR5OkVEbG9eDj5magd+YB1bCKKSHiKptZIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDfZfmiRDyvoT/IE+MiR6pVPW6U7zMcyaejgkTvDAheAUra/b+
	lgwnRQ8iawqEmjSNzR0obxcaGSGoUURTcI/0t2KfjHQVaWk3mdBR9QmiPIIl2QNWu9HjdcqVqnp
	H+6nM+LMq+2aewHlLAkbqu2AzEx/6hisxEtPRB40xL4RvmmtZiL56RNo=
X-Google-Smtp-Source: AGHT+IEcnaE1u5cJGQs8sWYQ9yQKbGPhq+59W9xriXSkY/LMuJzF7WtwWph1VmUtb945O45Hd/KvWwd1xfgDkuSAhg5DCndk0EhT
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2189:b0:3d4:2409:ce6 with SMTP id
 e9e14a558f8ab-3d88ed7c3e6mr49180905ab.5.1745024544275; Fri, 18 Apr 2025
 18:02:24 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:02:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6802f620.050a0220.297747.0014.GAE@google.com>
Subject: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in wacom_parse_and_register
From: syzbot <syzbot+190a37ea67b45020ca3d@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    169263214645 USB: core: Correct API usb_(enable|disable)_a..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=14a4f398580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56596400f3d8a772
dashboard link: https://syzkaller.appspot.com/bug?extid=190a37ea67b45020ca3d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6cdf1b67cebe/disk-16926321.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2ea16f6d604a/vmlinux-16926321.xz
kernel image: https://storage.googleapis.com/syzbot-assets/16c854b44a95/bzImage-16926321.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+190a37ea67b45020ca3d@syzkaller.appspotmail.com

------------[ cut here ]------------
UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
shift exponent 64 is too large for 64-bit type 'long unsigned int'
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc1-syzkaller-00068-g169263214645 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 wacom_devm_kfifo_alloc drivers/hid/wacom_sys.c:1308 [inline]
 wacom_parse_and_register+0x28e/0x5d10 drivers/hid/wacom_sys.c:2368
 wacom_probe+0xa1c/0xe10 drivers/hid/wacom_sys.c:2867
 __hid_device_probe drivers/hid/hid-core.c:2717 [inline]
 hid_device_probe+0x354/0x710 drivers/hid/hid-core.c:2754
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3666
 hid_add_device+0x373/0xa60 drivers/hid/hid-core.c:2900
 usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1432
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3666
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3666
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5535 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5675 [inline]
 port_event drivers/usb/core/hub.c:5835 [inline]
 hub_event+0x2f85/0x5030 drivers/usb/core/hub.c:5917
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
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

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

