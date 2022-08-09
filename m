Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A20758D3C4
	for <lists+linux-usb@lfdr.de>; Tue,  9 Aug 2022 08:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbiHIG3j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Aug 2022 02:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235179AbiHIG3i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Aug 2022 02:29:38 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444C320192
        for <linux-usb@vger.kernel.org>; Mon,  8 Aug 2022 23:29:36 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20220809062933euoutp0173cef04f49f4e21c8468f19d51b27630~JmV_c0lZT2922129221euoutp01Q
        for <linux-usb@vger.kernel.org>; Tue,  9 Aug 2022 06:29:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20220809062933euoutp0173cef04f49f4e21c8468f19d51b27630~JmV_c0lZT2922129221euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1660026573;
        bh=Gqefb9vsBrE3uqT1vhqRRLEg1hVJfNq9zdDTLWkpeF0=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=bsfk16124ybfwIWh2+HWYHl2sYT/vHEdzqVF9+vKO0x17bqJmfft4AIzkF8dulW2L
         FAsHoDv62oLDsF4oR2q4a826pX5vYa4/pigjlQ5kdUYRio/KU8EqvPBm0XuuZZvBUV
         xAd0MsdOmqsy5ifUuP2rjUqU16tA1zjR/+6kO6SM=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220809062933eucas1p2c52bf800b5a7373bb45243557c5fdd63~JmV_V1sUh2316423164eucas1p2R;
        Tue,  9 Aug 2022 06:29:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 43.4A.10067.DCEF1F26; Tue,  9
        Aug 2022 07:29:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220809062933eucas1p2955ac74ee0cc8ee5fb5ff7a504cd4ee0~JmV957lEg1820218202eucas1p2y;
        Tue,  9 Aug 2022 06:29:33 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220809062932eusmtrp266076a9e42b47ebc0f685efbfd0e1b0c~JmV95Ln6Y0745507455eusmtrp2O;
        Tue,  9 Aug 2022 06:29:32 +0000 (GMT)
X-AuditID: cbfec7f4-dc1ff70000002753-2e-62f1fecde774
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id EC.C7.09095.CCEF1F26; Tue,  9
        Aug 2022 07:29:32 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220809062932eusmtip21b8736478179987f913f6970f3c23456~JmV9enFH_2026920269eusmtip2U;
        Tue,  9 Aug 2022 06:29:32 +0000 (GMT)
Message-ID: <85e108c7-c5e0-8ff2-730f-eaf82a428955@samsung.com>
Date:   Tue, 9 Aug 2022 08:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in
 usb_udc_uevent()
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djP87pn/31MMmh4IGlxrO0Ju0Xz4vVs
        FouWtTJbHO89wGQx4fcFNosbW+YyO7B57Jl4ks1j8wotj02rOtk89s9dw+4x++4PRo/Pm+QC
        2KK4bFJSczLLUov07RK4Mm7fbmEpeGJT8fL2F5YGxn6TLkZODgkBE4mPH3pZuhi5OIQEVjBK
        TDpxjR0kISTwhVFi8g1ziMRnRom93VeZYDqarvQwQiSWM0q8nvGeHcL5yCjx82UvM0gVr4Cd
        xJ7WqawgNouAisSa7xOYIOKCEidnPmEBsUUFkiWe/V8M1MzBISzgL3FtdgpImFlAXOLWk/lg
        5SICWhKbm14yg8xnFjjMKLFly0ywBJuAoUTX2y42EJtTwFhi2ZvpTBDN8hLNW2eDNUgI3OCQ
        eLaskw3ibBeJlyv3Q70gLPHq+BZ2CFtG4v9OkG0cQHa+xN8ZxhDhColrr9cwQ9jWEnfO/WID
        KWEW0JRYv0sfIuwo0bUA4nwJAT6JG28FIS7gk5i0bTozRJhXoqNNCKJaTWLW8XVwOw9euMQ8
        gVFpFlKYzELy/Cwkv8xC2LuAkWUVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYPI5/e/4
        lx2My1991DvEyMTBeIhRgoNZSYT3yNr3SUK8KYmVValF+fFFpTmpxYcYpTlYlMR5kzM3JAoJ
        pCeWpGanphakFsFkmTg4pRqYtCeb2Od0bAj0+Rd/7a+O8efg9ecPpF5dxqZYtCBE/jHPTnb9
        BweTMl3b17SGl2y2PRXL+Y7T+JvP3rwNedI1q1xtprzaMefEKyaX4t2NzN+PK4VdXTRdgmvi
        25+zk3w0ruv8fzJfrGwdm7fJumcfG2dbror5wFPfe7FE20nHKsFabqKt57Sq2I7LbHNf1H9b
        GtVcPSl0RqJbseQqrrhfG5f+55i5ZeOFf9s32b4NNS3ef9p8XtGXD3M+1Vnkz5tlFMU25YCW
        hPPuaYmv/a4YtYWvLP7W+789s+xpqUNgrP/3gpeLd263sBQ76zH7zFrtK5HbQx+oe/V723Is
        E/j8ydT0Ne9Zhxah8k2e3x6GK7EUZyQaajEXFScCAFrNW2GtAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7pn/n1MMtj529ziWNsTdovmxevZ
        LBYta2W2ON57gMliwu8LbBY3tsxldmDz2DPxJJvH5hVaHptWdbJ57J+7ht1j9t0fjB6fN8kF
        sEXp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZdy+
        3cJS8MSm4uXtLywNjP0mXYycHBICJhJNV3oYuxi5OIQEljJKTO46ww6RkJE4Oa2BFcIWlvhz
        rYsNoug9o8TWXzOZQRK8AnYSe1qnghWxCKhIrPk+gQkiLihxcuYTFhBbVCBZYsGhpWC2sICv
        xJxt/WC9zALiEreezAerFxHQktjc9JIZZAGzwGFGiQ0rj7FAbNvJJNG0dh5YFZuAoUTXW5Az
        ODk4BYwllr2ZzgQxyUyia2sXI4QtL9G8dTbzBEahWUgOmYVk4SwkLbOQtCxgZFnFKJJaWpyb
        nltsqFecmFtcmpeul5yfu4kRGHfbjv3cvINx3quPeocYmTgYDzFKcDArifAeWfs+SYg3JbGy
        KrUoP76oNCe1+BCjKTA0JjJLiSbnAyM/ryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7
        NbUgtQimj4mDU6qBKSvQU61e1YRpmgr7yiqHkPXdMk6S80/vkrZZsWxzyFfvXOG7O7ytGo8U
        7j9reWDFU42cz5GxXYxy7NtFZ3xS7EleWNbi7LP63O/yunlFM/jqeKceOSTqIyiWP1cqpTN2
        2xU/1w1nVi7MNom3jfx31+Uhy/87NYc+xacZaC/0+u7vOP9SoXrqpGcSsvop8k4psVcUePLZ
        XLxf/Ltg4L1I8u8tP9dkHbuOo7uXL0pLq+RbH/Tr0nmjDafe1/BJF+rU2LMuWLG8iFNZSZbb
        obZn6vEwfWZ34Yr2q618fZONe27JMBde6iubcq9t49+9CbXtD8RMTOsN9pRVM2qtEs7gfbnn
        7sLOUmGenrCS10osxRmJhlrMRcWJADiJ4UpEAwAA
X-CMS-MailID: 20220809062933eucas1p2955ac74ee0cc8ee5fb5ff7a504cd4ee0
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
        <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
        <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
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

On 08.08.2022 22:26, Alan Stern wrote:
> On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
>> This patch landed recently in linux-next as commit 2191c00855b0 ("USB:
>> gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it
>> fixes the issue by introducing another one. It doesn't look very
>> probable, but it would be nice to fix it to make the lock dependency
>> checker happy.
> Indeed.
>
>> ======================================================
>> WARNING: possible circular locking dependency detected
>> 5.19.0-rc7+ #12510 Not tainted
>> ------------------------------------------------------
>> udevadm/312 is trying to acquire lock:
>> ffff80000aae1058 (udc_lock){+.+.}-{3:3}, at: usb_udc_uevent+0x54/0xe0
>>
>> but task is already holding lock:
>> ffff000002277548 (kn->active#4){++++}-{0:0}, at: kernfs_seq_start+0x34/0xe0
>>
>> which lock already depends on the new lock.
>>
>>
>> the existing dependency chain (in reverse order) is:
>>
>> -> #3 (kn->active#4){++++}-{0:0}:
>>          lock_acquire+0x68/0x84
>>          __kernfs_remove+0x268/0x380
>>          kernfs_remove_by_name_ns+0x58/0xac
>>          sysfs_remove_file_ns+0x18/0x24
>>          device_del+0x15c/0x440
>>          device_link_drop_managed+0xa8/0xe0
>>          device_links_driver_bound+0x1b8/0x230
>>          driver_bound+0x68/0xc0
>>          really_probe.part.0+0x1f8/0x2ac
>>          __driver_probe_device+0x98/0x144
>>          driver_probe_device+0xac/0x14c
>>          __driver_attach+0x104/0x1b0
>>          bus_for_each_dev+0x70/0xd0
>>          driver_attach+0x24/0x30
>>          bus_add_driver+0x154/0x204
>>          driver_register+0x78/0x130
>>          __platform_driver_register+0x28/0x34
>>          simple_pm_bus_driver_init+0x1c/0x28
>>          do_one_initcall+0x74/0x400
>>          kernel_init_freeable+0x2f4/0x37c
>>          kernel_init+0x28/0x130
>>          ret_from_fork+0x10/0x20
>>
>> -> #2 (device_links_lock){+.+.}-{3:3}:
>>          lock_acquire+0x68/0x84
>>          __mutex_lock+0x9c/0x430
>>          mutex_lock_nested+0x38/0x64
>>          device_link_remove+0x3c/0xa0
>>          _regulator_put.part.0+0x168/0x190
>>          regulator_put+0x3c/0x54
>>          devm_regulator_release+0x14/0x20
>>          release_nodes+0x5c/0x90
>>          devres_release_all+0x8c/0xe0
>>          device_unbind_cleanup+0x18/0x70
>>          really_probe.part.0+0x174/0x2ac
>>          __driver_probe_device+0x98/0x144
>>          driver_probe_device+0xac/0x14c
>>          __device_attach_driver+0xb8/0x120
>>          bus_for_each_drv+0x78/0xd0
>>          __device_attach_async_helper+0xb0/0xd4
>>          async_run_entry_fn+0x34/0xd0
>>          process_one_work+0x288/0x6bc
>>          worker_thread+0x74/0x450
>>          kthread+0x118/0x11c
>>          ret_from_fork+0x10/0x20
>>
>> -> #1 (regulator_list_mutex){+.+.}-{3:3}:
>>          lock_acquire+0x68/0x84
>>          __mutex_lock+0x9c/0x430
>>          mutex_lock_nested+0x38/0x64
>>          regulator_lock_dependent+0x54/0x284
>>          regulator_enable+0x34/0x80
>>          phy_power_on+0x24/0x130
>>          __dwc2_lowlevel_hw_enable+0x100/0x130
>>          dwc2_lowlevel_hw_enable+0x18/0x40
>>          dwc2_hsotg_udc_start+0x6c/0x2f0
>>          gadget_bind_driver+0x124/0x1f4
>>          really_probe.part.0+0x9c/0x2ac
>>          __driver_probe_device+0x98/0x144
>>          driver_probe_device+0xac/0x14c
>>          __device_attach_driver+0xb8/0x120
>>          bus_for_each_drv+0x78/0xd0
>>          __device_attach+0xa8/0x1c0
>>          device_initial_probe+0x14/0x20
>>          bus_probe_device+0x9c/0xa4
>>          device_add+0x3a0/0x890
>>          usb_add_gadget+0x170/0x200
>>          usb_add_gadget_udc+0x94/0xd4
>>          dwc2_driver_probe+0x580/0x78c
>>          platform_probe+0x68/0xe0
>>          really_probe.part.0+0x9c/0x2ac
>>          __driver_probe_device+0x98/0x144
>>          driver_probe_device+0xac/0x14c
>>          __device_attach_driver+0xb8/0x120
>>          bus_for_each_drv+0x78/0xd0
>>          __device_attach+0xa8/0x1c0
>>          device_initial_probe+0x14/0x20
>>          bus_probe_device+0x9c/0xa4
>>          device_add+0x3a0/0x890
>>          of_device_add+0x48/0x6c
>>          of_platform_device_create_pdata+0x98/0x100
>>          of_platform_bus_create+0x17c/0x37c
>>          of_platform_populate+0x58/0xec
>>          dwc3_meson_g12a_probe+0x314/0x5d0
>>          platform_probe+0x68/0xe0
>>          really_probe.part.0+0x9c/0x2ac
>>          __driver_probe_device+0x98/0x144
>>          driver_probe_device+0xac/0x14c
>>          __device_attach_driver+0xb8/0x120
>>          bus_for_each_drv+0x78/0xd0
>>          __device_attach+0xa8/0x1c0
>>          device_initial_probe+0x14/0x20
>>          bus_probe_device+0x9c/0xa4
>>          deferred_probe_work_func+0x88/0xc4
>>          process_one_work+0x288/0x6bc
>>          worker_thread+0x74/0x450
>>          kthread+0x118/0x11c
>>          ret_from_fork+0x10/0x20
>>
>> -> #0 (udc_lock){+.+.}-{3:3}:
>>          __lock_acquire+0x1298/0x20cc
>>          lock_acquire.part.0+0xe0/0x230
>>          lock_acquire+0x68/0x84
>>          __mutex_lock+0x9c/0x430
>>          mutex_lock_nested+0x38/0x64
>>          usb_udc_uevent+0x54/0xe0
>>          dev_uevent+0xb8/0x1ec
>>          uevent_show+0x8c/0x114
>>          dev_attr_show+0x20/0x60
>>          sysfs_kf_seq_show+0xa8/0x120
>>          kernfs_seq_show+0x2c/0x40
>>          seq_read_iter+0x1bc/0x4b0
>>          kernfs_fop_read_iter+0x140/0x1d0
>>          new_sync_read+0xd4/0x150
>>          vfs_read+0x190/0x1dc
>>          ksys_read+0x68/0xfc
>>          __arm64_sys_read+0x20/0x30
>>          invoke_syscall+0x48/0x114
>>          el0_svc_common.constprop.0+0x60/0x11c
>>          do_el0_svc_compat+0x1c/0x50
>>          el0_svc_compat+0x58/0x100
>>          el0t_32_sync_handler+0x90/0x140
>>          el0t_32_sync+0x190/0x194
>>
>> other info that might help us debug this:
>>
>> Chain exists of:
>>     udc_lock --> device_links_lock --> kn->active#4
> Peter, shouldn't this say:
>
>     udc_lock --> regulator_list_mutex --> device_links_lock --> kn->active#4
>
> ?  Is that a bug in the lockdep reporting?
>
> It looks like this is a bad interaction between the udc_lock and the
> sysfs/kernfs locking.  If a lock such as udc_lock is held (or is part of
> a chain) while a sysfs file is removed, the file's ->show or ->store
> routine better not acquire that lock.
>
> I suspect the problem is that udc_lock is held for too long.  Probably it
> should be released during the calls to udc->driver->bind and
> udc->driver->unbind.
>
> Getting this right will require some careful study.  Marek, if I send you
> a patch later, will you be able to test it?

Yes, sure. I'm available till 12th August, then I'm going for holidays.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

