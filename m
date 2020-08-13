Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8928243ED4
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 20:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHMS2D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 14:28:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:38354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgHMS2D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 14:28:03 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E89B206B2;
        Thu, 13 Aug 2020 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597343281;
        bh=uOu7//ehZakc2RigY5U2Yed0l3F/drZt9FxAmK/p6rM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UnTl90aCccqDwDCYx0fsKNUOX1nILL2GCPc262n+w1pa+il8PC/SpXTk2xlMlh8ac
         HXs2YHc6KUaSUqTJFX+tYDaFMKHtOuTQnRn6QI1WUrw0XubXhdk3R0WHbr1ofl/ZUx
         28uCvh6h4xqDA1R3K3q2WESW1diJFvFBkEx96iSc=
Date:   Thu, 13 Aug 2020 20:28:11 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Garry <john.garry@huawei.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
Message-ID: <20200813182811.GA4035999@kroah.com>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 13, 2020 at 04:29:07PM +0100, John Garry wrote:
> Hi,
> 
> I see this on today's linux-next with notably KASAN and
> DEBUG_TEST_DRIVER_REMOVE enabled:
> 
> [58.045441] hub 6-0:1.0: 1 port detected
> [58.050894] xhci_hcd 0000:7a:02.0: remove, state 1
> [58.055698] usb usb6: USB disconnect, device number 1
> [58.063151] xhci_hcd 0000:7a:02.0: USB bus 6 deregistered
> [58.068598] xhci_hcd 0000:7a:02.0: remove, state 1
> [58.073396] usb usb5: USB disconnect, device number 1
> [58.082040] xhci_hcd 0000:7a:02.0: USB bus 5 deregistered
> [58.088446]
> ==================================================================
> [58.095667] BUG: KASAN: use-after-free in usb_hcd_pci_remove+0xbc/0x168
> [58.102272] Read of size 8 at addr ffff002a0b6e8120 by task swapper/0/1
> [58.108875]
> [58.110361] CPU: 2 PID: 1 Comm: swapper/0 Tainted: G
> W5.8.0-next-20200813-dirty #31
> [58.119396] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI RC0 -
> V1.16.01 03/15/2019
> [58.127910] Call trace:
> [58.130351]  dump_backtrace+0x0/0x2d0
> [58.134005]  show_stack+0x18/0x28
> [58.137313]  dump_stack+0xf4/0x168
> [58.140709]  print_address_description.constprop.12+0x6c/0x4ec
> [58.146532]  kasan_report+0x130/0x200
> [58.150186]  __asan_load8+0x9c/0xd8
> [58.153666]  usb_hcd_pci_remove+0xbc/0x168
> [58.157755]  xhci_pci_remove+0xb8/0x108
> [58.161583]  pci_device_remove+0x6c/0x138
> [58.165586]  really_probe+0x22c/0x640
> [58.169240]  driver_probe_device+0x78/0xe8
> [58.173328]  device_driver_attach+0x9c/0xa8
> [58.177504]  __driver_attach+0x74/0x120
> [58.181331]  bus_for_each_dev+0xec/0x160
> [58.185245]  driver_attach+0x34/0x48
> [58.188812]  bus_add_driver+0x1b8/0x2c0
> [58.192639]  driver_register+0xc0/0x1e0
> [58.196467]  __pci_register_driver+0xb4/0xd0
> [58.200729]  xhci_pci_init+0x60/0x70
> [58.204297]  do_one_initcall+0xd4/0x264
> [58.208125]  kernel_init_freeable+0x270/0x2d8
> [58.212475]  kernel_init+0x14/0x124
> [58.215955]  ret_from_fork+0x10/0x34
> [58.216996] hub 1-1:1.0: USB hub found
> [58.219519]
> [58.219523] Allocated by task 13:
> [58.219528]  kasan_save_stack+0x28/0x58
> [58.219538]  __kasan_kmalloc.isra.6+0xcc/0xf0
> [58.236219]  kasan_kmalloc+0x10/0x20
> [58.239786]  __kmalloc+0x194/0x290
> [58.243181]  __usb_create_hcd+0x48/0x3a8
> [58.247095]  usb_create_hcd+0x1c/0x28
> [58.250748]  usb_hcd_pci_probe+0xa0/0x548
> [58.254749]  xhci_pci_probe+0x54/0x360
> [58.258488]  local_pci_probe+0x78/0xf8
> [58.262230]  work_for_cpu_fn+0x30/0x50
> [58.265971]  process_one_work+0x424/0x698
> [58.269972]  worker_thread+0x438/0x6d0
> [58.273713]  kthread+0x224/0x230
> [58.276933]  ret_from_fork+0x10/0x34
> [58.280497]
> [58.281978] Freed by task 1:
> [58.284851]  kasan_save_stack+0x28/0x58
> [58.288677]  kasan_set_track+0x28/0x40
> [58.292418]  kasan_set_free_info+0x24/0x48
> [58.296505]  __kasan_slab_free+0x104/0x188
> [58.300593]  kasan_slab_free+0x14/0x20
> [58.304333]  slab_free_freelist_hook+0x8c/0x190
> [58.308855]  kfree+0x2cc/0x400
> [58.311901]  usb_put_hcd+0xc0/0x110
> [58.315381]  usb_hcd_pci_remove+0xb4/0x168
> [58.317397] hub 1-1:1.0: 4 ports detected
> [58.319468]  xhci_pci_remove+0xb8/0x108
> [58.319473]  pci_device_remove+0x6c/0x138
> [58.319480]  really_probe+0x22c/0x640
> [58.334943]  driver_probe_device+0x78/0xe8
> [58.339031]  device_driver_attach+0x9c/0xa8
> [58.343205]  __driver_attach+0x74/0x120
> [58.347033]  bus_for_each_dev+0xec/0x160
> [58.350947]  driver_attach+0x34/0x48
> [58.354513]  bus_add_driver+0x1b8/0x2c0
> [58.358340]  driver_register+0xc0/0x1e0
> [58.362168]  __pci_register_driver+0xb4/0xd0
> [58.366429]  xhci_pci_init+0x60/0x70
> [58.369995]  do_one_initcall+0xd4/0x264
> [58.373823]  kernel_init_freeable+0x270/0x2d8
> [58.378171]  kernel_init+0x14/0x124
> [58.381651]  ret_from_fork+0x10/0x34
> [58.385215]
> [58.386699] The buggy address belongs to the object at ffff002a0b6e8000
> [58.386699]  which belongs to the cache kmalloc-8k of size 8192
> [58.399207] The buggy address is located 288 bytes inside of
> [58.399207]  8192-byte region [ffff002a0b6e8000, ffff002a0b6ea000)
> [58.411019] The buggy address belongs to the page:
> [58.415803] page:0000000060c9fcec refcount:1 mapcount:0
> mapping:0000000000000000 index:0x0 pfn:0x2a0b6e8
> [58.425272] head:0000000060c9fcec order:3 compound_mapcount:0
> compound_pincount:0
> [58.432746] flags: 0x2ffff00000010200(slab|head)
> [58.437357] raw: 2ffff00000010200 dead000000000100 dead000000000122
> ffff002a53c0f300
> [58.445092] raw: 0000000000000000 0000000080020002 00000001ffffffff
> 0000000000000000
> [58.452824] page dumped because: kasan: bad access detected
> [58.458385]
> [58.459867] Memory state around the buggy address:
> [58.464649]  ffff002a0b6e8000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> fb
> [58.471862]  ffff002a0b6e8080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> fb
> [58.479074] >ffff002a0b6e8100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> fb
> [58.486284]  ^
> [58.490545]  ffff002a0b6e8180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> fb
> [58.497758]  ffff002a0b6e8200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> fb
> [58.504968]
> ==================================================================
> [58.512179] Disabling lock debugging due to kernel taint
> [58.519143] xhci_hcd 0000:7a:02.0: xHCI Host Controller
> [58.524428] xhci_hcd 0000:7a:02.0: new USB bus registered, assigned bus
> number 5
> [58.532155] xhci_hcd 0000:7a:02.0: hcc params 0x0220f66d hci version 0x100
> quirks 0x0000000000000010
> [58.545434] hub 5-0:1.0: USB hub found
> [58.549366] hub 5-0:1.0: 1 port detected
> [58.554496] hub 5-0:1.0: USB hub found
> [58.558406] hub 5-0:1.0: 1 port detected
> [58.565161] hub 5-0:1.0: USB hub found
> [58.569080] hub 5-0:1.0: 1 port detected
> [58.574234] hub 5-0:1.0: USB hub found
> [58.578419] hub 5-0:1.0: 1 port detected
> [58.583849] xhci_hcd 0000:7a:02.0: xHCI Host Controller
> [58.589112] xhci_hcd 0000:7a:02.0: new USB bus registered, assigned bus
> number 6
> [58.596755] xhci_hcd 0000:7a:02.0: Host supports USB 3.0 SuperSpeed
> [58.603283] usb usb6: We don't know the algorithms for LPM for this host,
> disabling LPM.
> [58.614147] hub 6-0:1.0: USB hub found
> [58.618068] hub 6-0:1.0: 1 port detected
> [58.623291] hub 6-0:1.0: USB hub found
> [58.627197] hub 6-0:1.0: 1 port detected
> [58.633993] hub 6-0:1.0: USB hub found
> [58.638412] hub 6-0:1.0: 1 port detected
> [58.643593] hub 6-0:1.0: USB hub found
> [58.647537] hub 6-0:1.0: 1 port detected
> [58.654020] xhci_hcd 0000:ba:02.0: xHCI Host Controller
> [58.659323] xhci_hcd 0000:ba:02.0: new USB bus registered, assigned bus
> number 7
> [58.667086] xhci_hcd 0000:ba:02.0: hcc params 0x0220f66d hci version 0x100
> quirks 0x0000000000000010
> [58.680638] hub 7-0:1.0: USB hub found
> [58.684572] hub 7-0:1.0: 1 port detected
> [58.689782] hub 7-0:1.0: USB hub found
> [58.693700] hub 7-0:1.0: 1 port detected
> [58.709559] hub 7-0:1.0: USB hub found
> [58.713571] hub 7-0:1.0: 1 port detected
> [58.718955] xhci_hcd 0000:ba:02.0: xHCI Host Controller
> [58.724567] xhci_hcd 0000:ba:02.0: new USB bus registered, assigned bus
> number 8
> [58.731996] xhci_hcd 0000:ba:02.0: Hos.0: remove, state 1
> [58.793746] usb usb8: USB disconnect, device number 1
> [58.801364] xhci_hcd 0000:ba:02.0: USB bus 8 deregistered
> [58.806815] xhci_hcd 0000:ba:02.0: remove, state 1
> [58.811614] usb usb7: USB disconnect, device number 1
> [58.820394] xhci_hcd 0000:ba:02.0: USB bus 7 deregistered
> [58.826505] xhci_hcd 0000:ba:02.0: xHCI Host Controller
> [58.831811] xhci_hcd 0000:ba:02.0: new USB bus registered, assigned bus
> number 7
> [58.839569] xhci_hcd 0000:ba:02.0: hcc params 0x0220f66d hci version 0x100
> quirks 0x0000000000000010
> [58.852983] hub 7-0:1.0: USB hub found
> [58.856908] hub 7-0:1.0: 1 port detected
> [58.862044] hub 7-0:1.0: USB hub found
> [58.865959] hub 7-0:1.0: 1 port detected
> [58.872577] hub 7-0:1.0: USB hub found
> [58.876491] hub 7-0:1.0: 1 port detected
> [58.881760] hub 7-0:1.0: USB hub found
> [58.885678] hub 7-0:1.0: 1 port detected
> [58.891037] xhci_hcd 0000:ba:02.0: xHCI Host Controller
> [58.896550] xhci_hcd 0000:ba:02.0: new USB bus registered, assigned bus
> number 8
> [58.903968] xhci_hcd 0000:ba:02.0: Host supports USB 3.0 SuperSpeed
> [58.910471] usb usb8: We don't know the algorithms for LPM for this host,
> disabling LPM.
> [58.921427] hub 8-0:1.0: USB hub found
> [58.925533] hub 8-0:1.0: 1 port detected
> [58.930781] hub 8-0:1.0: USB hub found
> [58.934695] hub 8-0:1.0: 1 port detected
> [58.941649] hub 8-0:1.0: USB hub found
> [58.945728] hub 8-0:1.0: 1 port detected
> [58.950967] hub 8-0:1.0: USB hub found
> [58.954894] hub 8-0:1.0: 1 port detected
> [58.961651] usbcore: registered new interface driver usb-storage
> 
> Ring any bells? I don't mind debugging the real issue, but good to know it's
> not already solved. I didn't see anything on linux-usb archives, apart from
> this:
> https://lore.kernel.org/linux-usb/1566554761464.60146@mentor.com/ which
> doesn't look too familiar.
> 
> I couldn't recreate on v5.8, but this triggering this seems a bit fragile
> even on linux-next.

Looks new.  Any chance you can run 'git bisect' to track this down?

thanks,

greg k-h
