Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17A6653095
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 13:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiLUMKx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 07:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiLUMKq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 07:10:46 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5742628
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 04:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671624644; x=1703160644;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=FonXqvC3MdpAUmoUeG7HU6VzUlq963VLfVuVKg/zpm8=;
  b=U6VFL+TiqLTUxaNClIxbExDS6TuTeXAAszCKLwa2pOhqepEaPHwhW3ic
   UAOlw9x/c721A5rR2Q9U8O95CHdo4H4uISEDySFTarbnyzkLipsLJuTH5
   t9dqR/YqkFT89sdY07ihxzdsQQ0R/fnvcfczy2MxVXNEdfSyKFfkLM3br
   Cdef96am5Y7qAtVDABru2xdThcD7AVl1i+27Vcr6zcTl33SumqaIItLvV
   196DfooUpAU108E1w2Un7p8u877UNjcxOHbCCMKtFmHg4N0pUVSbSQ9d5
   39Ha1CfUulNl40cVZOesjfbYUZC650sVGlkr7JTanCwBLnMfspOF3lXH6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="321034914"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="321034914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 04:10:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="714802896"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="714802896"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2022 04:10:42 -0800
Message-ID: <e890f735-25a6-6855-11d4-e6bf82670181@linux.intel.com>
Date:   Wed, 21 Dec 2022 14:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-usb@vger.kernel.org, Sneeker Yeh <sneeker.yeh@gmail.com>
References: <Y45iXb6VCNiz7ZVd@lenoch> <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch> <Y6Dbh1xJucfNvwXq@lenoch> <Y6KyWqnHi1TFN0pa@lenoch>
 <6ac1cee8-b58a-b53f-2d0f-94336ac039b1@linux.intel.com>
 <Y6Lbxhc/98QA6dMU@lenoch>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xHCI host dies on device unplug
In-Reply-To: <Y6Lbxhc/98QA6dMU@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.12.2022 12.11, Ladislav Michl wrote:
> On Wed, Dec 21, 2022 at 11:58:42AM +0200, Mathias Nyman wrote:
>> On 21.12.2022 9.14, Ladislav Michl wrote:
>>> +Cc: Sneeker Yeh
>>>
>>> On Mon, Dec 19, 2022 at 10:45:43PM +0100, Ladislav Michl wrote:
>>>> On Mon, Dec 19, 2022 at 07:31:02PM +0100, Ladislav Michl wrote:
>>>>> On Mon, Dec 19, 2022 at 02:25:46PM +0200, Mathias Nyman wrote:
>>>>>>
>>>>>> Looks like controller didn't complete the stop endpoint command.
>>>>>>
>>>>>> Event for last completed command (before cycle bit change "c" -> "C") was:
>>>>>>     0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,
>>>>>>
>>>>>> This was for command at 35e81a0, which in the command ring was:
>>>>>>     0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
>>>>>>
>>>>>> The stop endpoint command was the next command queued, at 35e81b0:
>>>>>>     0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
>>>>>>
>>>>>> There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.
>>>>>>
>>>>>> Was this the only device connected? If so does connecting another usb device to another root port help?
>>>>>> Just to test if the host for some reason partially stops a while after last device disconnect?
>>>>>
>>>>> Device is connected directly into SoC. Once connected into HUB, host doesn't die
>>>>> (as noted in other email, sorry for not replying to my own message, so it got lost)
>>>>> It seems as intentional (power management?) optimization. If another device is
>>>>> plugged in before 5 sec timeout expires, host completes stop endpoint command.
>>>>>
>>>>> Unfortunately I cannot find anything describing this behavior in
>>>>> documentation, so I'll ask manufacturer support.
>>>>
>>>> As support is usually slow I asked search engine first and this sounds
>>>> familiar:
>>>> "Synopsis Designware USB3 IP earlier than v3.00a which is configured in silicon
>>>> with DWC_USB3_SUSPEND_ON_DISCONNECT_EN=1, would need a specific quirk to prevent
>>>> xhci host controller from dying when device is disconnected."
>>>>
>>>> usb: dwc3: Add quirk for Synopsis device disconnection errata
>>>> https://patchwork.kernel.org/project/linux-omap/patch/1424151697-2084-5-git-send-email-Sneeker.Yeh@tw.fujitsu.com/
>>>>
>>>> Any clue what happened with that? I haven't found any meaningfull traces...
>>>
>>> Lets step back a bit. All test so far was done with mainline 6.1.0 kernel.
>>> I also tested Marvell's vendor tree, one based on 4.9.79, second on 5.4.30,
>>> both heavily patched. The last version of above patch I found is v5:
>>> https://lkml.org/lkml/2015/2/21/260
>>>
>>
>> Looked at that same series and turned patch 1/5 into a standalone quick hack that applies on 6.1
>>
>> Untested, does it work for you?
> 
> Applied on the top of you stop_endpoint_fixes, 6.1.0. is a base tree:
> [   24.800835] xhci-hcd xhci-hcd.0.auto: Delay clearing port-1 CSC
> [   24.806788] usb 1-1: USB disconnect, device number 2
> [   28.148451] ieee80211 phy0: rt2x00usb_vendor_request: Error - Vendor Request 0x07 failed for offset 0x101c with error -19
> [   29.828466] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
> [   29.856656] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> [   29.864804] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> [   29.949460] xhci-hcd xhci-hcd.0.auto: Late clearing port-1 CSC, portsc 0x202a0
> 
> What about checking whenever anything is still connected on command timeout
> and considering device autosuspended instead of killing it?
Agree that we shouldn't kill it now that we know about this case.

Any idea what happens to the unhandled commands that are queued.
Are they lost, or does host continue processing them after reconnect?

If stop endpoint command times out without any device connected we should
probably start by manually giving back pending/cancelled URBs.

There will probably be a couple more commands queued after this when endpoints
are dropped and usb device freed (disable xhci slot)
Need to figure out what to do with these.

host still seems to respond to register writes even if it doesn't handle commands,
so entering suspend should be easier to tackle.

-Mathias

> 
> 	ladis

