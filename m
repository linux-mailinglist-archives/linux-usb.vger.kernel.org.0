Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8422F26CDF9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 23:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgIPVH3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 17:07:29 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:49839 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgIPQDk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Sep 2020 12:03:40 -0400
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08GBEmB0006139;
        Wed, 16 Sep 2020 20:14:48 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Wed, 16 Sep 2020 20:14:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08GBEmTf006134
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Wed, 16 Sep 2020 20:14:48 +0900 (JST)
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
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <4e724e07-3993-bcaa-79e9-45a2f7e1f759@i-love.sakura.ne.jp>
Date:   Wed, 16 Sep 2020 20:14:47 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600251486.2424.17.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/16 19:18, Oliver Neukum wrote:
> Am Dienstag, den 15.09.2020, 19:30 +0900 schrieb Tetsuo Handa:
>> On 2020/09/15 18:14, Oliver Neukum wrote
> 
>>> Is there something we can do in flush()?
>>
>> I consider that wdm_flush() is a wrong place to return an error. It is possible that
> 
> I am afraid that is a basic problem we need to resolve. As I understand
>  it, flush() as a method exists precisely to report errors. Otherwise
> you could implement it in release(). But this is not called for every
> close().

I think fsync() or ioctl() is a better method for reporting errors.

But anyway I consider that any error from N'th write() request should be
returned by N'th write() request.

> 
> Hence a driver is supposed to start IO upon write() and report the
> result to the next call, which can be either write() or close(), the
> latter corresponding to flush().

Whether N'th write() request succeeded remains unknown until (N+1)'th
write() request or close() request is issued? That sounds a strange design.

If there is nothing more to write(), how userspace process knows whether
N'th write() request succeeded? Wait for writability using poll() ?

How do we guarantee that N'th write() request already set desc->werr before
(N+1)'th next write() request is issued? If (N+1)'th write() request reached
memdup_user() before desc->werr is set by callback of N'th write() request,
(N+1)'th write() request will fail to report the error from N'th write() request.
Yes, that error would be reported by (N+2)'th write() request, but the userspace
process might have already discarded data needed for taking some actions (e.g.
print error messages, retry the write() request with same argument).

> 
>> a userspace process reaches wdm_flush() due to being killed by SIGKILL (rather than
>> via calling close() syscall). Then, that userspace process will never receive the error
> 
> If you are killed by a signal you are in a race condition
> anyway. It cannot be handled.

What is the purpose of sending the error to the userspace process via write() or close()?
Isn't the purpose to allow userspace process to do something (e.g. print error messages,
retry the write() request with same argument) ? If close() returned an error, it might be
too late to retry the write() request with same argument.

> 
>> fetched from wdm_flush(). Also, if that userspace process is killed by the OOM killer,
>> being able to terminate and release resources as soon as possible is more preferable
>> than try to wait for response.
> 
> Right, so should we just proceed in case of a dieing task? How do we
> do that?

We need to avoid waiting at wdm_flush() if killed.

And I think that wdm_flush() is a strange interface for reporting the error.

