Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1F558D9B7
	for <lists+linux-usb@lfdr.de>; Tue,  9 Aug 2022 15:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244349AbiHINsB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Aug 2022 09:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244035AbiHINrn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Aug 2022 09:47:43 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1151E1E3E8
        for <linux-usb@vger.kernel.org>; Tue,  9 Aug 2022 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660052842; x=1691588842;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=C0FRy2jt29lHeiVFyDDOs+oivaXFS8hGDk57UF78i+Q=;
  b=g4uEDpJB1RLadW2ZxW0GR92HSPWUDse6qeEEcmrgX308QBTgJ5n25Ny5
   UYmpatLfu7be0btjeGxO4rPP3P4PlSMWZMJ/ukrPvrb6fvrmIeGg1LH1v
   +B3f7orFWxrY8xPSqPxZa6dkC+LHQRNfSB+CbMK49up8+TzxCZIgOu7Td
   d0Zhr9Y0oTcjOlINvxHPQ7zAASWUqLUJd4gUzUqHxuN5Ah3y6JxsNMzsp
   e1skmD6jRaeE2Eso2dcM1GfP95o75bXU3elZ5uRJtgbrIYd7umzqYzLLp
   wlqwFnp0me5KQo3OA09MtKgUhmi8RKelkfsYFbH4j6+LqWUzyvD0szwnq
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="377125520"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="377125520"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 06:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="608216401"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2022 06:47:20 -0700
Message-ID: <ceb50ab3-f244-be72-68ec-93591a785a3a@linux.intel.com>
Date:   Tue, 9 Aug 2022 16:49:02 +0300
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
 <a5e9da68-fcf8-a89d-8e52-9798bc929170@linux.intel.com>
 <CAE=gft6ZFbdx8_M6qFZ6710YfLoe+XdoAdWnQOfEGkUFOz8EOA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
In-Reply-To: <CAE=gft6ZFbdx8_M6qFZ6710YfLoe+XdoAdWnQOfEGkUFOz8EOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21.7.2022 0.53, Evan Green wrote:
> On Tue, Jun 14, 2022 at 3:06 AM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> On 9.6.2022 18.08, Evan Green wrote:
>>> On Thu, Jun 9, 2022 at 12:58 AM Mathias Nyman
>>> <mathias.nyman@linux.intel.com> wrote:
>>>>
>>>> On 8.6.2022 16.43, Alan Stern wrote:
>>>>> On Wed, Jun 08, 2022 at 02:47:22PM +0300, Mathias Nyman wrote:
>>>>>> On 8.6.2022 11.19, Oliver Neukum wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 07.06.22 15:58, Mathias Nyman wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>>> In shutdown (S5), with xHCI as host, this can be solved fairly easily
>>>>>>>> by turning off roothub port power in the .shutdown path.
>>>>>>>
>>>>>>> That would suck for the people who charge their phone from their
>>>>>>> computer.
>>>>>>
>>>>>> Good point.
>>>>>> My guess is that xHC port power bits won't actually turn off VBus for those
>>>>>> Sleep-and-charge, or Always-on ports.
>>>>>> VBus is allowed to be on even if port is in power-off state, but usb link state
>>>>>> should be forced to ss.Disabled from other states, like U3.
>>>>>>
>>>>>> Need to try it out, it's possible this turns off VBus for some usb-A ports
>>>>>> on some older systems that earlier (accidentally?) supplied VBus on
>>>>>> "normal" ports after shutdown.
>>>>>
>>>>> How about turning off port power _only_ in the shutdown or unbind path,
>>>>> and setting the port link states to ss.Disabled in the poweroff or
>>>>> poweroff_noirq stage of hibernation (if wakeup is disabled)?  Would that
>>>>> solve the problem of the firmware needing to time out on reboot?
>>>>>
>>>>
>>>> That would be optimal, but unfortunately xHCI doesn't support setting link
>>>> state directly to ss.Disabled. Only way is to clear port power (PP) bit.
>>>>
>>>> To avoid turning off VBus in hibernate we could limit port power bit clearing
>>>> to xHC hosts that don't have the Port Power Control (PPC) capability flag.
>>>>
>>>> We know these xHC hosts don't control power switches, and clearing PP won't turn
>>>> off VBus (xhci 5.4.8, PORTRSC)
>>>>
>>>> This could be a solution for some hosts, but probably not cover all.
>>>> Not sure if the hardware this was reported on has PPC flag set.
>>>
>>> It appears it does not, HCCPARAMS1 for both USB controllers seems to
>>> be 0x20007fc1 (missing bit 3). You can check my work in case I made an
>>> error here: https://pastebin.com/9raZc63N
>>> -Evan
>>
>> Thanks, good to know.
>> So if disabling ports in hibernate doesn't work then we could turn off port power for
>> hosts with PPC==0. It should at least solve the issue for this particular system,
>> and not change current VBus policy in hibernate.
> 
> Did a new version of this ever make it out?
> -Evan

started writing a patch before vacation that sets port link to ss.Disabled instead of
turning off power power.

Still has some FIXME lines and extra prints, but should be testable.
pushed to a fix_port_disable_s4 topic branch on top of 5.19:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_port_disable_s4
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_port_disable_s4

There was also one reported regression with powering off ports in shutdown S5, probably need
to sort that out before pushing this.

Thanks
-Mathias
