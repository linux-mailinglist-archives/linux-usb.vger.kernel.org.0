Return-Path: <linux-usb+bounces-12811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E35449443A3
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 08:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 126BA1C2196A
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 06:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53623184524;
	Thu,  1 Aug 2024 06:11:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5F916DC2E
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 06:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722492687; cv=none; b=ZsMoBh/YEvKyG2hUw5x85tfdogvvrNgcaLJ9X1hcEsrU4lXdLRyydLqNKXT01B1a1BoqdO3fvfcI99soV/9Cpfo1qgrsjVnWqGapWoGbymwwfAAnEThoQZfYD+lUQ8PEEsBpGDz/DVKcwyNXN/sAh04Dgws5WxRbs9XH48c6seI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722492687; c=relaxed/simple;
	bh=TmVbMhXiLmTeoD9N4OuEuRD9H7Rc5Vut8F90dAAd9jM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KmINx8CxPa1y6mhGT4teaAmo8/WeaV3YC3AbDZqMnxakmGCA6R8EEna86zVInKoQbOYC4I+CXI0897FcHj/Epi8hQAnOfvwJE7/oJ9fLznsSD+PCsu7vhQgTM6psQAqWu5aaovb/VEOdQSDlIJ5ov/AMfCYntW4P9jLloFOm8ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-81f8edd7370so938316139f.1
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 23:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722492684; x=1723097484;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTp/HXLZJNQkU65Etniqvk0Blau2IcJzy01HL1UhCpg=;
        b=FNd64KPukUwxN58mMygywV1z+HTrtr1OVkVYAOqduznP1ZaJu1WZjVZRnL9otsNmRP
         wxl0/YIaiZ5BVELA101WXbTq1zTo/6jJ90VSVkPk/WCEB/u+yiDPHR9K5nNl3Uk+LqNb
         WOGxFaeSK4B9/sC+viDZ+Vz5h8zYbEeSIasg6E4K/ipja6jrLwTFIvdSBiMVE5cJZ8sE
         uGvseZGq3DbVfV6LNJ8WeaV4Blthf5odRCCOOgfj0fS+fWiRaEpd3XGVny6l9vfIhg79
         BSDB/OlEwAQs999W8px9szOiJUwKaPcWhmjjWJcQy7RrqoUYuKAO0OEkPZtAh312k3lE
         nkSA==
X-Forwarded-Encrypted: i=1; AJvYcCV6/cKobru4uf4jAPbjDH8X/HzciTz87/QEgYHvBlg2ovPXN2Oh/bC5C7aPfXrEc8s+oMGyWaKX4/ey3vtSN7GFC40n5RYUwh5J
X-Gm-Message-State: AOJu0YwnZ0o5w8DEgKPn0RverzyPheHrmOStsV11hmT0017XEAAwwHMJ
	2K4h+bccQW2HKOWe3hKBV/4rZ0liqRyBeZSuuDbhcsbcxf2qYlR0+qIbeTNNiFlUv6+NCox2Jmu
	RbqMLG39WSOqC4qTlij93t2NfTW1X8Ox8KW/nSgAu2WGbx24cWrUPTaA=
X-Google-Smtp-Source: AGHT+IG/kojLvRQfNSDwZVbWTcmC2tSP+HbH5brmjUDLobYoZ81nj0mzgSPuHvtF8Eehq08YzMy/43bnIV1Dn5x2dONb1kqM/sZM
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2115:b0:4c0:a8a5:81cc with SMTP id
 8926c6da1cb9f-4c8c9c6bb20mr91477173.3.1722492684523; Wed, 31 Jul 2024
 23:11:24 -0700 (PDT)
Date: Wed, 31 Jul 2024 23:11:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000096ee8f061e991433@google.com>
Subject: [syzbot] [wireless?] [usb?] WARNING in ath6kl_bmi_get_target_info (2)
From: syzbot <syzbot+92c6dd14aaa230be6855@syzkaller.appspotmail.com>
To: kvalo@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1467299d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3044dca4d5f6dbe
dashboard link: https://syzkaller.appspot.com/bug?extid=92c6dd14aaa230be6855
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166a0275980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13552c6d980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/78a5695ed7e2/disk-1722389b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1507b4c5000d/vmlinux-1722389b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/449aa9e94d6b/bzImage-1722389b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+92c6dd14aaa230be6855@syzkaller.appspotmail.com

usb 1-1: new high-speed USB device number 2 using dummy_hcd
usb 1-1: New USB device found, idVendor=0cf3, idProduct=9375, bcdDevice=1a.9e
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
------------[ cut here ]------------
WARNING: CPU: 0 PID: 2343 at drivers/net/wireless/ath/ath6kl/bmi.c:90 ath6kl_bmi_get_target_info+0x4f5/0x5b0 drivers/net/wireless/ath/ath6kl/bmi.c:90
Modules linked in:
CPU: 0 UID: 0 PID: 2343 Comm: kworker/0:2 Not tainted 6.10.0-syzkaller-g1722389b0d86 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:ath6kl_bmi_get_target_info+0x4f5/0x5b0 drivers/net/wireless/ath/ath6kl/bmi.c:90
Code: 77 fc ff ff e8 4c fa b1 fd be 08 00 00 00 bd f3 ff ff ff 48 c7 c7 20 db 7f 87 e8 26 42 fe ff e9 5c fd ff ff e8 2c fa b1 fd 90 <0f> 0b 90 bd ea ff ff ff e9 49 fd ff ff e8 79 ec 06 fe e9 e7 fb ff
RSP: 0018:ffffc900042eef48 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff8881135c0e20 RCX: ffffffff83a15e8a
RDX: ffff88811394d700 RSI: ffffffff83a16014 RDI: 0000000000000005
RBP: 0000000000000000 R08: 0000000000000005 R09: 000000000000000c
R10: 0000000000000000 R11: ffffffff81004e0a R12: ffffc900042ef058
R13: 1ffff9200085ddeb R14: ffff8881135c0e50 R15: ffffc900042ef05c
FS:  0000000000000000(0000) GS:ffff8881f6200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ea8cfc1b18 CR3: 0000000115c00000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ath6kl_core_init+0x1a0/0x11a0 drivers/net/wireless/ath/ath6kl/core.c:101
 ath6kl_usb_probe+0xcd2/0x1450 drivers/net/wireless/ath/ath6kl/usb.c:1168
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:578 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3679
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e66/0x4f50 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
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

