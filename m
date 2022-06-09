Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DCA544531
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 09:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238994AbiFIH6O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 03:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbiFIH6N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 03:58:13 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACD3EAC
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 00:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654761491; x=1686297491;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=B9HPmKizTXe83PDDS/VvSF9Pk0/uXH4/CHpcZ36jiSk=;
  b=d7IjNGR0SEUm/fbQm9U0+GVmVzJVhqXSpbGgQdOXUoGcVS4WhvESzNZS
   CPAXKsLcQvRB3jFYvQ4o0uHGakY0+jmHXuqW/Y38irXNG+jPT0x6VMgvp
   07QJeYorIhlVOm6Y1ZLHKjIx8pb1uIO3vCTMeTvzcY45LlGgwmxwBgxbG
   Eex0Pw3ngRxz+y+YEGvvRWTE4H2Qq0H0ywMor/Vntw+T5BsQLXmLAO8Wa
   Fbz90Brj0KtuAo7Z3NdDk1ChKka2IC456IV/zvA+qfP2RHGqhOpa9EEN6
   ORnKZrKggrtUR4W9t5+qldxUS0ftnUrkrcpuA4yjfUZLufO0wFoqukwao
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="363518920"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="363518920"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 00:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="724299214"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2022 00:58:09 -0700
Message-ID: <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
Date:   Thu, 9 Jun 2022 10:59:37 +0300
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
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
In-Reply-To: <YqCnkNMqBRCy3fdd@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8.6.2022 16.43, Alan Stern wrote:
> On Wed, Jun 08, 2022 at 02:47:22PM +0300, Mathias Nyman wrote:
>> On 8.6.2022 11.19, Oliver Neukum wrote:
>>>
>>>
>>> On 07.06.22 15:58, Mathias Nyman wrote:
>>>
>>> Hi,
>>>
>>>> In shutdown (S5), with xHCI as host, this can be solved fairly easily
>>>> by turning off roothub port power in the .shutdown path.
>>>
>>> That would suck for the people who charge their phone from their
>>> computer.
>>
>> Good point.
>> My guess is that xHC port power bits won't actually turn off VBus for those
>> Sleep-and-charge, or Always-on ports.
>> VBus is allowed to be on even if port is in power-off state, but usb link state
>> should be forced to ss.Disabled from other states, like U3.
>>
>> Need to try it out, it's possible this turns off VBus for some usb-A ports
>> on some older systems that earlier (accidentally?) supplied VBus on
>> "normal" ports after shutdown.
> 
> How about turning off port power _only_ in the shutdown or unbind path,
> and setting the port link states to ss.Disabled in the poweroff or
> poweroff_noirq stage of hibernation (if wakeup is disabled)?  Would that
> solve the problem of the firmware needing to time out on reboot?
> 

That would be optimal, but unfortunately xHCI doesn't support setting link
state directly to ss.Disabled. Only way is to clear port power (PP) bit.

To avoid turning off VBus in hibernate we could limit port power bit clearing
to xHC hosts that don't have the Port Power Control (PPC) capability flag.

We know these xHC hosts don't control power switches, and clearing PP won't turn
off VBus (xhci 5.4.8, PORTRSC)

This could be a solution for some hosts, but probably not cover all.
Not sure if the hardware this was reported on has PPC flag set.

Thanks
Mathias
