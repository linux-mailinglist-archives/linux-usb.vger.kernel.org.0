Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D532650B67
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 13:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiLSMYd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 07:24:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbiLSMYc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 07:24:32 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B7CDEC1
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 04:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671452671; x=1702988671;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=b/Ja06ChzojhwtU9xOIyZa6e0znKmo560T14mQ4F9/I=;
  b=RKThsEqmIyZ7uizPRb2RSUtZYNeTMZi0ENjaeaEERwDaNH4ydLRDD055
   dmk9oPR3N9cU7hvxKnHM1Vm2jWvoBfVJEnT0I4JWZdVhR+wTiYHca7/+3
   ReBwK1sHyJ77yi9Hsjgjgp0MecqH45TUV/lXyKIbdlsMKL+FfIa1PHyD9
   p2knzAEFOvTkUVo5BcOQEFUtUxR5tB+dOMdz+Xyd2tSOau10M/xwS1iq7
   3V41hOR4fK/1fzBK3k+80Bv+VelVegoHoojHwItg5xvxHvOM1awWL2srx
   6myYeUw/dDt2fr0Fi4W1hNSzsRQOcOnI5e5f7ggDLU4Fo/5zpGVdL9Ou5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="319382362"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="319382362"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 04:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="757608932"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="757608932"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2022 04:24:25 -0800
Message-ID: <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
Date:   Mon, 19 Dec 2022 14:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-usb@vger.kernel.org
References: <Y45iXb6VCNiz7ZVd@lenoch> <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xHCI host dies on device unplug
In-Reply-To: <Y5zkCxQqBWR+/b4F@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.12.2022 23.32, Ladislav Michl wrote:
> On Fri, Dec 16, 2022 at 12:13:23PM +0200, Mathias Nyman wrote:
>> On 15.12.2022 18.12, Ladislav Michl wrote:
>>> +Cc Mathias as he last touched this code path and may know more :)
>>>
>>> On Tue, Dec 06, 2022 at 02:17:08PM +0100, Ladislav Michl wrote:
>>>> On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
>>>>> I'm running current linux.git on custom Marvell OCTEON III CN7020
>>>>> based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
>>>>> bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
>>>>> bcdDevice= 0.00) works without issues, while Ralink WiFi dongle
>>>>> (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
>>>>> disconnect:
>>>>> xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
>>>>> xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
>>>>> xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
>>>>>
>>>>> Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
>>>>> to tell if there is any errata :/ In case anyone see a clue in debug
>>>>> logs bellow, I'll happily give it a try.
>>>>
>>>> So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
>>>> instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
>>>> I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
>>>> clock init is worth to be verified...
>>>
>>> After all whenever xhci dies with "xHCI host not responding to stop endpoint
>>> command" depends also on temperature, so there seems to be race somewhere.
>>>
>>> As a quick and dirty verification, whenever xhci really died, following patch
>>> was tested and it fixed issue. It just treats ep as if stop endpoint command
>>> succeeded. Any clues? I'll happily provide more traces.
>>
>> It's possible the controller did complete the stop endpoint command but driver
>> didn't get the interrupt for the event for some reason.
>>

Looks like controller didn't complete the stop endpoint command.

Event for last completed command (before cycle bit change "c" -> "C") was:
   0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,

This was for command at 35e81a0, which in the command ring was:
   0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c

The stop endpoint command was the next command queued, at 35e81b0:
   0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c

There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.

Was this the only device connected? If so does connecting another usb device to another root port help?
Just to test if the host for some reason partially stops a while after last device disconnect?

Another thing is that the stop endpoint command fails after three soft reset tries,
does disabling soft reset help?

Either add somwehere:

xhci->quirks |= XHCI_NO_SOFT_RETRY;

or:

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b07d3740f554..aa1c92a72916 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2515,7 +2515,7 @@ static int process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
                 remaining       = 0;
                 break;
         case COMP_USB_TRANSACTION_ERROR:
-               if (xhci->quirks & XHCI_NO_SOFT_RETRY ||
+               if (1 || xhci->quirks & XHCI_NO_SOFT_RETRY ||
                     (ep_ring->err_count++ > MAX_SOFT_RETRY) ||
                     le32_to_cpu(slot_ctx->tt_info) & TT_SLOT)
                         break;



Just for reference, the last events and commands:

  # cat /sys/kernel/debug/usb/xhci/xhci-hcd.0.auto/event-ring/trbs

  0x00000000028f5520: TRB 00000000036c9ce0 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
  0x00000000028f5530: TRB 00000000036c9d10 status 'Success' len 0 slot 1 ep 1 type 'Transfer Event' flags e:c
  0x00000000028f5540: TRB 00000000030fa9a0 status 'USB Transaction Error' len 3860 slot 1 ep 3 type 'Transfer Event' flags e:c
  0x00000000028f5550: TRB 00000000035e8180 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
  0x00000000028f5560: TRB 0000000001000000 status 'Success' len 0 slot 0 ep 0 type 'Port Status Change Event' flags e:c
  0x00000000028f5570: TRB 00000000030fa9a0 status 'USB Transaction Error' len 3860 slot 1 ep 3 type 'Transfer Event' flags e:c
  0x00000000028f5580: TRB 00000000035e8190 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c
  0x00000000028f5590: TRB 00000000030fa9a0 status 'USB Transaction Error' len 3860 slot 1 ep 3 type 'Transfer Event' flags e:c
  0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c

  # cat /sys/kernel/debug/usb/xhci/xhci-hcd.0.auto/command-ring/trbs
  0x00000000035e8120: Stop Ring Command: slot 1 sp 0 ep 3 flags c
  0x00000000035e8130: Set TR Dequeue Pointer Command: deq 00000000030fa891 stream 0 slot 1 ep 3 flags c
  0x00000000035e8140: Stop Ring Command: slot 1 sp 0 ep 3 flags c
  0x00000000035e8150: Set TR Dequeue Pointer Command: deq 00000000030fa8a1 stream 0 slot 1 ep 3 flags c
  0x00000000035e8160: Stop Ring Command: slot 1 sp 0 ep 3 flags c
  0x00000000035e8170: Set TR Dequeue Pointer Command: deq 00000000030fa8b1 stream 0 slot 1 ep 3 flags c
  0x00000000035e8180: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
  0x00000000035e8190: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
  0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
  0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
  
-Mathias
