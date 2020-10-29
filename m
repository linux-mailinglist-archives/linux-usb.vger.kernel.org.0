Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0809E29E52B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 08:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731195AbgJ2Hwy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 03:52:54 -0400
Received: from mout.gmx.net ([212.227.17.21]:46405 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731090AbgJ2Hwm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 03:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603957935;
        bh=AYegfopW/3Kxu6MQzOrBkg7LwYvJhVfSg6nWl7+Bfuo=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=VsjtbLnA0Wn1MwECGxg45oMPH95oKL+/fDNNylzQnOSnDfmQhV0MfmY4mWkFFzKO2
         GB2nmgfcvPjqHaTaTWgCoQ+fBEGaLYh+ry1wga7QRPhrvw+El+A0kUawM8ZALz4dkc
         vBae2BAJrGQqSGRvYsooAntXravbrvZ7HP/ibCag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.simpson.net ([185.146.51.69]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1kKLp53Dik-014hp5; Thu, 29
 Oct 2020 07:03:13 +0100
Message-ID: <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
From:   Mike Galbraith <efault@gmx.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Li Jun <jun.li@nxp.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Thu, 29 Oct 2020 07:03:12 +0100
In-Reply-To: <20201028203124.375344-4-mathias.nyman@linux.intel.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
         <20201028203124.375344-4-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NnfBogcBi5eUIff7RkDQOgVA6GHO8NM085DJ4Yy2zQDpTsIug51
 g+WMJl66H8wwBBarFJmERMKtp9D2qzz5EqCvR4xsONUg9WO94Uc9k0ijw6iY/u35EP+gOjI
 UEppdrddCVSX5qUjqV/Z2NPoe2046SqcCAJh2VwUw6fC8F2WNlmkXVuAWOsRT/pYxiFToBz
 uatTlsJgWMC395RlB1d2Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lpF+QfxuLS8=:jWYMR9jMYNgX9A7eZ/w/4i
 cKi4vvsNlgij1RxIFoapza8ZWnVpdWDQA4HZfmf6//kPaTFeCzV39TdNNnbaMwviIaFayLUt2
 +5ZRlk86zFpAhAHc2AxZHRUR1Xl+qZMzk2aEwI8PRVsnggpBTcO7PDWii73ZWcQD6JTvUR5Nz
 bXVyRDrwLzg7iSNyzquA6+0QISai+FdyN+IbfyMYi5n3ysynEOrm1HVX1q5sBMTglWe80ppEY
 GiCbAvFrn/Do6LLZQPdpODbWYVs3T0lmqGrbpudhvo5uUCbKioVs0FrKRWcKULWUOkmMLfeEu
 oaoy/0w5NfBQ4t5txqjpXwkUsuMR1F2ci7txDvHOY8M66+krgrGGxJuhGTOi5N6IBWMlUeqCZ
 XEht81+XefJEaN5kjQbeMR6eo/BbXTfmumWzuIZYOpGh6BRibi8EG/EEr3Bxt2g9IuENgLXgR
 /5vc8ZlHEWGR2b08WRhI7SSlm/ljw39AJU4jAvhZI+zwHsUOJv17h3RRiVuoDjtWXayS/a5Ww
 iq9IcLQAnN+/00+Rjzly3GcGucEAWwjip/yKVzmhMP42oXgbiEsqbiu2D6ivAmeTFsc25lhrY
 pWMjCqeJog2X+HdhmxaVa0+ZrVNLNjKMp0UqsZPg9w+aufGKd58aFHX/LR+x5DBDNryO1t5XW
 rzubF8rRF17AdYJyDG1ofhlUnQzyRz8/g0elCGaYxRx+aoruQH69HwK2Ch3PMmiu1rL6vySNu
 qZY3h/2yhIsQ9Nr2dVDxTXfS4fr6fpVVMzO1M+Vj6y2BRBlN6k5zn7yINjcxp7dCg8xcaAIgk
 iGPuhraMRvAIQZfY3erKWY1pakp6gdeaLT5ROnUM5VMBOL39ogItSSHkRPRtWfbtcfvbdPyBF
 W26yDkNLmdtUDmCOYWqQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,

Testing $subject in shiny new 5.10-rt induced a lockdep grumble, so I
plugged it into master and booted lappy with threadirqs.  When I then
fired up my android-x86 vm toy, that kernel grumbled as well.

[   81.184240] tun: Universal TUN/TAP device driver, 1.6
[   81.187185] virbr0: port 1(virbr0-nic) entered blocking state
[   81.187230] virbr0: port 1(virbr0-nic) entered disabled state
[   81.187529] device virbr0-nic entered promiscuous mode
[   81.867218] virbr0: port 1(virbr0-nic) entered blocking state
[   81.867326] virbr0: port 1(virbr0-nic) entered listening state
[   82.038707] virbr0: port 1(virbr0-nic) entered disabled state
[   93.259770] virbr0: port 2(vnet0) entered blocking state
[   93.259818] virbr0: port 2(vnet0) entered disabled state
[   93.260118] device vnet0 entered promiscuous mode
[   93.260888] virbr0: port 2(vnet0) entered blocking state
[   93.260935] virbr0: port 2(vnet0) entered listening state
[   93.601718] cgroup: cgroup: disabling cgroup2 socket matching due to ne=
t_prio or net_cls activation
[   95.278373] virbr0: port 2(vnet0) entered learning state
[   97.293928] virbr0: port 2(vnet0) entered forwarding state
[   97.293984] virbr0: topology change detected, propagating

[  107.611645] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  107.611650] WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
[  107.611656] 5.10.0.g23859ae-master #17 Tainted: G S        I E
[  107.611660] -----------------------------------------------------
[  107.611666] worker/4060 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
[  107.611671] ffff90bba6d2c680 (lock#2){+.+.}-{2:2}, at: radix_tree_maybe=
_preload+0x8/0xb0
[  107.611684]
               and this task is already holding:
[  107.611689] ffff90ba501a8430 (&xhci->lock){..-.}-{2:2}, at: xhci_urb_en=
queue+0x20a/0x6f0 [xhci_hcd]
[  107.611706] which would create a new lock dependency:
[  107.611710]  (&xhci->lock){..-.}-{2:2} -> (lock#2){+.+.}-{2:2}
[  107.611719]
               but this new dependency connects a SOFTIRQ-irq-safe lock:
[  107.611725]  (&xhci->lock){..-.}-{2:2}
[  107.611727]
               ... which became SOFTIRQ-irq-safe at:
[  107.611741]   lock_acquire+0x1a7/0x3b0
[  107.611748]   _raw_spin_lock_irqsave+0x3d/0x50
[  107.611760]   xhci_hub_status_data+0xc2/0x390 [xhci_hcd]
[  107.611776]   usb_hcd_poll_rh_status+0x41/0x180 [usbcore]
[  107.611783]   call_timer_fn+0x9d/0x2b0
[  107.611788]   run_timer_softirq+0x48d/0x570
[  107.611793]   __do_softirq+0xeb/0x4a4
[  107.611799]   run_ksoftirqd+0x32/0x60
[  107.611805]   smpboot_thread_fn+0x1d8/0x280
[  107.611810]   kthread+0x14c/0x170
[  107.611816]   ret_from_fork+0x1f/0x30
[  107.611819]
               to a SOFTIRQ-irq-unsafe lock:
[  107.611825]  (lock#2){+.+.}-{2:2}
[  107.611828]
               ... which became SOFTIRQ-irq-unsafe at:
[  107.611837] ...
[  107.611839]   lock_acquire+0x1a7/0x3b0
[  107.611846]   __radix_tree_preload+0x5c/0x2a0
[  107.611851]   idr_preload+0xf/0xb0
[  107.611857]   __kernfs_new_node+0x66/0x270
[  107.611862]   kernfs_create_root+0xab/0x140
[  107.611868]   sysfs_init+0x14/0x53
[  107.611873]   mnt_init+0xc9/0x1f1
[  107.611878]   vfs_caches_init+0xca/0xd4
[  107.611884]   start_kernel+0x734/0x78a
[  107.611889]   secondary_startup_64_no_verify+0xb8/0xbb
[  107.611893]
               other info that might help us debug this:

[  107.611901]  Possible interrupt unsafe locking scenario:

[  107.611908]        CPU0                    CPU1
[  107.611912]        ----                    ----
[  107.611916]   lock(lock#2);
[  107.611921]                                local_irq_disable();
[  107.611926]                                lock(&xhci->lock);
[  107.611932]                                lock(lock#2);
[  107.611938]   <Interrupt>
[  107.611942]     lock(&xhci->lock);
[  107.611947]
                *** DEADLOCK ***

[  107.611954] 4 locks held by worker/4060:
[  107.611958]  #0: ffffffffb056a9e0 (rcu_read_lock){....}-{1:2}, at: hctx=
_lock+0x17/0xe0
[  107.611969]  #1: ffff90ba45d58048 (shost->host_lock){....}-{2:2}, at: u=
as_queuecommand+0x28/0x260 [uas]
[  107.611981]  #2: ffff90ba45d59848 (&devinfo->lock){..-.}-{2:2}, at: uas=
_queuecommand+0xd9/0x260 [uas]
[  107.611992]  #3: ffff90ba501a8430 (&xhci->lock){..-.}-{2:2}, at: xhci_u=
rb_enqueue+0x20a/0x6f0 [xhci_hcd]
[  107.612008]
               the dependencies between SOFTIRQ-irq-safe lock and the hold=
ing lock:
[  107.612035] -> (&xhci->lock){..-.}-{2:2} {
[  107.612043]    IN-SOFTIRQ-W at:
[  107.612048]                     lock_acquire+0x1a7/0x3b0
[  107.612054]                     _raw_spin_lock_irqsave+0x3d/0x50
[  107.612066]                     xhci_hub_status_data+0xc2/0x390 [xhci_h=
cd]
[  107.612079]                     usb_hcd_poll_rh_status+0x41/0x180 [usbc=
ore]
[  107.612085]                     call_timer_fn+0x9d/0x2b0
[  107.612091]                     run_timer_softirq+0x48d/0x570
[  107.612096]                     __do_softirq+0xeb/0x4a4
[  107.612102]                     run_ksoftirqd+0x32/0x60
[  107.612108]                     smpboot_thread_fn+0x1d8/0x280
[  107.612113]                     kthread+0x14c/0x170
[  107.612119]                     ret_from_fork+0x1f/0x30
[  107.612123]    INITIAL USE at:
[  107.612129]                    lock_acquire+0x1a7/0x3b0
[  107.612134]                    _raw_spin_lock_irqsave+0x3d/0x50
[  107.612146]                    xhci_hub_control+0xa5/0x2440 [xhci_hcd]
[  107.612158]                    usb_hcd_submit_urb+0x743/0xb00 [usbcore]
[  107.612171]                    usb_start_wait_urb+0x55/0x140 [usbcore]
[  107.612184]                    usb_control_msg+0xc3/0x110 [usbcore]
[  107.612195]                    hub_configure+0x103/0xc00 [usbcore]
[  107.612207]                    hub_probe+0x29c/0x350 [usbcore]
[  107.612220]                    usb_probe_interface+0x105/0x300 [usbcore=
]
[  107.612227]                    really_probe+0xf7/0x4d0
[  107.612232]                    driver_probe_device+0x5d/0x140
[  107.612238]                    bus_for_each_drv+0x5e/0x90
[  107.612244]                    __device_attach+0xbe/0x140
[  107.612249]                    bus_probe_device+0x9c/0xb0
[  107.612255]                    device_add+0x3fa/0x820
[  107.612267]                    usb_set_configuration+0x469/0x960 [usbco=
re]
[  107.612280]                    usb_generic_driver_probe+0x28/0x70 [usbc=
ore]
[  107.612293]                    usb_probe_device+0x3b/0xc0 [usbcore]
[  107.612298]                    really_probe+0xf7/0x4d0
[  107.612304]                    driver_probe_device+0x5d/0x140
[  107.612309]                    bus_for_each_drv+0x5e/0x90
[  107.612315]                    __device_attach+0xbe/0x140
[  107.612320]                    bus_probe_device+0x9c/0xb0
[  107.612325]                    device_add+0x3fa/0x820
[  107.612337]                    usb_new_device+0x21d/0x4a0 [usbcore]
[  107.612349]                    usb_add_hcd+0x60b/0x7f0 [usbcore]
[  107.612361]                    usb_hcd_pci_probe+0x237/0x480 [usbcore]
[  107.612367]                    xhci_pci_probe+0x6d/0x1df [xhci_pci]
[  107.612374]                    local_pci_probe+0x42/0x90
[  107.612380]                    pci_device_probe+0xe7/0x1a0
[  107.612385]                    really_probe+0xf7/0x4d0
[  107.612391]                    driver_probe_device+0x5d/0x140
[  107.612397]                    device_driver_attach+0x4f/0x60
[  107.612402]                    __driver_attach+0xa4/0x140
[  107.612408]                    bus_for_each_dev+0x67/0x90
[  107.612414]                    bus_add_driver+0x18c/0x230
[  107.612419]                    driver_register+0x5b/0xf0
[  107.612425]                    do_one_initcall+0x54/0x2f0
[  107.612430]                    do_init_module+0x5b/0x21b
[  107.612436]                    load_module+0x1e40/0x2370
[  107.612442]                    __do_sys_finit_module+0x98/0xe0
[  107.612448]                    do_syscall_64+0x33/0x40
[  107.612453]                    entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  107.612458]  }
[  107.612467]  ... key      at: [<ffffffffc06044e0>] __key.49448+0x0/0xff=
fffffffffe5b20 [xhci_hcd]
[  107.612473]  ... acquired at:
[  107.612478]    lock_acquire+0x1a7/0x3b0
[  107.612483]    radix_tree_maybe_preload+0x49/0xb0
[  107.612493]    xhci_update_stream_segment_mapping+0x63/0x160 [xhci_hcd]
[  107.612503]    xhci_ring_expansion+0x19d/0x320 [xhci_hcd]
[  107.612514]    prepare_ring+0x8b/0x1f0 [xhci_hcd]
[  107.612523]    prepare_transfer+0x64/0x140 [xhci_hcd]
[  107.612534]    xhci_queue_bulk_tx+0xe7/0xb70 [xhci_hcd]
[  107.612544]    xhci_urb_enqueue+0x615/0x6f0 [xhci_hcd]
[  107.612556]    usb_hcd_submit_urb+0xa7/0xb00 [usbcore]
[  107.612561]    uas_submit_urbs+0x35b/0x500 [uas]
[  107.612566]    uas_queuecommand+0x1db/0x260 [uas]
[  107.612579]    scsi_queue_rq+0x5ca/0xbe0 [scsi_mod]
[  107.612585]    blk_mq_dispatch_rq_list+0x285/0x6d0
[  107.612590]    __blk_mq_do_dispatch_sched+0x210/0x260
[  107.612596]    __blk_mq_sched_dispatch_requests+0x133/0x170
[  107.612602]    blk_mq_sched_dispatch_requests+0x30/0x60
[  107.612607]    __blk_mq_run_hw_queue+0x6f/0xd0
[  107.612612]    __blk_mq_delay_run_hw_queue+0xda/0x1f0
[  107.612617]    blk_mq_run_hw_queue+0x6a/0xd0
[  107.612623]    blk_mq_sched_insert_requests+0xdd/0x2a0
[  107.612628]    blk_mq_flush_plug_list+0x12d/0x240
[  107.612633]    blk_flush_plug_list+0xb4/0xd0
[  107.612638]    blk_mq_submit_bio+0x365/0x770
[  107.612643]    submit_bio_noacct+0x41e/0x4b0
[  107.612648]    submit_bio+0x33/0x160
[  107.612677]    ext4_mpage_readpages+0x1ad/0x980 [ext4]
[  107.612683]    read_pages+0x7d/0x230
[  107.612688]    page_cache_ra_unbounded+0x138/0x1f0
[  107.612695]    generic_file_buffered_read+0x144/0xa10
[  107.612701]    do_iter_readv_writev+0x17c/0x1b0
[  107.612706]    do_iter_read+0xca/0x1c0
[  107.612711]    vfs_readv+0x6f/0xa0
[  107.612716]    do_preadv+0x9c/0xe0
[  107.612720]    do_syscall_64+0x33/0x40
[  107.612726]    entry_SYSCALL_64_after_hwframe+0x44/0xa9

[  107.612734]
               the dependencies between the lock to be acquired
[  107.612734]  and SOFTIRQ-irq-unsafe lock:
[  107.612761] -> (lock#2){+.+.}-{2:2} {
[  107.612769]    HARDIRQ-ON-W at:
[  107.612775]                     lock_acquire+0x1a7/0x3b0
[  107.612780]                     __radix_tree_preload+0x5c/0x2a0
[  107.612786]                     idr_preload+0xf/0xb0
[  107.612792]                     __kernfs_new_node+0x66/0x270
[  107.612798]                     kernfs_create_root+0xab/0x140
[  107.612804]                     sysfs_init+0x14/0x53
[  107.612809]                     mnt_init+0xc9/0x1f1
[  107.612814]                     vfs_caches_init+0xca/0xd4
[  107.612820]                     start_kernel+0x734/0x78a
[  107.612826]                     secondary_startup_64_no_verify+0xb8/0xb=
b
[  107.612831]    SOFTIRQ-ON-W at:
[  107.612836]                     lock_acquire+0x1a7/0x3b0
[  107.612841]                     __radix_tree_preload+0x5c/0x2a0
[  107.612847]                     idr_preload+0xf/0xb0
[  107.612853]                     __kernfs_new_node+0x66/0x270
[  107.612858]                     kernfs_create_root+0xab/0x140
[  107.612864]                     sysfs_init+0x14/0x53
[  107.612869]                     mnt_init+0xc9/0x1f1
[  107.612875]                     vfs_caches_init+0xca/0xd4
[  107.612880]                     start_kernel+0x734/0x78a
[  107.612885]                     secondary_startup_64_no_verify+0xb8/0xb=
b
[  107.612891]    INITIAL USE at:
[  107.612896]                    lock_acquire+0x1a7/0x3b0
[  107.612901]                    __radix_tree_preload+0x5c/0x2a0
[  107.612906]                    idr_preload+0xf/0xb0
[  107.612912]                    __kernfs_new_node+0x66/0x270
[  107.612918]                    kernfs_create_root+0xab/0x140
[  107.612923]                    sysfs_init+0x14/0x53
[  107.612928]                    mnt_init+0xc9/0x1f1
[  107.612933]                    vfs_caches_init+0xca/0xd4
[  107.612939]                    start_kernel+0x734/0x78a
[  107.612944]                    secondary_startup_64_no_verify+0xb8/0xbb
[  107.612949]  }
[  107.612953]  ... key      at: [<ffff90bba6c2c680>] 0xffff90bba6c2c680
[  107.612958]  ... acquired at:
[  107.612963]    lock_acquire+0x1a7/0x3b0
[  107.612968]    radix_tree_maybe_preload+0x49/0xb0
[  107.612978]    xhci_update_stream_segment_mapping+0x63/0x160 [xhci_hcd]
[  107.612989]    xhci_ring_expansion+0x19d/0x320 [xhci_hcd]
[  107.612999]    prepare_ring+0x8b/0x1f0 [xhci_hcd]
[  107.613008]    prepare_transfer+0x64/0x140 [xhci_hcd]
[  107.613019]    xhci_queue_bulk_tx+0xe7/0xb70 [xhci_hcd]
[  107.613029]    xhci_urb_enqueue+0x615/0x6f0 [xhci_hcd]
[  107.613041]    usb_hcd_submit_urb+0xa7/0xb00 [usbcore]
[  107.613047]    uas_submit_urbs+0x35b/0x500 [uas]
[  107.613052]    uas_queuecommand+0x1db/0x260 [uas]
[  107.613063]    scsi_queue_rq+0x5ca/0xbe0 [scsi_mod]
[  107.613068]    blk_mq_dispatch_rq_list+0x285/0x6d0
[  107.613073]    __blk_mq_do_dispatch_sched+0x210/0x260
[  107.613079]    __blk_mq_sched_dispatch_requests+0x133/0x170
[  107.613085]    blk_mq_sched_dispatch_requests+0x30/0x60
[  107.613090]    __blk_mq_run_hw_queue+0x6f/0xd0
[  107.613095]    __blk_mq_delay_run_hw_queue+0xda/0x1f0
[  107.613100]    blk_mq_run_hw_queue+0x6a/0xd0
[  107.613106]    blk_mq_sched_insert_requests+0xdd/0x2a0
[  107.613111]    blk_mq_flush_plug_list+0x12d/0x240
[  107.613116]    blk_flush_plug_list+0xb4/0xd0
[  107.613121]    blk_mq_submit_bio+0x365/0x770
[  107.613126]    submit_bio_noacct+0x41e/0x4b0
[  107.613131]    submit_bio+0x33/0x160
[  107.613153]    ext4_mpage_readpages+0x1ad/0x980 [ext4]
[  107.613158]    read_pages+0x7d/0x230
[  107.613163]    page_cache_ra_unbounded+0x138/0x1f0
[  107.613169]    generic_file_buffered_read+0x144/0xa10
[  107.613175]    do_iter_readv_writev+0x17c/0x1b0
[  107.613180]    do_iter_read+0xca/0x1c0
[  107.613185]    vfs_readv+0x6f/0xa0
[  107.613189]    do_preadv+0x9c/0xe0
[  107.613194]    do_syscall_64+0x33/0x40
[  107.613199]    entry_SYSCALL_64_after_hwframe+0x44/0xa9

[  107.613207]
               stack backtrace:
[  107.613214] CPU: 2 PID: 4060 Comm: worker Tainted: G S        I E     5=
.10.0.g23859ae-master #17
[  107.613220] Hardware name: HP HP Spectre x360 Convertible/804F, BIOS F.=
47 11/22/2017
[  107.613226] Call Trace:
[  107.613233]  dump_stack+0x77/0x97
[  107.613239]  check_irq_usage+0x7a8/0x7b0
[  107.613246]  ? check_path.constprop.54+0x22/0x40
[  107.613255]  ? __lock_acquire+0x14af/0x1a70
[  107.613260]  __lock_acquire+0x14af/0x1a70
[  107.613268]  lock_acquire+0x1a7/0x3b0
[  107.613273]  ? radix_tree_maybe_preload+0x8/0xb0
[  107.613283]  ? xhci_segment_alloc+0xd8/0x100 [xhci_hcd]
[  107.613290]  radix_tree_maybe_preload+0x49/0xb0
[  107.613295]  ? radix_tree_maybe_preload+0x8/0xb0
[  107.613305]  xhci_update_stream_segment_mapping+0x63/0x160 [xhci_hcd]
[  107.613316]  xhci_ring_expansion+0x19d/0x320 [xhci_hcd]
[  107.613328]  prepare_ring+0x8b/0x1f0 [xhci_hcd]
[  107.613338]  prepare_transfer+0x64/0x140 [xhci_hcd]
[  107.613350]  xhci_queue_bulk_tx+0xe7/0xb70 [xhci_hcd]
[  107.613363]  xhci_urb_enqueue+0x615/0x6f0 [xhci_hcd]
[  107.613377]  usb_hcd_submit_urb+0xa7/0xb00 [usbcore]
[  107.613383]  ? find_held_lock+0x2d/0x90
[  107.613389]  ? uas_submit_urbs+0x34a/0x500 [uas]
[  107.613396]  uas_submit_urbs+0x35b/0x500 [uas]
[  107.613403]  uas_queuecommand+0x1db/0x260 [uas]
[  107.613415]  scsi_queue_rq+0x5ca/0xbe0 [scsi_mod]
[  107.613421]  blk_mq_dispatch_rq_list+0x285/0x6d0
[  107.613430]  __blk_mq_do_dispatch_sched+0x210/0x260
[  107.613437]  __blk_mq_sched_dispatch_requests+0x133/0x170
[  107.613444]  blk_mq_sched_dispatch_requests+0x30/0x60
[  107.613449]  __blk_mq_run_hw_queue+0x6f/0xd0
[  107.613455]  __blk_mq_delay_run_hw_queue+0xda/0x1f0
[  107.613461]  blk_mq_run_hw_queue+0x6a/0xd0
[  107.613467]  blk_mq_sched_insert_requests+0xdd/0x2a0
[  107.613473]  blk_mq_flush_plug_list+0x12d/0x240
[  107.613480]  blk_flush_plug_list+0xb4/0xd0
[  107.613486]  blk_mq_submit_bio+0x365/0x770
[  107.613493]  submit_bio_noacct+0x41e/0x4b0
[  107.613500]  ? submit_bio+0x33/0x160
[  107.613505]  ? xa_load+0xb6/0x130
[  107.613509]  submit_bio+0x33/0x160
[  107.613514]  ? bio_add_page+0x29/0x70
[  107.613536]  ext4_mpage_readpages+0x1ad/0x980 [ext4]
[  107.613544]  ? find_held_lock+0x2d/0x90
[  107.613550]  read_pages+0x7d/0x230
[  107.613556]  ? lru_cache_add+0x113/0x1b0
[  107.613562]  ? page_cache_ra_unbounded+0x138/0x1f0
[  107.613567]  page_cache_ra_unbounded+0x138/0x1f0
[  107.613575]  generic_file_buffered_read+0x144/0xa10
[  107.613583]  do_iter_readv_writev+0x17c/0x1b0
[  107.613589]  do_iter_read+0xca/0x1c0
[  107.613595]  vfs_readv+0x6f/0xa0
[  107.613602]  ? __fget_files+0xea/0x1f0
[  107.613608]  ? __fget_files+0x102/0x1f0
[  107.613614]  ? do_preadv+0x9c/0xe0
[  107.613618]  do_preadv+0x9c/0xe0
[  107.613624]  do_syscall_64+0x33/0x40
[  107.613629]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  107.613637] RIP: 0033:0x7fd344b8cc83
[  107.613647] Code: 49 89 ca b8 27 01 00 00 0f 05 48 3d 01 f0 ff ff 73 34=
 c3 48 83 ec 08 e8 fb 64 01 00 48 89 04 24 49 89 ca b8 27 01 00 00 0f 05 <=
48> 8b 3c 24 48 89 c2 e8 41 65 01 00 48 89 d0 48 83 c4 08 48 3d 01
[  107.613657] RSP: 002b:00007fd33d39a850 EFLAGS: 00000293 ORIG_RAX: 00000=
00000000127
[  107.613664] RAX: ffffffffffffffda RBX: 00007fd20e0a46f0 RCX: 00007fd344=
b8cc83
[  107.613670] RDX: 0000000000000002 RSI: 00007fd3242644b0 RDI: 0000000000=
00000b
[  107.613675] RBP: 0000563a9eb21140 R08: 0000000000000000 R09: 00000000ff=
ffffff
[  107.613681] R10: 00000000da0c9000 R11: 0000000000000293 R12: 0000563a9c=
dc36b0
[  107.613686] R13: 0000563a9eb211a8 R14: 00007fd324269590 R15: 00007ffeab=
138280

