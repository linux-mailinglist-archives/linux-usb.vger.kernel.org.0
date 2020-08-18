Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76662480DD
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 10:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgHRIoS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 04:44:18 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2611 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726043AbgHRIoR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 04:44:17 -0400
Received: from lhreml724-chm.china.huawei.com (unknown [172.18.7.106])
        by Forcepoint Email with ESMTP id 647FAD7C292D5FA4C51C;
        Tue, 18 Aug 2020 09:44:16 +0100 (IST)
Received: from [127.0.0.1] (10.210.172.123) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Tue, 18 Aug
 2020 09:44:15 +0100
From:   John Garry <john.garry@huawei.com>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com>
 <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
 <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com>
 <20200814180720.GE1891694@smile.fi.intel.com>
 <20200814195119.GA45072@rowland.harvard.edu>
 <CAHp75VdMXd3LWLM5ooBsWGZnSXnJBW3R5gH9Cpux0EHmcxjTvQ@mail.gmail.com>
 <20200815015000.GA52242@rowland.harvard.edu>
 <CAHp75VdCCe=sKuas+sdu__qYVSEO4pKqZ8RGq_Jxaoh91HXZ+g@mail.gmail.com>
 <20200816160550.GB86937@rowland.harvard.edu>
 <20200817113509.GJ1891694@smile.fi.intel.com>
Message-ID: <62845ad6-1b09-e391-6b2f-14f2ef2b26f2@huawei.com>
Date:   Tue, 18 Aug 2020 09:41:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200817113509.GJ1891694@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.210.172.123]
X-ClientProxiedBy: lhreml708-chm.china.huawei.com (10.201.108.57) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/08/2020 12:35, Andy Shevchenko wrote:
> On Sun, Aug 16, 2020 at 12:05:50PM -0400, Alan Stern wrote:
>> On Sun, Aug 16, 2020 at 11:33:14AM +0300, Andy Shevchenko wrote:
>>> On Sat, Aug 15, 2020 at 4:50 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>>>> On Sat, Aug 15, 2020 at 12:55:57AM +0300, Andy Shevchenko wrote:
> 
> ...
> 
>>>> Sure, the difference in ordering was pretty obvious.  What is not
>>>> obvious is why this should cause a problem.
>>>
>>> It may be not causing any problem right now, but with all these small
>>> steps we may come to the case like DWC3 removal mess.
>>>
>>>> Do you think that the host controller driver is going to try to use the
>>>> IRQ vector somewhere between the pci_free_irq_vectors call and the
>>>> usb_put_hcd call?  If that's not going to happen then I don't see what
>>>> difference the order of the two calls makes.
>>>
>>> I think that this is a bit incorrect to rely on side-effects to ruin
>>> the clear understanding of what ordering is going on. If you insist,
>>> you can take John's solution, but I won't give a tag on such.
>>>
>>> Also take into consideration the possible copy'n'paste of this example
>>> to other drivers. I have seen a lot of bad examples were
>>> copied'n'pasted all over the kernel during my reviews. I don't want to
>>> give another one.
>>>
>>> So, the review process, in my opinion, should be slightly broader that
>>> we usually understand it, i.e. take into account:
>>> - *run-time* bisectability
>>> - possible copy'n'paste of the code excerpts
>>
>> I see.  So you use "correct" in the broader sense of "good form" as well
>> as strict correctness.  (It was confusing because I wouldn't conflate
>> those two different concepts.)
> 
> Thank you for clarification, I'm not native speaker and this is a good learn
> to me. I will try to use better wording in the future.
> 
>> Okay, now your reply makes sense.
> 
> Thanks!
> 

It looks like that function [pci_free_irq_vectors()] is harmless when 
the vectors aren't allocated, so it should be possible to always call it 
always and drop the hcd flags check. But then this pattern may not be 
liked either.

Anyway, I guess you guys can sort this out. I'm just trying to help 
identify issues.

Thanks,
John
