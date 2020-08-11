Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFA9C241ED2
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 19:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgHKRA7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 13:00:59 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:34010 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728906AbgHKRAV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 13:00:21 -0400
Received: by mail-io1-f69.google.com with SMTP id 127so10255299iou.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 10:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=gZgyni2GVSRYbWS9PH5RPXXStatdShT/Am/nC/on1wU=;
        b=TKFL6XIOZGN40bSmQkV91WmPxsOqNyXJWB+DVTkNGsTKuw2CwrOmfpG0McDcGTOgab
         HrwYcE2v7HX+zAjS/HJ+zwZr1ljxEO6wdxfmv4ahNKHqKWH93XkbSNoukv2VIWBpmIBe
         mTmLv/tDXuDfvm9WwH1yv0y70Q1+obsI0uIxBEoKwH32G8PurLbMobYPm37/lEddn5YV
         2UaVWgv3S6iHLscdWZKWmqhpPLfjHsacCGYC42WRHANiKOjAv1JN3Q4EZaRjmq68R2LT
         2G1Z8uU0WJCLk7uVgYloj+kLBYhXvZlYIsI+oSu3GbtaD+oZikz3TcZu0Oqk/vdBBO5S
         fVbA==
X-Gm-Message-State: AOAM531mzIJOkGXLBn6D0GTIxm4nyZoHXHuNKiuBu2cj1MPrXZwECgAo
        FaE19WIMQ/nZGEQbouYvHKKtzngP93KIS4S3DXFCH+JlA/7F
X-Google-Smtp-Source: ABdhPJz1pliI1BOrZ+96rn0J2xfn79n1/E/FbQN1k0QqkVWljk/RNp2RC/UXhxEQMv88+KUaR4gwTJbwP2L0lzTvVuGkxRM+DF3w
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2f88:: with SMTP id u8mr23823093iow.210.1597165219516;
 Tue, 11 Aug 2020 10:00:19 -0700 (PDT)
Date:   Tue, 11 Aug 2020 10:00:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008e983905ac9d0182@google.com>
Subject: KASAN: use-after-free Read in rtl_fw_do_work
From:   syzbot <syzbot+ff4b26b0bfbff2dc7960@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, davem@davemloft.net, kuba@kernel.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, pkshih@realtek.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    449dc8c9 Merge tag 'for-v5.9' of git://git.kernel.org/pub/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=16cd1a26900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ef84fa8ee48e528
dashboard link: https://syzkaller.appspot.com/bug?extid=ff4b26b0bfbff2dc7960
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ff4b26b0bfbff2dc7960@syzkaller.appspotmail.com

usb 5-1: Direct firmware load for rtlwifi/rtl8192cufw.bin failed with error -2
==================================================================
BUG: KASAN: use-after-free in rtl_fw_do_work+0x407/0x430 drivers/net/wireless/realtek/rtlwifi/core.c:87
Read of size 8 at addr ffff8881cd72ff38 by task kworker/1:5/3068

CPU: 1 PID: 3068 Comm: kworker/1:5 Not tainted 5.8.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events request_firmware_work_func
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xf6/0x16e lib/dump_stack.c:118
 print_address_description.constprop.0+0x1c/0x210 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x37/0x7c mm/kasan/report.c:530
 rtl_fw_do_work+0x407/0x430 drivers/net/wireless/realtek/rtlwifi/core.c:87
 request_firmware_work_func+0x126/0x250 drivers/base/firmware_loader/main.c:1001
 process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x392/0x470 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

The buggy address belongs to the page:
page:000000004712885d refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1cd72f
flags: 0x200000000000000()
raw: 0200000000000000 0000000000000000 ffffea000735cbc8 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8881cd72fe00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8881cd72fe80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff8881cd72ff00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                        ^
 ffff8881cd72ff80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff8881cd730000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
