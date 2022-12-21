Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 109BD652EC6
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 10:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbiLUJpJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 04:45:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234601AbiLUJpC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 04:45:02 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B9821E33
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 01:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671615901; x=1703151901;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=AEeOFab2vWPE1QyUIgnDsoqAX1bCJRPPIcOwDT0cmYE=;
  b=Udcs3BzoheoJ9Evs+1xQgOi6bibd4w4vu9L1xAMn+J7A9AtQrwGnLv4b
   M9UlETpfTdcH9yK3nhi4R8Ii0HKLIO/RsUOev+YKIGGzycxIdEwT1l7Jg
   mUwMdYwxklZtc4m6APaIvjU2TXGMzZ/3VZazNRX2MmeKfhCGzz0clG6nd
   ZTSGuu1XsBNQdOKjJhunpRfNVYBoJSo9bTINOBi+157F8oU8dXU+rugRc
   oDosf30ZEzu7Y0+rAJ3DJ5OlJbBOC5YR9xr+KpReaD1zM8M1NopYFtapq
   yspZsofTt1ZD+NU5wB1tU9/SCQxsRSJixJBIDWq1maWaRsX8ifyEwQ2L+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="299510188"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="299510188"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 01:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="644773851"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; 
   d="scan'208";a="644773851"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga007.jf.intel.com with ESMTP; 21 Dec 2022 01:44:59 -0800
Message-ID: <575dba2f-2e97-601b-0623-7cdd123c3f80@linux.intel.com>
Date:   Wed, 21 Dec 2022 11:46:21 +0200
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
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch> <Y6Dbh1xJucfNvwXq@lenoch> <Y6FrQm5mYrwAnbFt@lenoch>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xHCI host dies on device unplug
In-Reply-To: <Y6FrQm5mYrwAnbFt@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.12.2022 9.58, Ladislav Michl wrote:
> On Mon, Dec 19, 2022 at 10:45:43PM +0100, Ladislav Michl wrote:
>> On Mon, Dec 19, 2022 at 07:31:02PM +0100, Ladislav Michl wrote:
>>> On Mon, Dec 19, 2022 at 02:25:46PM +0200, Mathias Nyman wrote:
>>>> Looks like controller didn't complete the stop endpoint command.
>>>>
>>>> Event for last completed command (before cycle bit change "c" -> "C") was:
>>>>    0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,
>>>>
>>>> This was for command at 35e81a0, which in the command ring was:
>>>>    0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
>>>>
>>>> The stop endpoint command was the next command queued, at 35e81b0:
>>>>    0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
>>>>
>>>> There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.
>>>>
>>>> Was this the only device connected? If so does connecting another usb device to another root port help?
>>>> Just to test if the host for some reason partially stops a while after last device disconnect?
>>>
>>> Device is connected directly into SoC. Once connected into HUB, host doesn't die
>>> (as noted in other email, sorry for not replying to my own message, so it got lost)
>>> It seems as intentional (power management?) optimization. If another device is
>>> plugged in before 5 sec timeout expires, host completes stop endpoint command.
>>>
>>> Unfortunately I cannot find anything describing this behavior in
>>> documentation, so I'll ask manufacturer support.
>>
>> As support is usually slow I asked search engine first and this sounds
>> familiar:
>> "Synopsis Designware USB3 IP earlier than v3.00a which is configured in silicon
>> with DWC_USB3_SUSPEND_ON_DISCONNECT_EN=1, would need a specific quirk to prevent
>> xhci host controller from dying when device is disconnected."
>>
>> usb: dwc3: Add quirk for Synopsis device disconnection errata
>> https://patchwork.kernel.org/project/linux-omap/patch/1424151697-2084-5-git-send-email-Sneeker.Yeh@tw.fujitsu.com/
>>
>> Any clue what happened with that? I haven't found any meaningfull traces...
> 
> Just for completeness, this turned into:
> 41135de1e7fd ("usb: xhci: add quirk flag for broken PED bits")
> and it is enabled:
> cc params 0x0220f065 hci version 0x100 quirks 0x0000000002010010
> 
> However I do not see original logic there, clearing PORT_CSC before
> stopping endpoint.

CSC is cleared to allow xHC future port change events reporting.
we don't want to miss when something is re-connected.

Hardware shouldn't stop running based on cleared CSC, it should stop when
driver clears the USBCMD register Run/Stop bit.

-Mathias
