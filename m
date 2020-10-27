Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7895B29CB80
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 22:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506017AbgJ0VvX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 17:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33057 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505991AbgJ0VvW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 17:51:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603835478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=KFZGGoSWWEhyza5tDauQ6Hysil1bK85fYmdC6bsumdg=;
        b=fmL7SCiR3y/FELNa5fJkZctOLz20WWEZLrtFdcqdCdRyHf3CyS+TaMSXApLeuUqeFN3/YM
        su8HDt2o89SX78ii0xn8WZhAOe0l23sop+Y+YFK17AILw6pWKjUiAgwwEjnXGqaSCUShOf
        VFoPQq3RClu0d6v4WsYUwI/Uk0SR9vE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-AaKAEXtXM7yG6gABU5OUxg-1; Tue, 27 Oct 2020 17:54:30 -0400
X-MC-Unique: AaKAEXtXM7yG6gABU5OUxg-1
Received: by mail-ed1-f69.google.com with SMTP id h6so1242643edt.12
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2020 14:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=KFZGGoSWWEhyza5tDauQ6Hysil1bK85fYmdC6bsumdg=;
        b=QHpp4lBoAj2+pfFrJzBsHcDg1sHQZGjQBc0zxI74qTsc+ZMBtJ5Ggm3FTmT5HoBqv/
         rqqF9iwwtCPwZSc6PhuupRjwW9tPlWYOuLuRtLjzU68QvW9FuoytRYG3jU0JgJngoXTB
         sPc3HU64f+9swgGO7cu1Vs//H7FHulTBYbemQqEIiJNkBtn5LjYol1X6Mjm2oCkGTdLQ
         sKBKrbPa8o2SGB85YlOBrDXkbx0O02mqlNI/A2dAVnKMsKTnulunUYIOeYRmdSTX13nK
         am86321OiJm3/ns8QA3C2Jr5qMvavwmGz5UiW7fmk/iHpaf4E6lPTdSUUpL5jVbnNjPt
         t6fA==
X-Gm-Message-State: AOAM530xMkT/80uobDi+xxjLWBaPg+hS2Ie9gm1cNZ71C0NgP8CLDkDU
        SNXEjcKsjIEkPlJl9vhoW+HdEufqB1sJ6XUHVaVsLy5gQ0QszSbxwbuFHmoDCM9kZRajTLeIthT
        wGQW+fed0DEKtvBvZ6x9s
X-Received: by 2002:a05:6402:a45:: with SMTP id bt5mr4593102edb.101.1603835473026;
        Tue, 27 Oct 2020 14:51:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR36hQl3QhQQbY2p9D8XlpOFS201NWeNPhm6IABbFBGMnR2aJSiHL3co64WXrCm+mZU6CkdQ==
X-Received: by 2002:a05:6402:a45:: with SMTP id bt5mr4593079edb.101.1603835472657;
        Tue, 27 Oct 2020 14:51:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id h8sm1643551eds.51.2020.10.27.14.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 14:51:12 -0700 (PDT)
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: New XHCI lockdep oops in 5.10-rc1
Message-ID: <01e273b8-beb9-ef8c-c2a4-925a11b07799@redhat.com>
Date:   Tue, 27 Oct 2020 22:51:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I standard run my local kernel builds with lockdep enabled, booting 5.10-rc1 with lockdep enabled results in:

[    3.339982] =====================================================
[    3.339984] WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
[    3.339987] 5.10.0-rc1pdx86+ #8 Not tainted
[    3.339988] -----------------------------------------------------
[    3.339991] systemd-udevd/386 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
[    3.339993] ffffffffb1a94038 (pin_fs_lock){+.+.}-{2:2}, at: simple_pin_fs+0x22/0xa0
[    3.339999] 
               and this task is already holding:
[    3.340002] ffff9e7b87fbc430 (&xhci->lock){-.-.}-{2:2}, at: xhci_alloc_streams+0x5f9/0x810
[    3.340008] which would create a new lock dependency:
[    3.340009]  (&xhci->lock){-.-.}-{2:2} -> (pin_fs_lock){+.+.}-{2:2}
[    3.340013] 
               but this new dependency connects a HARDIRQ-irq-safe lock:
[    3.340016]  (&xhci->lock){-.-.}-{2:2}
[    3.340017] 
               ... which became HARDIRQ-irq-safe at:
[    3.340022]   lock_acquire+0xb9/0x3d0
[    3.340025]   _raw_spin_lock_irqsave+0x48/0x60
[    3.340027]   xhci_irq+0x42/0x2160
[    3.340029]   __handle_irq_event_percpu+0xcd/0x2b0
[    3.340031]   handle_irq_event+0x45/0x90
[    3.340034]   handle_edge_irq+0x87/0x220
[    3.340036]   asm_call_irq_on_stack+0xf/0x20
[    3.340039]   common_interrupt+0xf2/0x1a0
[    3.340041]   asm_common_interrupt+0x1e/0x40
[    3.340044]   cpuidle_enter_state+0xfa/0x470
[    3.340045]   cpuidle_enter+0x29/0x40
[    3.340048]   do_idle+0x1e6/0x290
[    3.340050]   cpu_startup_entry+0x19/0x20
[    3.340053]   secondary_startup_64_no_verify+0xb8/0xbb
[    3.340055] 
               to a HARDIRQ-irq-unsafe lock:
[    3.340057]  (pin_fs_lock){+.+.}-{2:2}
[    3.340058] 
               ... which became HARDIRQ-irq-unsafe at:
[    3.340061] ...
[    3.340062]   lock_acquire+0xb9/0x3d0
[    3.340065]   _raw_spin_lock+0x2c/0x40
[    3.340067]   simple_pin_fs+0x22/0xa0
[    3.340070]   start_creating.part.0+0x3b/0x110
[    3.340072]   debugfs_create_dir+0x23/0x170
[    3.340076]   em_debug_init+0x13/0x1d
[    3.340078]   do_one_initcall+0x5b/0x2d0
[    3.340081]   kernel_init_freeable+0x25c/0x2a5
[    3.340083]   kernel_init+0xa/0x111
[    3.340085]   ret_from_fork+0x1f/0x30
[    3.340087] 
               other info that might help us debug this:

[    3.340090]  Possible interrupt unsafe locking scenario:

[    3.340092]        CPU0                    CPU1
[    3.340093]        ----                    ----
[    3.340095]   lock(pin_fs_lock);
[    3.340097]                                local_irq_disable();
[    3.340099]                                lock(&xhci->lock);
[    3.340101]                                lock(pin_fs_lock);
[    3.340104]   <Interrupt>
[    3.340105]     lock(&xhci->lock);
[    3.340107] 
                *** DEADLOCK ***

[    3.340109] 3 locks held by systemd-udevd/386:
[    3.340111]  #0: ffff9e7b8919ba18 (&dev->mutex){....}-{3:3}, at: device_driver_attach+0x9b/0xb0
[    3.340116]  #1: ffff9e7b8919e1a8 (&dev->mutex){....}-{3:3}, at: device_driver_attach+0x3b/0xb0
[    3.340121]  #2: ffff9e7b87fbc430 (&xhci->lock){-.-.}-{2:2}, at: xhci_alloc_streams+0x5f9/0x810
[    3.340125] 
               the dependencies between HARDIRQ-irq-safe lock and the holding lock:
[    3.340133] -> (&xhci->lock){-.-.}-{2:2} {
[    3.340136]    IN-HARDIRQ-W at:
[    3.340138]                     lock_acquire+0xb9/0x3d0
[    3.340140]                     _raw_spin_lock_irqsave+0x48/0x60
[    3.340142]                     xhci_irq+0x42/0x2160
[    3.340145]                     __handle_irq_event_percpu+0xcd/0x2b0
[    3.340148]                     handle_irq_event+0x45/0x90
[    3.340152]                     handle_edge_irq+0x87/0x220
[    3.340154]                     asm_call_irq_on_stack+0xf/0x20
[    3.340157]                     common_interrupt+0xf2/0x1a0
[    3.340159]                     asm_common_interrupt+0x1e/0x40
[    3.340161]                     cpuidle_enter_state+0xfa/0x470
[    3.340164]                     cpuidle_enter+0x29/0x40
[    3.340166]                     do_idle+0x1e6/0x290
[    3.340168]                     cpu_startup_entry+0x19/0x20
[    3.340171]                     secondary_startup_64_no_verify+0xb8/0xbb
[    3.340173]    IN-SOFTIRQ-W at:
[    3.340175]                     lock_acquire+0xb9/0x3d0
[    3.340177]                     _raw_spin_lock_irqsave+0x48/0x60
[    3.340180]                     xhci_hub_status_data+0xcb/0x360
[    3.340183]                     usb_hcd_poll_rh_status+0x4a/0x1b0
[    3.340186]                     call_timer_fn+0x94/0x260
[    3.340189]                     __run_timers.part.0+0x1c3/0x290
[    3.340192]                     run_timer_softirq+0x26/0x50
[    3.340194]                     __do_softirq+0xd5/0x485
[    3.340196]                     asm_call_irq_on_stack+0xf/0x20
[    3.340199]                     do_softirq_own_stack+0x5b/0x70
[    3.340202]                     __irq_exit_rcu+0xda/0x120
[    3.340205]                     irq_exit_rcu+0xa/0x20
[    3.340207]                     sysvec_apic_timer_interrupt+0x4b/0xa0
[    3.340209]                     asm_sysvec_apic_timer_interrupt+0x12/0x20
[    3.340212]                     cpuidle_enter_state+0xfa/0x470
[    3.340214]                     cpuidle_enter+0x29/0x40
[    3.340217]                     do_idle+0x1e6/0x290
[    3.340219]                     cpu_startup_entry+0x19/0x20
[    3.340221]                     secondary_startup_64_no_verify+0xb8/0xbb
[    3.340223]    INITIAL USE at:
[    3.340225]                    lock_acquire+0xb9/0x3d0
[    3.340227]                    _raw_spin_lock_irqsave+0x48/0x60
[    3.340230]                    xhci_dbc_init+0xa5/0x210
[    3.340233]                    xhci_run+0x374/0x570
[    3.340235]                    usb_add_hcd.cold+0x32c/0x739
[    3.340238]                    usb_hcd_pci_probe+0x211/0x3f0
[    3.340241]                    xhci_pci_probe+0x80/0x1e0
[    3.340244]                    local_pci_probe+0x42/0x80
[    3.340246]                    pci_device_probe+0xd9/0x190
[    3.340249]                    really_probe+0x205/0x460
[    3.340251]                    driver_probe_device+0xe1/0x150
[    3.340254]                    device_driver_attach+0xa8/0xb0
[    3.340256]                    __driver_attach+0x8c/0x150
[    3.340258]                    bus_for_each_dev+0x67/0x90
[    3.340261]                    bus_add_driver+0x12e/0x1f0
[    3.340263]                    driver_register+0x8b/0xe0
[    3.340265]                    do_one_initcall+0x5b/0x2d0
[    3.340268]                    kernel_init_freeable+0x25c/0x2a5
[    3.340270]                    kernel_init+0xa/0x111
[    3.340273]                    ret_from_fork+0x1f/0x30
[    3.340274]  }
[    3.340277]  ... key      at: [<ffffffffb308ef80>] __key.35+0x0/0x10
[    3.340279]  ... acquired at:
[    3.340280]    lock_acquire+0xb9/0x3d0
[    3.340282]    _raw_spin_lock+0x2c/0x40
[    3.340284]    simple_pin_fs+0x22/0xa0
[    3.340286]    start_creating.part.0+0x3b/0x110
[    3.340289]    __debugfs_create_file+0x4c/0x190
[    3.340292]    xhci_debugfs_create_stream_files+0x74/0xa0
[    3.340294]    xhci_alloc_streams+0x685/0x810
[    3.340296]    usb_alloc_streams+0x91/0xd0
[    3.340299]    uas_configure_endpoints+0x120/0x150 [uas]
[    3.340302]    uas_probe+0x443/0x563 [uas]
[    3.340304]    usb_probe_interface+0xe8/0x2a0
[    3.340307]    really_probe+0x358/0x460
[    3.340308]    driver_probe_device+0xe1/0x150
[    3.340310]    device_driver_attach+0xa8/0xb0
[    3.340312]    __driver_attach+0x8c/0x150
[    3.340314]    bus_for_each_dev+0x67/0x90
[    3.340316]    bus_add_driver+0x12e/0x1f0
[    3.340318]    driver_register+0x8b/0xe0
[    3.340320]    usb_register_driver+0xaf/0x150
[    3.340322]    uas_init+0x46/0x1000 [uas]
[    3.340324]    do_one_initcall+0x5b/0x2d0
[    3.340327]    do_init_module+0x5c/0x260
[    3.340329]    __do_sys_finit_module+0x98/0xe0
[    3.340331]    do_syscall_64+0x33/0x40
[    3.340333]    entry_SYSCALL_64_after_hwframe+0x44/0xa9

[    3.340336] 
               the dependencies between the lock to be acquired
[    3.340336]  and HARDIRQ-irq-unsafe lock:
[    3.340342] -> (pin_fs_lock){+.+.}-{2:2} {
[    3.340345]    HARDIRQ-ON-W at:
[    3.340347]                     lock_acquire+0xb9/0x3d0
[    3.340349]                     _raw_spin_lock+0x2c/0x40
[    3.340351]                     simple_pin_fs+0x22/0xa0
[    3.340353]                     start_creating.part.0+0x3b/0x110
[    3.340356]                     debugfs_create_dir+0x23/0x170
[    3.340358]                     em_debug_init+0x13/0x1d
[    3.340361]                     do_one_initcall+0x5b/0x2d0
[    3.340363]                     kernel_init_freeable+0x25c/0x2a5
[    3.340366]                     kernel_init+0xa/0x111
[    3.340368]                     ret_from_fork+0x1f/0x30
[    3.340370]    SOFTIRQ-ON-W at:
[    3.340372]                     lock_acquire+0xb9/0x3d0
[    3.340374]                     _raw_spin_lock+0x2c/0x40
[    3.340376]                     simple_pin_fs+0x22/0xa0
[    3.340378]                     start_creating.part.0+0x3b/0x110
[    3.340381]                     debugfs_create_dir+0x23/0x170
[    3.340383]                     em_debug_init+0x13/0x1d
[    3.340386]                     do_one_initcall+0x5b/0x2d0
[    3.340388]                     kernel_init_freeable+0x25c/0x2a5
[    3.340390]                     kernel_init+0xa/0x111
[    3.340393]                     ret_from_fork+0x1f/0x30
[    3.340395]    INITIAL USE at:
[    3.340396]                    lock_acquire+0xb9/0x3d0
[    3.340399]                    _raw_spin_lock+0x2c/0x40
[    3.340401]                    simple_pin_fs+0x22/0xa0
[    3.340403]                    start_creating.part.0+0x3b/0x110
[    3.340405]                    debugfs_create_dir+0x23/0x170
[    3.340408]                    em_debug_init+0x13/0x1d
[    3.340410]                    do_one_initcall+0x5b/0x2d0
[    3.340412]                    kernel_init_freeable+0x25c/0x2a5
[    3.340415]                    kernel_init+0xa/0x111
[    3.340417]                    ret_from_fork+0x1f/0x30
[    3.340419]  }
[    3.340422]  ... key      at: [<ffffffffb1a94038>] pin_fs_lock+0x18/0x40
[    3.340424]  ... acquired at:
[    3.340425]    lock_acquire+0xb9/0x3d0
[    3.340427]    _raw_spin_lock+0x2c/0x40
[    3.340429]    simple_pin_fs+0x22/0xa0
[    3.340431]    start_creating.part.0+0x3b/0x110
[    3.340433]    __debugfs_create_file+0x4c/0x190
[    3.340435]    xhci_debugfs_create_stream_files+0x74/0xa0
[    3.340438]    xhci_alloc_streams+0x685/0x810
[    3.340440]    usb_alloc_streams+0x91/0xd0
[    3.340442]    uas_configure_endpoints+0x120/0x150 [uas]
[    3.340445]    uas_probe+0x443/0x563 [uas]
[    3.340447]    usb_probe_interface+0xe8/0x2a0
[    3.340449]    really_probe+0x358/0x460
[    3.340451]    driver_probe_device+0xe1/0x150
[    3.340452]    device_driver_attach+0xa8/0xb0
[    3.340454]    __driver_attach+0x8c/0x150
[    3.340456]    bus_for_each_dev+0x67/0x90
[    3.340458]    bus_add_driver+0x12e/0x1f0
[    3.340460]    driver_register+0x8b/0xe0
[    3.340462]    usb_register_driver+0xaf/0x150
[    3.340464]    uas_init+0x46/0x1000 [uas]
[    3.340466]    do_one_initcall+0x5b/0x2d0
[    3.340468]    do_init_module+0x5c/0x260
[    3.340470]    __do_sys_finit_module+0x98/0xe0
[    3.340473]    do_syscall_64+0x33/0x40
[    3.340474]    entry_SYSCALL_64_after_hwframe+0x44/0xa9

[    3.340477] 
               stack backtrace:
[    3.340479] CPU: 4 PID: 386 Comm: systemd-udevd Not tainted 5.10.0-rc1pdx86+ #8
[    3.340482] Hardware name: LENOVO 20U90SIT19/20U90SIT19, BIOS N2WET23W (1.13 ) 09/22/2020
[    3.340485] Call Trace:
[    3.340488]  dump_stack+0x8b/0xb0
[    3.340491]  check_irq_usage.cold+0x256/0x260
[    3.340494]  ? check_noncircular+0x65/0xf0
[    3.340497]  __lock_acquire+0x117d/0x2150
[    3.340500]  lock_acquire+0xb9/0x3d0
[    3.340502]  ? simple_pin_fs+0x22/0xa0
[    3.340505]  _raw_spin_lock+0x2c/0x40
[    3.340507]  ? simple_pin_fs+0x22/0xa0
[    3.340509]  simple_pin_fs+0x22/0xa0
[    3.340511]  start_creating.part.0+0x3b/0x110
[    3.340513]  __debugfs_create_file+0x4c/0x190
[    3.340516]  xhci_debugfs_create_stream_files+0x74/0xa0
[    3.340518]  xhci_alloc_streams+0x685/0x810
[    3.340522]  usb_alloc_streams+0x91/0xd0
[    3.340524]  uas_configure_endpoints+0x120/0x150 [uas]
[    3.340527]  uas_probe+0x443/0x563 [uas]
[    3.340530]  usb_probe_interface+0xe8/0x2a0
[    3.340533]  really_probe+0x358/0x460
[    3.340535]  driver_probe_device+0xe1/0x150
[    3.340537]  device_driver_attach+0xa8/0xb0
[    3.340540]  __driver_attach+0x8c/0x150
[    3.340541]  ? device_driver_attach+0xb0/0xb0
[    3.340543]  ? device_driver_attach+0xb0/0xb0
[    3.340546]  bus_for_each_dev+0x67/0x90
[    3.340548]  bus_add_driver+0x12e/0x1f0
[    3.340550]  driver_register+0x8b/0xe0
[    3.340552]  usb_register_driver+0xaf/0x150
[    3.340555]  ? 0xffffffffc03f0000
[    3.340557]  uas_init+0x46/0x1000 [uas]
[    3.340559]  do_one_initcall+0x5b/0x2d0
[    3.340562]  ? rcu_read_lock_sched_held+0x3f/0x80
[    3.340565]  ? kmem_cache_alloc_trace+0x2b9/0x2e0
[    3.340568]  do_init_module+0x5c/0x260
[    3.340570]  __do_sys_finit_module+0x98/0xe0
[    3.340574]  do_syscall_64+0x33/0x40
[    3.340575]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    3.340578] RIP: 0033:0x7feb1764b50d
[    3.340580] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 89 0c 00 f7 d8 64 89 01 48
[    3.340585] RSP: 002b:00007ffe89064ac8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.340589] RAX: ffffffffffffffda RBX: 0000560779ad6e90 RCX: 00007feb1764b50d
[    3.340591] RDX: 0000000000000000 RSI: 00007feb1778735a RDI: 000000000000000d
[    3.340593] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000560779ad8260
[    3.340596] R10: 000000000000000d R11: 0000000000000246 R12: 00007feb1778735a
[    3.340598] R13: 0000560779ad8b60 R14: 0000000000000007 R15: 0000560779ad8d80
[    3.340608] INFO: lockdep is turned off.
[    3.340609] irq event stamp: 13332
[    3.340611] hardirqs last  enabled at (13331): [<ffffffffb0cd7544>] _raw_spin_unlock_irq+0x24/0x40
[    3.340614] hardirqs last disabled at (13332): [<ffffffffb0cd777d>] _raw_spin_lock_irqsave+0x5d/0x60
[    3.340617] softirqs last  enabled at (12526): [<ffffffffb0e0110f>] asm_call_irq_on_stack+0xf/0x20
[    3.340620] softirqs last disabled at (12519): [<ffffffffb0e0110f>] asm_call_irq_on_stack+0xf/0x20
[    3.340624] CPU: 4 PID: 386 Comm: systemd-udevd Not tainted 5.10.0-rc1pdx86+ #8
[    3.340626] Hardware name: LENOVO 20U90SIT19/20U90SIT19, BIOS N2WET23W (1.13 ) 09/22/2020
[    3.340628] Call Trace:
[    3.340630]  dump_stack+0x8b/0xb0
[    3.340632]  ___might_sleep.cold+0xb6/0xc6
[    3.340635]  down_write+0x1c/0x70
[    3.340637]  start_creating.part.0+0x5c/0x110
[    3.340640]  __debugfs_create_file+0x4c/0x190
[    3.340642]  xhci_debugfs_create_stream_files+0x74/0xa0
[    3.340645]  xhci_alloc_streams+0x685/0x810
[    3.340648]  usb_alloc_streams+0x91/0xd0
[    3.340651]  uas_configure_endpoints+0x120/0x150 [uas]
[    3.340654]  uas_probe+0x443/0x563 [uas]
[    3.340657]  usb_probe_interface+0xe8/0x2a0
[    3.340659]  really_probe+0x358/0x460
[    3.340662]  driver_probe_device+0xe1/0x150
[    3.340664]  device_driver_attach+0xa8/0xb0
[    3.340666]  __driver_attach+0x8c/0x150
[    3.340668]  ? device_driver_attach+0xb0/0xb0
[    3.340669]  ? device_driver_attach+0xb0/0xb0
[    3.340672]  bus_for_each_dev+0x67/0x90
[    3.340674]  bus_add_driver+0x12e/0x1f0
[    3.340676]  driver_register+0x8b/0xe0
[    3.340678]  usb_register_driver+0xaf/0x150
[    3.340680]  ? 0xffffffffc03f0000
[    3.340682]  uas_init+0x46/0x1000 [uas]
[    3.340685]  do_one_initcall+0x5b/0x2d0
[    3.340687]  ? rcu_read_lock_sched_held+0x3f/0x80
[    3.340689]  ? kmem_cache_alloc_trace+0x2b9/0x2e0
[    3.340692]  do_init_module+0x5c/0x260
[    3.340694]  __do_sys_finit_module+0x98/0xe0
[    3.340698]  do_syscall_64+0x33/0x40
[    3.340700]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    3.340702] RIP: 0033:0x7feb1764b50d
[    3.340704] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 3b 89 0c 00 f7 d8 64 89 01 48
[    3.340709] RSP: 002b:00007ffe89064ac8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.340711] RAX: ffffffffffffffda RBX: 0000560779ad6e90 RCX: 00007feb1764b50d
[    3.340714] RDX: 0000000000000000 RSI: 00007feb1778735a RDI: 000000000000000d
[    3.340716] RBP: 0000000000020000 R08: 0000000000000000 R09: 0000560779ad8260
[    3.340718] R10: 000000000000000d R11: 0000000000000246 R12: 00007feb1778735a
[    3.340720] R13: 0000560779ad8b60 R14: 0000000000000007 R15: 0000560779ad8d80


This is on a Lenovo Thinkpad X1 carbon 8th gen, connected to a 2nd gen Lenovo thunderbolt dock.

Regards,

Hans

