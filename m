Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5B126E53A
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 21:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728405AbgIQQSj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 12:18:39 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:63575 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbgIQQSL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 12:18:11 -0400
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08HGHfrp094255;
        Fri, 18 Sep 2020 01:17:41 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Fri, 18 Sep 2020 01:17:41 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08HGHegj094225
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Fri, 18 Sep 2020 01:17:41 +0900 (JST)
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
 <0bd0995d-d8a0-321a-0695-f4013bbc88ec@i-love.sakura.ne.jp>
 <1600352222.2424.57.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <52714f66-c2ec-7a31-782a-9365ba900111@i-love.sakura.ne.jp>
Date:   Fri, 18 Sep 2020 01:17:39 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600352222.2424.57.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/17 23:17, Oliver Neukum wrote:
> The API and its semantics are clear. Write schedules a write:
> 
>        A  successful  return  from  write() does not make any guarantee that data has been committed to disk.  On some filesystems, including NFS, it does not even guarantee that space has successfully been reserved for the data.  In this case, some errors might be
>        delayed until a future write(2), fsync(2), or even close(2).  The only way to be sure is to call fsync(2) after you are done writing all your data.

But I think that this leaves a room for allowing write() to imply fflush()
(i.e. write() is allowed to wait for data to be committed to disk).

> 
> Fsync flushes data:
> 
>        fsync()  transfers ("flushes") all modified in-core data of (i.e., modified buffer cache pages for) the file referred to by the file descriptor fd to the disk device (or other permanent storage device) so that all changed information can be retrieved even if
>        the system crashes or is rebooted.  This includes writing through or flushing a disk cache if present.  The call blocks until the device reports that the transfer has completed.
> 
> If user space does not call fsync(), the error is supposed to be reported
> by the next write() and if there is no next write(), close() shall report it.

Where does "the next" (and not "the next after the next") write() come from?

>> You did not answer to
>>
>>   How do we guarantee that N'th write() request already set desc->werr before
>>   (N+1)'th next write() request is issued? If (N+1)'th write() request reached
>>   memdup_user() before desc->werr is set by callback of N'th write() request,
>>   (N+1)'th write() request will fail to report the error from N'th write() request.
>>   Yes, that error would be reported by (N+2)'th write() request, but the userspace
>>   process might have already discarded data needed for taking some actions (e.g.
>>   print error messages, retry the write() request with same argument).
> 
> We don't, nor do we have to. You are right, error reporting can be
> improved. I implemented fsync() to do so.

You are saying that if user space does not call fsync(), the error is allowed to be
reported by the next after the next (in other words, (N+2)'th) write() ?

> 
>> . At least I think that
>>
>>         spin_lock_irq(&desc->iuspin);
>>         we = desc->werr;
>>         desc->werr = 0;
>>         spin_unlock_irq(&desc->iuspin);
>>         if (we < 0)
>>                 return usb_translate_errors(we);
>>
>> in wdm_write() should be moved to after !test_bit(WDM_IN_USE, &desc->flags).
> 
> Why?

Otherwise, we can't make sure (N+1)'th write() will report error from N'th write().

Since I don't know the characteristics of data passed via wdm_write() (I guess that
the data is some stateful controlling commands rather than meaningless byte stream),
I guess that (N+1)'th wdm_write() attempt should be made only after confirming that
N'th wdm_write() attempt received wdm_callback() response. To preserve state / data
used by N'th wdm_write() attempt, reporting the error from too late write() attempt
would be useless.



>> In addition, is
>>
>>         /* using write lock to protect desc->count */
>>         mutex_lock(&desc->wlock);
>>
>> required? Isn't wdm_mutex that is actually protecting desc->count from modification?
>> If it is desc->wlock that is actually protecting desc->count, the !desc->count check
>> in wdm_release() and the desc->count == 1 check in wdm_open() have to be done with
>> desc->wlock held.
> 
> Correct. So should wdm_mutex be dropped earlier?

If recover_from_urb_loss() can tolerate stale desc->count value, wdm_mutex already
protects desc->count. I don't know how this module works. I don't know whether
wdm_mutex and/or desc->wlock is held when recover_from_urb_loss() is called from
wdm_resume(). It seems that desc->wlock is held but wdm_mutex is not held when
recover_from_urb_loss() is called from wdm_post_reset().



By the way, after the fixes, we could replace

  spin_lock_irq(&desc->iuspin);
  rv = desc->werr;
  desc->werr = 0;
  spin_unlock_irq(&desc->iuspin);

with

  rv = xchg(&desc->werr, 0);

and avoid spin_lock_irq()/spin_unlock_irq() because there are many
locations which needs to check and clear the error...

