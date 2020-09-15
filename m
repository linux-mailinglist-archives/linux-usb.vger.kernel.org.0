Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9021026A326
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 12:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgIOKa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 06:30:59 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:54037 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIOKa5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Sep 2020 06:30:57 -0400
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08FAUcsL046641;
        Tue, 15 Sep 2020 19:30:38 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp);
 Tue, 15 Sep 2020 19:30:38 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08FAUcp4046638
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 15 Sep 2020 19:30:38 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC 0/5] fix races in CDC-WDM
To:     Oliver Neukum <oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
References: <20200812132034.14363-1-oneukum@suse.com>
 <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
 <1599728957.10822.9.camel@suse.com>
 <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
 <1600161279.2424.5.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <4b8f6305-52fd-cb72-eb13-9d0a0bf07319@i-love.sakura.ne.jp>
Date:   Tue, 15 Sep 2020 19:30:35 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600161279.2424.5.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/15 18:14, Oliver Neukum wrote:
>>>> In patch "[RFC 3/5] CDC-WDM: making flush() interruptible", it is legal to return -EINTR
>>>>  from close(). But I think that returning -EINTR from close() is not recommended because
>>>> it can confuse multithreaded application (retrying close() upon -EINTR is not safe).
>>>
>>> Well, but what is the alternative? Should we ignore signals?
>>>
>>
>> we return the error from write() request (i.e. give up trying to report errors from
>> close() event), we can't pass results to the intended recipients.
> 
> That means
> 
> * harming the single threaded for the sake of the few multithreaded

What is wrong with the single threaded user? As I describe below, there is no guarantee
that wdm_write() can complete immediately (even if O_NONBLOCK flag is set).

> * it would not work for O_NONBLOCK

It does work for O_NONBLOCK. Please see my proposal at
https://lkml.kernel.org/r/b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp .
Since my proposal calls mutex_unlock() before start waiting for response, my
proposal does not block mutex_lock_interruptible() from O_NONBLOCK write().

O_NONBLOCK cannot guarantee that "we do not wait for memory allocation request by
memdup_user()/copy_from_user()/usb_submit_urb(GFP_KERNEL)". It is possible that
O_NONBLOCK write() is blocked for many _minutes_ at (at least) these three locations.

O_NONBLOCK only guarantees that "it does not wait when we can't start immediately".

> * if you use a device from multiple threads or tasks, locking is your
> problem

You mean "a device" as "struct wdm_device *desc" ? Then, it does not matter because
the mutex, buffer, status etc. are per "struct wdm_device *desc" objects. Nobody will
be disturbed by somebody else using different "struct wdm_device *desc".

> 
> Is there something we can do in flush()?

I consider that wdm_flush() is a wrong place to return an error. It is possible that
a userspace process reaches wdm_flush() due to being killed by SIGKILL (rather than
via calling close() syscall). Then, that userspace process will never receive the error
fetched from wdm_flush(). Also, if that userspace process is killed by the OOM killer,
being able to terminate and release resources as soon as possible is more preferable
than try to wait for response.

