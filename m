Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA6064E936
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 11:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiLPKML (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 05:12:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230361AbiLPKMH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 05:12:07 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F03120BB
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 02:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671185525; x=1702721525;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=fMVMMWWne98PrD1p8Pgh6jDorAG3NfmCPhn8mXFBy4g=;
  b=kMyhTBSX9qlAVYPhDjY+4cAsPipg+vd/+hypRwO3zmm/k3fc0I/+Q5Ep
   TGKmL31N9FE6FlA1iJDFM4THFpmECTLjNDXhqg8KFfKIYUqwaGG/zbBjq
   2D7n0hbLsHVJN/E8r5FalXmrdFWpLgPWQ3bgFCW48MR759r7uzi2K5FOO
   zfQWVfM6JQ/fKc1x/HPw02gJMoDkBerg2Lo3s72re9niwPckM7iM42Bu8
   riUvLVYKyKCEQtImdX4PXE1cRmQaB0CrNFRRO8x0Xkz8gVOYzco9knvqd
   cHTOB01YtXb+fzIF1w2jU8/fAhTiacD5jRGp/q8P8jOnDfpRdIVl5SWC9
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="320110305"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="320110305"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 02:12:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10562"; a="718311285"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="718311285"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2022 02:12:03 -0800
Message-ID: <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
Date:   Fri, 16 Dec 2022 12:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>, linux-usb@vger.kernel.org
References: <Y45iXb6VCNiz7ZVd@lenoch> <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xHCI host dies on device unplug
In-Reply-To: <Y5tHWwHctY6wr+CJ@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15.12.2022 18.12, Ladislav Michl wrote:
> +Cc Mathias as he last touched this code path and may know more :)
> 
> On Tue, Dec 06, 2022 at 02:17:08PM +0100, Ladislav Michl wrote:
>> On Mon, Dec 05, 2022 at 10:27:57PM +0100, Ladislav Michl wrote:
>>> I'm running current linux.git on custom Marvell OCTEON III CN7020
>>> based board. USB devices like FTDI (idVendor=0403, idProduct=6001,
>>> bcdDevice= 6.00) Realtek WiFi dongle (idVendor=0bda, idProduct=8179,
>>> bcdDevice= 0.00) works without issues, while Ralink WiFi dongle
>>> (idVendor=148f, idProduct=5370, bcdDevice= 1.01) kills the host on
>>> disconnect:
>>> xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
>>> xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
>>> xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
>>>
>>> Unfortunately I do not have a datasheet for CN7020 SoC, so it is hard
>>> to tell if there is any errata :/ In case anyone see a clue in debug
>>> logs bellow, I'll happily give it a try.
>>
>> So I do have datasheet now. As a wild guess I tried to use dlmc_ref_clk0
>> instead of dlmc_ref_clk1 as a refclk-type-ss and it fixed unplug death.
>> I have no clue why, but anyway - sorry for the noise :) Perhaps Octeon's
>> clock init is worth to be verified...
> 
> After all whenever xhci dies with "xHCI host not responding to stop endpoint
> command" depends also on temperature, so there seems to be race somewhere.
> 
> As a quick and dirty verification, whenever xhci really died, following patch
> was tested and it fixed issue. It just treats ep as if stop endpoint command
> succeeded. Any clues? I'll happily provide more traces.

It's possible the controller did complete the stop endpoint command but driver
didn't get the interrupt for the event for some reason.

I wrote some patches that checks the event ring for this event during
timeout.

code is in a stop_endpoint_fixes branch in my tree:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git stop_endpoint_fixes
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=stop_endpoint_fixes

Another thing would be checking command and event rings for this stop endpoint command.
So Instead of killing host at timeout, do nothing, and check sysfs after the disconnect:

cat /sys/kernel/debug/usb/xhci/<address>/event-ring/trbs
cat /sys/kernel/debug/usb/xhci/<address>/command-ring/trbs

-Mathias

