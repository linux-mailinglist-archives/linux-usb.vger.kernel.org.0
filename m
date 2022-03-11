Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61C214D6A09
	for <lists+linux-usb@lfdr.de>; Sat, 12 Mar 2022 00:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiCKWuL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Mar 2022 17:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiCKWuB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Mar 2022 17:50:01 -0500
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF822BFCF5
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 14:24:02 -0800 (PST)
Received: by mail-il1-f199.google.com with SMTP id a2-20020a056e020e0200b002c6344a01c9so6421089ilk.13
        for <linux-usb@vger.kernel.org>; Fri, 11 Mar 2022 14:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=2Q57z1F8XAilR8GwXp2jj5N7XCSKupWDFaXmEOuADRs=;
        b=3c4WMeaCjFZz9w3/ICGzR+SMdA8AIPEbO9IqrViJX3Onb4GXwFXLjHvZiRwMWe37WF
         8Uo6uSU53FiGrOTekuIh2ncaYrMdnuI8bxi8yElHTbgfj8sJlts7UJ6AGNziPwlwNpWt
         XIpN3zUShY47L8WmJRDVuEM+/2ei6kgA02fPcfMVD6Ug3SLOFZRkjPMtgQus5U/tCJsU
         +o+/ZinceUAlfBMVJ5RkmJIrQ/xH/bmfJTpidbqURIZ8Mu1C4tCtzyofkab71mn4pWfl
         xka6TPcrYPw80rCq0T9soKFh5lh8fLYxEpaeTCiSivkEHRDG8HnPBVmkMc7cI+Yn0V8V
         yBAA==
X-Gm-Message-State: AOAM531/uxP++RfvyamvnLwW4zPYPZScMvTmXEejpSaatxZKLZgVpnTk
        nl7IiNkYEkjDV8q+hz7C58JFatYa5LixR9zD8DrB7YMiZSDp
X-Google-Smtp-Source: ABdhPJzlSRIpwopQ8QEJSaEfO56jSAg8VmG8rwEcJCD1LVuSs7XkXxwvm92qEiO8iYlqHohMkIKoqCvixG1+yhAYSTDudbLJMQDg
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1447:b0:2c6:7e8b:6ff8 with SMTP id
 p7-20020a056e02144700b002c67e8b6ff8mr8132718ilo.178.1647033009715; Fri, 11
 Mar 2022 13:10:09 -0800 (PST)
Date:   Fri, 11 Mar 2022 13:10:09 -0800
In-Reply-To: <Yiu4tCONfHVH1Qfv@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a3fb305d9f7c1bd@google.com>
Subject: Re: [syzbot] memory leak in usb_get_configuration
From:   syzbot <syzbot+f0fae482604e6d9a87c9@syzkaller.appspotmail.com>
To:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, pavel.hofman@ivitera.com,
        rob@robgreener.com, stern@rowland.harvard.edu,
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

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
memory leak in usb_get_configuration

BUG: memory leak
unreferenced object 0xffff8881128c0320 (size 32):
  comm "kworker/1:1", pid 25, jiffies 4294943657 (age 15.110s)
  hex dump (first 32 bytes):
    09 02 12 00 01 00 00 00 00 09 04 00 00 00 d0 bb  ................
    3a 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  :...............
  backtrace:
    [<ffffffff82c98127>] kmalloc include/linux/slab.h:586 [inline]
    [<ffffffff82c98127>] usb_get_configuration+0x1c7/0x1cd0 drivers/usb/core/config.c:919
    [<ffffffff82c863f9>] usb_enumerate_device drivers/usb/core/hub.c:2398 [inline]
    [<ffffffff82c863f9>] usb_new_device+0x1a9/0x2e0 drivers/usb/core/hub.c:2536
    [<ffffffff82c88ea4>] hub_port_connect drivers/usb/core/hub.c:5358 [inline]
    [<ffffffff82c88ea4>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c88ea4>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c88ea4>] hub_event+0x1364/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126a41f>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ad49>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81274705>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810021ef>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

BUG: memory leak
unreferenced object 0xffff888108eeb640 (size 64):
  comm "kworker/1:1", pid 25, jiffies 4294943661 (age 15.080s)
  hex dump (first 32 bytes):
    01 00 00 00 01 00 00 00 09 04 00 00 00 d0 bb 3a  ...............:
    00 00 00 00 00 00 00 00 32 03 8c 12 81 88 ff ff  ........2.......
  backtrace:
    [<ffffffff82c9871d>] kmalloc include/linux/slab.h:586 [inline]
    [<ffffffff82c9871d>] kzalloc include/linux/slab.h:714 [inline]
    [<ffffffff82c9871d>] usb_parse_configuration drivers/usb/core/config.c:772 [inline]
    [<ffffffff82c9871d>] usb_get_configuration+0x7bd/0x1cd0 drivers/usb/core/config.c:944
    [<ffffffff82c863f9>] usb_enumerate_device drivers/usb/core/hub.c:2398 [inline]
    [<ffffffff82c863f9>] usb_new_device+0x1a9/0x2e0 drivers/usb/core/hub.c:2536
    [<ffffffff82c88ea4>] hub_port_connect drivers/usb/core/hub.c:5358 [inline]
    [<ffffffff82c88ea4>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c88ea4>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c88ea4>] hub_event+0x1364/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126a41f>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ad49>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81274705>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810021ef>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

BUG: memory leak
unreferenced object 0xffff888112a7bf00 (size 64):
  comm "kworker/1:2", pid 1569, jiffies 4294944314 (age 8.550s)
  hex dump (first 32 bytes):
    01 00 00 00 01 00 00 00 09 04 00 00 00 d0 bb 3a  ...............:
    00 00 00 00 00 00 00 00 52 66 72 12 81 88 ff ff  ........Rfr.....
  backtrace:
    [<ffffffff82c9871d>] kmalloc include/linux/slab.h:586 [inline]
    [<ffffffff82c9871d>] kzalloc include/linux/slab.h:714 [inline]
    [<ffffffff82c9871d>] usb_parse_configuration drivers/usb/core/config.c:772 [inline]
    [<ffffffff82c9871d>] usb_get_configuration+0x7bd/0x1cd0 drivers/usb/core/config.c:944
    [<ffffffff82c863f9>] usb_enumerate_device drivers/usb/core/hub.c:2398 [inline]
    [<ffffffff82c863f9>] usb_new_device+0x1a9/0x2e0 drivers/usb/core/hub.c:2536
    [<ffffffff82c88ea4>] hub_port_connect drivers/usb/core/hub.c:5358 [inline]
    [<ffffffff82c88ea4>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
    [<ffffffff82c88ea4>] port_event drivers/usb/core/hub.c:5660 [inline]
    [<ffffffff82c88ea4>] hub_event+0x1364/0x21a0 drivers/usb/core/hub.c:5742
    [<ffffffff8126a41f>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
    [<ffffffff8126ad49>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
    [<ffffffff81274705>] kthread+0x125/0x160 kernel/kthread.c:377
    [<ffffffff810021ef>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295



Tested on:

commit:         0014404f Merge branch 'akpm' (patches from Andrew)
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=155954d9700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3f0a704147ec8e32
dashboard link: https://syzkaller.appspot.com/bug?extid=f0fae482604e6d9a87c9
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1005e709700000

