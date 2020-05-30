Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105D71E8DEB
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2020 06:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgE3E6t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 30 May 2020 00:58:49 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:60281 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgE3E6t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 30 May 2020 00:58:49 -0400
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04U4wllf037292;
        Sat, 30 May 2020 13:58:47 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Sat, 30 May 2020 13:58:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04U4wlMd037282
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Sat, 30 May 2020 13:58:47 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
 <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
 <20200530011040.GB12419@rowland.harvard.edu>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <c491266c-7c13-fa9d-602e-52d147c241b6@i-love.sakura.ne.jp>
Date:   Sat, 30 May 2020 13:58:47 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200530011040.GB12419@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/30 10:10, Alan Stern wrote:
> On Sat, May 30, 2020 at 09:42:46AM +0900, Tetsuo Handa wrote:
>> On 2020/05/30 5:41, Andrey Konovalov wrote:
>>> On Thu, May 28, 2020 at 10:58 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> 
>>>> This sounds like a bug in the driver.  What would it do if someone had a
>>>> genuine (not emulated) but buggy USB device which didn't send the
>>>> desired response?  The only way to unblock the driver would be to unplug
>>>> the device!  That isn't acceptable behavior.
>>>
>>> OK, that's what I thought.
>>
>> I believe that this is not a bug in the driver but a problem of hardware
>> failure. Unless this is high-availability code which is designed for safely
>> failing over to other node, we don't need to care about hardware failure.
> 
> Oh my!  I can't even imagine what Linus would say if he saw that...  :-(
> 
> Have you heard of Bad USB?

Of course, I've heard of that.

Please show me as a patch first.

> 
> The kernel most definitely does need to protect itself against 
> misbehaving hardware.  Let's just leave it at that.  If you don't 
> believe me, ask Greg KH.

I've made many locations killable (in order to reduce damage caused by OOM
condition). But I can't make locations killable where handling SIGKILL case is
too difficult to implement.

"struct file_operations"->flush() is called from filp_close() when there is
something which has to be done before "struct file_operations"->release() is
called.

As far as I read this thread, what you are trying to do sounds like allow
"not waiting for completion of wdm_out_callback()" with only
's/wait_event/wait_event_intrruptible/' in wdm_flush(). Then, please do remove
wdm_flush() call itself.

I'm not familiar with USB. But at least we would need to do something similar
to commit d0bd587a80960d7b ("usermodehelper: implement UMH_KILLABLE") in
addition to 's/wait_event/wait_event_intrruptible/' in wdm_flush().

> 
> I admit, causing a driver to hang isn't the worst thing a buggy device 
> can do.  But the kernel is supposed to be able to cope with such things 
> gracefully.

My understanding is that the "misbehaving hardware" in this bug report is not
"USB device itself" but "CPU used for receiving request from that USB device
and sending response to that USB device".

I don't know how wdm_flush() can recover when the CPU which is supposed to
unblock wait_event() is blocked inside that wait_event() itself. Unless you can
safely omit wdm_flush() by doing something similar to commit d0bd587a80960d7b,
this looks to me like a circular dependency which is impossible to solve.

Therefore, again, please show me as a patch first.

