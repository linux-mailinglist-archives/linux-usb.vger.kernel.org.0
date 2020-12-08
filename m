Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566872D2A6C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 13:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728653AbgLHMNw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 07:13:52 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:33504 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728560AbgLHMNw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 07:13:52 -0500
Received: by mail-io1-f70.google.com with SMTP id t23so12952027ioh.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Dec 2020 04:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=sIr2487dPP01PGWAGnpnCKoFqEKwcrRNII54jM9x7Vo=;
        b=oIza9+R0yEYcXoqHuBYFUrxmFkbS2MIw0OSk/IQqT+PkB66brMNFvbcY7gQX0Rd9Tt
         A+SRpF1pIAPkwUoG0HYlx7ZwnUwBrqXi20Q0obwy+EnRkUQ6ZSdyL0j0Kzr33xpaW4PT
         AouDPds3sYxiX+2ne1x19iXTKobfAxbtP5KQbjw9I43IeE1+L2jI/ERZiYwK6O461RlB
         x885hJfpJnJpkia5uBba3mog9eDzkx+Ylb2DxUe/FpteK0VEbECKOPGe5MocrfWu+CGS
         9kOdR1w1Hw+wwwF2maDRh+KP1s9Iq62CEhhUSPjZur4fhn5fNlEe93yNmijJBIsd74PQ
         ojTg==
X-Gm-Message-State: AOAM531narj/SiSEwezVqNIObNoygU/Dm1Xa/AdUSrxhYccwdp9ezl7c
        xzeFdxY21YLN2ZUg5JPV/vpLb3wJi441EoqwlOUHvHaHoJZN
X-Google-Smtp-Source: ABdhPJzQ2sFxvi5gFhKu9t/hT7O5AB3ZxOq2aTRzfBapXieBJ7KJ9ziCrnh8yClmV5kM5K9Qi8xqU11QUwht+toUxIFgc0oqetYN
MIME-Version: 1.0
X-Received: by 2002:a92:1906:: with SMTP id 6mr26171612ilz.138.1607429591500;
 Tue, 08 Dec 2020 04:13:11 -0800 (PST)
Date:   Tue, 08 Dec 2020 04:13:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cd8dcd05b5f2dd90@google.com>
Subject: KMSAN: uninit-value in smsc95xx_wait_eeprom (2)
From:   syzbot <syzbot+94b1393490c2c70b781b@syzkaller.appspotmail.com>
To:     UNGLinuxDriver@microchip.com, davem@davemloft.net,
        glider@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        steve.glendinning@shawell.net, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    73d62e81 kmsan: random: prevent boot-time reports in _mix_..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=178d246b500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eef728deea880383
dashboard link: https://syzkaller.appspot.com/bug?extid=94b1393490c2c70b781b
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+94b1393490c2c70b781b@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in smsc95xx_wait_eeprom+0x223/0x3e0 drivers/net/usb/smsc95xx.c:303
CPU: 1 PID: 28836 Comm: kworker/1:1 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 smsc95xx_wait_eeprom+0x223/0x3e0 drivers/net/usb/smsc95xx.c:303
 smsc95xx_read_eeprom+0x46d/0xa10 drivers/net/usb/smsc95xx.c:360
 smsc95xx_init_mac_address drivers/net/usb/smsc95xx.c:769 [inline]
 smsc95xx_bind+0x811/0x1d30 drivers/net/usb/smsc95xx.c:1090
 usbnet_probe+0x1169/0x3e90 drivers/net/usb/usbnet.c:1712
 usb_probe_interface+0xfcc/0x1520 drivers/usb/core/driver.c:396
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_set_configuration+0x39cf/0x4010 drivers/usb/core/message.c:2159
 usb_generic_driver_probe+0x138/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x317/0x570 drivers/usb/core/driver.c:293
 really_probe+0xebd/0x2420 drivers/base/dd.c:558
 driver_probe_device+0x293/0x390 drivers/base/dd.c:738
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:844
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x538/0x860 drivers/base/dd.c:912
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:959
 bus_probe_device+0x177/0x3d0 drivers/base/bus.c:491
 device_add+0x399e/0x3f20 drivers/base/core.c:2936
 usb_new_device+0x1bd6/0x2a30 drivers/usb/core/hub.c:2554
 hub_port_connect drivers/usb/core/hub.c:5222 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x5bc9/0x8890 drivers/usb/core/hub.c:5590
 process_one_work+0x121c/0x1fc0 kernel/workqueue.c:2272
 worker_thread+0x10cc/0x2740 kernel/workqueue.c:2418
 kthread+0x51c/0x560 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Local variable ----buf.i.i@smsc95xx_wait_eeprom created at:
 __smsc95xx_read_reg drivers/net/usb/smsc95xx.c:77 [inline]
 smsc95xx_read_reg drivers/net/usb/smsc95xx.c:141 [inline]
 smsc95xx_wait_eeprom+0x9d/0x3e0 drivers/net/usb/smsc95xx.c:297
 __smsc95xx_read_reg drivers/net/usb/smsc95xx.c:77 [inline]
 smsc95xx_read_reg drivers/net/usb/smsc95xx.c:141 [inline]
 smsc95xx_wait_eeprom+0x9d/0x3e0 drivers/net/usb/smsc95xx.c:297
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
