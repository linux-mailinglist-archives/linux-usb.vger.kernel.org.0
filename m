Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED7056033B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jun 2022 16:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbiF2OiV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 10:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233528AbiF2OiU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 10:38:20 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25B4A18A
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656513498; x=1688049498;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=CYqsnQizauRVZ0RBQFQ0+BY4c3cHQsqdAtjRMkQPohc=;
  b=hg88DWUkyM+GGhVnpzKMnQHU8nLpYfTEhc5WUOw3BWZYTR3ZxuwJjgZa
   rTcOCzJhtIFbbFJoVW/LPjhBdnrgA20ySoTy4pCRW0T01ZB7noyYkx3CO
   ClrUVgxwbwD0S5l3w5s7HBZAfO01O8Ybi4jkXq6czjL3V5qAwogH7ZcMH
   zh9G4CQEIi41cILqx3UDo2LpbvSHqvHM0S8HQpzPfAl2E0BXizIPf5ymR
   o3760KVyA1yrSyWUo3HBtRmjQk7yFne/pWIMPFRSjwBCZ5Ft0TQyAoV8k
   63ns+bNnjBg+45tDOG7xxxcBzPyMzQNDI08crlWq2vSkGgoCgZhCav/je
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="280808536"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="280808536"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 07:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="733202416"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2022 07:38:17 -0700
Message-ID: <cdd5b0b2-cfcd-3c25-6b77-2d20ebfc97c5@linux.intel.com>
Date:   Wed, 29 Jun 2022 17:39:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        Jon Grimm <jon.grimm@amd.com>,
        "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
References: <YrXMY0Nd0Yn6XDSN@suse.de>
 <8917c751-76dc-98d3-83ac-652aa2249b7d@linux.intel.com>
 <YrqzGpuLdNrbfHL5@suse.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: DMA Faults with XHCI driver
In-Reply-To: <YrqzGpuLdNrbfHL5@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28.6.2022 10.51, Jörg Rödel wrote:
> Hi Mathias,
> 
> thanks a lot for your reply.
> 
> On Mon, Jun 27, 2022 at 01:52:44PM +0300, Mathias Nyman wrote:
>> Add to kernel cmdline:
>> xhci_hcd.dyndbg=+p trace_event=xhci-hcd trace_buf_size=80M
>> <boot>
>> mount -t debugfs none /sys/kernel/debug
>> Send output of dmesg
>> Send content of /sys/kernel/debug/tracing/trace
>>
>> Also if you could dump the content of following registers:
>> cat /sys/kernel/debug/usb/xhci/<pci address>/reg-op
>> cat /sys/kernel/debug/usb/xhci/<pci address>/reg-runtime
>>
>> xhci driver writes dma addresses it allocated for the host into
>> some of those registers
> 
> The data you requested is in the attached archive. The trace was
> actually empty. My kernel has tracing enabled in general, do I need to
> enable more config options to get the trace?
> 

Thanks, not sure about which tracing option is missing.

You might be right about mangling DMA addresses above 32bit.
At least that address looks a lot like the command ring DMA address with a
higher byte zeroed.

Driver allocates and maps memory for the command ring at DMA 0xffffffffffefe000:

[    6.698051] xhci_hcd 0000:02:00.0: First segment DMA is 0xffffffffffefe000
[    6.698053] xhci_hcd 0000:02:00.0: // Setting command ring address to 0xffffffffffefe001

That address is stored in a 64 bit CRCR register (mmio at xhci->op_regs->cmd_ring)
by writing low 32 bits first, then high 32 bits.

The AMD-Vi IO_PAGE_FAULT for accessing 0xff00ffffffefe000 comes right after driver
asked xHC to process commands from the command ring (the Ding dong! message)
xHC device reads the commands from the DMA address written to the CRCR register.
The faulty address has the same lower 32 bits as the command ring we allocated.

[    6.880028] xhci_hcd 0000:02:00.0: // Ding dong!
[    6.880045] xhci_hcd 0000:02:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x000f address=0xff00ffffffefe000 flags=0x0000]

Can't find a reason for zeroed bits in the upper 32 bit part.
Looks like we always write all 64 bits to CRCR register.

Maybe a race where command ring is started while writing high 32 bits to CRCR?
Writing address bits to CRCR register are ignored if command ring is running.

Also looks like roothub might be runtime suspending just before the issue.

Anyway, maybe flushing the CRCR register by reading it back after writing it would help:

---

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 8c19e151a945..e54829898a2c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2473,6 +2473,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
                         "// Setting command ring address to 0x%016llx", val_64);
         xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
  
+       xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
+
         /* Reserve one command ring TRB for disabling LPM.
          * Since the USB core grabs the shared usb_bus bandwidth mutex before
          * disabling LPM, we only need to reserve one TRB for all devices.
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 46d0b9ad6f74..721715ba5085 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -390,6 +390,9 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
         crcr = xhci_trb_virt_to_dma(new_seg, new_deq);
         xhci_write_64(xhci, crcr | CMD_RING_ABORT, &xhci->op_regs->cmd_ring);
  
+       xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
+
         /* Section 4.6.1.2 of xHCI 1.0 spec says software should also time the
          * completion of the Command Abort operation. If CRR is not negated in 5
          * seconds then driver handles it as if host died (-ENODEV).
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 9ac56e9ffc64..6180a721693d 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -854,6 +854,8 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
                         "// Setting command ring address to 0x%llx",
                         (long unsigned long) val_64);
         xhci_write_64(xhci, val_64, &xhci->op_regs->cmd_ring);
+
+       xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
  }
  
  /*

