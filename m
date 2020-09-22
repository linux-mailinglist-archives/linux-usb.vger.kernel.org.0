Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F3D27383A
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 03:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgIVB5W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 21:57:22 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:53854 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgIVB5V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 21:57:21 -0400
Received: from fsav402.sakura.ne.jp (fsav402.sakura.ne.jp [133.242.250.101])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08M1v4R9044917;
        Tue, 22 Sep 2020 10:57:04 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav402.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp);
 Tue, 22 Sep 2020 10:57:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav402.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08M1v2Yi044902
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 22 Sep 2020 10:57:03 +0900 (JST)
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
 <52714f66-c2ec-7a31-782a-9365ba900111@i-love.sakura.ne.jp>
 <1600685578.2424.72.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <fab1cbfc-7284-73f4-b633-1e060c38acdb@i-love.sakura.ne.jp>
Date:   Tue, 22 Sep 2020 10:56:59 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600685578.2424.72.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/21 19:52, Oliver Neukum wrote:
>>> If user space does not call fsync(), the error is supposed to be reported
>>> by the next write() and if there is no next write(), close() shall report it.
>>
>> Where does "the next" (and not "the next after the next") write() come from?
> 
> We would indeed by on spec. However, we perform best if we return an
> error as soon as possible.
> 
>> You are saying that if user space does not call fsync(), the error is allowed to be
>> reported by the next after the next (in other words, (N+2)'th) write() ?
> 
> Yes. The man page is clear on that.

To understand it, I must understand why it is safe to defer error reporting.

> 
>>>> . At least I think that
>>>>
>>>>         spin_lock_irq(&desc->iuspin);
>>>>         we = desc->werr;
>>>>         desc->werr = 0;
>>>>         spin_unlock_irq(&desc->iuspin);
>>>>         if (we < 0)
>>>>                 return usb_translate_errors(we);
>>>>
>>>> in wdm_write() should be moved to after !test_bit(WDM_IN_USE, &desc->flags).
>>>
>>> Why?
>>
>> Otherwise, we can't make sure (N+1)'th write() will report error from N'th write().
> 
> We should move the test for reporting errors later, so that it is sure
> to be carried out? I am afraid I cannot follow that logic.
> 
>> Since I don't know the characteristics of data passed via wdm_write() (I guess that
>> the data is some stateful controlling commands rather than meaningless byte stream),
>> I guess that (N+1)'th wdm_write() attempt should be made only after confirming that
>> N'th wdm_write() attempt received wdm_callback() response. To preserve state / data
>> used by N'th wdm_write() attempt, reporting the error from too late write() attempt
>> would be useless.
> 
> We cannot make assumptions on how user space uses the driver. Somebody
> manually connecting and typing in commands letter by letter must also
> work.

I'm not making any assumptions on how user space uses the driver. Up to now,
your explanation makes me think that you are making assumptions on how user space
uses cdc-wdm driver.

I'm querying you about characteristics of data passed to wdm_write().
Without knowing the difference between writing to cdc-wdm driver and normal file on
some filesystem, I can't judge whether it is acceptable to defer reporting errors.
When an error occurred when writing to normal file on some filesystem, the userspace
would simply treat that file as broken (e.g. delete such file). The userspace of this
cdc-wdm driver might want that any error is immediately reported, for I'm thinking that
each data passed to wdm_write() is stateful, for

  /* CDC-WMC r1.1 requires wMaxCommand to be "at least 256 decimal (0x100)" */
  #define WDM_DEFAULT_BUFSIZE     256

and

        if (count > desc->wMaxCommand)
                count = desc->wMaxCommand;

makes me think that wdm_write() has to be able to handle chunk of data in atomic
manner.

> 
> We can optimize for the common case, but we must operate according to
> the specs.
>>
>>
>>
>>>> In addition, is
>>>>
>>>>         /* using write lock to protect desc->count */
>>>>         mutex_lock(&desc->wlock);
>>>>
>>>> required? Isn't wdm_mutex that is actually protecting desc->count from modification?
>>>> If it is desc->wlock that is actually protecting desc->count, the !desc->count check
>>>> in wdm_release() and the desc->count == 1 check in wdm_open() have to be done with
>>>> desc->wlock held.
>>>
>>> Correct. So should wdm_mutex be dropped earlier?
>>
>> If recover_from_urb_loss() can tolerate stale desc->count value, wdm_mutex already
> 
> It cannot.
> 
>> protects desc->count. I don't know how this module works. I don't know whether
>> wdm_mutex and/or desc->wlock is held when recover_from_urb_loss() is called from
>> wdm_resume(). It seems that desc->wlock is held but wdm_mutex is not held when
>> recover_from_urb_loss() is called from wdm_post_reset().
> 
> Indeed.

I don't like [RFC 8/8]. Please drop [RFC 8/8] because not only it is unrelated to
hang up problem syzbot is reporting but also lock dependency is still unclear.
The /* using write lock to protect desc->count */ comment is hardly helpful
because wdm_disconnect() accesses desc->count with only wdm_mutex held.
Detailed explanation about why releasing wdm_mutex early in wdm_open() is safe
with regards to e.g. wdm_disconnect()/recover_from_urb_loss()/wdm_release() will
be required for [RFC 8/8].

Also, pointless

+               /* in case flush() had timed out */
+               usb_kill_urb(desc->command);

is still in [RFC 2/8].

Please do squash into one patch, and add detailed/polite patch description like
https://lkml.kernel.org/r/1597188375-4787-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp .
Current series is too fragmented to understand, and nobody can review such series.

