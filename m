Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077AF54638E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 12:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245312AbiFJK30 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 06:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245467AbiFJK3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 06:29:24 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4180140E0
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654856961; x=1686392961;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=HZuIijc8fWgTGCK4Z3i/HNb7Z1JBlts+rsxDupZdIBc=;
  b=jk/fA8fyDeP90GBH3N3dr0dUZug2S27w4sCXtNrhdTsYASffNegT71An
   zzEg5lWNX4gHWWI48Sxk4hfwXtn1iJYZaejuuzPzayUaBscwN8jaupNFa
   FiuDgx7MhDMzPFOQVy+kE+ZrkX8zbeAx2AdHak658CKWXEKqPFtD5mWt6
   XmUkyIYl443Z/+DjmEYVaCHXCgdu5TjiYb5suXH1OYCgKNe4hqeNvPidk
   76RagiRVR398MHfKbbhxeFy/SeUCcCktzWnLOCf7SjgDSqRrGpjw10tBy
   EbdnApIXCRk1CpfQjGd+i2Yi62XPUfb/wVE8HRiHoBbs1Bl+TX77SSpnf
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278388541"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="278388541"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 03:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="724906779"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2022 03:29:19 -0700
Message-ID: <5b00c02f-646d-591f-9371-e3d22a1ba9f1@linux.intel.com>
Date:   Fri, 10 Jun 2022 13:30:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        evgreen@google.com, shobhit.srivastava@intel.com
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
 <400be833-468c-be0d-c80a-f3617800750d@suse.com>
 <36fdbf28-47fa-522e-8789-23bb1afa9176@linux.intel.com>
 <YqCnkNMqBRCy3fdd@rowland.harvard.edu>
 <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
 <YqH6Rsc59Bj8tspu@rowland.harvard.edu>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
In-Reply-To: <YqH6Rsc59Bj8tspu@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9.6.2022 16.48, Alan Stern wrote:
> On Thu, Jun 09, 2022 at 10:59:37AM +0300, Mathias Nyman wrote:
>> On 8.6.2022 16.43, Alan Stern wrote:
>>> On Wed, Jun 08, 2022 at 02:47:22PM +0300, Mathias Nyman wrote:
>>>> On 8.6.2022 11.19, Oliver Neukum wrote:
>>>>>
>>>>>
>>>>> On 07.06.22 15:58, Mathias Nyman wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>>> In shutdown (S5), with xHCI as host, this can be solved fairly easily
>>>>>> by turning off roothub port power in the .shutdown path.
>>>>>
>>>>> That would suck for the people who charge their phone from their
>>>>> computer.
>>>>
>>>> Good point.
>>>> My guess is that xHC port power bits won't actually turn off VBus for those
>>>> Sleep-and-charge, or Always-on ports.
>>>> VBus is allowed to be on even if port is in power-off state, but usb link state
>>>> should be forced to ss.Disabled from other states, like U3.
>>>>
>>>> Need to try it out, it's possible this turns off VBus for some usb-A ports
>>>> on some older systems that earlier (accidentally?) supplied VBus on
>>>> "normal" ports after shutdown.
>>>
>>> How about turning off port power _only_ in the shutdown or unbind path,
>>> and setting the port link states to ss.Disabled in the poweroff or
>>> poweroff_noirq stage of hibernation (if wakeup is disabled)?  Would that
>>> solve the problem of the firmware needing to time out on reboot?
>>>
>>
>> That would be optimal, but unfortunately xHCI doesn't support setting link
>> state directly to ss.Disabled. Only way is to clear port power (PP) bit.

Correction,  we can get USB 3 links to ss.Disabled and port to Disabled state
by setting the PORTSC PED bit.
USB 2 link goes to Polling, port Disabled.

Port power is left untouched.
This could work.

> 
> What would happen if you clear the PP bit, wait for the link state to
> become ss.Disabled, and then turn PP back on?

For USB 3 devices host will detect the device, and do all steps until device is
in an enabled U0 state. All without driver interaction, and even if host is not running.

USB 2 devices probably stop in Disabled/link:Polling waiting for driver port reset

> 
>> To avoid turning off VBus in hibernate we could limit port power bit clearing
>> to xHC hosts that don't have the Port Power Control (PPC) capability flag.
>>
>> We know these xHC hosts don't control power switches, and clearing PP won't turn
>> off VBus (xhci 5.4.8, PORTRSC)
>>
>> This could be a solution for some hosts, but probably not cover all.
>> Not sure if the hardware this was reported on has PPC flag set.
> 
> In theory the problem could affect systems having any kind of xHCI
> hardware, since it's really a defect in the system firmware.
> 
> Doesn't Windows have a hibernation mode?  Do you know what state it
> leaves the xHCI ports in during hibernation?

Good question, haven't looked into what windows does here.
I think this problematic boot firmware is specific for non-windows systems.
but again, not sure.
Worth looking into

Thanks

-Mathias
