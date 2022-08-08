Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7362B58CAE2
	for <lists+linux-usb@lfdr.de>; Mon,  8 Aug 2022 16:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243541AbiHHO5u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Aug 2022 10:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243400AbiHHO5n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Aug 2022 10:57:43 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA9213CF5
        for <linux-usb@vger.kernel.org>; Mon,  8 Aug 2022 07:57:40 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220808145736euoutp02267a747601ee07b77e6103e89436e0cb~JZoSD-qD00786907869euoutp024
        for <linux-usb@vger.kernel.org>; Mon,  8 Aug 2022 14:57:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220808145736euoutp02267a747601ee07b77e6103e89436e0cb~JZoSD-qD00786907869euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1659970657;
        bh=NLo+475xAFptKrlVZIxzZsfJMmuOmgJtj4+bbeoK+vc=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=CoxaPDJhuhOuYTvVKIBQfMJaXJuTabiQCHsXYmXPX/NmP6T5NhvZJweyVGW0sKR6T
         Z3uldg0von6CkNg+wWeniru/C42IxA0gYbHUNssZ04W6AQtyOWHMC4UxZbb5Z9X66E
         3BxgMaSpb06+F3KOl9PfPoPiQsMMV5igTXzK3Fes=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220808145736eucas1p25649bbbd130b65addf38eabf7a9edc9a~JZoR8Kq5H1274212742eucas1p2h;
        Mon,  8 Aug 2022 14:57:36 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id BC.D9.10067.06421F26; Mon,  8
        Aug 2022 15:57:36 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405~JZoRjNovk3048430484eucas1p2W;
        Mon,  8 Aug 2022 14:57:36 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220808145736eusmtrp1afd1f7f4c0825c235abe8349f2425ed7~JZoRigSvx2175221752eusmtrp1H;
        Mon,  8 Aug 2022 14:57:36 +0000 (GMT)
X-AuditID: cbfec7f4-dc1ff70000002753-8f-62f12460a8cc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id D2.8D.09095.06421F26; Mon,  8
        Aug 2022 15:57:36 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220808145736eusmtip2b863a26fb97d9c813d422b9d4a94579d~JZoRLsmLp2202622026eusmtip2_;
        Mon,  8 Aug 2022 14:57:36 +0000 (GMT)
Message-ID: <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
Date:   Mon, 8 Aug 2022 16:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in
 usb_udc_uevent()
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <YtlrnhHyrHsSky9m@rowland.harvard.edu>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0yMcRzHfe957umpdvl2fvTxmyu2miJpbmP9MOasPzIVYyaP7tlJdeUe
        5zdDROfHoS11V0rJJac4FSe5daN2Mt1kzZA2DsmPFmeT/Hx8h/57fd6f92efz/u7L0vJj0vH
        s+nazbxOy2UqGD+6sXXwfvi6kIH1s19bw5WteR4fZW5lHaOsOH+QUp4YcjPKR/WlVJxUdfOk
        i1HZavIZlaPU6qMyd39Bqk+2ycukq/0WqPnM9C28blbMOr8NTYf2UTl9Kdsu2R30XlSYYEC+
        LOC5cCyvjjYgP1aOqxFYPA2IFF4ENe+qkOiS408I7P1qA2L/THRYQojHgqC2pE5KigEEp9ze
        PwMyHAMN9mNIHKBxCJzxZhA5EFzFHlrkMTgNXv2s9BEto3AidJnVokzhIHjsKZOIPBoL4DJf
        kBI9CVwvKymRGRwJhvcGRmRfHAX5JWU08UyB3AYzJZ4D2M3C6zIXQ1Iugu/Ga1LCo6Cvrd6H
        8ERoLzhKk1zZ8L0oisjboOutlSI8H57e/8qIFgqHQt2NWUSOB0M5uR5wADx6H0guCIBTjacp
        IsvgcJ6cuGeAqa32384W9wPqBFKYhj2JaVh207Aspv97yxFdg4J4vZCl4YU5Wn5rhMBlCXqt
        JiItO8uGfn+Z9h9t3uvI0jcQ4UQSFjkRsJRitOz2pf71cpma276D12Wn6vSZvOBEE1haESRL
        S7/MybGG28xn8HwOr/vblbC+4/dKTlo29fRS+/GbjMQ9GRODlirjOtp9czjnucTmovqralNj
        mCf2TkV8xNgETcvZO48bPwf/mJls64yO3fmw+mNL7kqhLXjxivpcg3/0GFnkpmWd2YqQI+7l
        +FuR3XlkuVQfFjrUFG3Zl29ADu7JlQfPzuhHzs1xDK69pQi04d4DSTM6uj8YzUnlURvnCJOe
        lDQ7rAuqByslxbtaocDepIm2z/tQHFqWWoisyaWdI6OqexpSFwdPN/rHNedddB/tjh/R39v8
        vGdcWlXsrbeLal+0Th0KeGMvfbjQmxQzLdxoBqWx4nTCxxT+Z0HXqntSeolnY//OgN3z12jj
        /FNW3/32OVJBCxu4yDBKJ3C/ADY+CrmhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xe7oJKh+TDN4uF7M41vaE3aJ58Xo2
        i0XLWpktJvy+wGZxY8tcZgdWjz0TT7J5bFrVyeaxf+4ado/Zd38wenzeJBfAGqVnU5RfWpKq
        kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXsbu9kbngVWjF2p37
        WRoYp3l3MXJwSAiYSJxfrtLFyMUhJLCUUWLryieMXYycQHEZiZPTGlghbGGJP9e62CCK3jNK
        TJt8nh0kwStgJ7F1Zy8jyCAWARWJeV+yIcKCEidnPmEBsUUFkiUWHFoKZgsL+ErM2dbPDGIz
        C4hL3HoynwnEFhEolji29DMrRDxYYvejiawQu9oZJSZs3gp2EJuAoUTXW5AjODk4BYwlOufM
        Z4FoMJPo2trFCGHLSzRvnc08gVFoFpI7ZiHZNwtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX
        5qXrJefnbmIExte2Yz8372Cc9+qj3iFGJg7GQ4wSHMxKIrxH1r5PEuJNSaysSi3Kjy8qzUkt
        PsRoCgyLicxSosn5wAjPK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+Lg
        lGpg4rn0h79U5fTbrjLhlaeiZ3e5BicIVmY0lbOyL4lwjVeyWxc4sXjlHtU9l2ezP519XyXP
        JNky0NCyv+rNrl96T9ar+4aptAo+//j55ULxkl2x3+5wiri3tcyLllll5jZ1V/KVI8vXH7E4
        r7hJzarbyGWmhDjT5rN3lPdxSDypzunYrfeMJ3k2h12IiCZLuWnNA/uZxxdH+bnmVn6ri9Jj
        CFZ4Pm9joeeBS6GFDoe0TR5cPmApUs5s45EW9L9v073ZAS3n6nlvrDzi7K7fknuqSPmVUyNr
        gcnqRzVnJW6mNX7cEjfRTcQp93S/6o6g7adX3VG8WiPMIXuAZfoPm6sHrzZET0/cECMT4HGn
        RkWJpTgj0VCLuag4EQD4xXKmOAMAAA==
X-CMS-MailID: 20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
        <000000000000acc0e905e4517fa0@google.com>
        <YtlrnhHyrHsSky9m@rowland.harvard.edu>
        <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On 21.07.2022 17:07, Alan Stern wrote:
> The syzbot fuzzer found a race between uevent callbacks and gadget
> driver unregistration that can cause a use-after-free bug:
>
> ---------------------------------------------------------------
> BUG: KASAN: use-after-free in usb_udc_uevent+0x11f/0x130
> drivers/usb/gadget/udc/core.c:1732
> Read of size 8 at addr ffff888078ce2050 by task udevd/2968
>
> CPU: 1 PID: 2968 Comm: udevd Not tainted 5.19.0-rc4-next-20220628-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google
> 06/29/2022
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:88 [inline]
>   dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
>   print_address_description mm/kasan/report.c:317 [inline]
>   print_report.cold+0x2ba/0x719 mm/kasan/report.c:433
>   kasan_report+0xbe/0x1f0 mm/kasan/report.c:495
>   usb_udc_uevent+0x11f/0x130 drivers/usb/gadget/udc/core.c:1732
>   dev_uevent+0x290/0x770 drivers/base/core.c:2424
> ---------------------------------------------------------------
>
> The bug occurs because usb_udc_uevent() dereferences udc->driver but
> does so without acquiring the udc_lock mutex, which protects this
> field.  If the gadget driver is unbound from the udc concurrently with
> uevent processing, the driver structure may be accessed after it has
> been deallocated.
>
> To prevent the race, we make sure that the routine holds the mutex
> around the racing accesses.
>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+b0de012ceb1e2a97891b@syzkaller.appspotmail.com
> CC: stable@vger.kernel.org
> Link: <https://lore.kernel.org/all/0000000000004de90405a719c951@google.com>

This patch landed recently in linux-next as commit 2191c00855b0 ("USB: 
gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it 
fixes the issue by introducing another one. It doesn't look very 
probable, but it would be nice to fix it to make the lock dependency 
checker happy.

======================================================
WARNING: possible circular locking dependency detected
5.19.0-rc7+ #12510 Not tainted
------------------------------------------------------
udevadm/312 is trying to acquire lock:
ffff80000aae1058 (udc_lock){+.+.}-{3:3}, at: usb_udc_uevent+0x54/0xe0

but task is already holding lock:
ffff000002277548 (kn->active#4){++++}-{0:0}, at: kernfs_seq_start+0x34/0xe0

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (kn->active#4){++++}-{0:0}:
        lock_acquire+0x68/0x84
        __kernfs_remove+0x268/0x380
        kernfs_remove_by_name_ns+0x58/0xac
        sysfs_remove_file_ns+0x18/0x24
        device_del+0x15c/0x440
        device_link_drop_managed+0xa8/0xe0
        device_links_driver_bound+0x1b8/0x230
        driver_bound+0x68/0xc0
        really_probe.part.0+0x1f8/0x2ac
        __driver_probe_device+0x98/0x144
        driver_probe_device+0xac/0x14c
        __driver_attach+0x104/0x1b0
        bus_for_each_dev+0x70/0xd0
        driver_attach+0x24/0x30
        bus_add_driver+0x154/0x204
        driver_register+0x78/0x130
        __platform_driver_register+0x28/0x34
        simple_pm_bus_driver_init+0x1c/0x28
        do_one_initcall+0x74/0x400
        kernel_init_freeable+0x2f4/0x37c
        kernel_init+0x28/0x130
        ret_from_fork+0x10/0x20

-> #2 (device_links_lock){+.+.}-{3:3}:
        lock_acquire+0x68/0x84
        __mutex_lock+0x9c/0x430
        mutex_lock_nested+0x38/0x64
        device_link_remove+0x3c/0xa0
        _regulator_put.part.0+0x168/0x190
        regulator_put+0x3c/0x54
        devm_regulator_release+0x14/0x20
        release_nodes+0x5c/0x90
        devres_release_all+0x8c/0xe0
        device_unbind_cleanup+0x18/0x70
        really_probe.part.0+0x174/0x2ac
        __driver_probe_device+0x98/0x144
        driver_probe_device+0xac/0x14c
        __device_attach_driver+0xb8/0x120
        bus_for_each_drv+0x78/0xd0
        __device_attach_async_helper+0xb0/0xd4
        async_run_entry_fn+0x34/0xd0
        process_one_work+0x288/0x6bc
        worker_thread+0x74/0x450
        kthread+0x118/0x11c
        ret_from_fork+0x10/0x20

-> #1 (regulator_list_mutex){+.+.}-{3:3}:
        lock_acquire+0x68/0x84
        __mutex_lock+0x9c/0x430
        mutex_lock_nested+0x38/0x64
        regulator_lock_dependent+0x54/0x284
        regulator_enable+0x34/0x80
        phy_power_on+0x24/0x130
        __dwc2_lowlevel_hw_enable+0x100/0x130
        dwc2_lowlevel_hw_enable+0x18/0x40
        dwc2_hsotg_udc_start+0x6c/0x2f0
        gadget_bind_driver+0x124/0x1f4
        really_probe.part.0+0x9c/0x2ac
        __driver_probe_device+0x98/0x144
        driver_probe_device+0xac/0x14c
        __device_attach_driver+0xb8/0x120
        bus_for_each_drv+0x78/0xd0
        __device_attach+0xa8/0x1c0
        device_initial_probe+0x14/0x20
        bus_probe_device+0x9c/0xa4
        device_add+0x3a0/0x890
        usb_add_gadget+0x170/0x200
        usb_add_gadget_udc+0x94/0xd4
        dwc2_driver_probe+0x580/0x78c
        platform_probe+0x68/0xe0
        really_probe.part.0+0x9c/0x2ac
        __driver_probe_device+0x98/0x144
        driver_probe_device+0xac/0x14c
        __device_attach_driver+0xb8/0x120
        bus_for_each_drv+0x78/0xd0
        __device_attach+0xa8/0x1c0
        device_initial_probe+0x14/0x20
        bus_probe_device+0x9c/0xa4
        device_add+0x3a0/0x890
        of_device_add+0x48/0x6c
        of_platform_device_create_pdata+0x98/0x100
        of_platform_bus_create+0x17c/0x37c
        of_platform_populate+0x58/0xec
        dwc3_meson_g12a_probe+0x314/0x5d0
        platform_probe+0x68/0xe0
        really_probe.part.0+0x9c/0x2ac
        __driver_probe_device+0x98/0x144
        driver_probe_device+0xac/0x14c
        __device_attach_driver+0xb8/0x120
        bus_for_each_drv+0x78/0xd0
        __device_attach+0xa8/0x1c0
        device_initial_probe+0x14/0x20
        bus_probe_device+0x9c/0xa4
        deferred_probe_work_func+0x88/0xc4
        process_one_work+0x288/0x6bc
        worker_thread+0x74/0x450
        kthread+0x118/0x11c
        ret_from_fork+0x10/0x20

-> #0 (udc_lock){+.+.}-{3:3}:
        __lock_acquire+0x1298/0x20cc
        lock_acquire.part.0+0xe0/0x230
        lock_acquire+0x68/0x84
        __mutex_lock+0x9c/0x430
        mutex_lock_nested+0x38/0x64
        usb_udc_uevent+0x54/0xe0
        dev_uevent+0xb8/0x1ec
        uevent_show+0x8c/0x114
        dev_attr_show+0x20/0x60
        sysfs_kf_seq_show+0xa8/0x120
        kernfs_seq_show+0x2c/0x40
        seq_read_iter+0x1bc/0x4b0
        kernfs_fop_read_iter+0x140/0x1d0
        new_sync_read+0xd4/0x150
        vfs_read+0x190/0x1dc
        ksys_read+0x68/0xfc
        __arm64_sys_read+0x20/0x30
        invoke_syscall+0x48/0x114
        el0_svc_common.constprop.0+0x60/0x11c
        do_el0_svc_compat+0x1c/0x50
        el0_svc_compat+0x58/0x100
        el0t_32_sync_handler+0x90/0x140
        el0t_32_sync+0x190/0x194

other info that might help us debug this:

Chain exists of:
   udc_lock --> device_links_lock --> kn->active#4

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(kn->active#4);
                                lock(device_links_lock);
                                lock(kn->active#4);
   lock(udc_lock);

  *** DEADLOCK ***

3 locks held by udevadm/312:
  #0: ffff000001ab80a0 (&p->lock){+.+.}-{3:3}, at: seq_read_iter+0x60/0x4b0
  #1: ffff00003cdf7e88 (&of->mutex){+.+.}-{3:3}, at: 
kernfs_seq_start+0x2c/0xe0
  #2: ffff000002277548 (kn->active#4){++++}-{0:0}, at: 
kernfs_seq_start+0x34/0xe0

stack backtrace:
CPU: 2 PID: 312 Comm: udevadm Not tainted 5.19.0-rc7+ #12510
Hardware name: Khadas VIM3 (DT)
Call trace:
  dump_backtrace.part.0+0xd0/0xe0
  show_stack+0x18/0x6c
  dump_stack_lvl+0x8c/0xb8
  dump_stack+0x18/0x34
  print_circular_bug+0x1f8/0x200
  check_noncircular+0x130/0x144
  __lock_acquire+0x1298/0x20cc
  lock_acquire.part.0+0xe0/0x230
  lock_acquire+0x68/0x84
  __mutex_lock+0x9c/0x430
  mutex_lock_nested+0x38/0x64
  usb_udc_uevent+0x54/0xe0
  dev_uevent+0xb8/0x1ec
  uevent_show+0x8c/0x114
  dev_attr_show+0x20/0x60
  sysfs_kf_seq_show+0xa8/0x120
  kernfs_seq_show+0x2c/0x40
  seq_read_iter+0x1bc/0x4b0
  kernfs_fop_read_iter+0x140/0x1d0
  new_sync_read+0xd4/0x150
  vfs_read+0x190/0x1dc
  ksys_read+0x68/0xfc
  __arm64_sys_read+0x20/0x30
  invoke_syscall+0x48/0x114
  el0_svc_common.constprop.0+0x60/0x11c
  do_el0_svc_compat+0x1c/0x50
  el0_svc_compat+0x58/0x100
  el0t_32_sync_handler+0x90/0x140
  el0t_32_sync+0x190/0x194



> ---
>
> As far as I can tell, this bug has always been present.  However, the
> udc_lock mutex used by the patch was added in commit fc274c1e9973
> ("USB: gadget: Add a new bus for gadgets"), so this patch won't apply
> to trees which don't include that commit or a backport of it.  I don't
> know what tag, if any, can express this requirement.
>
>
> [as1983]
>
>
>   drivers/usb/gadget/udc/core.c |   11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> Index: usb-devel/drivers/usb/gadget/udc/core.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/udc/core.c
> +++ usb-devel/drivers/usb/gadget/udc/core.c
> @@ -1728,13 +1728,14 @@ static int usb_udc_uevent(struct device
>   		return ret;
>   	}
>   
> -	if (udc->driver) {
> +	mutex_lock(&udc_lock);
> +	if (udc->driver)
>   		ret = add_uevent_var(env, "USB_UDC_DRIVER=%s",
>   				udc->driver->function);
> -		if (ret) {
> -			dev_err(dev, "failed to add uevent USB_UDC_DRIVER\n");
> -			return ret;
> -		}
> +	mutex_unlock(&udc_lock);
> +	if (ret) {
> +		dev_err(dev, "failed to add uevent USB_UDC_DRIVER\n");
> +		return ret;
>   	}
>   
>   	return 0;
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

