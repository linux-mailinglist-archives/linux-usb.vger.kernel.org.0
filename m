Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5B6B244D6B
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 19:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgHNRUe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 13:20:34 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2608 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728018AbgHNRUe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 13:20:34 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id BB63DCE225C14D51D891;
        Fri, 14 Aug 2020 18:20:32 +0100 (IST)
Received: from [127.0.0.1] (10.47.4.107) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 14 Aug
 2020 18:20:32 +0100
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
From:   John Garry <john.garry@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com>
 <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
Message-ID: <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com>
Date:   Fri, 14 Aug 2020 18:18:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.47.4.107]
X-ClientProxiedBy: lhreml726-chm.china.huawei.com (10.201.108.77) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14/08/2020 08:26, John Garry wrote:

+

> On 13/08/2020 19:28, Greg Kroah-Hartman wrote:
>>> [58.950967] hub 8-0:1.0: USB hub found
>>> [58.954894] hub 8-0:1.0: 1 port detected
>>> [58.961651] usbcore: registered new interface driver usb-storage
>>>
>>> Ring any bells? I don't mind debugging the real issue, but good to 
>>> know it's
>>> not already solved. I didn't see anything on linux-usb archives, 
>>> apart from
>>> this:
>>> https://lore.kernel.org/linux-usb/1566554761464.60146@mentor.com/  which
>>> doesn't look too familiar.
>>>
>>> I couldn't recreate on v5.8, but this triggering this seems a bit 
>>> fragile
>>> even on linux-next.
>> Looks new.  Any chance you can run 'git bisect' to track this down?
>>
> 
> Hi Greg,
> 
> I need to find a reliable reproducer. I could only reproduce when some 
> other seemingly unrelated kernel config options were enabled. Let me see 
> if I can reproduce based on Linus' kernel (it will be 5.9-rc now), and 
> go from there.
> 

Is the problem 306c54d0edb6 (""usb: hcd: Try MSI interrupts on PCI 
devices), as this following patch stops KASAN complaining for me:

 From a3b9e1b405d1efdfee2ee672bbf7dc1c7de62d66 Mon Sep 17 00:00:00 2001
From: John Garry <john.garry@huawei.com>
Date: Fri, 14 Aug 2020 18:14:51 +0100
Subject: [PATCH] usb: hcd: Fix use-after-free in usb_hcd_pci_remove()

KASAN reports when CONFIG_DEBUG_TEST_DRIVER_REMOVE is enabled:

==================================================================
[58.095667] BUG: KASAN: use-after-free in usb_hcd_pci_remove+0xbc/0x168
[58.102272] Read of size 8 at addr ffff002a0b6e8120 by task swapper/0/1
[58.108875]
[58.110361] CPU: 2 PID: 1 Comm: swapper/0 Tainted: G
W5.8.0-next-20200813-dirty #31
[58.119396] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI RC0
- V1.16.01 03/15/2019
[58.127910] Call trace:
[58.130351]  dump_backtrace+0x0/0x2d0
[58.134005]  show_stack+0x18/0x28
[58.137313]  dump_stack+0xf4/0x168
[58.140709]  print_address_description.constprop.12+0x6c/0x4ec
[58.146532]  kasan_report+0x130/0x200
[58.150186]  __asan_load8+0x9c/0xd8
[58.153666]  usb_hcd_pci_remove+0xbc/0x168
[58.157755]  xhci_pci_remove+0xb8/0x108
[58.161583]  pci_device_remove+0x6c/0x138
[58.165586]  really_probe+0x22c/0x640
[58.169240]  driver_probe_device+0x78/0xe8
[58.173328]  device_driver_attach+0x9c/0xa8
[58.177504]  __driver_attach+0x74/0x120
[58.181331]  bus_for_each_dev+0xec/0x160
[58.185245]  driver_attach+0x34/0x48
[58.188812]  bus_add_driver+0x1b8/0x2c0
[58.192639]  driver_register+0xc0/0x1e0
[58.196467]  __pci_register_driver+0xb4/0xd0
[58.200729]  xhci_pci_init+0x60/0x70
[58.204297]  do_one_initcall+0xd4/0x264
[58.208125]  kernel_init_freeable+0x270/0x2d8
[58.212475]  kernel_init+0x14/0x124
[58.215955]  ret_from_fork+0x10/0x34
[58.216996] hub 1-1:1.0: USB hub found
[58.219519]
[58.219523] Allocated by task 13:
[58.219528]  kasan_save_stack+0x28/0x58
[58.219538]  __kasan_kmalloc.isra.6+0xcc/0xf0
[58.236219]  kasan_kmalloc+0x10/0x20
[58.239786]  __kmalloc+0x194/0x290
[58.243181]  __usb_create_hcd+0x48/0x3a8
[58.247095]  usb_create_hcd+0x1c/0x28
[58.250748]  usb_hcd_pci_probe+0xa0/0x548
[58.254749]  xhci_pci_probe+0x54/0x360
[58.258488]  local_pci_probe+0x78/0xf8
[58.262230]  work_for_cpu_fn+0x30/0x50
[58.265971]  process_one_work+0x424/0x698
[58.269972]  worker_thread+0x438/0x6d0
[58.273713]  kthread+0x224/0x230
[58.276933]  ret_from_fork+0x10/0x34
[58.280497]
[58.281978] Freed by task 1:
[58.284851]  kasan_save_stack+0x28/0x58
[58.288677]  kasan_set_track+0x28/0x40
[58.292418]  kasan_set_free_info+0x24/0x48
[58.296505]  __kasan_slab_free+0x104/0x188
[58.300593]  kasan_slab_free+0x14/0x20
[58.304333]  slab_free_freelist_hook+0x8c/0x190
[58.308855]  kfree+0x2cc/0x400
[58.311901]  usb_put_hcd+0xc0/0x110
[58.315381]  usb_hcd_pci_remove+0xb4/0x168
[58.317397] hub 1-1:1.0: 4 ports detected
[58.319468]  xhci_pci_remove+0xb8/0x108
[58.319473]  pci_device_remove+0x6c/0x138
[58.319480]  really_probe+0x22c/0x640
[58.334943]  driver_probe_device+0x78/0xe8
[58.339031]  device_driver_attach+0x9c/0xa8
[58.343205]  __driver_attach+0x74/0x120
[58.347033]  bus_for_each_dev+0xec/0x160
[58.350947]  driver_attach+0x34/0x48
[58.354513]  bus_add_driver+0x1b8/0x2c0
[58.358340]  driver_register+0xc0/0x1e0
[58.362168]  __pci_register_driver+0xb4/0xd0
[58.366429]  xhci_pci_init+0x60/0x70
[58.369995]  do_one_initcall+0xd4/0x264
[58.373823]  kernel_init_freeable+0x270/0x2d8
[58.378171]  kernel_init+0x14/0x124
[58.381651]  ret_from_fork+0x10/0x34
[58.385215]
[58.386699] The buggy address belongs to the object at ffff002a0b6e8000
[58.386699]  which belongs to the cache kmalloc-8k of size 8192
[58.399207] The buggy address is located 288 bytes inside of
[58.399207]  8192-byte region [ffff002a0b6e8000, ffff002a0b6ea000)
[58.411019] The buggy address belongs to the page:
[58.415803] page:0000000060c9fcec refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x2a0b6e8
[58.425272] head:0000000060c9fcec order:3 compound_mapcount:0
compound_pincount:0
[58.432746] flags: 0x2ffff00000010200(slab|head)
[58.437357] raw: 2ffff00000010200 dead000000000100 dead000000000122
ffff002a53c0f300
[58.445092] raw: 0000000000000000 0000000080020002 00000001ffffffff
0000000000000000
[58.452824] page dumped because: kasan: bad access detected
[58.458385]
[58.459867] Memory state around the buggy address:
[58.464649]  ffff002a0b6e8000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb
fb fb
[58.471862]  ffff002a0b6e8080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb
fb fb
[58.479074] >ffff002a0b6e8100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb
fb fb
[58.486284]  ^
[58.490545]  ffff002a0b6e8180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb
fb fb
[58.497758]  ffff002a0b6e8200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb
fb fb
[58.504968]
==================================================================

Fix by relocating the usb_put_hcd() call until after the 
hcd->driver->flags check.

Signed-off-by: John Garry <john.garry@huawei.com>

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 4dc443aaef5c..44a8d3644973 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -346,9 +346,9 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
  		dev_set_drvdata(&dev->dev, NULL);
  		up_read(&companions_rwsem);
  	}
-	usb_put_hcd(hcd);
  	if ((hcd->driver->flags & HCD_MASK) < HCD_USB3)
  		pci_free_irq_vectors(dev);
+	usb_put_hcd(hcd);
  	pci_disable_device(dev);
  }
  EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);


---->8-----------

@Andy, Apologies if I'm off the mark!

Thanks,
John

