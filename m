Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309372435CE
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 10:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgHMIOZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 04:14:25 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:34443 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgHMIOZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Aug 2020 04:14:25 -0400
Received: by mail-il1-f199.google.com with SMTP id w86so3091461ilk.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2020 01:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=T3KzcsfU3IPS4IZAZXg1Ymp2fNeF0MGN3kDCnkCvTTY=;
        b=DR+YegS+lQAT2VoHa6T3ejI+HzMHaQL3TwsKBo6GHMprmKEu3lcfEzlWzqKliBkTgH
         4i/e69NsfsLdJTluc3beMNP36fGGvwmL8Ox+xd0SVNvwfOeGFsx79AGWutsxh2cdwldF
         1yTU6Cj+R+JaE9PnXlSbOkN7VooRXZ+Buc5JxxE0hs5wEUXDv0GLTKos0cSCulp1z3Yl
         hSuKIzz1rmt/iNxHnWVowKNCtuiky81RV+V2vE10M/5d6Rbtik9NB8peEU+jvbqMOLsF
         bD7TV9vHDz1MmhB7O6BSX9QfgXBW9h3IH5+G8EfJvuuZnwCZyt8dYcQloux0RnyAuCO7
         lf2A==
X-Gm-Message-State: AOAM530VCyaQ67ktWlYbCxTIgTBeLoKYlHYx+1t1ND4v63HvXuJ++9GW
        uzN9Hul97Jaf7oRGqSHiWrCvTuxMhACb3LMDoPpplOlQTI87
X-Google-Smtp-Source: ABdhPJzqD/zGN6fLKzlkCav4NKWGrkw9AQVcG8r/DfGi+uymODWZO/qxRYQGqoPgLg6heLX/8MTsxOwUVtH5gy7McS8Vwj1QH61G
MIME-Version: 1.0
X-Received: by 2002:a6b:c88f:: with SMTP id y137mr3757335iof.55.1597306464087;
 Thu, 13 Aug 2020 01:14:24 -0700 (PDT)
Date:   Thu, 13 Aug 2020 01:14:24 -0700
In-Reply-To: <000000000000ef601705ac9d161b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000063b35705acbde4e5@google.com>
Subject: Re: KMSAN: kernel-usb-infoleak in hif_usb_send
From:   syzbot <syzbot+f83a1df1ed4f67e8d8ad@syzkaller.appspotmail.com>
To:     glider@google.com, gregkh@linuxfoundation.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    ce8056d1 wip: changed copy_from_user where instrumented
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=13555816900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
dashboard link: https://syzkaller.appspot.com/bug?extid=f83a1df1ed4f67e8d8ad
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ab61e2900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17614e6e900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f83a1df1ed4f67e8d8ad@syzkaller.appspotmail.com

usb 1-1: ath9k_htc: Transferred FW: ath9k_htc/htc_9271-1.4.0.fw, size: 51008
=====================================================
BUG: KMSAN: kernel-usb-infoleak in kmsan_handle_urb+0x28/0x40 mm/kmsan/kmsan_hooks.c:307
CPU: 0 PID: 3219 Comm: kworker/0:2 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events request_firmware_work_func
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:121
 kmsan_internal_check_memory+0x238/0x3d0 mm/kmsan/kmsan.c:423
 kmsan_handle_urb+0x28/0x40 mm/kmsan/kmsan_hooks.c:307
 usb_submit_urb+0x861/0x2470 drivers/usb/core/urb.c:406
 hif_usb_send_regout drivers/net/wireless/ath/ath9k/hif_usb.c:127 [inline]
 hif_usb_send+0x633/0x1790 drivers/net/wireless/ath/ath9k/hif_usb.c:470
 htc_issue_send drivers/net/wireless/ath/ath9k/htc_hst.c:34 [inline]
 htc_connect_service+0x14b4/0x19f0 drivers/net/wireless/ath/ath9k/htc_hst.c:275
 ath9k_wmi_connect+0x178/0x2c0 drivers/net/wireless/ath/ath9k/wmi.c:268
 ath9k_init_htc_services+0xf3/0x11f0 drivers/net/wireless/ath/ath9k/htc_drv_init.c:146
 ath9k_htc_probe_device+0x4dc/0x3ed0 drivers/net/wireless/ath/ath9k/htc_drv_init.c:962
 ath9k_htc_hw_init+0xdf/0x190 drivers/net/wireless/ath/ath9k/htc_hst.c:501
 ath9k_hif_usb_firmware_cb+0x42e/0xab0 drivers/net/wireless/ath/ath9k/hif_usb.c:1218
 request_firmware_work_func+0x1aa/0x2d0 drivers/base/firmware_loader/main.c:1001
 process_one_work+0x1688/0x2140 kernel/workqueue.c:2269
 worker_thread+0x10bc/0x2730 kernel/workqueue.c:2415
 kthread+0x551/0x590 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293

Uninit was created at:
 kmsan_save_stack_with_flags mm/kmsan/kmsan.c:144 [inline]
 kmsan_internal_poison_shadow+0x66/0xd0 mm/kmsan/kmsan.c:127
 kmsan_slab_alloc+0x8a/0xe0 mm/kmsan/kmsan_hooks.c:80
 slab_alloc_node mm/slub.c:2839 [inline]
 __kmalloc_node_track_caller+0xeab/0x12e0 mm/slub.c:4478
 __kmalloc_reserve net/core/skbuff.c:142 [inline]
 __alloc_skb+0x35f/0xb30 net/core/skbuff.c:210
 alloc_skb include/linux/skbuff.h:1083 [inline]
 htc_connect_service+0x1057/0x19f0 drivers/net/wireless/ath/ath9k/htc_hst.c:258
 ath9k_wmi_connect+0x178/0x2c0 drivers/net/wireless/ath/ath9k/wmi.c:268
 ath9k_init_htc_services+0xf3/0x11f0 drivers/net/wireless/ath/ath9k/htc_drv_init.c:146
 ath9k_htc_probe_device+0x4dc/0x3ed0 drivers/net/wireless/ath/ath9k/htc_drv_init.c:962
 ath9k_htc_hw_init+0xdf/0x190 drivers/net/wireless/ath/ath9k/htc_hst.c:501
 ath9k_hif_usb_firmware_cb+0x42e/0xab0 drivers/net/wireless/ath/ath9k/hif_usb.c:1218
 request_firmware_work_func+0x1aa/0x2d0 drivers/base/firmware_loader/main.c:1001
 process_one_work+0x1688/0x2140 kernel/workqueue.c:2269
 worker_thread+0x10bc/0x2730 kernel/workqueue.c:2415
 kthread+0x551/0x590 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293

Bytes 4-7 of 18 are uninitialized
Memory access of size 18 starts at ffff88810755bc00
=====================================================

