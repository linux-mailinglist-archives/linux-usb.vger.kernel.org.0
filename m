Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16D7F4C0F39
	for <lists+linux-usb@lfdr.de>; Wed, 23 Feb 2022 10:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239257AbiBWJar (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Feb 2022 04:30:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234747AbiBWJaq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Feb 2022 04:30:46 -0500
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1471410FF8
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 01:30:19 -0800 (PST)
Received: by mail-il1-f199.google.com with SMTP id i17-20020a925411000000b002bf4c9c4142so12235350ilb.6
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 01:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=rOgWpFzlzfDic7PPkkbTbM91/9giJy4YgpDa5cNJ1TM=;
        b=45CkH9bCRFCLdrc0Vk+CY33e72zZ7yLzxpuZfgGE4bJuuIk+2xA8LHi/d1WqHHna9C
         bgxxXRmI+aVB5S++uXVXOsvN/O3DCOCrlPG7KkHlmvfM/C9zfmBYQTktdlv1edIgYRts
         v7f9IGRv1BnzNCpr/2mU6tHYc1EyzQLdgBTW5TJb6/WFTlqcVLRmhimbEcukkPbjoQbQ
         Vfj48xaISev8hODECP1aMhBW/6z3P9drltBzafkI7KS7IAj/VAsVwV/NDqyX8luAtlNo
         a6P9qCZYc20XNF1wDoIbZp7mhUxPzEvEy1vNz3OzvCvjpVBn1D+FF2rD+pnk0x5VgnSA
         5vCA==
X-Gm-Message-State: AOAM5301MtwrpM4SZfwoMhZsdegs+GcZK1G6I/avAV5hKSMNZ3CKgJyp
        JPZFmOk84/d9a9NCXRC2nKdRPZZKeOa89fyEkwJIlehpW5us
X-Google-Smtp-Source: ABdhPJyGbs/d0DzgEhO+2h4MPKAwNX1W6TCt+NastddY0kCx+EpZlh5lo+m1HiWBuZ3H6FFLBNHEiwGioei+ALB6ZDn+PKSTupWv
MIME-Version: 1.0
X-Received: by 2002:a92:b0b:0:b0:2c2:74db:9630 with SMTP id
 b11-20020a920b0b000000b002c274db9630mr2822578ilf.170.1645608618466; Wed, 23
 Feb 2022 01:30:18 -0800 (PST)
Date:   Wed, 23 Feb 2022 01:30:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000024a1f805d8ac1da3@google.com>
Subject: [syzbot] KMSAN: uninit-value in asix_check_host_enable
From:   syzbot <syzbot+8f5f07bb9d6935e2f8d9@syzkaller.appspotmail.com>
To:     andrew@lunn.ch, davem@davemloft.net, glider@google.com,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux@rempel-privat.de,
        netdev@vger.kernel.org, paskripkin@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    724946410067 x86: kmsan: enable KMSAN builds for x86
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=11c85246700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=76f99026248b24e4
dashboard link: https://syzkaller.appspot.com/bug?extid=8f5f07bb9d6935e2f8d9
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11674fe2700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1497324c700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f5f07bb9d6935e2f8d9@syzkaller.appspotmail.com

asix 1-1:0.0 (unnamed net_device) (uninitialized): Failed to write reg index 0x0000: -71
asix 1-1:0.0 (unnamed net_device) (uninitialized): Failed to enable software MII access
asix 1-1:0.0 (unnamed net_device) (uninitialized): Failed to read reg index 0x0000: -71
=====================================================
BUG: KMSAN: uninit-value in asix_check_host_enable+0x289/0x330 drivers/net/usb/asix_common.c:84
 asix_check_host_enable+0x289/0x330 drivers/net/usb/asix_common.c:84
 __asix_mdio_write+0x10d/0x5c0 drivers/net/usb/asix_common.c:532
 asix_mdio_write+0xad/0xc0 drivers/net/usb/asix_common.c:550
 asix_phy_reset+0xd5/0x2e0 drivers/net/usb/asix_devices.c:208
 ax88172_bind+0x738/0x9d0 drivers/net/usb/asix_devices.c:275
 usbnet_probe+0x1251/0x4160 drivers/net/usb/usbnet.c:1747
 usb_probe_interface+0xf19/0x1600 drivers/usb/core/driver.c:396
 really_probe+0x653/0x14b0 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:752
 driver_probe_device drivers/base/dd.c:782 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:899
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:970
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1017
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1fff/0x26e0 drivers/base/core.c:3405
 usb_set_configuration+0x37e9/0x3ed0 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0x13c/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x309/0x570 drivers/usb/core/driver.c:293
 really_probe+0x653/0x14b0 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:752
 driver_probe_device drivers/base/dd.c:782 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:899
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:970
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1017
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1fff/0x26e0 drivers/base/core.c:3405
 usb_new_device+0x1b8e/0x2950 drivers/usb/core/hub.c:2566
 hub_port_connect drivers/usb/core/hub.c:5358 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
 port_event drivers/usb/core/hub.c:5660 [inline]
 hub_event+0x58e3/0x89e0 drivers/usb/core/hub.c:5742
 process_one_work+0xdb6/0x1820 kernel/workqueue.c:2307
 worker_thread+0x10b3/0x21e0 kernel/workqueue.c:2454
 kthread+0x3c7/0x500 kernel/kthread.c:377
 ret_from_fork+0x1f/0x30

Local variable smsr created at:
 asix_check_host_enable+0x66/0x330
 __asix_mdio_write+0x10d/0x5c0 drivers/net/usb/asix_common.c:532

CPU: 1 PID: 34 Comm: kworker/1:1 Not tainted 5.17.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
