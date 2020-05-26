Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E6C1AF62D
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2020 03:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgDSBqG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Apr 2020 21:46:06 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:49345 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgDSBqF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Apr 2020 21:46:05 -0400
Received: by mail-io1-f70.google.com with SMTP id v19so6847480ioq.16
        for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2020 18:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=bpfLdZafPe0oYfWcanYZoISvZdU7aY0f0bhGg6C78NY=;
        b=o8ZezT4W2LvN4Ftka1ODyiaLSxS2JR/WNFS2dwP2kQVmkM3Vv8Y9StpE1OCh81Cb4m
         r77YJHb9bia4RHxBKcGEM28ZEgUAHuV6UD6gFCbhVibYWiyUtsCXoL+YE+9I//Z32MmW
         OrIM6Etg7WSjphQZzaqpMjec2aNxrORldsy7EC1Ep3Zqz6F7M8ZGCbwaqMJQEkZkOwb9
         ZKTvnRty53QwVAa2vOQ9MOtMbz2uxJpgDKNYceI/FjraTRCVS+hZTaR39bTMPaug9PMY
         1gQp2ZHbKk7P4aC1vooPUuf11OjYwvwD2P+uuYaPjpmDtO0BECy/0E+XnJ/RVAJmsZsn
         xA6A==
X-Gm-Message-State: AGi0PuZd+f865BW7MYLS+dr3mXkeCfuOvrIMjsZrCsd59PEZY+aIyeJW
        sS8qDdUfV2f2bf2d8gOJ3SO8SPS0wNNZZ4GDiw3yCf68t+ah
X-Google-Smtp-Source: APiQypJJM8tCAHWlJ/FIAeJkVwce8XYjPJuuBTbnyCUanlqgS2GAO1ZHtwEHGYXTPMv1CYSm/7T/igpLAb+44Mjtds3s1/cPqq0Y
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:c8f:: with SMTP id b15mr9136491ile.35.1587260763277;
 Sat, 18 Apr 2020 18:46:03 -0700 (PDT)
Date:   Sat, 18 Apr 2020 18:46:03 -0700
In-Reply-To: <Pine.LNX.4.44L0.2004182131100.26218-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f610e805a39af1d0@google.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
From:   syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot has tested the proposed patch but the reproducer still triggered crash:
WARNING in usbhid_stop

usbhid 5-1:0.0: Stop while open = 1
WARNING: CPU: 0 PID: 95 at drivers/hid/usbhid/hid-core.c:1205 usbhid_stop.cold+0x1fb/0x5e6 drivers/hid/usbhid/hid-core.c:1205
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 95 Comm: kworker/0:2 Not tainted 5.6.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xef/0x16e lib/dump_stack.c:118
 panic+0x2aa/0x6e1 kernel/panic.c:221
 __warn.cold+0x2f/0x30 kernel/panic.c:582
 report_bug+0x27b/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:174 [inline]
 fixup_bug arch/x86/kernel/traps.c:169 [inline]
 do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
 do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:usbhid_stop.cold+0x1fb/0x5e6 drivers/hid/usbhid/hid-core.c:1205
Code: 48 89 7c 24 08 e8 7b 87 bd fc 48 8b 7c 24 08 e8 a1 57 f7 fd 48 8b 14 24 44 89 f1 48 c7 c7 60 3d 84 86 48 89 c6 e8 23 18 92 fc <0f> 0b e8 54 87 bd fc 48 8d bb ac 1e 00 00 b8 ff ff 37 00 48 89 fa
RSP: 0018:ffff8881d5cbf640 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff8881bcd1c000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff812974dd RDI: ffffed103ab97eba
RBP: ffff8881ccac4000 R08: ffff8881d712e200 R09: ffffed103b646248
R10: ffffed103b646247 R11: ffff8881db23123f R12: ffff8881ccac4008
R13: ffff8881d8859000 R14: 0000000000000001 R15: ffff8881bcd1dfd8
 wacom_remove+0x88/0x3b0 drivers/hid/wacom_sys.c:2773
 hid_device_remove+0xed/0x1d0 drivers/hid/hid-core.c:2298
 __device_release_driver drivers/base/dd.c:1135 [inline]
 device_release_driver_internal+0x231/0x500 drivers/base/dd.c:1168
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2677
 hid_remove_device drivers/hid/hid-core.c:2469 [inline]
 hid_destroy_device+0xe1/0x150 drivers/hid/hid-core.c:2488
 usbhid_disconnect+0x9f/0xe0 drivers/hid/usbhid/hid-core.c:1420
 usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:436
 __device_release_driver drivers/base/dd.c:1137 [inline]
 device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1168
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x481/0xd30 drivers/base/core.c:2677
 usb_disable_device+0x23d/0x790 drivers/usb/core/message.c:1238
 usb_disconnect+0x293/0x900 drivers/usb/core/hub.c:2211
 hub_port_connect drivers/usb/core/hub.c:5046 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5335 [inline]
 port_event drivers/usb/core/hub.c:5481 [inline]
 hub_event+0x1a1d/0x4300 drivers/usb/core/hub.c:5563
 process_one_work+0x94b/0x1620 kernel/workqueue.c:2266
 process_scheduled_works kernel/workqueue.c:2328 [inline]
 worker_thread+0x7ab/0xe20 kernel/workqueue.c:2414
 kthread+0x318/0x420 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16275720100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
dashboard link: https://syzkaller.appspot.com/bug?extid=7bf5a7b0f0a1f9446f4c
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=175205d7e00000

