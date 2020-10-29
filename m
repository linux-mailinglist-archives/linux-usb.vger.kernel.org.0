Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E877F29E8E2
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 11:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgJ2KXp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 06:23:45 -0400
Received: from mout.gmx.net ([212.227.15.15]:53361 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgJ2KXp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 06:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603967006;
        bh=dVeOY+iOGr6W8XJx+2gmWaZCTERwgo0iDkX2CxRZl3w=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=ApgTYewU7I7LrH7YrWdkjPxsytJs05eqbggMTlidZ1W82KhfTcUlYcWSehMxeXLDw
         Cmmeft/yJIK3a7jqtCP86ZzwO8VWolUrt/JCG0JSuFWpEgBHS04jEUOe9NEEOCM+//
         Xyva9Z3Ps8VD1+KVkYZt5TPTX6PmNjOdy4cEBlsc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.simpson.net ([185.146.51.69]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnaoZ-1k8xcR0rFl-00jbTy; Thu, 29
 Oct 2020 11:23:26 +0100
Message-ID: <127927cb3ae3178de36653a47f99f7466ee33b20.camel@gmx.de>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
From:   Mike Galbraith <efault@gmx.de>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, Li Jun <jun.li@nxp.com>
Date:   Thu, 29 Oct 2020 11:23:25 +0100
In-Reply-To: <20201029094236.fkgzl5mbdp672lbe@linutronix.de>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
         <20201028203124.375344-4-mathias.nyman@linux.intel.com>
         <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
         <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
         <20201029094236.fkgzl5mbdp672lbe@linutronix.de>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:b3e2zP5Hwtl0isN3BI4UokcQKwktz5KMRYhI/R600HBdMTy8gYU
 Fak0bGnjRm9NyD43CKvHJbna5x6wxNEgd/Dy8IYvCFQgOBwmXDe0aspHDMS8i3TyrmtRSHL
 hJ1DTakDVVgBtma1uSHtHqUzjY98iMox3+7rcjTqa+f3BUN6b0AhdPYMxfmS0QfaM3WAdj+
 dW0hQdYTqCaFo/VTYD2WA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OGjiSWxez0E=:9b+nmD12EP9hHQrZ/HSjfx
 S6coPZM0/KIJMEnK3B27USOSNZzY9K4duNeaCUUtr7o2erkc1uQ8e/pWM7jhx6BIhFFPcQv3P
 t+RJlzHYe2YQDczbbISALYAJNlTQIet1mn70+kF5mGy6EufDJbH5tLy6ooSYjR4wKZm39HKH1
 diG1mrOU/4BJLKHO4uUt05zIPik0osp00UzKlodB9he+8PYAaTyl+MAf3Mo2WJx/O7ZKirt1c
 JFO7q6KZGmMOjofQLLEk1AgwrcNX35N4KzMCq4X8y50CEsUnmu38LH+Rj+dSDSc0QtbkzW4jz
 9tyMMb8aX3oFZA2UiArjs2IAxbwPFVd3CXOBkjWpuSzacZv3QSEiTFYzZZ10HKAYpMJGWaLY5
 EjsuiR4HR5Soul4hiqZPsMzGNPR3v/5hYu+Lr71SsYHvMo9WA2y8NcUgS6cP7Ia+5ZEPUAl+H
 bI/MnsMh/lVGQYmhkjisZcMXr9x2bK6yADi604q5UDuSvTiO31m62vCM+hbx5v06qMLSCN6k1
 CdJd9mKyqIUA7agyUDrj7wcroefP8PhsEAedhCP9BmL/B5kmIeLAdTv7GXq0GHSqBD0KhnzoX
 KlWQfbAkQ9diHHVsMadBtDVUZuLcF9gLJdDkXdILRrHo+7DzpPChVhxCk3YkffhxMyfuVu/G1
 WoBLE2d6AKGhIGUcTtUMcIzJIlZwy80b1ugbGbCejBVzTUzIDmM2bzIFh9zdaBXhmRPkQyRXg
 h9by8wT2w7NEvSB0Sb6pr1US/JS15Mdu4sc3Jnf6q4Igty06+5IO76MO8NoCd5t5pRZXFXRbu
 DjSEN0hOefpeLGJrRgowvjDPI5GoAX4tsWCzBGaXD+Q4EYuoGzFuNsjfTbObYdfLxxYKCQKWH
 zPvq5EWkM4HJzbeN9ilA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-10-29 at 10:42 +0100, Sebastian Andrzej Siewior wrote:
> On 2020-10-29 11:41:41 [+0200], Mathias Nyman wrote:
> > This looks like a separate locking issue related to stream ring buffer=
 expansion and radix tree usage.
> > This has probably been there for a while. Can you check if this can be=
 reproduced with 5.9 kernel?
> >
> > I don't have a quick fix for this. I need to look into it more.
> > Anyway, this shouldn't prevent PATCH 3/3 from fixing the streams debug=
fs issue introduced in 5.10-rc1
>
> let me look into this.

Below, the aforementioned 5.10-rt splat in case that helps.

[  155.051661] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  155.051661] WARNING: possible circular locking dependency detected
[  155.051662] 5.10.0.g23859ae-rt1-rt #11 Tainted: G S        I E
[  155.051663] ------------------------------------------------------
[  155.051663] worker/4086 is trying to acquire lock:
[  155.051664] ffff8b6666daa090 ((lock).lock){+.+.}-{2:2}, at: radix_tree_=
maybe_preload+0x42/0x110
[  155.051672]
               but task is already holding lock:
[  155.051673] ffff8b6520c945b8 (&xhci->lock){+.+.}-{0:0}, at: xhci_urb_en=
queue+0x217/0x740 [xhci_hcd]
[  155.051683]
               which lock already depends on the new lock.

[  155.051683]
               the existing dependency chain (in reverse order) is:
[  155.051683]
               -> #2 (&xhci->lock){+.+.}-{0:0}:
[  155.051685]        rt_spin_lock+0x2b/0xc0
[  155.051687]        xhci_irq+0x3f/0x540 [xhci_hcd]
[  155.051695]        irq_forced_thread_fn+0x30/0x80
[  155.051697]        irq_thread+0xf7/0x1a0
[  155.051698]        kthread+0x16c/0x190
[  155.051700]        ret_from_fork+0x1f/0x30
[  155.051702]
               -> #1 ((softirq_ctrl.lock).lock){+.+.}-{2:2}:
[  155.051703]        rt_spin_lock+0x2b/0xc0
[  155.051704]        __local_bh_disable_ip+0x127/0x2c0
[  155.051706]        __do_sys_bpf+0x1959/0x1f50
[  155.051708]        do_syscall_64+0x33/0x40
[  155.051710]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  155.051711]
               -> #0 ((lock).lock){+.+.}-{2:2}:
[  155.051712]        __lock_acquire+0x149d/0x1a70
[  155.051714]        lock_acquire+0x1a7/0x410
[  155.051716]        rt_spin_lock+0x2b/0xc0
[  155.051716]        radix_tree_maybe_preload+0x42/0x110
[  155.051718]        xhci_update_stream_segment_mapping+0x63/0x190 [xhci_=
hcd]
[  155.051723]        xhci_ring_expansion+0x19d/0x390 [xhci_hcd]
[  155.051728]        prepare_ring+0x8b/0x1f0 [xhci_hcd]
[  155.051734]        prepare_transfer+0x64/0x140 [xhci_hcd]
[  155.051739]        xhci_queue_bulk_tx+0xe7/0xc50 [xhci_hcd]
[  155.051745]        xhci_urb_enqueue+0x627/0x740 [xhci_hcd]
[  155.051750]        usb_hcd_submit_urb+0xa7/0xac0 [usbcore]
[  155.051760]        uas_submit_urbs+0x35b/0x500 [uas]
[  155.051762]        uas_queuecommand+0x1d3/0x240 [uas]
[  155.051763]        scsi_queue_rq+0x5e5/0xce0 [scsi_mod]
[  155.051772]        blk_mq_dispatch_rq_list+0x291/0x6e0
[  155.051774]        __blk_mq_do_dispatch_sched+0x219/0x260
[  155.051775]        __blk_mq_sched_dispatch_requests+0x154/0x190
[  155.051776]        blk_mq_sched_dispatch_requests+0x33/0x60
[  155.051777]        __blk_mq_run_hw_queue+0x86/0xf0
[  155.051779]        __blk_mq_delay_run_hw_queue+0x135/0x180
[  155.051781]        blk_mq_run_hw_queue+0x70/0xe0
[  155.051782]        blk_mq_sched_insert_requests+0xdd/0x2a0
[  155.051783]        blk_mq_flush_plug_list+0x12d/0x2b0
[  155.051784]        blk_flush_plug_list+0xb4/0xd0
[  155.051785]        blk_mq_submit_bio+0x365/0x930
[  155.051786]        submit_bio_noacct+0x41e/0x4b0
[  155.051786]        submit_bio+0x33/0x160
[  155.051787]        ext4_mpage_readpages+0x1ad/0x930 [ext4]
[  155.051811]        read_pages+0x7d/0x230
[  155.051813]        page_cache_ra_unbounded+0x13b/0x1f0
[  155.051814]        generic_file_buffered_read+0x144/0xa10
[  155.051815]        do_iter_readv_writev+0x182/0x1b0
[  155.051817]        do_iter_read+0xca/0x1c0
[  155.051818]        vfs_readv+0x6f/0xa0
[  155.051819]        do_preadv+0x9c/0xe0
[  155.051820]        do_syscall_64+0x33/0x40
[  155.051822]        entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  155.051823]
               other info that might help us debug this:

[  155.051824] Chain exists of:
                 (lock).lock --> (softirq_ctrl.lock).lock --> &xhci->lock

[  155.051825]  Possible unsafe locking scenario:

[  155.051826]        CPU0                    CPU1
[  155.051826]        ----                    ----
[  155.051826]   lock(&xhci->lock);
[  155.051827]                                lock((softirq_ctrl.lock).loc=
k);
[  155.051828]                                lock(&xhci->lock);
[  155.051828]   lock((lock).lock);
[  155.051829]
                *** DEADLOCK ***

[  155.051829] 7 locks held by worker/4086:
[  155.051830]  #0: ffffffffbd59c8e0 (rcu_read_lock){....}-{1:2}, at: hctx=
_lock+0x17/0xe0
[  155.051833]  #1: ffff8b65201340c0 (shost->host_lock){+.+.}-{0:0}, at: u=
as_queuecommand+0x2b/0x240 [uas]
[  155.051837]  #2: ffffffffbd59c8e0 (rcu_read_lock){....}-{1:2}, at: rt_s=
pin_lock+0x5/0xc0
[  155.051839]  #3: ffff8b6520136010 (&devinfo->lock){+.+.}-{0:0}, at: uas=
_queuecommand+0xd7/0x240 [uas]
[  155.051841]  #4: ffffffffbd59c8e0 (rcu_read_lock){....}-{1:2}, at: rt_s=
pin_lock+0x5/0xc0
[  155.051843]  #5: ffff8b6520c945b8 (&xhci->lock){+.+.}-{0:0}, at: xhci_u=
rb_enqueue+0x217/0x740 [xhci_hcd]
[  155.051850]  #6: ffffffffbd59c8e0 (rcu_read_lock){....}-{1:2}, at: rt_s=
pin_lock+0x5/0xc0
[  155.051853]
               stack backtrace:
[  155.051853] CPU: 3 PID: 4086 Comm: worker Tainted: G S        I E     5=
.10.0.g23859ae-rt1-rt #11
[  155.051855] Hardware name: HP HP Spectre x360 Convertible/804F, BIOS F.=
47 11/22/2017
[  155.051856] Call Trace:
[  155.051858]  dump_stack+0x77/0x97
[  155.051861]  check_noncircular+0xe7/0x100
[  155.051865]  ? __lock_acquire+0x149d/0x1a70
[  155.051867]  __lock_acquire+0x149d/0x1a70
[  155.051870]  lock_acquire+0x1a7/0x410
[  155.051872]  ? radix_tree_maybe_preload+0x42/0x110
[  155.051875]  ? xhci_segment_alloc+0xd8/0x100 [xhci_hcd]
[  155.051880]  rt_spin_lock+0x2b/0xc0
[  155.051882]  ? radix_tree_maybe_preload+0x42/0x110
[  155.051883]  radix_tree_maybe_preload+0x42/0x110
[  155.051885]  xhci_update_stream_segment_mapping+0x63/0x190 [xhci_hcd]
[  155.051891]  xhci_ring_expansion+0x19d/0x390 [xhci_hcd]
[  155.051897]  prepare_ring+0x8b/0x1f0 [xhci_hcd]
[  155.051903]  prepare_transfer+0x64/0x140 [xhci_hcd]
[  155.051909]  xhci_queue_bulk_tx+0xe7/0xc50 [xhci_hcd]
[  155.051919]  xhci_urb_enqueue+0x627/0x740 [xhci_hcd]
[  155.051924]  ? dma_map_sg_attrs+0x30/0x50
[  155.051926]  ? usb_hcd_map_urb_for_dma+0xc2/0x460 [usbcore]
[  155.051935]  usb_hcd_submit_urb+0xa7/0xac0 [usbcore]
[  155.051942]  ? mark_held_locks+0x49/0x70
[  155.051944]  ? _raw_spin_unlock_irqrestore+0x70/0x80
[  155.051945]  ? lockdep_hardirqs_on+0x85/0x110
[  155.051947]  ? _raw_spin_unlock_irqrestore+0x34/0x80
[  155.051948]  ? rt_mutex_futex_unlock+0x56/0x80
[  155.051950]  uas_submit_urbs+0x35b/0x500 [uas]
[  155.051952]  ? sdev_evt_alloc+0x60/0x60 [scsi_mod]
[  155.051959]  uas_queuecommand+0x1d3/0x240 [uas]
[  155.051962]  scsi_queue_rq+0x5e5/0xce0 [scsi_mod]
[  155.051969]  blk_mq_dispatch_rq_list+0x291/0x6e0
[  155.051970]  ? rt_mutex_futex_unlock+0x56/0x80
[  155.051973]  __blk_mq_do_dispatch_sched+0x219/0x260
[  155.051976]  __blk_mq_sched_dispatch_requests+0x154/0x190
[  155.051978]  blk_mq_sched_dispatch_requests+0x33/0x60
[  155.051979]  __blk_mq_run_hw_queue+0x86/0xf0
[  155.051981]  __blk_mq_delay_run_hw_queue+0x135/0x180
[  155.051983]  blk_mq_run_hw_queue+0x70/0xe0
[  155.051985]  blk_mq_sched_insert_requests+0xdd/0x2a0
[  155.051987]  blk_mq_flush_plug_list+0x12d/0x2b0
[  155.051990]  blk_flush_plug_list+0xb4/0xd0
[  155.051992]  blk_mq_submit_bio+0x365/0x930
[  155.051994]  submit_bio_noacct+0x41e/0x4b0
[  155.051996]  ? submit_bio+0x33/0x160
[  155.051997]  ? xa_load+0xb6/0x130
[  155.051999]  submit_bio+0x33/0x160
[  155.052000]  ? bio_add_page+0x29/0x70
[  155.052002]  ext4_mpage_readpages+0x1ad/0x930 [ext4]
[  155.052021]  ? _raw_spin_unlock_irqrestore+0x70/0x80
[  155.052022]  ? lockdep_hardirqs_on+0x85/0x110
[  155.052024]  read_pages+0x7d/0x230
[  155.052026]  ? rcu_read_lock_sched_held+0x32/0x60
[  155.052029]  ? page_cache_ra_unbounded+0x13b/0x1f0
[  155.052030]  page_cache_ra_unbounded+0x13b/0x1f0
[  155.052032]  generic_file_buffered_read+0x144/0xa10
[  155.052036]  do_iter_readv_writev+0x182/0x1b0
[  155.052038]  do_iter_read+0xca/0x1c0
[  155.052040]  vfs_readv+0x6f/0xa0
[  155.052043]  ? __fget_files+0xf6/0x1f0
[  155.052045]  ? __fget_files+0x10e/0x1f0
[  155.052047]  ? do_preadv+0x9c/0xe0
[  155.052048]  do_preadv+0x9c/0xe0
[  155.052049]  do_syscall_64+0x33/0x40
[  155.052051]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  155.052053] RIP: 0033:0x7f70da5adc83
[  155.052055] Code: 49 89 ca b8 27 01 00 00 0f 05 48 3d 01 f0 ff ff 73 34=
 c3 48 83 ec 08 e8 fb 64 01 00 48 89 04 24 49 89 ca b8 27 01 00 00 0f 05 <=
48> 8b 3c 24 48 89 c2 e8 41 65 01 00 48 89 d0 48 83 c4 08 48 3d 01
[  155.052056] RSP: 002b:00007f70d2dbb850 EFLAGS: 00000293 ORIG_RAX: 00000=
00000000127
[  155.052058] RAX: ffffffffffffffda RBX: 00007f6fa6ded6f0 RCX: 00007f70da=
5adc83
[  155.052058] RDX: 0000000000000002 RSI: 00007f70b80f45d0 RDI: 0000000000=
00000b
[  155.052059] RBP: 000055752e62e140 R08: 0000000000000000 R09: 00000000ff=
ffffff
[  155.052059] R10: 000000015fd7e000 R11: 0000000000000293 R12: 000055752b=
fc36b0
[  155.052060] R13: 000055752e62e1a8 R14: 00007f70b81a4540 R15: 00007ffe9e=
730b10

