Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7477078D1
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 06:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjEREMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 00:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjEREMt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 00:12:49 -0400
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73223A80
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 21:12:46 -0700 (PDT)
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-33866ff4c0bso1312195ab.3
        for <linux-usb@vger.kernel.org>; Wed, 17 May 2023 21:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684383166; x=1686975166;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ad68lj4j6xqtAEDpxc6cTTyJqlISj7andYukqr+rtKQ=;
        b=Epm3hI92aAokgF9pP8jkRSvXElLpvRDzKCxfNIaL3yrxfwkmdaCKu8hkjjEa8Wui+K
         qN+iHHQa8pvK3fCfMNCrjUCAo2ti+RIi93FimtjBdqq9Id4fCkLuK1l8oPbrJpLwMiU9
         X8aky5WasLA9my7tQpw4NK8rLWR6IAKkgC+b9SrGiYJw5XIu1fnjOXL8RkKIy35kTUaV
         XXB3vwsD3lwd0Tz1VxrEfO6wTIdGXctJ00IBu/TZrAjiiokhFl78CTRuGQ89wt1j3fKT
         crcPRnhhL/xTcr7ukVGqxoTbiyPXbiDW7A34R6shw+mHcsjj6E4C4wunX7mauhWqJvov
         8o4A==
X-Gm-Message-State: AC+VfDyZLV4wlGPYpDxEqN++Sx+MMMqnUvSMK7RMyPx5d2eYCMXR/BGv
        gqCkCD78DUwDSOpB19gtirSL3OJuYTMoFoXGlcgCkTsf6OEh
X-Google-Smtp-Source: ACHHUZ5u+S4OP8f/Ud+k9vjwXAsEJfXmAwXGq+cz/5NQAfGKCVRKR69HrAcQvze56oKsJKuKyiMIHraZQcL2339fMeX/WgGW6BiT
MIME-Version: 1.0
X-Received: by 2002:a92:d086:0:b0:335:de72:23d7 with SMTP id
 h6-20020a92d086000000b00335de7223d7mr2485125ilh.3.1684383166240; Wed, 17 May
 2023 21:12:46 -0700 (PDT)
Date:   Wed, 17 May 2023 21:12:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004a222005fbf00461@google.com>
Subject: [syzbot] [fbdev?] [usb?] WARNING in dlfb_submit_urb/usb_submit_urb (2)
From:   syzbot <syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com>
To:     bernie@plugable.com, deller@gmx.de,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
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

HEAD commit:    a4422ff22142 usb: typec: qcom: Add Qualcomm PMIC Type-C dr..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15245566280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2414a945e4542ec1
dashboard link: https://syzkaller.appspot.com/bug?extid=0e22d63dcebb802b9bc8
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1720fd3a280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=171a73ea280000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/414817142fb7/disk-a4422ff2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/448dba0d344e/vmlinux-a4422ff2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d0ad9fe848e2/bzImage-a4422ff2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0e22d63dcebb802b9bc8@syzkaller.appspotmail.com

usb 1-1: Read EDID byte 0 failed: -71
usb 1-1: Unable to get valid EDID from device/display
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 3 != type 1
WARNING: CPU: 0 PID: 9 at drivers/usb/core/urb.c:504 usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
Modules linked in:
CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.4.0-rc1-syzkaller-00016-ga4422ff22142 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/28/2023
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xed6/0x1880 drivers/usb/core/urb.c:504
Code: 7c 24 18 e8 7c dc 5a fd 48 8b 7c 24 18 e8 42 ca 0b ff 41 89 d8 44 89 e1 4c 89 ea 48 89 c6 48 c7 c7 60 34 cc 86 e8 0a fa 25 fd <0f> 0b e9 58 f8 ff ff e8 4e dc 5a fd 48 81 c5 b8 05 00 00 e9 84 f7
RSP: 0018:ffffc9000009ed48 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff888103650000 RSI: ffffffff81163677 RDI: 0000000000000001
RBP: ffff88810cb32940 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000003
R13: ffff88810cf426b8 R14: 0000000000000003 R15: ffff888104272100
FS:  0000000000000000(0000) GS:ffff8881f6600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562147be3b70 CR3: 0000000110380000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dlfb_submit_urb+0x92/0x180 drivers/video/fbdev/udlfb.c:1980
 dlfb_set_video_mode+0x21f0/0x2950 drivers/video/fbdev/udlfb.c:315
 dlfb_ops_set_par+0x2a7/0x8d0 drivers/video/fbdev/udlfb.c:1111
 dlfb_usb_probe+0x149a/0x2710 drivers/video/fbdev/udlfb.c:1743
 usb_probe_interface+0x30f/0x960 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x240/0xca0 drivers/base/dd.c:658
 __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
 __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
 bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
 device_add+0x112d/0x1a40 drivers/base/core.c:3625
 usb_set_configuration+0x1196/0x1bc0 drivers/usb/core/message.c:2211
 usb_generic_driver_probe+0xcf/0x130 drivers/usb/core/generic.c:238
 usb_probe_device+0xd8/0x2c0 drivers/usb/core/driver.c:293
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x240/0xca0 drivers/base/dd.c:658
 __driver_probe_device+0x1df/0x4b0 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:830
 __device_attach_driver+0x1d4/0x2e0 drivers/base/dd.c:958
 bus_for_each_drv+0x149/0x1d0 drivers/base/bus.c:457
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17c/0x1c0 drivers/base/bus.c:532
 device_add+0x112d/0x1a40 drivers/base/core.c:3625
 usb_new_device+0xcb2/0x19d0 drivers/usb/core/hub.c:2575
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5551 [inline]
 port_event drivers/usb/core/hub.c:5711 [inline]
 hub_event+0x2e3d/0x4ed0 drivers/usb/core/hub.c:5793
 process_one_work+0x99a/0x15e0 kernel/workqueue.c:2405
 worker_thread+0x67d/0x10c0 kernel/workqueue.c:2552
 kthread+0x344/0x440 kernel/kthread.c:379
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
