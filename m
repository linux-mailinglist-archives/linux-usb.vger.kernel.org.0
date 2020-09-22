Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD6D274279
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 14:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgIVMwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 08:52:22 -0400
Received: from aibo.runbox.com ([91.220.196.211]:59214 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgIVMwW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 08:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=jD6365DnSofM5fp4nTzwfP5zUoYP3xtd4c7TeHs37Ww=; b=foFrV9UaX5me3EWMBgFOzLAs4Z
        reuzUwDyzBC3se+87ryqGYtyHWRf79idqOx8TyL767yCCVzuNkALmzmd/j5OLBvLxUsHDaiW9F+tJ
        1gOEhgMHh0K+7WWdXjsNF/0/7IZs6v6GqIIDruPgv0WgkIBrkv4QT0LD7MNkzjKl1jrPWCViJfBDT
        Ng1JwEJSa6mLZQzrxFKdeWBebQMndlFHVjQCcwr2WZQlHrGsB+4axryyD2OiEu9KGd7yfyvhaEIhy
        YLyf/7+mfJnTGjq6wikLoyA9G2xAUSz3aDt+sz3kEqx9gVH/GjKTmWvseOPrTaXGIm72hWyNOsJQK
        0rUdLVBg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
        by mailtransmit03.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kKhmL-00075q-8r; Tue, 22 Sep 2020 14:52:17 +0200
Received: by submission03.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kKhmH-0008Un-1o; Tue, 22 Sep 2020 14:52:13 +0200
Subject: Re: [PATCH v3 0/4] Fixes for usbip and specialised USB driver
 selection
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller <syzkaller@googlegroups.com>
References: <20200922110703.720960-1-m.v.b@runbox.com>
 <CAAeHK+wVjRiphvYPSH0QT4XZj+rvDzvepQQCupgBJq2BfeNgVA@mail.gmail.com>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <4abbba2c-e519-31a9-1f7e-fc5fb1568e88@runbox.com>
Date:   Tue, 22 Sep 2020 15:52:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+wVjRiphvYPSH0QT4XZj+rvDzvepQQCupgBJq2BfeNgVA@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22/09/2020 15.38, Andrey Konovalov wrote:
> On Tue, Sep 22, 2020 at 1:07 PM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
>>
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
>>    driver selection code, while preserving legacy/previous behaviour.
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
>>    Revert "usbip: Implement a match function to fix usbip"
>>    usbcore/driver: Fix specific driver selection
>>    usbcore/driver: Fix incorrect downcast
>>    usbcore/driver: Accommodate usbip
>>
>>   drivers/usb/core/driver.c    | 50 ++++++++++++++++++++++++------------
>>   drivers/usb/usbip/stub_dev.c |  6 -----
>>   2 files changed, 34 insertions(+), 22 deletions(-)
> 
> Hi Vefa,
> 
> This fixes the issue that I've been having.
> 
> Tested-by: Andrey Konovalov <andreyknvl@google.com>
> 
> for the series.
> 
> Thank you!

Thank you as well, Andrey, for confirming that these patches
resolve the negative interaction between usbip and dummy_hcd!
I appreciate your effort in testing the patches.

Vefa
