Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940BD54ADE7
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jun 2022 12:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242115AbiFNKGX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jun 2022 06:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241977AbiFNKGC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jun 2022 06:06:02 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED61A2E0A8
        for <linux-usb@vger.kernel.org>; Tue, 14 Jun 2022 03:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655201160; x=1686737160;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=sut4Yn+e5EcPqzK6t0XW7Uxz+/nzKV5TmarH0RW69CA=;
  b=n+gPL8RztwoEaroOcq44yQbF6MApAG+WxYfa3i106FcXlY3puQgRLPpp
   Lqr9tfmvT0eRb2R71GgoUN6fqxUUOfoYEESvYKwNHGWyVvmFcv2372w7o
   4Lss4oQm6snc26l43sTz8ddicZHjcSTqUWU135Toh5KBjIE3cZTHNaSDy
   tUExUU7YaVI05EwpM+/hAeH8ymWRPcxPWVPaPyhH8SFicJ7GYwNfp5jbr
   Oq51vogo1gK71RLUslG+uM2HIosG9CSi6WOfbTci6Yrom0Yx7h1iykq38
   UhuC3IBBez/Cg93GwaqF1AsK6uWucys7N50WHOscyb3mxF5Xd0m4ZBHGr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="276112582"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="276112582"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 03:06:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="726747551"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 14 Jun 2022 03:05:58 -0700
Message-ID: <a5e9da68-fcf8-a89d-8e52-9798bc929170@linux.intel.com>
Date:   Tue, 14 Jun 2022 13:07:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     Evan Green <evgreen@google.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        "Srivastava, Shobhit" <shobhit.srivastava@intel.com>
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
 <400be833-468c-be0d-c80a-f3617800750d@suse.com>
 <36fdbf28-47fa-522e-8789-23bb1afa9176@linux.intel.com>
 <YqCnkNMqBRCy3fdd@rowland.harvard.edu>
 <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
 <CAE=gft6GEV58buVgErAD2O+SHJBbf+KubiBge_y4NXYaojnKAw@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
In-Reply-To: <CAE=gft6GEV58buVgErAD2O+SHJBbf+KubiBge_y4NXYaojnKAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9.6.2022 18.08, Evan Green wrote:
> On Thu, Jun 9, 2022 at 12:58 AM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
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
>>
>> To avoid turning off VBus in hibernate we could limit port power bit clearing
>> to xHC hosts that don't have the Port Power Control (PPC) capability flag.
>>
>> We know these xHC hosts don't control power switches, and clearing PP won't turn
>> off VBus (xhci 5.4.8, PORTRSC)
>>
>> This could be a solution for some hosts, but probably not cover all.
>> Not sure if the hardware this was reported on has PPC flag set.
> 
> It appears it does not, HCCPARAMS1 for both USB controllers seems to
> be 0x20007fc1 (missing bit 3). You can check my work in case I made an
> error here: https://pastebin.com/9raZc63N
> -Evan

Thanks, good to know.
So if disabling ports in hibernate doesn't work then we could turn off port power for
hosts with PPC==0. It should at least solve the issue for this particular system,
and not change current VBus policy in hibernate.

-Mathias
