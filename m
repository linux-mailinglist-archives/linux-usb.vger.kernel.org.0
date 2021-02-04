Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64A3630CC8B
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 21:01:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238582AbhBBT7U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 14:59:20 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:48821 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240276AbhBBT7D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 14:59:03 -0500
Received: by mail-il1-f199.google.com with SMTP id n12so22171761ili.15
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 11:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=UclMjV2e3LCjfk/QkZ6q41TSY2ihxfURePl2vFE1F3s=;
        b=ADLLs0ka9x+qY/ShrvG555ZP7U8kt6h9kGFdJeaJgo+98AMgjY0AcHwONvuwLQgAvD
         VxhTpLBaDa3fzDpgUSzAFwZ5DDxzaxVEdGQiWMOE6WJ55WuzgR6K3uRzbzD1GWi5tAa+
         QOZM9S34CCUT+teT/9Iz6wrdGGQorPrYyHIlQgyeU1lxLpYh5npug9hCDT9vRpiJLXxb
         Xdvu1Bbjz2fBshHBLJuvpeVSBJmmdjLxUdIYOvQsSnj9uWAqcwbOC51J7yk9LxGrxmuK
         qsO5uFTygpqsXQ160xCIpCb5DpSTesSIUDksu5NDZLlaX7xovijnNFqp0FIAqxvxOOvJ
         pa+g==
X-Gm-Message-State: AOAM533RaeDXSS0YQfmej8U9wT5GPf34RU9VkCC0mi2LfTP5f6vQ4IgR
        EucH1FjcjoLMjOOLUnm+p3sGk5r5Grcbc/F+Mw7V3V5pDCrc
X-Google-Smtp-Source: ABdhPJyfua7/jgIC+5xP9eBTjpNno/VUfE83tz6nYlKxfKntQ753/+LwZq01dOOD1V4eRAdGOC/WPuJDkm/Atx5zOPF+wLdkMtdn
MIME-Version: 1.0
X-Received: by 2002:a6b:d21a:: with SMTP id q26mr18422964iob.128.1612295901958;
 Tue, 02 Feb 2021 11:58:21 -0800 (PST)
Date:   Tue, 02 Feb 2021 11:58:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000082554705ba5fe454@google.com>
Subject: INFO: task hung in usb_remote_wakeup (2)
From:   syzbot <syzbot+85439002c78b774488d8@syzkaller.appspotmail.com>
To:     erosca@de.adit-jv.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        oneukum@suse.com, stern@rowland.harvard.edu,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    bec4c296 Merge tag 'ecryptfs-5.11-rc6-setxattr-fix' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=113cc090d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9408d1770a50819c
dashboard link: https://syzkaller.appspot.com/bug?extid=85439002c78b774488d8
compiler:       clang version 11.0.1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138d0264d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+85439002c78b774488d8@syzkaller.appspotmail.com

INFO: task kworker/1:0:19 blocked for more than 143 seconds.
      Not tainted 5.11.0-rc5-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:0     state:D stack:27488 pid:   19 ppid:     2 flags:0x00004000
Workqueue: pm hcd_resume_work
Call Trace:
 context_switch kernel/sched/core.c:4327 [inline]
 __schedule+0x999/0xe70 kernel/sched/core.c:5078
 schedule+0x14b/0x200 kernel/sched/core.c:5157
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:5216
 __mutex_lock_common+0x124f/0x2f00 kernel/locking/mutex.c:1033
 __mutex_lock kernel/locking/mutex.c:1103 [inline]
 mutex_lock_nested+0x1a/0x20 kernel/locking/mutex.c:1118
 device_lock include/linux/device.h:737 [inline]
 usb_remote_wakeup+0x1f/0xf0 drivers/usb/core/hub.c:3643
 process_one_work+0x789/0xfc0 kernel/workqueue.c:2275
 worker_thread+0xac1/0x1300 kernel/workqueue.c:2421
 kthread+0x39a/0x3c0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Showing all locks held in the system:
5 locks held by kworker/0:0/5:
 #0: 
ffff8880151ba538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc90000ca7d78 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250
 #2: ffff88814489a218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:737 [inline]
 #2: ffff88814489a218 (&dev->mutex){....}-{3:3}, at: hub_event+0x112/0xcb0 drivers/usb/core/hub.c:5537
 #3: ffff88814489e578 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3030 [inline]
 #3: ffff88814489e578 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect+0xc1e/0x25b0 drivers/usb/core/hub.c:5154
 #4: ffff88801cab6668 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_init+0x1ee/0x2ce0 drivers/usb/core/hub.c:4582
5 locks held by kworker/0:1/7:
 #0: ffff8880151ba538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc90000cc7d78 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250
 #2: ffff88814481e218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:737 [inline]
 #2: ffff88814481e218 (&dev->mutex){....}-{3:3}, at: hub_event+0x112/0xcb0 drivers/usb/core/hub.c:5537
 #3: ffff88801cb8a578 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3030 [inline]
 #3: ffff88801cb8a578 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect+0xc1e/0x25b0 drivers/usb/core/hub.c:5154
 #4: 
ffff8880146e1868
 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_init+0x1ee/0x2ce0 drivers/usb/core/hub.c:4582
3 locks held by kworker/1:0/19:
 #0: ffff888140747538 (
(wq_completion)pm){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc90000d97d78 ((work_completion)(&hcd->wakeup_work)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250
 #2: ffff88814481e218 (
&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:737 [inline]
&dev->mutex){....}-{3:3}, at: usb_remote_wakeup+0x1f/0xf0 drivers/usb/core/hub.c:3643
5 locks held by kworker/1:1/34:
 #0: ffff8880151ba538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc90000e2fd78 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250
 #2: ffff88801cc46218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:737 [inline]
 #2: ffff88801cc46218 (&dev->mutex){....}-{3:3}, at: hub_event+0x112/0xcb0 drivers/usb/core/hub.c:5537
 #3: ffff88801cc72578 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3030 [inline]
 #3: ffff88801cc72578 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect+0xc1e/0x25b0 drivers/usb/core/hub.c:5154
 #4: ffff88801358c168 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_init+0x1ee/0x2ce0 drivers/usb/core/hub.c:4582
2 locks held by kworker/u4:2/46:
1 lock held by khungtaskd/1642:
 #0: ffffffff8bd11740 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x0/0x30 arch/x86/pci/mmconfig_64.c:151
5 locks held by kworker/1:2/2989:
 #0: ffff8880151ba538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc9000984fd78 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250
 #2: ffff888144952218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:737 [inline]
 #2: ffff888144952218 (&dev->mutex){....}-{3:3}, at: hub_event+0x112/0xcb0 drivers/usb/core/hub.c:5537
 #3: ffff888144956578 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3030 [inline]
 #3: ffff888144956578 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect+0xc1e/0x25b0 drivers/usb/core/hub.c:5154
 #4: ffff88814486a768 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_init+0x1ee/0x2ce0 drivers/usb/core/hub.c:4582
1 lock held by systemd-journal/4873:
1 lock held by systemd-udevd/4883:
1 lock held by in:imklog/8156:
 #0: ffff888011ac3c70 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0x24e/0x2f0 fs/file.c:947
1 lock held by syz-executor.2/8490:
 #0: ffff88814745cd88 (&xt[i].mutex){+.+.}-{3:3}, at: xt_find_table_lock+0x37/0x410 net/netfilter/x_tables.c:1206
2 locks held by syz-executor.3/8494:
 #0: ffff88814745c308 (&xt[i].mutex){+.+.}-{3:3}, at: xt_find_table_lock+0x37/0x410 net/netfilter/x_tables.c:1206
 #1: ffffffff8bd15ae8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock kernel/rcu/tree_exp.h:322 [inline]
 #1: ffffffff8bd15ae8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: synchronize_rcu_expedited+0x2b5/0x600 kernel/rcu/tree_exp.h:836
2 locks held by syz-executor.0/8496:
 #0: ffff88814745cd88 (&xt[i].mutex){+.+.}-{3:3}, at: xt_find_table_lock+0x37/0x410 net/netfilter/x_tables.c:1206
 #1: ffffffff8bd15ae8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock kernel/rcu/tree_exp.h:290 [inline]
 #1: ffffffff8bd15ae8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: synchronize_rcu_expedited+0x1e8/0x600 kernel/rcu/tree_exp.h:836
1 lock held by syz-executor.5/8497:
 #0: ffff88814745c308 (&xt[i].mutex){+.+.}-{3:3}, at: xt_find_table_lock+0x37/0x410 net/netfilter/x_tables.c:1206
1 lock held by syz-executor.1/8498:
 #0: ffff88814745cd88 (&xt[i].mutex){+.+.}-{3:3}, at: xt_find_table_lock+0x37/0x410 net/netfilter/x_tables.c:1206
1 lock held by syz-executor.4/8499:
 #0: ffff88814745cd88 (&xt[i].mutex){+.+.}-{3:3}, at: xt_find_table_lock+0x37/0x410 net/netfilter/x_tables.c:1206
5 locks held by kworker/1:3/9773:
 #0: ffff8880151ba538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc9000a76fd78 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250
 #2: ffff88801ccda218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:737 [inline]
 #2: ffff88801ccda218 (&dev->mutex){....}-{3:3}, at: hub_event+0x112/0xcb0 drivers/usb/core/hub.c:5537
 #3: ffff88801ccde578 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3030 [inline]
 #3: ffff88801ccde578 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect+0xc1e/0x25b0 drivers/usb/core/hub.c:5154
 #4: ffff888011989368 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_init+0x1ee/0x2ce0 drivers/usb/core/hub.c:4582
5 locks held by kworker/0:6/9930:
 #0: ffff8880151ba538 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc9000abbfd78 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250
 #2: ffff8881449ce218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:737 [inline]
 #2: ffff8881449ce218 (&dev->mutex){....}-{3:3}, at: hub_event+0x112/0xcb0 drivers/usb/core/hub.c:5537
 #3: ffff8881449ea578 (&port_dev->status_lock){+.+.}-{3:3}, at: usb_lock_port drivers/usb/core/hub.c:3030 [inline]
 #3: ffff8881449ea578 (&port_dev->status_lock){+.+.}-{3:3}, at: hub_port_connect+0xc1e/0x25b0 drivers/usb/core/hub.c:5154
 #4: ffff8881441b9068 (hcd->address0_mutex){+.+.}-{3:3}, at: hub_port_init+0x1ee/0x2ce0 drivers/usb/core/hub.c:4582
2 locks held by kworker/1:6/10030:
 #0: ffff88801047c538 ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x6f4/0xfc0 kernel/workqueue.c:2248
 #1: ffffc9000ae7fd78 ((work_completion)(&rew.rew_work)){+.+.}-{0:0}, at: process_one_work+0x733/0xfc0 kernel/workqueue.c:2250

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 1642 Comm: khungtaskd Not tainted 5.11.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x137/0x1be lib/dump_stack.c:120
 nmi_cpu_backtrace+0x16c/0x190 lib/nmi_backtrace.c:105
 nmi_trigger_cpumask_backtrace+0x191/0x2f0 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:209 [inline]
 watchdog+0xce9/0xd30 kernel/hung_task.c:294
 kthread+0x39a/0x3c0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 4506 Comm: kworker/u4:6 Not tainted 5.11.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: phy12 ieee80211_iface_work
RIP: 0010:orc_find arch/x86/kernel/unwind_orc.c:157 [inline]
RIP: 0010:unwind_next_frame+0x1a4/0x1e20 arch/x86/kernel/unwind_orc.c:443
Code: 80 89 49 39 c4 0f 83 0a 01 00 00 48 c7 c0 00 00 00 81 4c 89 e5 48 29 c5 48 c1 ed 08 48 c7 c0 98 9a 3f 8e 48 c7 c1 98 9c 61 8e <48> 29 c1 48 8d 41 03 48 85 c9 48 0f 49 c1 40 8a 35 0f 30 49 0a 48
RSP: 0018:ffffc900078af120 EFLAGS: 00000206
RAX: ffffffff8e3f9a98 RBX: ffffc900078af230 RCX: ffffffff8e619c98
RDX: dffffc0000000000 RSI: ffffffff814ff56a RDI: ffffffff81348a3d
RBP: 0000000000004ff5 R08: 0000000000000008 R09: ffffc900078af298
R10: fffff52000f15e49 R11: 0000000000000000 R12: ffffffff814ff569
R13: ffffc900078af1e8 R14: dffffc0000000000 R15: 1ffff92000f15e43
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f31f96be000 CR3: 0000000011972000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 arch_stack_walk+0xb2/0xe0 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0xad/0x150 kernel/stacktrace.c:121
 kasan_save_stack mm/kasan/common.c:38 [inline]
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:401 [inline]
 ____kasan_kmalloc+0xbd/0xf0 mm/kasan/common.c:429
 kasan_slab_alloc include/linux/kasan.h:209 [inline]
 slab_post_alloc_hook mm/slab.h:512 [inline]
 slab_alloc_node mm/slub.c:2892 [inline]
 slab_alloc mm/slub.c:2900 [inline]
 __kmalloc+0x207/0x330 mm/slub.c:3967
 kmalloc include/linux/slab.h:557 [inline]
 ieee802_11_parse_elems_crc+0xac/0xf20 net/mac80211/util.c:1473
 ieee802_11_parse_elems net/mac80211/ieee80211_i.h:2040 [inline]
 ieee80211_bss_info_update+0x7a2/0xb40 net/mac80211/scan.c:212
 ieee80211_rx_bss_info net/mac80211/ibss.c:1126 [inline]
 ieee80211_rx_mgmt_probe_beacon net/mac80211/ibss.c:1615 [inline]
 ieee80211_ibss_rx_queued_mgmt+0x721/0x2930 net/mac80211/ibss.c:1642
 ieee80211_iface_work+0x71a/0xb10 net/mac80211/iface.c:1423
 process_one_work+0x789/0xfc0 kernel/workqueue.c:2275
 worker_thread+0xac1/0x1300 kernel/workqueue.c:2421
 kthread+0x39a/0x3c0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
