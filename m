Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEB1680F32
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 14:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235612AbjA3NkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 08:40:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbjA3NkY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 08:40:24 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EBA42F794
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675086022; x=1706622022;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=VZUNUKt9aTV0LLivsE9l07rqR8OYydkURAqTEGH60ng=;
  b=PJY1xPVYGCERncujeKN+9yh9ZlFvcZsl/Ercgp7vQtKwsWZGuNDQg0WW
   GEY0Ezpx4TNnfVrBKrF4DSxsjri4997rq2otnVwfTzJRJVTx+ys2rM6u/
   STYNmOtWUVxQI7KNc/701LT3RPrStNSwFy2d61HAsNvQkPgXWFw74wqcb
   SmXBEZ4PvBPdGkzgH09784y9mWtqpQu3bZzfPIocRCR0tFelzbuVsXnCG
   gKKvdTC8D9P+m/1pzVgNT3AxS4FHols6Evc6qJjGerMQ1NzrG6cSLEr42
   lBUV2XPgoBcpxKNgLwAw6mjujXzRCYonsbPSlgD5w6bVMetCl1oK11ghN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327573816"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="327573816"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 05:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694557433"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="694557433"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 05:40:20 -0800
Message-ID: <5ae25a36-03f2-6867-263b-1844a2ed90b9@linux.intel.com>
Date:   Mon, 30 Jan 2023 15:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To:     Joe Bolling <jbolling@bostondynamics.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
References: <CAHPEz-1J=PU1Qgyw9=gWbC_Z71muoXQx=jYCvB2XE=_qZySCqQ@mail.gmail.com>
 <54dca4fd-81c3-ba7f-e63e-64c8a38eebd8@linux.intel.com>
 <CAHPEz-30ypzfmCp7kqszSOa=-wXqgE8ZeysejO_mebo4UonEGg@mail.gmail.com>
 <aa6fd5d9-a0db-391b-7626-ee7e8531a8cc@linux.intel.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: PROBLEM: Error 110 from ASMedia Host Controller
In-Reply-To: <aa6fd5d9-a0db-391b-7626-ee7e8531a8cc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30.1.2023 15.19, Mathias Nyman wrote:
> On 28.1.2023 0.47, Joe Bolling wrote:
>> Thanks Mathias!
>>
>> I received an updated firmware image from ASMedia. It seems to improve
>> the 110 error problem a little bit - after the error occurs, I can
>> still run lsusb without it hanging. However, the streaming performance
>> of the camera has worsened with the new firmware; even with only one
>> camera connected, I get "ERROR Transfer event TRB DMA ptr not part of
>> current TD ep_index 8 comp_code 1" after just a few frames.
>>
>> I guess the good news is these logs might be easier to analyze, since
>> there's only one endpoint needed to reproduce the error. I'm not sure
>> if this is the same behavior I was seeing before or not.
>> Trace: https://bostondynamics1.box.com/s/3ovxdzu8g276os0pur5rmqbj2vzsgk79
> 
> Trace is missing most events, maybe the CPU handing the xHC interrupts
> is not being traced. Getting all the events would help.
> 
>> dmesg: https://bostondynamics1.box.com/s/7420hi96o5o0f8rmsc2vaafwxf8fcv9y
> 
> Combining dmesg and trace it looks like ASMedia hosts fails to create a
> transfer completion event for the last normal transfer block (TRB) on the
> last segment before ringbuffer wraps back and continues handling events at
> the beginning of the ring.
> 
> [  116.226252] xhci_hcd 0000:01:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 8 comp_code 1
> [  116.226254] xhci_hcd 0000:01:00.0: Looking for event-dma 000000003f82b000 trb-start 000000003f82cfe0 trb-end 000000003f82cfe0 seg-start 000000003f82c000
> 
> The xHC host hardware itself probably handled the transfer as it continues
> handling later TRBs on this ring (cycling back to first segment).
> So driver is waiting for an event for TRB at 0x3f82cfe0, while driver is
> generating events for later TRBs at:
> 000000003f82b000
> 000000003f82b010
> 000000003f82b020
> 000000003f82b030
> 
> bulk endpoint 4 i(n) has a ring buffer with two segments. each fits 256TRBs
> 0x000000003f82b000
> 0x000000003f82c000
> 
> last TRB of each segment contains a link TRB (at 0x..bff0 and 0x..cff0) that
> points to next segment, link TRB on last segment has a cycle bit set.
> 
> Looks like TRBs are queued normally,
> queue TRB @ 0x3f82cfe0
> 116.257625: xhci_queue_trb: BULK: Buffer 000000003f930000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
> 116.257625: xhci_inc_enq: BULK 0000000084ebe58d: enq 0x000000003f82cff0(0x000000003f82c000) deq 0x000000003f82cfa0(0x000000
> ...
> queue TRB @ 0x3f82b000
> 116.259186: xhci_queue_trb: BULK: Buffer 000000003f910000 length 32768 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
> 116.259186: xhci_inc_enq: BULK 0000000084ebe58d: enq 0x000000003f82b010(0x000000003f82b000) deq 0x000000003f82cfb0
> 
> A wild guess would be that this is somehow related to the cycle bit in of the
> Link TRB. Maybe ASMedia HW processes the link TRB before creating the event for
> the last normal TRB, and sets the cycle bit incorrectly for it?
> 
> Thanks
> Mathias
> 

Just recalled this same issue was seen some time ago.

https://lkml.org/lkml/2021/4/2/197
https://patchwork.kernel.org/project/linux-usb/patch/20210416093729.41865-1-ole@salscheider.org/#24159595

Also make sure the new firmware has proper PCI ID so that xhci driver runs
the correct ASMedia quirks

This one especially:
9da5a1092b13 xhci: Bad Ethernet performance plugged in ASM1042A host

Thanks
Mathias
