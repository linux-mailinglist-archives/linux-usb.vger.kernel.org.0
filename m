Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3DA5FF1EA
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 18:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiJNQAx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 12:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiJNQAw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 12:00:52 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B223FB7ED1
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665763247; x=1697299247;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=WffeUGQcvR70uBIPO/MxTx5MXyxFxsNz2aKQC2lGXqI=;
  b=R5zEhfs4oIM4lh/jOHSv+2yvc9IGN81Q+YJXtQFHVtqfFIw0AcfJ6OR4
   KgjnMONIVfs5yDYIZhhAk/kyBrQ9C3SYlOWiOrKiXBz5I3jL9K/UdT/vA
   uH+garrG8dWG/V9eDcevT85HnbPedrXoBQ67CoeuccrgFfw9dpt5vziem
   kp1q9+9At3RerGvfIgO3HvL/tIAdNGBMTHt/dXKk8moGEWCY9ScpVcuK+
   J0GZoxQ/oq1n5TDLMWjlg45lcqifXHL9Bpl3SQd8V5LHnjVdyOi36A4bI
   H6mffgMYbiujvl/2f+CBtmfV0T1Z2GE2mil5+WmSB9Y/VVWk3S/QZC35E
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="369597572"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="369597572"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2022 09:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="627615166"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="627615166"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 14 Oct 2022 09:00:45 -0700
Message-ID: <7eaf9861-5571-584f-b124-fa7076920090@linux.intel.com>
Date:   Fri, 14 Oct 2022 19:02:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= 
        <marmarek@invisiblethingslab.com>, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
References: <Yw6r7FxMCCYSzfTk@mail-itl> <Y0i5h9Tx/1mxvh9A@mail-itl>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind
In-Reply-To: <Y0i5h9Tx/1mxvh9A@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 14.10.2022 4.21, Marek Marczykowski-Górecki wrote:
> On Wed, Aug 31, 2022 at 02:31:23AM +0200, Marek Marczykowski-Górecki wrote:
>> Hello,
>>
>> I hit a kernel crash when unbinding xhci-pci from the PCI device (via
>> sysfs write). I can trigger the issue at least on 5.19.2 and 6.0-rc3.
>> Interestingly, the same kernel does not crash on another machine while
>> doing the same, so it might depends on specific devices being connected.
> 
> I did some more digging, and the issue is definitely much older, I can
> see it in 5.10.112 too. It simply happen to be found with
> init_on_free=1, which I changed about the same time (and forgot about
> it).
> 
>> The specific message I get is this:
>>
>>    ehci-pci 0000:00:06.0: remove, state 1
>>    usb usb4: USB disconnect, device number 1
>>    usb 4-1: USB disconnect, device number 2
>>    usb 4-1.5: USB disconnect, device number 3
>>    ehci-pci 0000:00:06.0: USB bus 4 deregistered
>>    ehci-pci 0000:00:07.0: remove, state 1
>>    usb usb5: USB disconnect, device number 1
>>    usb 5-1: USB disconnect, device number 2
>>    usb 5-1.2: USB disconnect, device number 3
>>    usb 5-1.4: USB disconnect, device number 4
>>    usb 5-1.5: USB disconnect, device number 5
>>    usb 5-1.6: USB disconnect, device number 6
>>    ehci-pci 0000:00:07.0: USB bus 5 deregistered
>>    xhci_hcd 0000:00:08.0: remove, state 4
>>    usb usb3: USB disconnect, device number 1
>>    xhci_hcd 0000:00:08.0: USB bus 3 deregistered
>>    xhci_hcd 0000:00:08.0: remove, state 1
>>    usb usb2: USB disconnect, device number 1
>>    usb 2-4: USB disconnect, device number 2
>>    cdc_mbim 2-4:1.6 wws8u4i6: unregister 'cdc_mbim' usb-0000:00:08.0-4, CDC MBIM
>>    xhci_hcd 0000:00:08.0: Slot 1 endpoint 8 not removed from BW list!
>>    xhci_hcd 0000:00:08.0: Slot 1 endpoint 12 not removed from BW list!
>>    xhci_hcd 0000:00:08.0: Slot 1 endpoint 14 not removed from BW list!
>>    xhci_hcd 0000:00:08.0: Slot 1 endpoint 16 not removed from BW list!
>>    xhci_hcd 0000:00:08.0: Slot 1 endpoint 18 not removed from BW list!
>>    xhci_hcd 0000:00:08.0: Slot 1 endpoint 20 not removed from BW list!
> 
> This seems to be highly related. The related code is
> (drivers/usb/host/xhci-mem.c):
> 
>   860 void xhci_free_virt_device(struct xhci_hcd *xhci, int slot_id)
>   861 {
> (...)
>   870     dev = xhci->devs[slot_id];
> (...)
>   892         if (!list_empty(&dev->eps[i].bw_endpoint_list))
>   893             xhci_warn(xhci, "Slot %u endpoint %u "
>   894                     "not removed from BW list!\n",
>   895                     slot_id, i);
> (...)
>   909     kfree(xhci->devs[slot_id]);
>   910     xhci->devs[slot_id] = NULL;
>   911 }
> 
> So, it does kfree() a list that is connected somewhere.
> 
> I can trigger the issue by unbinding xhci_hcd from just this device.
> This is an USB controller to which internal WWAN adapter is connected,
> and nothing else. I can still trigger the crash, if I prevent relevant
> driver(s) from ever loading, so the issue is clearly somewhere in xhci
> core. Adding XHCI maintainer to the recipients.
> 
> BTW, the call trace to the above warning is (collected on different
> kernel version than the other one...):
> 
>    usb_disconnect+0x212/0x290
>    usb_disconnect+0xc8/0x290
>    usb_remove_hcd+0xdf/0x1d3
>    usb_hcd_pci_remove+0x74/0x100
>    pci_device_remove+0x3b/0xa0
>    __device_release_driver+0x181/0x250
>    device_driver_detach+0x3c/0xa0
>    unbind_store+0xd8/0x100
>    kernfs_fop_write_iter+0x11a/0x1f0
>    new_sync_write+0x150/0x1e0
>    vfs_write+0x1d0/0x260
>    ksys_write+0x6b/0xe0
>    do_syscall_64+0x33/0x40
>    entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> 
>>    list_del corruption, ffff935804028758->next is NULL
>>    ------------[ cut here ]------------
>>    kernel BUG at lib/list_debug.c:49!
>>    invalid opcode: 0000 [#1] PREEMPT SMP PTI
>>    CPU: 1 PID: 1211 Comm: prepare-suspend Not tainted 6.0.0-rc3-1.51.fc32.qubes.x86_64 #248
>>    Hardware name: Xen HVM domU, BIOS 4.14.5 08/24/2022
>>    RIP: 0010:__list_del_entry_valid.cold+0xf/0x6f
>>    Code: c7 c7 38 de 8c ae e8 22 d2 fd ff 0f 0b 48 c7 c7 10 de 8c ae e8 14 d2 fd ff 0f 0b 48 89 fe 48 c7 c7 20 df 8c ae e8 03 d2 fd ff <0f> 0b 48 89 d1 48 c7 c7 40 e0 8c ae 4c 89 c2 e8 ef d1 fd ff 0f 0b
>>    RSP: 0000:ffffb7ef817e7cd0 EFLAGS: 00010246
>>    RAX: 0000000000000033 RBX: ffff935803460900 RCX: 0000000000000000
>>    RDX: 0000000000000000 RSI: ffffffffae8b45a7 RDI: 00000000ffffffff
>>    RBP: 0000000000000006 R08: 0000000000000000 R09: 00000000ffffdfff
>>    R10: ffffb7ef817e7b78 R11: ffffffffaed46088 R12: ffff935803466260
>>    R13: ffff935803460810 R14: ffff935804028758 R15: ffff935803460928
>>    FS:  000076820cccd740(0000) GS:ffff935810700000(0000) knlGS:0000000000000000
>>    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>    CR2: 000075bb7d654d70 CR3: 000000000066a003 CR4: 00000000001706e0
>>    Call Trace:
>>     <TASK>
>>     xhci_mem_cleanup+0x14c/0x520 [xhci_hcd]
> 
> This indeed iterates over
> xhci->rh_bw[i].bw_table.interval_bw[j].endpoints and tries to
> list_del_init() every entry.
> I guess it should happen before the above xhci_free_virt_device(), but
> for some reason happens after.
> 

Thanks for looking into this.

This whole software bandwidth issue should only be visible in Intel
Panther Point PCH xHC (Ivy bridge)

Endpoints should be deleted from bw_table list, and xhci_virt_devices
should be freed already before xhci_mem_cleanup() is called if all goes well.

Normally endpoints are deleted from bw_table list during usb_disconnect()

usb_disconnect()
   ...
   usb_hcd_alloc_bandwidth(dev, NULL, NULL, NULL);
     hcd->driver->drop_endpoint()  // flags endpoint to be dropped
     hcd->driver->check_bandwidth()
     ->xhci_check_bandwidth()
       xhci_configure_endpoint()
         xhci_reserve_bandwidth()  // only for Panther Point
           xhci_drop_ep_from_interval_table()

But to avoid queuing new commands to a host in XHCI_STATE_DYING or
XHCI_STATE_REMOVING state we return early, not calling xhci_reserve_bandwidth().

Thanks
Mathias
