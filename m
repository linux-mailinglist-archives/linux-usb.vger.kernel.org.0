Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AADD353F630
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 08:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbiFGGdc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 02:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235887AbiFGGdb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 02:33:31 -0400
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027F72A267
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 23:33:29 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id g11-20020a056e021e0b00b002d1b5e8389bso13220881ila.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jun 2022 23:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=HKsdbbloWmDVf+xwX90jh6OebywG/qiKXLEQJYJCpeo=;
        b=XRZMvsPTU0NPBTz8Q3XUU+/odQeEMuSBheHhUlJSFaenJxcQfMtmUucU9w3TxW9Pub
         bL0JozCa02CUuNhr2FImmyeYc5BRrXQ7Dr+9qKqEQjIlFFgvfwhKHH2e2XHyj2nNOLPA
         cRHVM5W4F1GbnH87KnX/qnyqglXhxx16oB33p6SJgZiSkIHys5UxqHy/zLRUhEOUyGx5
         WIAwrzooosEEAXJcbNAC1g1MrYq7PGmAGpw7cnPsPfc3vwvNGFbI6ngghbvX7kTAJUcH
         TOf/EEBxseaY9+GzeFRcQZRWBfA2ywR0HhKK1BUmS/c54zbwUsjWcFDO6Sy6IgeBOQHC
         WKgw==
X-Gm-Message-State: AOAM531zk03BMeS/vGIM/kCnvJJJSEt0SYmlZUOSMN8MgKBqvXp+fl1T
        dDebUgCykLxz+8tvJnHCsK7uWotWYj1Melc3ij7HwbEQ8sF2
X-Google-Smtp-Source: ABdhPJxBwCt0Gq6e4RjkMaq7JYb0t3Yhrtw1rXkKwN3CocXd7UEOwcn2On0A0bPeAFuk77j7Mm83yvufZ+SxyggPCWzvaDmaGAsE
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2586:b0:331:bbbe:4f63 with SMTP id
 s6-20020a056638258600b00331bbbe4f63mr3652859jat.255.1654583608285; Mon, 06
 Jun 2022 23:33:28 -0700 (PDT)
Date:   Mon, 06 Jun 2022 23:33:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000039214105e0d5c4f4@google.com>
Subject: [syzbot] usb-testing boot error: INFO: task hung in add_early_randomness
From:   syzbot <syzbot+695f4009c37860232f35@syzkaller.appspotmail.com>
To:     herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux@dominikbrodowski.net, mpm@selenic.com,
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

HEAD commit:    f2906aa86338 Linux 5.19-rc1
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1042a03bf00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3bafeb86189666d4
dashboard link: https://syzkaller.appspot.com/bug?extid=695f4009c37860232f35
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+695f4009c37860232f35@syzkaller.appspotmail.com

INFO: task swapper/0:1 blocked for more than 143 seconds.
      Not tainted 5.19.0-rc1-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:swapper/0       state:D stack:23984 pid:    1 ppid:     0 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5116 [inline]
 __schedule+0x93c/0x25e0 kernel/sched/core.c:6428
 schedule+0xd2/0x1f0 kernel/sched/core.c:6500
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:6559
 __mutex_lock_common kernel/locking/mutex.c:679 [inline]
 __mutex_lock+0xa70/0x1350 kernel/locking/mutex.c:747
 add_early_randomness+0x1a/0x170 drivers/char/hw_random/core.c:69
 hwrng_register+0x399/0x510 drivers/char/hw_random/core.c:599
 virtrng_scan+0x37/0x90 drivers/char/hw_random/virtio-rng.c:205
 virtio_dev_probe+0x639/0x910 drivers/virtio/virtio.c:313
 call_driver_probe drivers/base/dd.c:555 [inline]
 really_probe+0x23e/0xb90 drivers/base/dd.c:634
 __driver_probe_device+0x338/0x4d0 drivers/base/dd.c:764
 driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:794
 __driver_attach+0x22d/0x550 drivers/base/dd.c:1163
 bus_for_each_dev+0x147/0x1d0 drivers/base/bus.c:301
 bus_add_driver+0x422/0x640 drivers/base/bus.c:618
 driver_register+0x220/0x3a0 drivers/base/driver.c:240
 do_one_initcall+0x103/0x650 init/main.c:1295
 do_initcall_level init/main.c:1368 [inline]
 do_initcalls init/main.c:1384 [inline]
 do_basic_setup init/main.c:1403 [inline]
 kernel_init_freeable+0x6ac/0x735 init/main.c:1610
 kernel_init+0x1a/0x1d0 init/main.c:1499
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:302
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:302
 </TASK>

Showing all locks held in the system:
2 locks held by swapper/0/1:
 #0: ffff88810cb9e170 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:835 [inline]
 #0: ffff88810cb9e170 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:1054 [inline]
 #0: ffff88810cb9e170 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x222/0x550 drivers/base/dd.c:1162
 #1: ffffffff87edbbe8 (reading_mutex){+.+.}-{3:3}, at: add_early_randomness+0x1a/0x170 drivers/char/hw_random/core.c:69
2 locks held by pr/ttyS0/14:
1 lock held by khungtaskd/27:
 #0: ffffffff87a94840 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6491
1 lock held by hwrng/150:
 #0: ffffffff87edbbe8 (reading_mutex){+.+.}-{3:3}, at: hwrng_fillfn+0x141/0x370 drivers/char/hw_random/core.c:503

=============================================



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
