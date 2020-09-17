Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65BC026DECD
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 16:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgIQOyl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 10:54:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:47662 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgIQOy2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 10:54:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=cantorsusede;
        t=1600352231;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k2ZYOFf+ON/Lj4zQAxqF/KMgakPa4D1HVskD+8LdCUQ=;
        b=JlXp1utQfSl8ElFLunQY0UjGiRqZpa3+/wDdMfWbG0t3XY2/OozrvHDNymofLAyGvmlR/W
        jSTc5+BSy/rqum7TnnhXpo5K0a7lSs1ELmbBw6fy4BHmmqEy+yvukMXUCYGxHGJvChLLMr
        PQ2JY3zOSOqqh2xMO3BPoVzQPiEi0Si3w/YeSwk0fVvcyU79XwvxWN8WWCCZevoBdM+084
        4B4PoL5zFWUKqiOQfe0hSHAnx49JzjMmcs1k0NxK9nSEXiQENnefzo0pSJLo2diRFwVNNM
        pGdKwcCwapJg+ySrBmjY4TNim37u/hb3xPLm5P5hujRXXnr3o7wQqSaEQJ4Mow==
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7EABDAB5C;
        Thu, 17 Sep 2020 14:17:45 +0000 (UTC)
Message-ID: <1600352222.2424.57.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Thu, 17 Sep 2020 16:17:02 +0200
In-Reply-To: <0bd0995d-d8a0-321a-0695-f4013bbc88ec@i-love.sakura.ne.jp>
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
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 17.09.2020, 20:24 +0900 schrieb Tetsuo Handa:
> On 2020/09/17 18:50, Oliver Neukum wrote:
> > Am Mittwoch, den 16.09.2020, 20:14 +0900 schrieb Tetsuo Handa:

> If you ask userspace programs to be updated to call fsync(), we can ask
> userspace programs be updated to call ioctl().
> 
> I expected you to implement wdm_ioctl() for fetching last error code. Then,

Again, we are not redefining APIs. The APIs for character devices are
well defined by POSIX. Please see the man pages. Introducing a whole
new ioctl() is out of question.

The API and its semantics are clear. Write schedules a write:

       A  successful  return  from  write() does not make any guarantee that data has been committed to disk.  On some filesystems, including NFS, it does not even guarantee that space has successfully been reserved for the data.  In this case, some errors might be
       delayed until a future write(2), fsync(2), or even close(2).  The only way to be sure is to call fsync(2) after you are done writing all your data.

Fsync flushes data:

       fsync()  transfers ("flushes") all modified in-core data of (i.e., modified buffer cache pages for) the file referred to by the file descriptor fd to the disk device (or other permanent storage device) so that all changed information can be retrieved even if
       the system crashes or is rebooted.  This includes writing through or flushing a disk cache if present.  The call blocks until the device reports that the transfer has completed.

If user space does not call fsync(), the error is supposed to be reported
by the next write() and if there is no next write(), close() shall report it.

> we can apply my proposal (wait for response at wdm_write() by default) as a baseline
> for not to break existing userspace programs (except latency), followed by a patch
> which allows userspace programs to use that wdm_ioctl() in order not to wait for
> response at wdm_write(), which is enabled by calling wdm_ioctl() (in order to
> recover latency caused by waiting for response at wdm_write()).

I am sorry, but the API is defined by POSIX.

> > > What is the purpose of sending the error to the userspace process via write() or close()?
> > 
> > Yes. However to do so, user space must be running. That the death
> > of a process interferes with error handling is independent from that.
> 
> Why need to send the error to the userspace process when that process was killed?
> My question
> 
>   Isn't the purpose to allow userspace process to do something (e.g. print error messages,
>   retry the write() request with same argument) ? If close() returned an error, it might be
>   too late to retry the write() request with same argument.

Yes. Technically you need to use fsync(). Hence I implemented it.

> If we check the error at wdm_write() or wdm_ioctl(), there is no error to report at
> wdm_flush(). Therefore, we can remove wdm_flush() completely.

Again, the API is defined by POSIX. If user space calls write() and
then close(), close() must report the error.

> I can't read this series without squashing into single patch. Making changes which
> will be after all removed in [RFC 5/7] is sad. Please do [RFC 5/7] before [RFC 4/7].

Done.

> Then, you won't need to make unneeded modifications. I'd like to see one cleanup
> patch, one possible unsafe dereference fix patch, and one deadlock avoidance patch.

This needs to partially go into stable. Hence fixes must come first.

> You did not answer to
> 
>   How do we guarantee that N'th write() request already set desc->werr before
>   (N+1)'th next write() request is issued? If (N+1)'th write() request reached
>   memdup_user() before desc->werr is set by callback of N'th write() request,
>   (N+1)'th write() request will fail to report the error from N'th write() request.
>   Yes, that error would be reported by (N+2)'th write() request, but the userspace
>   process might have already discarded data needed for taking some actions (e.g.
>   print error messages, retry the write() request with same argument).

We don't, nor do we have to. You are right, error reporting can be
improved. I implemented fsync() to do so.

> . At least I think that
> 
>         spin_lock_irq(&desc->iuspin);
>         we = desc->werr;
>         desc->werr = 0;
>         spin_unlock_irq(&desc->iuspin);
>         if (we < 0)
>                 return usb_translate_errors(we);
> 
> in wdm_write() should be moved to after !test_bit(WDM_IN_USE, &desc->flags).

Why?

> In [RFC 2/7], I think that
> 
>                 /* in case flush() had timed out */
>                 usb_kill_urb(desc->command);
> 
> which is called only when desc->count == 0 in wdm_open() is pointless, for since
> desc->count is incremented/decremented with wdm_mutex held, kill_urbs(desc) which
> is called when desc->count == 0 in wdm_release() must have already called
> usb_kill_urb(desc->command) before allowing wdm_open() to reach there.

You are right. I am going to remove it.

> In addition, is
> 
>         /* using write lock to protect desc->count */
>         mutex_lock(&desc->wlock);
> 
> required? Isn't wdm_mutex that is actually protecting desc->count from modification?
> If it is desc->wlock that is actually protecting desc->count, the !desc->count check
> in wdm_release() and the desc->count == 1 check in wdm_open() have to be done with
> desc->wlock held.

Correct. So should wdm_mutex be dropped earlier?

> In [RFC 3/7], patch description says
> 
>   There is no need for flush() to be uninterruptible. close(2)
>   is allowed to return -EAGAIN. Change it.
> 
> but the code does
> 
> 	if (rv < 0)
> 		return -EINTR;
> 
> . Which error code do you want to use? (I still prefer removing wdm_flush() completely...)

-EINTR. Sorry. I shall change the description.

	Regards
		Oliver

