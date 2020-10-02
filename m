Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5774280F64
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 11:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgJBJBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 05:01:31 -0400
Received: from aibo.runbox.com ([91.220.196.211]:40386 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725993AbgJBJBb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 05:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=iKgcxn0i1/cv46SgFMPp/05i4iv/GdMjt7BrOzXUMqE=; b=CiDs3gPR3UJl7ZWmxxAc8c1mr1
        3mT8MYl1iByMQOSG1hjJJZapU4UVOaxnqSq29xw2cl42x5aNBn/qbInxcjcP7IVzulwrvEWLckllU
        hE0SJh94v6zr3ra/hsoJa2RzsK8ZN+b6YFXV40L3Rzqqtk49Dfdrma5KBwcdDE05hRTJ/Ea3JMy8A
        c1YnxxISU2ErZK2CBJQr3FQjsLzWJYU4d4vjvTtSu55q1TXWapMZha7841PCqtLs6oLGnEEIX5pSh
        hKEvhm9/Upaz5symRfR3h3VSTs0v1feDu1ki2O/p+NLLq+FNUnveJmMpkjNGhgBSyQOuKGT7k7z3m
        kiJUcrPQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
        by mailtransmit03.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kOGwN-0001m0-UC; Fri, 02 Oct 2020 11:01:24 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kOGw7-0004sC-Fb; Fri, 02 Oct 2020 11:01:07 +0200
Subject: Re: [PATCH v3 0/4] Fixes for usbip and specialised USB driver
 selection
To:     Brooke Basile <brookebasile@gmail.com>, linux-usb@vger.kernel.org
Cc:     Bastien Nocera <hadess@hadess.net>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller@googlegroups.com
References: <20200922110703.720960-1-m.v.b@runbox.com>
 <36a8c401-029e-54ae-2468-04d557f3c31f@gmail.com>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <a0a61fc1-eb83-f4a3-1e06-63e0c67bf4ae@runbox.com>
Date:   Fri, 2 Oct 2020 12:00:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <36a8c401-029e-54ae-2468-04d557f3c31f@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/2/20 6:11 AM, Brooke Basile wrote:
> On 9/22/20 7:06 AM, M. Vefa Bicakci wrote:
>> Hello all,
>>
>> This is the third version of the patch sets originally published in the
>> e-mail thread thread at [1]. As mentioned in the same e-mail thread with
>> the e-mail at [2], I was able to find a more acceptable solution to the
>> issue reported by Andrey Konovalov, where usbip takes over the
>> dummy_hcd-provided devices set up by the USB fuzzing instance of the
>> syzkaller fuzzer.
>>
>> In summary, the approach involves:
>>
>> * Removal of the usbip_match function.
>> * Fixing two bugs in the specialised USB driver selection code.
>> * Accommodating usbip by changing the logic in the specialised USB
>>    driver selection code, while preserving legacy/previous behaviour.
>>
>> I have tested this patch set with Greg Kroah-Hartman's usb-next tree
>> based on v5.9-rc6 with the base commit mentioned below in this e-mail,
>> and I can report that usbip works as expected, with no regressions in
>> the usbip_test.sh self-test suite output compared to v4.14.119. I have
>> also verified that the apple-mfi-fastcharge driver is correctly used
>> when an iPhone is plugged in to my system. Finally, I can report that
>> Andrey Konovalov's "keyboard" test program making use of dummy_hcd,
>> found at [3], also works as expected.
>>
>> I would appreciate your comments.
>>
>> Thank you,
>>
>> Vefa
>>
>> [1] https://lore.kernel.org/linux-usb/CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com/
>> [2] https://lore.kernel.org/linux-usb/9f332d7b-e33d-ebd0-3154-246fbfb69128@runbox.com/
>> [3] https://github.com/xairy/raw-gadget
>>
>> Cc: Bastien Nocera <hadess@hadess.net>
>> Cc: Valentina Manea <valentina.manea.m@gmail.com>
>> Cc: Shuah Khan <shuah@kernel.org>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Alan Stern <stern@rowland.harvard.edu>
>> Cc: <syzkaller@googlegroups.com>
>>
>> M. Vefa Bicakci (4):
>>    Revert "usbip: Implement a match function to fix usbip"
>>    usbcore/driver: Fix specific driver selection
>>    usbcore/driver: Fix incorrect downcast
>>    usbcore/driver: Accommodate usbip
>>
>>   drivers/usb/core/driver.c    | 50 ++++++++++++++++++++++++------------
>>   drivers/usb/usbip/stub_dev.c |  6 -----
>>   2 files changed, 34 insertions(+), 22 deletions(-)
>>
>>
>> base-commit: 55be22adf11b48c80ea181366685ec91a4700b7e
>>
> 
> Hi,
> 
> I ran into this issue when trying to use two different FTDI serial TTL cables on my laptop, running 5.9-rc7.
> 
> This patch set fixes the issue.
> 
> Oddly, I was unable to reproduce the issue on another laptop, also running 5.9-rc7.
> 
> Tested-by: Brooke Basile <brookebasile@gmail.com>
> 
> Thank you!
> Brooke Basile

Hello Brooke,

Thank you for the feedback! Greg Kroah-Hartman has committed the patches
to the usb-linus branch of the USB git tree about a week ago, so it may
unfortunately be a bit late to add your Tested-by tag to the patch series.
Nevertheless, I appreciate your success report!

In case you are interested, the committed patches can be seen here:
   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-linus&id=3fce39601a1a34d940cf62858ee01ed9dac5d459

Thanks again,

Vefa
