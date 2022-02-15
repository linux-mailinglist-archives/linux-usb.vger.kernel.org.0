Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9282C4B6998
	for <lists+linux-usb@lfdr.de>; Tue, 15 Feb 2022 11:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236630AbiBOKm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Feb 2022 05:42:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235841AbiBOKm1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Feb 2022 05:42:27 -0500
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3F9986EC
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 02:42:17 -0800 (PST)
Received: by mail-il1-f197.google.com with SMTP id p8-20020a056e02144800b002be41f4c3d2so13135463ilo.15
        for <linux-usb@vger.kernel.org>; Tue, 15 Feb 2022 02:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=LZjOty7zFJyOrMcr4TxzREc+2c2KYd3S0p/Wv9X7MIc=;
        b=OMKJD5uooSKWI+wh942rCz2UCIQIeR3IaD9ioZa3UpihTUtb4zZ4NAhy0CiTrc51RW
         JV/6voFh+XwBryzy9GE5Au6o96WHN6igNbuep30l8OSC8hXEIHNwvUJ6s41BtrpnJSSo
         N6TNLGP7YLJUVUb4J04t0eFVGtcUnxxzLrUzTTbx9TWrYZTYBRLfBFW4+NSjgi9CsE8t
         WIwP5WTo9E6xjooxvI8PZlZ4wiqEJqJ1k723HlaZL+i+UFaxV24WAvDBF7d8vmo/zWhP
         qyITnEAn/LybV+xBMbKabE/W4jesAX1MTRoFziqY5Ji2/prHvoJ7oV+VKkyXaNfs/XpC
         awbQ==
X-Gm-Message-State: AOAM530wiROYK5djS7MxzCyNRrGW+2iAQYi6UlTvHMbmEtbcjctTopKJ
        RUpt4BL5SO93UPVuV1ySR9LP1esXwRBDkqEYhuj612TpeLyD
X-Google-Smtp-Source: ABdhPJw14P7CBwpVD017iscgSxpeYEOKiTbswdQ+qjsuc8jOMmAEFFiwc4iS66FSjVgskWlH1gc92AYMS8GmDsc0kxpdzyp7wtFh
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a0a:: with SMTP id s10mr2075014ild.297.1644921737274;
 Tue, 15 Feb 2022 02:42:17 -0800 (PST)
Date:   Tue, 15 Feb 2022 02:42:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d56a0305d80c2f2b@google.com>
Subject: [syzbot] KMSAN: uninit-value in ax88179_led_setting
From:   syzbot <syzbot+d3dbdf31fbe9d8f5f311@syzkaller.appspotmail.com>
To:     arnd@arndb.de, davem@davemloft.net, glider@google.com,
        jgg@ziepe.ca, kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        phil@philpotter.co.uk, syzkaller-bugs@googlegroups.com
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

HEAD commit:    85cfd6e539bd kmsan: core: delete kmsan_gup_pgd_range()
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=12d6c53c700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b9807dd5b044fd7a
dashboard link: https://syzkaller.appspot.com/bug?extid=d3dbdf31fbe9d8f5f311
compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-monorepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d3dbdf31fbe9d8f5f311@syzkaller.appspotmail.com

ax88179_178a 2-1:0.35 (unnamed net_device) (uninitialized): Failed to read reg index 0x0001: -71
ax88179_178a 2-1:0.35 (unnamed net_device) (uninitialized): Failed to read reg index 0x0002: -71
=====================================================
BUG: KMSAN: uninit-value in ax88179_check_eeprom drivers/net/usb/ax88179_178a.c:1074 [inline]
BUG: KMSAN: uninit-value in ax88179_led_setting+0x884/0x30b0 drivers/net/usb/ax88179_178a.c:1168
 ax88179_check_eeprom drivers/net/usb/ax88179_178a.c:1074 [inline]
 ax88179_led_setting+0x884/0x30b0 drivers/net/usb/ax88179_178a.c:1168
 ax88179_bind+0xe75/0x1990 drivers/net/usb/ax88179_178a.c:1411
 usbnet_probe+0x1284/0x4140 drivers/net/usb/usbnet.c:1747
 usb_probe_interface+0xf19/0x1600 drivers/usb/core/driver.c:396
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_set_configuration+0x37e9/0x3ed0 drivers/usb/core/message.c:2170
 usb_generic_driver_probe+0x13c/0x300 drivers/usb/core/generic.c:238
 usb_probe_device+0x309/0x570 drivers/usb/core/driver.c:293
 really_probe+0x67d/0x1510 drivers/base/dd.c:596
 __driver_probe_device+0x3e9/0x530 drivers/base/dd.c:751
 driver_probe_device drivers/base/dd.c:781 [inline]
 __device_attach_driver+0x79f/0x1120 drivers/base/dd.c:898
 bus_for_each_drv+0x2d6/0x3f0 drivers/base/bus.c:427
 __device_attach+0x593/0x8e0 drivers/base/dd.c:969
 device_initial_probe+0x4a/0x60 drivers/base/dd.c:1016
 bus_probe_device+0x17b/0x3e0 drivers/base/bus.c:487
 device_add+0x1d3e/0x2400 drivers/base/core.c:3394
 usb_new_device+0x1b8e/0x2950 drivers/usb/core/hub.c:2563
 hub_port_connect drivers/usb/core/hub.c:5353 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5643 [inline]
 hub_event+0x5ad2/0x8910 drivers/usb/core/hub.c:5725
 process_one_work+0xdb9/0x1820 kernel/workqueue.c:2298
 process_scheduled_works kernel/workqueue.c:2361 [inline]
 worker_thread+0x1735/0x21f0 kernel/workqueue.c:2447
 kthread+0x721/0x850 kernel/kthread.c:327
 ret_from_fork+0x1f/0x30

Local variable eeprom.i created at:
 ax88179_check_eeprom drivers/net/usb/ax88179_178a.c:1045 [inline]
 ax88179_led_setting+0x2e2/0x30b0 drivers/net/usb/ax88179_178a.c:1168
 ax88179_bind+0xe75/0x1990 drivers/net/usb/ax88179_178a.c:1411

CPU: 1 PID: 13457 Comm: kworker/1:0 Not tainted 5.16.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
