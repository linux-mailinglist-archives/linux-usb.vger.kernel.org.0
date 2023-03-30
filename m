Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA256D04C8
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 14:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjC3MeB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 08:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjC3MeA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 08:34:00 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1F6273C
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680179637; x=1711715637;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=V2C49A3mCAhVGRVr/gphq8gtPSLz2hOqosuvz2Np22w=;
  b=JwGE8I2xMDGDwaikZfunyYqnvr0pFARpFR5GUEgicAUjQ3MMh3fouaG1
   YSPZgVoa5SYXSt0gPef3ROL01KAmbbInf8VX7PqI736JzoIbZqg4DGYV1
   t5RT50dtEgHblpG6aeA7YawEOJI7nhu4I+VozMdOw9rOzdZBw33YLLXf/
   mD3R6xd86cJS0f883lebTpHAVd+/d7TmyMWintpKtd5N+MDVyEaGMUWdT
   67HU1n/KW/HzYNHkQlhvhS83UzF8IuMpRH9n80E+l/ULCqhTDFRqwLoK+
   TXya2NLszFerkweIIKCeZhL3z/Vhzm0WFHdrw1QphDkFm+ooJ6IgGmnIg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="338652542"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="338652542"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 05:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="1014407401"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="1014407401"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2023 05:33:37 -0700
Message-ID: <b5241e6c-dde1-ae14-3eb3-9157283a4eda@linux.intel.com>
Date:   Thu, 30 Mar 2023 15:34:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     "YoungJun.Park" <her0gyugyu@gmail.com>, linux-usb@vger.kernel.org
Cc:     youngjun.park@ahnlab.com, her0gyu@naver.com,
        Greg KH <gregkh@linuxfoundation.org>
References: <20230328063020.GA1824187@ubuntu>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Question of possible concurrent xhci debugfs file
In-Reply-To: <20230328063020.GA1824187@ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28.3.2023 9.30, YoungJun.Park wrote:
> I got a panic dump which happend on kernel(
> I check the both of CentOS and mainline kernel
> And I assume it could be happend on mainline kernel.
> (like I said assume)
> 
> I think xhci-debugfs file creation check the creation of
> NULL parent dentry. Is it right? (drivers/usb/host/xhci-debugfs.c)
> 
> The contents below is the what I analyze.
> 
> 1. A lot of usb error
> ...
> [1994159.974407] usb 1-2: device descriptor read/64, error -71
> [1994160.187902] usb 1-2: new low-speed USB device number 36 using xhci_hcd
> [1994160.302634] usb 1-2: device descriptor read/64, error -71
> [1994160.562027] usb 1-2: device descriptor read/64, error -71
> [1994160.663789] usb usb1-port2: unable to enumerate USB device
> [1994162.256029] usb 1-2: new low-speed USB device number 37 using xhci_hcd
> [1994162.370764] usb 1-2: device descriptor read/64, error -71
> [1994162.585258] usb 1-2: device descriptor read/64, error -71
> [1994162.797751] usb 1-2: new low-speed USB device number 38 using xhci_hcd
> [1994162.912484] usb 1-2: device descriptor read/64, error -71
> [1994163.141944] usb 1-2: device descriptor read/64, error -71
> [1994163.243712] usb usb1-port2: attempt power cycle.
> ...
> 
> 2. After that panic happend and I got a dump.
> The cause of panic reading "/sys/kernel/debug/trbs" which is abnormal.
> (which have bad xhci_ring private data)
> the file must be on the "/sys/kernel/debug/usb/~~~".
> 
> sh> bt
> PID: 91416  TASK: ffff8d68fcc54200  CPU: 1   COMMAND: "fbmons"
>   #0 [ffff8d679a6cbad0] machine_kexec at ffffffff9e2662c4
>   #1 [ffff8d679a6cbb30] __crash_kexec at ffffffff9e322a32
>   #2 [ffff8d679a6cbc00] crash_kexec at ffffffff9e322b20
>   #3 [ffff8d679a6cbc18] oops_end at ffffffff9e98d798
>   #4 [ffff8d679a6cbc40] no_context at ffffffff9e275d14
>   #5 [ffff8d679a6cbc90] __bad_area_nosemaphore at ffffffff9e275fe2
>   #6 [ffff8d679a6cbce0] bad_area_nosemaphore at ffffffff9e276104
>   #7 [ffff8d679a6cbcf0] __do_page_fault at ffffffff9e990750
>   #8 [ffff8d679a6cbd60] do_page_fault at ffffffff9e990975
>   #9 [ffff8d679a6cbd90] page_fault at ffffffff9e98c778
>      [exception RIP: xhci_ring_trb_show+29]
>      RIP: ffffffff9e76005d  RSP: ffff8d679a6cbe40  RFLAGS: 00010246
>      RAX: ffff8d497b0fe018  RBX: 0000000000000000  RCX: 0000001309207f9b
>      RDX: fffffffffffffff4  RSI: 0000000000000001  RDI: ffff8d6939b8fd40
>      RBP: ffff8d679a6cbe60   R8: ffff8d49ffa5f1a0   R9: ffff8d3b3fc07300
>      R10: ffff8d3b3fc07300  R11: ffffffff9e3de9fd  R12: 0000000000000000
>      R13: 0000000000000000  R14: ffff8d6939b8fd40  R15: ffff8d6939b8fd40
>      ORIG_RAX: ffffffffffffffff  CS: 0010  SS: 0018
> #10 [ffff8d679a6cbe68] seq_read at ffffffff9e476d10
> #11 [ffff8d679a6cbed8] vfs_read at ffffffff9e44e3ff
> #12 [ffff8d679a6cbf08] sys_read at ffffffff9e44f27f
> #13 [ffff8d679a6cbf50] system_call_fastpath at ffffffff9e995f92
>      RIP: 00007f5f9749f6fd  RSP: 00007f5f84c73700  RFLAGS: 00000293
>      RAX: 0000000000000000  RBX: 00007f5f7066a390  RCX: ffffffffffffffff
>      RDX: 0000000000000400  RSI: 00007f5f706d2270  RDI: 0000000000000016
>      RBP: 00007f5f706d2270   R8: 00007f5f953e73a0   R9: 00007f5f953e7388
>      R10: 0000000000000040  R11: 0000000000000293  R12: 0000000000000400
>      R13: 00007f5f84c7354c  R14: 0000000022100004  R15: 00007f5f866c5368
>      ORIG_RAX: 0000000000000000  CS: 0033  SS: 002b
> 
> 3. I found a another abnormal xhci debugfs file ep_context in dump.
> Check xhci_slot_priv is alive and find the root is NULL.
> 
> crash> files -d 0xffff8d68fe8f0000
>       DENTRY           INODE           SUPERBLK     TYPE PATH
> ffff8d68fe8f0000 ffff8d489e979e10 ffff8d3b19169800 REG  /sys/kernel/debug/ep-context
> 
> crash > struct xchi_slot_priv 0xffff8d4812492c0
> struct xhci_slot_priv {
> ...
>    root = 0x0,
> ...
>    dev = 0xffff8d497b0fe000
> }
> 
> 4. Looking into the mainline kernel code, I finally concluded that
> /sys/fs/debug/"interface file" could be made.
> 
> drivers/usb/host/xhci-debugfs.c
> xhci_debugfs_create_slot function
> ...
> priv->root = debugfs_create_dir(priv->name, xhci->debugfs_slots); // root can be NULL

If you can reproduce this could you check if debugfs_create_dir() actually returned
NULL here, or if there was some race zeroing priv->root a bit later.

I tried to reproduce this myself by intentionally failing the device descriptor read
during enumeration. This gave similar "device descriptor read/64, error -71" and
"attempt power cycle" log entries, but didn't trigger the issue.

For me the slot related debugfs files were successfully created after usb_alloc_dev() was called,
and removed after hub_free_dev().

Thanks
Mathias
