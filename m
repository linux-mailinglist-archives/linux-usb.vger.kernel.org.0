Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7331F1E8C91
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 02:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbgE3Am4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 20:42:56 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:50550 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgE3Amw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 20:42:52 -0400
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04U0gofc017415;
        Sat, 30 May 2020 09:42:50 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp);
 Sat, 30 May 2020 09:42:50 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04U0gk1Z017399
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Sat, 30 May 2020 09:42:50 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <1590134662.19681.12.camel@suse.com>
 <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
Date:   Sat, 30 May 2020 09:42:46 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/30 5:41, Andrey Konovalov wrote:
> On Thu, May 28, 2020 at 10:58 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>>
>> On Thu, May 28, 2020 at 09:51:35PM +0200, Andrey Konovalov wrote:
>>> On Thu, May 28, 2020 at 9:40 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>>>>
>>>> On Thu, May 28, 2020 at 09:03:43PM +0200, Andrey Konovalov wrote:
>>>>
>>>>> Ah, so the problem is that when a process exits, it tries to close wdm
>>>>> fd first, which ends up calling wdm_flush(), which can't finish
>>>>> because the USB requests are not terminated before raw-gadget fd is
>>>>> closed, which is supposed to happen after wdm fd is closed. Is this
>>>>> correct? I wonder what will happen if a real device stays connected
>>>>> and ignores wdm requests.
>>>>>
>>>>> I don't understand though, how using wait_event_interruptible() will
>>>>> shadow anything here.
>>>>>
>>>>> Alan, Greg, is this acceptable behavior for a USB driver?
>>>>
>>>> I don't understand what the problem is.  Can you explain in more general
>>>> terms -- nothing specific to wdm or anything like that -- what you are
>>>> concerned about?  Is this something that could happen to any gadget
>>>> driver?  Or any USB class device driver?  Or does it only affect
>>>> usespace components of raw-gadget drivers?
>>>
>>> So, AFAIU, we have a driver whose flush() callback blocks on
>>> wait_event(), which can only terminate when either 1) the driver
>>> receives a particular USB response from the device or 2) the device
>>> disconnects.
>>
>> This sounds like a bug in the driver.  What would it do if someone had a
>> genuine (not emulated) but buggy USB device which didn't send the
>> desired response?  The only way to unblock the driver would be to unplug
>> the device!  That isn't acceptable behavior.
> 
> OK, that's what I thought.

I believe that this is not a bug in the driver but a problem of hardware
failure. Unless this is high-availability code which is designed for safely
failing over to other node, we don't need to care about hardware failure.

> 
>>
>>> For 1) the emulated device doesn't provide required
>>> responses. For 2) the problem is that the emulated via raw-gadget
>>> device disconnects when the process is killed (and raw-gadget fd is
>>> closed). But that process is the same process that is currently stuck
>>> on wait_event() in the flush callback(), and therefore unkillable.
>>
>> What would happen if you unload dummy-hcd at this point?  Or even just
>> do: echo 0 >/sys/bus/usb/devices/usbN/bConfigurationValue, where N is
>> the bus number of the dummy-hcd bus?
> 
> The device disconnects and flush() unblocks.
> 
>>> This can generally happen with any driver that goes into
>>> uninterruptible sleep within one of its code paths reachable from
>>> userspace that can only be unblocked by a particular behavior from the
>>> USB device. But I haven't seen any such drivers so far, wdm is the
>>> first.
>>
>> Drivers should never go into uninterruptible sleep states unless they
>> can guarantee that the duration will be bounded somehow (for example, by
>> a reasonable timeout).  Or that cutting the sleep state short would
>> cause the system to crash -- but that's not an issue here.
> 
> OK, thank you, Alan!
> 
> Tetsuo, could you clarify why you think that using
> wait_event_interruptible() is a bad fix here?
> 

If wait_event() in wdm_flush() were using timeout or interruptible, can the
wdm driver handle that case safely? Since cleanup(desc) from wdm_release()
might release "desc", wouldn't "not-waiting-for-completion" has a risk of
"use-after-free write"? Please add comment block why it is safe if it is
actually safe.
