Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D98680EA5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 14:17:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235384AbjA3NR4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 08:17:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235039AbjA3NRz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 08:17:55 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D1E7D8E
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 05:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675084673; x=1706620673;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=QO+yzc9mYNFGP3TnIL/azcoFQ6WI4kuK3/bq3dE9ScM=;
  b=NCaXxGXuIbnYbItMXWt5ezEt/jFZ64Tz4cM5LUrHZLdJR2xFKLERR0IU
   RgSQxxzDhiiDZdRqsg0q24bFeZ26PqQtmPPwckUDRsRXTZjXRXkn1m3ct
   GQQHuelyaR68Lz6LSzOP3shBGbZ0+Y0YA8v7CKGVnvLFZD3xwaQEp/T0h
   1eKMUpkdEYLKyq/3AAM9ZyFo0YSNy3aW4OZmW7suvKvrrbZgunuEPsria
   U82HRIeLVDtDvZ1YqJEO6J2dplw+vmrRNkddgj1yz1iNAWk62gmPH4Acu
   p5uTMBJdvpKV9n2hv4QlkgBW2z529zCIr5oLHn2IL3tCsHSJddUDYwixQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="315512768"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="315512768"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 05:17:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="641543270"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="641543270"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2023 05:17:51 -0800
Message-ID: <aa6fd5d9-a0db-391b-7626-ee7e8531a8cc@linux.intel.com>
Date:   Mon, 30 Jan 2023 15:19:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To:     Joe Bolling <jbolling@bostondynamics.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
References: <CAHPEz-1J=PU1Qgyw9=gWbC_Z71muoXQx=jYCvB2XE=_qZySCqQ@mail.gmail.com>
 <54dca4fd-81c3-ba7f-e63e-64c8a38eebd8@linux.intel.com>
 <CAHPEz-30ypzfmCp7kqszSOa=-wXqgE8ZeysejO_mebo4UonEGg@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: PROBLEM: Error 110 from ASMedia Host Controller
In-Reply-To: <CAHPEz-30ypzfmCp7kqszSOa=-wXqgE8ZeysejO_mebo4UonEGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28.1.2023 0.47, Joe Bolling wrote:
> Thanks Mathias!
> 
> I received an updated firmware image from ASMedia. It seems to improve
> the 110 error problem a little bit - after the error occurs, I can
> still run lsusb without it hanging. However, the streaming performance
> of the camera has worsened with the new firmware; even with only one
> camera connected, I get "ERROR Transfer event TRB DMA ptr not part of
> current TD ep_index 8 comp_code 1" after just a few frames.
> 
> I guess the good news is these logs might be easier to analyze, since
> there's only one endpoint needed to reproduce the error. I'm not sure
> if this is the same behavior I was seeing before or not.
> Trace: https://bostondynamics1.box.com/s/3ovxdzu8g276os0pur5rmqbj2vzsgk79

Trace is missing most events, maybe the CPU handing the xHC interrupts
is not being traced. Getting all the events would help.

> dmesg: https://bostondynamics1.box.com/s/7420hi96o5o0f8rmsc2vaafwxf8fcv9y

Combining dmesg and trace it looks like ASMedia hosts fails to create a
transfer completion event for the last normal transfer block (TRB) on the
last segment before ringbuffer wraps back and continues handling events at
the beginning of the ring.

[  116.226252] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 8 comp_code 1
[  116.226254] xhci_hcd 0000:01:00.0: Looking for event-dma 000000003f82b000 trb-start 000000003f82cfe0 trb-end 000000003f82cfe0 seg-start 000000003f82c000

The xHC host hardware itself probably handled the transfer as it continues
handling later TRBs on this ring (cycling back to first segment).
So driver is waiting for an event for TRB at 0x3f82cfe0, while driver is
generating events for later TRBs at:
000000003f82b000
000000003f82b010
000000003f82b020
000000003f82b030

bulk endpoint 4 i(n) has a ring buffer with two segments. each fits 256TRBs
0x000000003f82b000
0x000000003f82c000

last TRB of each segment contains a link TRB (at 0x..bff0 and 0x..cff0) that
points to next segment, link TRB on last segment has a cycle bit set.

Looks like TRBs are queued normally,
queue TRB @ 0x3f82cfe0
116.257625: xhci_queue_trb: BULK: Buffer 000000003f930000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
116.257625: xhci_inc_enq: BULK 0000000084ebe58d: enq 0x000000003f82cff0(0x000000003f82c000) deq 0x000000003f82cfa0(0x000000
...
queue TRB @ 0x3f82b000
116.259186: xhci_queue_trb: BULK: Buffer 000000003f910000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
116.259186: xhci_inc_enq: BULK 0000000084ebe58d: enq 0x000000003f82b010(0x000000003f82b000) deq 0x000000003f82cfb0

A wild guess would be that this is somehow related to the cycle bit in of the
Link TRB. Maybe ASMedia HW processes the link TRB before creating the event for
the last normal TRB, and sets the cycle bit incorrectly for it?

Thanks
Mathias

