Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE1558CF15
	for <lists+linux-usb@lfdr.de>; Mon,  8 Aug 2022 22:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244312AbiHHU06 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Aug 2022 16:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244334AbiHHU0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Aug 2022 16:26:55 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C78DC1A81C
        for <linux-usb@vger.kernel.org>; Mon,  8 Aug 2022 13:26:50 -0700 (PDT)
Received: (qmail 785745 invoked by uid 1000); 8 Aug 2022 16:26:49 -0400
Date:   Mon, 8 Aug 2022 16:26:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
 <YtlrnhHyrHsSky9m@rowland.harvard.edu>
 <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
 <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
> Hi Alan,

Hi.

> This patch landed recently in linux-next as commit 2191c00855b0 ("USB: 
> gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it 
> fixes the issue by introducing another one. It doesn't look very 
> probable, but it would be nice to fix it to make the lock dependency 
> checker happy.

Indeed.

> ======================================================
> WARNING: possible circular locking dependency detected
> 5.19.0-rc7+ #12510 Not tainted
> ------------------------------------------------------
> udevadm/312 is trying to acquire lock:
> ffff80000aae1058 (udc_lock){+.+.}-{3:3}, at: usb_udc_uevent+0x54/0xe0
> 
> but task is already holding lock:
> ffff000002277548 (kn->active#4){++++}-{0:0}, at: kernfs_seq_start+0x34/0xe0
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #3 (kn->active#4){++++}-{0:0}:
>         lock_acquire+0x68/0x84
>         __kernfs_remove+0x268/0x380
>         kernfs_remove_by_name_ns+0x58/0xac
>         sysfs_remove_file_ns+0x18/0x24
>         device_del+0x15c/0x440
>         device_link_drop_managed+0xa8/0xe0
>         device_links_driver_bound+0x1b8/0x230
>         driver_bound+0x68/0xc0
>         really_probe.part.0+0x1f8/0x2ac
>         __driver_probe_device+0x98/0x144
>         driver_probe_device+0xac/0x14c
>         __driver_attach+0x104/0x1b0
>         bus_for_each_dev+0x70/0xd0
>         driver_attach+0x24/0x30
>         bus_add_driver+0x154/0x204
>         driver_register+0x78/0x130
>         __platform_driver_register+0x28/0x34
>         simple_pm_bus_driver_init+0x1c/0x28
>         do_one_initcall+0x74/0x400
>         kernel_init_freeable+0x2f4/0x37c
>         kernel_init+0x28/0x130
>         ret_from_fork+0x10/0x20
> 
> -> #2 (device_links_lock){+.+.}-{3:3}:
>         lock_acquire+0x68/0x84
>         __mutex_lock+0x9c/0x430
>         mutex_lock_nested+0x38/0x64
>         device_link_remove+0x3c/0xa0
>         _regulator_put.part.0+0x168/0x190
>         regulator_put+0x3c/0x54
>         devm_regulator_release+0x14/0x20
>         release_nodes+0x5c/0x90
>         devres_release_all+0x8c/0xe0
>         device_unbind_cleanup+0x18/0x70
>         really_probe.part.0+0x174/0x2ac
>         __driver_probe_device+0x98/0x144
>         driver_probe_device+0xac/0x14c
>         __device_attach_driver+0xb8/0x120
>         bus_for_each_drv+0x78/0xd0
>         __device_attach_async_helper+0xb0/0xd4
>         async_run_entry_fn+0x34/0xd0
>         process_one_work+0x288/0x6bc
>         worker_thread+0x74/0x450
>         kthread+0x118/0x11c
>         ret_from_fork+0x10/0x20
> 
> -> #1 (regulator_list_mutex){+.+.}-{3:3}:
>         lock_acquire+0x68/0x84
>         __mutex_lock+0x9c/0x430
>         mutex_lock_nested+0x38/0x64
>         regulator_lock_dependent+0x54/0x284
>         regulator_enable+0x34/0x80
>         phy_power_on+0x24/0x130
>         __dwc2_lowlevel_hw_enable+0x100/0x130
>         dwc2_lowlevel_hw_enable+0x18/0x40
>         dwc2_hsotg_udc_start+0x6c/0x2f0
>         gadget_bind_driver+0x124/0x1f4
>         really_probe.part.0+0x9c/0x2ac
>         __driver_probe_device+0x98/0x144
>         driver_probe_device+0xac/0x14c
>         __device_attach_driver+0xb8/0x120
>         bus_for_each_drv+0x78/0xd0
>         __device_attach+0xa8/0x1c0
>         device_initial_probe+0x14/0x20
>         bus_probe_device+0x9c/0xa4
>         device_add+0x3a0/0x890
>         usb_add_gadget+0x170/0x200
>         usb_add_gadget_udc+0x94/0xd4
>         dwc2_driver_probe+0x580/0x78c
>         platform_probe+0x68/0xe0
>         really_probe.part.0+0x9c/0x2ac
>         __driver_probe_device+0x98/0x144
>         driver_probe_device+0xac/0x14c
>         __device_attach_driver+0xb8/0x120
>         bus_for_each_drv+0x78/0xd0
>         __device_attach+0xa8/0x1c0
>         device_initial_probe+0x14/0x20
>         bus_probe_device+0x9c/0xa4
>         device_add+0x3a0/0x890
>         of_device_add+0x48/0x6c
>         of_platform_device_create_pdata+0x98/0x100
>         of_platform_bus_create+0x17c/0x37c
>         of_platform_populate+0x58/0xec
>         dwc3_meson_g12a_probe+0x314/0x5d0
>         platform_probe+0x68/0xe0
>         really_probe.part.0+0x9c/0x2ac
>         __driver_probe_device+0x98/0x144
>         driver_probe_device+0xac/0x14c
>         __device_attach_driver+0xb8/0x120
>         bus_for_each_drv+0x78/0xd0
>         __device_attach+0xa8/0x1c0
>         device_initial_probe+0x14/0x20
>         bus_probe_device+0x9c/0xa4
>         deferred_probe_work_func+0x88/0xc4
>         process_one_work+0x288/0x6bc
>         worker_thread+0x74/0x450
>         kthread+0x118/0x11c
>         ret_from_fork+0x10/0x20
> 
> -> #0 (udc_lock){+.+.}-{3:3}:
>         __lock_acquire+0x1298/0x20cc
>         lock_acquire.part.0+0xe0/0x230
>         lock_acquire+0x68/0x84
>         __mutex_lock+0x9c/0x430
>         mutex_lock_nested+0x38/0x64
>         usb_udc_uevent+0x54/0xe0
>         dev_uevent+0xb8/0x1ec
>         uevent_show+0x8c/0x114
>         dev_attr_show+0x20/0x60
>         sysfs_kf_seq_show+0xa8/0x120
>         kernfs_seq_show+0x2c/0x40
>         seq_read_iter+0x1bc/0x4b0
>         kernfs_fop_read_iter+0x140/0x1d0
>         new_sync_read+0xd4/0x150
>         vfs_read+0x190/0x1dc
>         ksys_read+0x68/0xfc
>         __arm64_sys_read+0x20/0x30
>         invoke_syscall+0x48/0x114
>         el0_svc_common.constprop.0+0x60/0x11c
>         do_el0_svc_compat+0x1c/0x50
>         el0_svc_compat+0x58/0x100
>         el0t_32_sync_handler+0x90/0x140
>         el0t_32_sync+0x190/0x194
> 
> other info that might help us debug this:
> 
> Chain exists of:
>    udc_lock --> device_links_lock --> kn->active#4

Peter, shouldn't this say:

   udc_lock --> regulator_list_mutex --> device_links_lock --> kn->active#4

?  Is that a bug in the lockdep reporting?

It looks like this is a bad interaction between the udc_lock and the 
sysfs/kernfs locking.  If a lock such as udc_lock is held (or is part of 
a chain) while a sysfs file is removed, the file's ->show or ->store 
routine better not acquire that lock.

I suspect the problem is that udc_lock is held for too long.  Probably it 
should be released during the calls to udc->driver->bind and 
udc->driver->unbind.

Getting this right will require some careful study.  Marek, if I send you 
a patch later, will you be able to test it?

Alan Stern
