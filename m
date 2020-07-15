Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325652204D1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 08:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbgGOGPV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 02:15:21 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:64313 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgGOGPU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 02:15:20 -0400
Received: from fsav102.sakura.ne.jp (fsav102.sakura.ne.jp [27.133.134.229])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06F6FIiM070875;
        Wed, 15 Jul 2020 15:15:18 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav102.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp);
 Wed, 15 Jul 2020 15:15:18 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06F6FHnJ070871
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Wed, 15 Jul 2020 15:15:17 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <1590852311.14886.3.camel@suse.com>
 <20200530154728.GB29298@rowland.harvard.edu>
 <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
 <254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp>
 <CAAeHK+w+wBNksK_wpczad3AU4oLQRsjL_5G8p1R55Zh_FLhprg@mail.gmail.com>
 <c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp>
 <b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp>
 <1593674666.3609.3.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <f6de3d3a-6825-1904-65f4-8d96594a9846@i-love.sakura.ne.jp>
Date:   Wed, 15 Jul 2020 15:15:15 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1593674666.3609.3.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/07/02 16:24, Oliver Neukum wrote:
> Am Donnerstag, den 02.07.2020, 14:44 +0900 schrieb Tetsuo Handa:
> 
>>  
>>  	usb_autopm_put_interface(desc->intf)
>>  	mutex_unlock(&desc->wlock);
>> +	if (rv >= 0 &&
>> +	    /*
>> +	     * needs both flags. We cannot do with one
>> +	     * because resetting it would cause a race
>> +	     * with write() yet we need to signal
>> +	     * a disconnect
>> +	     */
>> +	    wait_event_killable_timeout(desc->wait,
>> +					!test_bit(WDM_IN_USE, &desc->flags) ||
>> +					test_bit(WDM_DISCONNECTING, &desc->flags), 30 * HZ) == 0) {
>> +		if (mutex_lock_killable(&desc->wlock) == 0) {
>> +			if (!test_bit(WDM_DISCONNECTING, &desc->flags))
>> +				dev_err(&desc->intf->dev,
>> +					"Tx URB not responding index=%d\n",
>> +					le16_to_cpu(req->wIndex));
>> +			mutex_unlock(&desc->wlock);
>> +		}
>> +	}
> 
> Hi,
> 
> I am afraid this would
> 
> 1. serialize the driver, harming performance

Is wdm_write() called so frequently (e.g. 1000 times per one second) ?

> 2. introduce a race with every timer a task is running

What is estimated response time from usb_submit_urb() to wdm_out_callback() ?
Can it be many seconds?

I didn't try your patches at https://lkml.kernel.org/r/1593078968.28236.15.camel@suse.com
because it seems to me that your patch does not answer my 3 concerns:

(1) wdm_flush() says
    
            /* cannot dereference desc->intf if WDM_DISCONNECTING */
            if (test_bit(WDM_DISCONNECTING, &desc->flags))
                    return -ENODEV;
            if (desc->werr < 0)
                    dev_err(&desc->intf->dev, "Error in flush path: %d\n",
                            desc->werr);

    but it seems to me that nothing guarantees that test_bit(WDM_DISCONNECTING) == false
    indicates dereferencing desc->intf->dev is safe, for wdm_flush() tests WDM_DISCONNECTING
    without any lock whereas wdm_disconnect() sets WDM_DISCONNECTING under wdm_mutex and
    desc->iuspin held. It might be safe to dereference from wdm_release() which holds wdm_mutex.

(2) If wait_event() in wdm_flush() might fail to wake up (due to close() dependency
    problem this crash report is focusing on), wait_event_interruptible() in wdm_write() might
    also fail to wake up (unless interrupted) due to the same dependency. Then, why can't we
    wait for completion of wdm_out_callback() (with reasonable timeout) inside wdm_write() ?

(3) While wdm_flush() waits for clearing of WDM_IN_USE using wait_event(), concurrently
    executed wdm_write() also waits for clearing of WDM_IN_USE using wait_event_interruptible(),
    and wdm_write() can immediately set WDM_IN_USE again as soon as returning from
    wait_event_interruptible() even if somebody was already waiting at wdm_flush() to clear
    WDM_IN_USE.

    That is, wait_event() in wdm_flush() does not know whether there is usb_submit_urb()
    request which is started after wait_event() found that WDM_IN_USE was cleared. Then,
    why does this wait_event() in wdm_flush() want to flush which current thread might not
    have issued?

Current thread synchronously waits for completion of wdm_out_callback() issued by current
thread's usb_submit_urb() request might make sense. But how much value is there for current
thread waits for completion of wdm_out_callback() issued by other thread's usb_submit_urb()
request? Multiple threads can use the same "desc" pointer, and trying to flush upon close()
by each thread using that "desc" pointer...

If synchronous waiting harms performance so much, do we want to know the error at all?
wdm_write() already returned success (the number of bytes passed to write()). And there is
no guarantee that the error code which current thread will receive from wmd_flush()
corresponds with a request current thread has issued?

I'm skeptical about the value of trying to synchronously return an error code for
wmd_write() request to the caller. I'm really inclined to remove wdm_flush() completely.

