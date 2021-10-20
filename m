Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9AB9434FB7
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 18:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhJTQJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 12:09:09 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:43998 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbhJTQJI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Oct 2021 12:09:08 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 9A10A20CD190
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <YW5ajmF67RjuD7l5@kroah.com> <YW50ZLkVDkVuYdBp@kroah.com>
 <fb0e0bfc-ca56-e70b-5563-a23fe546f651@omp.ru>
 <20211019183521.GA1090528@rowland.harvard.edu>
 <28272bc7-d493-c0ec-f32b-57b0c45b18df@omp.ru>
Organization: Open Mobile Platform
Message-ID: <592a2ade-cd6c-4690-0bea-82b6b8549b7c@omp.ru>
Date:   Wed, 20 Oct 2021 19:06:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <28272bc7-d493-c0ec-f32b-57b0c45b18df@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/19/21 9:46 PM, Sergey Shtylyov wrote:
[...]
>>>>>> Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
>>>>>> The affected drivers use platform_get_irq() which can return IRQ0 (considered
>>>>>> invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
>>>>>> called at the end of the probe methods. I think that the solution to this issue
>>>>>> is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
>>>>>> patch set to get the things going...
>>>>>
>>>>> Why not fix the root of the problem for your platform that is failing to
>>>>> assign a valid irq for the device?
>>>>>
>>>>> Are you going to make this change to all callers of this function in the
>>>>> kernel tree?
>>>>
>>>> Also, you should have gotten a huge WARNING in your kernel log if this
>>>> happens to let you know that something bad is going on.
>>>
>>>    That's the relatively recent addition, yet it doesn't override IRQ0 to s/th
>>> like -EINVAL.
>>>
>>>> Is this patch
>>>> series going to really change any of that?
>>>
>>>    How? It doesn't touch drivers/base/platform.c...
>>>
>>>>
>>>> What is the root problem here that you are trying to paper over with
>>>> this patchset?
>>>
>>>    As I said, it would be preferrable to either deny IRQ0 in usb_add_hcd() or
>>> just don't try to filter it out. The real problem is that usb_add_hcd() does
>>> add a non-functioning HCD without the necessary IRQ handling (it only hooks
>>> an IRQ when it's non-zero).
>>
>> This is because some HCDs don't use interrupts (e.g., dummy-hcd).
> 
>    Ah, that was the missing piece of a puzzle, thanks!

   And some drivers prefer to manage the IRQs themselves too.

>    This series doesn't have an alternative then (other than ignoring :-))...

   Or overriding IRQ0 to an error code in platform_get_irq(), finally, of/c...

MBR, Sergey
