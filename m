Return-Path: <linux-usb+bounces-7143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E001869C1C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 17:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BF92B308F2
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 16:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4BF1487DC;
	Tue, 27 Feb 2024 16:12:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404731474AB
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709050342; cv=none; b=ppaMKW6I1cLQjsSn5/n/cfHaun1ScnIzd2dJjjR5XRU/aCiI/iatwwqvNuDvnxHNE4xhCxSbvOQ39PwN3f+AUShBbM6MItLzsRJ63vpJi/UXttliopJMvszao9sGKIcvlqg/eE25Hd2dCyrDTOs+EQw20CIgXAAMvV4sBLW9iFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709050342; c=relaxed/simple;
	bh=BFEQIZVH5Nc8v1KRuh7Tj2bYQ/ne/aCK7lSVlDmIVfo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ZOmnjBlvhsaYE91oeMQoVmD3ywqxlrBolKhhXb5ipUhBpg5CygcMcWsMtOgWotduyUi8vlZ8JlpIRPlJwe/1RAYEcz9bYkMVm+VtrJJN/vvoJj4g37FUYGe7suj9rkzdJP7ITYcqNBWKNwcfxBvYvdGbp1zezF3/eTdXFPxew/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-365219a851aso31834305ab.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 08:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709050339; x=1709655139;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xT8RLq9P4JqKsEIdS744XQR8XzwEfjm7rQQcW82q8o=;
        b=P55LpGbG8SoLRhnD0/+krb9Gnp8LE33kznbJHc/n8+wLFtDMLwBvyy20OBH0NFmxZH
         ga4PAWwLtJwCIKlAt1SeeYUAS9moPEB5of2M+SDyWXG6zRnJk6ElF7ZwDazwfANs3kxI
         4wSgx66nYHFDEKDVqdvoZtxQQ+LwhrpmeMhnDd/2krgOcob31Agm4cTafGw2hR8tgqyf
         60Ne3fxRxcsjyq40xWDkIx4kTUWDwVcr+NCgGeo+aHPeXUnlN+Mf1SlkiS2rJe32DFqz
         ImU31NNd2nLjLCTg9nArxJzUU78Fup12waa4ciFLyvvkWk9ABlV5yi8LNZG+OvBnraGs
         LgRA==
X-Forwarded-Encrypted: i=1; AJvYcCVnmPhKNH1lCc3ck42oObGslIswlXtGpj4phXA95bUxQKRlUpxTqlcpwVtok+Gok/2amiRFrHnwgXz5wEhN/xA1ZMOn81uWYbUD
X-Gm-Message-State: AOJu0YyhR/G/RZ4UGCyJvVBgQY1X4CTK1nsMeK/UAZRzWPaWmaluS31F
	cN4H5KwG3V/eFxTFJmBEHW44Gl2mA206StQ6BKGmqmJ9i3jL21Udtr5V+E3I7Zwr1ZKpMN5QeHj
	zkfUZR+e7Zbgl0ppNhzkUTkQnrAeF3Hj18e749YAM6tPO5tfCD0Lsfb4=
X-Google-Smtp-Source: AGHT+IHi4rUXrlLkS/7yrg6PKExL5vZGjbaK1BSsNHqc3qV3deyIDkZSMGvOfgteU+4uiVl5Uv5anROr+53tJxT2l14iFMNXfyMe
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2192:b0:365:2f9d:5f04 with SMTP id
 j18-20020a056e02219200b003652f9d5f04mr733406ila.5.1709050339449; Tue, 27 Feb
 2024 08:12:19 -0800 (PST)
Date: Tue, 27 Feb 2024 08:12:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000062e3bd06125f4a28@google.com>
Subject: [syzbot] [usb?] [input?] WARNING in __input_unregister_device
From: syzbot <syzbot+b03b0fc32e288051502d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9abbc24128bc Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1432aac4180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=af5c6c699e57bbb3
dashboard link: https://syzkaller.appspot.com/bug?extid=b03b0fc32e288051502d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147aa106180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=150f8e22180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ce13ec3ed5ad/disk-9abbc241.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/256cbd314121/vmlinux-9abbc241.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0af86fb52109/Image-9abbc241.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b03b0fc32e288051502d@syzkaller.appspotmail.com

microsoft 0003:045E:07DA.0009: input,hidraw0: USB HID v0.00 Device [HID 045e:07da] on usb-dummy_hcd.0-1/input0
usb 1-1: USB disconnect, device number 10
------------[ cut here ]------------
add_uevent_var: buffer size too small
WARNING: CPU: 1 PID: 1394 at lib/kobject_uevent.c:671 add_uevent_var+0x278/0x3c0
Modules linked in:
CPU: 1 PID: 1394 Comm: kworker/1:2 Tainted: G    B              6.8.0-rc5-syzkaller-g9abbc24128bc #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
Workqueue: usb_hub_wq hub_event
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : add_uevent_var+0x278/0x3c0
lr : add_uevent_var+0x274/0x3c0 lib/kobject_uevent.c:671
sp : ffff800098486c80
x29: ffff800098486da0 x28: 000000000000000c x27: ffff700013090d9c
x26: dfff800000000000 x25: ffff0000c8e02a10 x24: 000000000000000c
x23: 00000000000007f4 x22: 000000000000000c x21: ffff0000c8e02218
x20: ffff0000c8e02a1c x19: ffff0000c8e02000 x18: 1fffe00036804796
x17: 0000000000000000 x16: ffff80008ad5bbdc x15: 0000000000000001
x14: 1fffe00036804802 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000002 x10: 0000000000ff0100 x9 : c77e75592b5e9e00
x8 : c77e75592b5e9e00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff800098486578 x4 : ffff80008ed715e0 x3 : ffff8000805b98b4
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 00000000fffffff4
Call trace:
 add_uevent_var+0x278/0x3c0
 kobject_uevent_env+0x4f0/0x874 lib/kobject_uevent.c:588
 kobject_uevent+0x2c/0x3c lib/kobject_uevent.c:642
 device_del+0x6a8/0x87c drivers/base/core.c:3846
 __input_unregister_device+0x454/0x5c0 drivers/input/input.c:2232
 input_unregister_device+0xb0/0xfc drivers/input/input.c:2440
 hidinput_disconnect+0x1fc/0x290 drivers/hid/hid-input.c:2388
 hid_disconnect drivers/hid/hid-core.c:2280 [inline]
 hid_hw_stop+0x88/0x1cc drivers/hid/hid-core.c:2329
 ms_remove+0x28/0x94 drivers/hid/hid-microsoft.c:409
 hid_device_remove+0x1c8/0x2fc
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x3e4/0x6a0 drivers/base/dd.c:1295
 device_release_driver+0x28/0x38 drivers/base/dd.c:1318
 bus_remove_device+0x314/0x3b4 drivers/base/bus.c:574
 device_del+0x480/0x87c drivers/base/core.c:3828
 hid_remove_device drivers/hid/hid-core.c:2867 [inline]
 hid_destroy_device+0x70/0x114 drivers/hid/hid-core.c:2887
 usbhid_disconnect+0xa8/0xf0 drivers/hid/usbhid/hid-core.c:1456
 usb_unbind_interface+0x1a4/0x758 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x440/0x6a0 drivers/base/dd.c:1295
 device_release_driver+0x28/0x38 drivers/base/dd.c:1318
 bus_remove_device+0x314/0x3b4 drivers/base/bus.c:574
 device_del+0x480/0x87c drivers/base/core.c:3828
 usb_disable_device+0x354/0x760 drivers/usb/core/message.c:1416
 usb_disconnect+0x290/0x808 drivers/usb/core/hub.c:2267
 hub_port_connect drivers/usb/core/hub.c:5323 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5623 [inline]
 port_event drivers/usb/core/hub.c:5783 [inline]
 hub_event+0x18ec/0x435c drivers/usb/core/hub.c:5865
 process_one_work+0x694/0x1204 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x938/0xef4 kernel/workqueue.c:2787
 kthread+0x288/0x310 kernel/kthread.c:388
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
irq event stamp: 71432
hardirqs last  enabled at (71431): [<ffff80008ae4d56c>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
hardirqs last  enabled at (71431): [<ffff80008ae4d56c>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:202
hardirqs last disabled at (71432): [<ffff80008ae372c4>] __schedule+0x2bc/0x24b4 kernel/sched/core.c:6625
softirqs last  enabled at (42430): [<ffff80008002189c>] softirq_handle_end kernel/softirq.c:399 [inline]
softirqs last  enabled at (42430): [<ffff80008002189c>] __do_softirq+0xac8/0xce4 kernel/softirq.c:582
softirqs last disabled at (42421): [<ffff80008002ab48>] ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
---[ end trace 0000000000000000 ]---
usb 1-1: new high-speed USB device number 11 using dummy_hcd
usb 1-1: Using ep0 maxpacket: 16
usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has an invalid bInterval 0, changing to 7
usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
usb 1-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
microsoft 0003:045E:07DA.000A: unknown main item tag 0x0
microsoft 0003:045E:07DA.000A: unknown main item tag 0x0
microsoft 0003:045E:07DA.000A: unknown main item tag 0x0
microsoft 0003:045E:07DA.000A: unknown main item tag 0x0
HID 045e:07da: Invalid code 65791 type 1
input: HID 045e:07da as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/0003:045E:07DA.000A/input/input11
microsoft 0003:045E:07DA.000A: input,hidraw0: USB HID v0.00 Device [HID 045e:07da] on usb-dummy_hcd.0-1/input0
usb 1-1: USB disconnect, device number 11
------------[ cut here ]------------
add_uevent_var: buffer size too small
WARNING: CPU: 1 PID: 1394 at lib/kobject_uevent.c:671 add_uevent_var+0x278/0x3c0
Modules linked in:
CPU: 1 PID: 1394 Comm: kworker/1:2 Tainted: G    B   W          6.8.0-rc5-syzkaller-g9abbc24128bc #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/25/2024
Workqueue: usb_hub_wq hub_event
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : add_uevent_var+0x278/0x3c0
lr : add_uevent_var+0x274/0x3c0 lib/kobject_uevent.c:671
sp : ffff800098486c80
x29: ffff800098486da0 x28: 000000000000000c x27: ffff700013090d9c
x26: dfff800000000000 x25: ffff0001ffb5ea10 x24: 000000000000000c
x23: 00000000000007f4 x22: 000000000000000c x21: ffff0001ffb5e218
x20: ffff0001ffb5ea1c x19: ffff0001ffb5e000 x18: 1fffe00036804796
x17: 0000000000000000 x16: ffff80008ad5bbdc x15: 0000000000000001
x14: 1fffe00036804802 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000002 x10: 0000000000ff0100 x9 : c77e75592b5e9e00
x8 : c77e75592b5e9e00 x7 : 0000000000000001 x6 : 0000000000000001
x5 : ffff800098486578 x4 : ffff80008ed715e0 x3 : ffff8000805b98b4
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 00000000fffffff4
Call trace:
 add_uevent_var+0x278/0x3c0
 kobject_uevent_env+0x4f0/0x874 lib/kobject_uevent.c:588
 kobject_uevent+0x2c/0x3c lib/kobject_uevent.c:642
 device_del+0x6a8/0x87c drivers/base/core.c:3846
 __input_unregister_device+0x454/0x5c0 drivers/input/input.c:2232
 input_unregister_device+0xb0/0xfc drivers/input/input.c:2440
 hidinput_disconnect+0x1fc/0x290 drivers/hid/hid-input.c:2388
 hid_disconnect drivers/hid/hid-core.c:2280 [inline]
 hid_hw_stop+0x88/0x1cc drivers/hid/hid-core.c:2329
 ms_remove+0x28/0x94 drivers/hid/hid-microsoft.c:409
 hid_device_remove+0x1c8/0x2fc
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x3e4/0x6a0 drivers/base/dd.c:1295
 device_release_driver+0x28/0x38 drivers/base/dd.c:1318
 bus_remove_device+0x314/0x3b4 drivers/base/bus.c:574
 device_del+0x480/0x87c drivers/base/core.c:3828
 hid_remove_device drivers/hid/hid-core.c:2867 [inline]
 hid_destroy_device+0x70/0x114 drivers/hid/hid-core.c:2887
 usbhid_disconnect+0xa8/0xf0 drivers/hid/usbhid/hid-core.c:1456
 usb_unbind_interface+0x1a4/0x758 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x440/0x6a0 drivers/base/dd.c:1295
 device_release_driver+0x28/0x38 drivers/base/dd.c:1318
 bus_remove_device+0x314/0x3b4 drivers/base/bus.c:574
 device_del+0x480/0x87c drivers/base/core.c:3828
 usb_disable_device+0x354/0x760 drivers/usb/core/message.c:1416
 usb_disconnect+0x290/0x808 drivers/usb/core/hub.c:2267
 hub_port_connect drivers/usb/core/hub.c:5323 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5623 [inline]
 port_event drivers/usb/core/hub.c:5783 [inline]
 hub_event+0x18ec/0x435c drivers/usb/core/hub.c:5865
 process_one_work+0x694/0x1204 kernel/workqueue.c:2633
 process_scheduled_works kernel/workqueue.c:2706 [inline]
 worker_thread+0x938/0xef4 kernel/workqueue.c:2787
 kthread+0x288/0x310 kernel/kthread.c:388
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860
irq event stamp: 71432
hardirqs last  enabled at (71431): [<ffff80008ae4d56c>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
hardirqs last  enabled at (71431): [<ffff80008ae4d56c>] _raw_spin_unlock_irq+0x30/0x80 kernel/locking/spinlock.c:202
hardirqs last disabled at (71432): [<ffff80008ae372c4>] __schedule+0x2bc/0x24b4 kernel/sched/core.c:6625
softirqs last  enabled at (42430): [<ffff80008002189c>] softirq_handle_end kernel/softirq.c:399 [inline]
softirqs last  enabled at (42430): [<ffff80008002189c>] __do_softirq+0xac8/0xce4 kernel/softirq.c:582
softirqs last disabled at (42421): [<ffff80008002ab48>] ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:81
---[ end trace 0000000000000000 ]---
usb 1-1: new high-speed USB device number 12 using dummy_hcd
usb 1-1: Using ep0 maxpacket: 16
usb 1-1: config 0 interface 0 altsetting 0 endpoint 0x81 has an invalid bInterval 0, changing to 7
usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
usb 1-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
microsoft 0003:045E:07DA.000B: unknown main item tag 0x0
microsoft 0003:045E:07DA.000B: unknown main item tag 0x0
microsoft 0003:045E:07DA.000B: unknown main item tag 0x0
microsoft 0003:045E:07DA.000B: unknown main item tag 0x0
HID 045e:07da: Invalid code 65791 type 1
input: HID 045e:07da as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.0/0003:045E:07DA.000B/input/input12
microsoft 0003:045E:07DA.000B: input,hidraw0: USB HID v0.00 Device [HID 045e:07da] on usb-dummy_hcd.0-1/input0


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

