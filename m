Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8414D70DB12
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 13:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236465AbjEWLB6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 07:01:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236457AbjEWLB5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 07:01:57 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7057C11A
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684839712; x=1716375712;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=yLp2MEhRQ+10P9QChmLujNcUwDJYuHxjmyF582J5q4Y=;
  b=KewBf39YK//vocVaYZyRO0btYjMoGukvn4FLCDl/s3ghiCi5ybqXIb9Z
   4edlcu7zXma6RHVmfp1Cr/EjVJC/jaLMGC3oi+16Wf9lpwwmsTvEC6QFW
   ZCWckBaXU71nvhJXH7zxMhgLoXzcarbIlK8JRvqrg985YL6rAjhsko1iF
   pYI5kYeLJctu5CWjQ4p058rrn49yvXQpM6FbnD0MggKbK4ScS96TdiM//
   gZuSti5aW9YvLjR4Ohpv17lYui/88iKUJkdcCAUHQiT80QTFRsq9gLqxj
   zCBi2PrZVWlTi1yO1Gdm23YfeyyVlN1uSGdCMWzNVW0Aab88LlgXfJJUo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="355556849"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="355556849"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 04:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="706954292"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="706954292"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga007.fm.intel.com with ESMTP; 23 May 2023 04:01:50 -0700
Message-ID: <08014089-e158-3e62-57e9-112930a71a54@linux.intel.com>
Date:   Tue, 23 May 2023 14:03:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To:     =?UTF-8?B?TW/FhCwgVG9tYXN6?= <tomasz.mon@nordicsemi.no>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
Cc:     "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
        "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
        "michael.jamet@intel.com" <michael.jamet@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
 <20230523090132.GO45886@black.fi.intel.com>
 <551c6ce270bac239fbcebd5280e426851b84ee0e.camel@nordicsemi.no>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: USB 2.0 host controller for Thunderbolt 4
In-Reply-To: <551c6ce270bac239fbcebd5280e426851b84ee0e.camel@nordicsemi.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.5.2023 12.45, Moń, Tomasz wrote:
> On Tue, 2023-05-23 at 12:01 +0300, Mika Westerberg wrote:
>> On Tue, May 23, 2023 at 10:53:17AM +0200, Tomasz Moń wrote:
>>> When I connect Thunderbolt 3 dock, two new host controllers show up:
>>>    * usb5 - USB 2.0 High-Speed
>>>    * usb6 - USB 3.0 SuperSpeed
>>>
>>> Devices connected through Thunderbolt 3 dock end up on expected host
>>> controllers, i.e. Low/Full/High-Speed devices connect to usb5 and
>>> SuperSpeed devices end up on usb6.
>>>
>>> Is Thunderbolt 3 essentially tunnelling the USB 2.0 traffic (by
>>> tunnelling PCIe xHCI host controller traffic) on the superspeed
>>> differential pairs (operating in alternate TBT3 mode)?
>>
>> It is not. The USB 2.x wires are separate on type-C cables.
> 
> Yes, the USB 2.x wires are separate on type-C cables. But this does not
> answer the question why there is new USB 2.0 High-Speed controller
> showing up that the devices do connect to.
> 
> Wouldn't the Low/Full/High-Speed devices traffic appear on usb3 (PCH
> controller) if the USB 2.x wires in type-C cable were really used in
> this case (instead of the usb5 which appeared only after Thunderbolt 3
> was connected)?
> 
> I forgot to mention that the Thunderbolt 3 docking station in question
> has Intel Corporation DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C
> 2015] and ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller.
> 
> The way I understand it, that the usb5 and usb6 come from ASM1042A
> (which implements xHCI). The communication would then be:
>    * Dell Latitude <-> Thunderbolt 3 dock (TBT3 tunnelling PCIe xHCI)
>    * ASM1042 (in Thunderbolt 3 dock) <-> USB 2.x devices connected to
> the dock (data never makes it to type-C D+/D- wires, because it is
> ASM1042 that generates the tokens)
> 
> Is there a flaw in my understanding?
> 
>>> When I connect Thunderbolt 4 dock, the SuperSpeed devices connected to
>>> dock ports end up on usb2 host controller. However, Low/Full/High-Speed
>>> devices do end up on usb3 (USB 3.2 xHCI) and not on usb1 (Alder Lake-P
>>> Thunderbolt 4 USB Controller).
>>
>> Yes, that's expected the TBT USB controller (on the host) does not
>> support USB 2.x so it is routed to the PCH one.
> 
> Should the driver be changed to not even register the dummy USB 2.0
> interface in such case?
> 

Even if nothing is routed to the TBT USB xHCI USB 2.x ports, the controller
itself reports it supports both Low/Full/High-Speed ports and SuperSpeed
ports, so driver creates roothubs for both.

This might be due to xHCI spec 7.2.2.1 USB Protocols stating:
"USB 2.0 and USB 3.x Supported Protocol Capabilities shall be declared
if any USB3 connectors are associated with xHCI Root Hub ports that enable user
attached devices. Refer to sections 11.1 and 11.3 in the USB3 spec."

xhci driver was recently changed to support xHCI hosts with only one
roothub (USB 2.x or USB 3.x) for xHCI platform devices, there is some minor
work needed in xhci-pci.c to support only one roothub for PCI xHCI controllers.

But as long as the controller reports having both USB 2.x and USB 3.x ports the
driver will create roothubs for both.

Thanks
Mathias

