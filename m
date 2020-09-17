Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA4026DC6F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 15:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgIQNGs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 09:06:48 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:54953 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgIQNGe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 09:06:34 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08HBP26l040207;
        Thu, 17 Sep 2020 20:25:02 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Thu, 17 Sep 2020 20:25:02 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08HBOvnT040186
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Thu, 17 Sep 2020 20:25:01 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC 0/5] fix races in CDC-WDM
To:     Oliver Neukum <oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
References: <20200812132034.14363-1-oneukum@suse.com>
 <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
 <1599728957.10822.9.camel@suse.com>
 <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
 <1600161279.2424.5.camel@suse.com>
 <4b8f6305-52fd-cb72-eb13-9d0a0bf07319@i-love.sakura.ne.jp>
 <1600251486.2424.17.camel@suse.com>
 <4e724e07-3993-bcaa-79e9-45a2f7e1f759@i-love.sakura.ne.jp>
 <1600336214.2424.39.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <0bd0995d-d8a0-321a-0695-f4013bbc88ec@i-love.sakura.ne.jp>
Date:   Thu, 17 Sep 2020 20:24:57 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600336214.2424.39.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/17 18:50, Oliver Neukum wrote:
> Am Mittwoch, den 16.09.2020, 20:14 +0900 schrieb Tetsuo Handa:
>> On 2020/09/16 19:18, Oliver Neukum wrote:
>>> Am Dienstag, den 15.09.2020, 19:30 +0900 schrieb Tetsuo Handa:
>>>> On 2020/09/15 18:14, Oliver Neukum wrote
>>>>> Is there something we can do in flush()?
>>>>
>>>> I consider that wdm_flush() is a wrong place to return an error. It is possible that
>>>
>>> I am afraid that is a basic problem we need to resolve. As I understand
>>>  it, flush() as a method exists precisely to report errors. Otherwise
>>> you could implement it in release(). But this is not called for every
>>> close().
>>
>> I think fsync() or ioctl() is a better method for reporting errors.
> 
> Very well, I am implementing fsync(). However, I must say that the very
> existance of fsync() tells us that write() is not expected to push
> data out to devices and hence report results.

If you ask userspace programs to be updated to call fsync(), we can ask
userspace programs be updated to call ioctl().

I expected you to implement wdm_ioctl() for fetching last error code. Then,

> 
>> Whether N'th write() request succeeded remains unknown until (N+1)'th
>> write() request or close() request is issued? That sounds a strange design.
> 
> Welcome to the world of Unix. This is necessary if you want to block
> as rarely as possible.

we can apply my proposal (wait for response at wdm_write() by default) as a baseline
for not to break existing userspace programs (except latency), followed by a patch
which allows userspace programs to use that wdm_ioctl() in order not to wait for
response at wdm_write(), which is enabled by calling wdm_ioctl() (in order to
recover latency caused by waiting for response at wdm_write()).



>> What is the purpose of sending the error to the userspace process via write() or close()?
> 
> Yes. However to do so, user space must be running. That the death
> of a process interferes with error handling is independent from that.

Why need to send the error to the userspace process when that process was killed?
My question

  Isn't the purpose to allow userspace process to do something (e.g. print error messages,
  retry the write() request with same argument) ? If close() returned an error, it might be
  too late to retry the write() request with same argument.

which is unrelated to the userspace process being killed. My suggestion is that we can send
the error from wdm_write() (for synchronous mode) or wdm_ioctl() (for asynchronous mode).

> 
>> And I think that wdm_flush() is a strange interface for reporting the error.
> 
> Well, POSIX is what it is.The close() syscall is supposed to return
> errors. Hence flush() must report them.

If we check the error at wdm_write() or wdm_ioctl(), there is no error to report at
wdm_flush(). Therefore, we can remove wdm_flush() completely.



I can't read this series without squashing into single patch. Making changes which
will be after all removed in [RFC 5/7] is sad. Please do [RFC 5/7] before [RFC 4/7].
Then, you won't need to make unneeded modifications. I'd like to see one cleanup
patch, one possible unsafe dereference fix patch, and one deadlock avoidance patch.



You did not answer to

  How do we guarantee that N'th write() request already set desc->werr before
  (N+1)'th next write() request is issued? If (N+1)'th write() request reached
  memdup_user() before desc->werr is set by callback of N'th write() request,
  (N+1)'th write() request will fail to report the error from N'th write() request.
  Yes, that error would be reported by (N+2)'th write() request, but the userspace
  process might have already discarded data needed for taking some actions (e.g.
  print error messages, retry the write() request with same argument).

. At least I think that

        spin_lock_irq(&desc->iuspin);
        we = desc->werr;
        desc->werr = 0;
        spin_unlock_irq(&desc->iuspin);
        if (we < 0)
                return usb_translate_errors(we);

in wdm_write() should be moved to after !test_bit(WDM_IN_USE, &desc->flags).



In [RFC 2/7], I think that

                /* in case flush() had timed out */
                usb_kill_urb(desc->command);

which is called only when desc->count == 0 in wdm_open() is pointless, for since
desc->count is incremented/decremented with wdm_mutex held, kill_urbs(desc) which
is called when desc->count == 0 in wdm_release() must have already called
usb_kill_urb(desc->command) before allowing wdm_open() to reach there.

In addition, is

        /* using write lock to protect desc->count */
        mutex_lock(&desc->wlock);

required? Isn't wdm_mutex that is actually protecting desc->count from modification?
If it is desc->wlock that is actually protecting desc->count, the !desc->count check
in wdm_release() and the desc->count == 1 check in wdm_open() have to be done with
desc->wlock held.



In [RFC 3/7], patch description says

  There is no need for flush() to be uninterruptible. close(2)
  is allowed to return -EAGAIN. Change it.

but the code does

	if (rv < 0)
		return -EINTR;

. Which error code do you want to use? (I still prefer removing wdm_flush() completely...)

