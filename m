Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020753182E2
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 02:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhBKBFK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 20:05:10 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:59291 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhBKBFJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 20:05:09 -0500
Received: from fsav401.sakura.ne.jp (fsav401.sakura.ne.jp [133.242.250.100])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11B14DhP024244;
        Thu, 11 Feb 2021 10:04:13 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav401.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav401.sakura.ne.jp);
 Thu, 11 Feb 2021 10:04:13 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav401.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11B14CrZ024239
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Feb 2021 10:04:12 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] usb: usbip: fix error handling of kthread_get_run()
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <000000000000414db905b6e9bae8@google.com>
 <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
 <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
 <1f4b36a1-460e-1154-b46c-32ba72b88205@linuxfoundation.org>
 <dffdefc9-9499-2cd0-fce9-b084df1511af@i-love.sakura.ne.jp>
 <2f922e76-623e-1d87-17a5-c4a87dc8f2fc@linuxfoundation.org>
 <bb8f438f-8a77-2aac-cb2b-b2551f6a64b0@i-love.sakura.ne.jp>
 <f97b85c7-d319-0897-e0f1-29c4154ca060@linuxfoundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <f8cae6b1-8f84-0e6a-7d9c-fc4aec68f07b@i-love.sakura.ne.jp>
Date:   Thu, 11 Feb 2021 10:04:07 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f97b85c7-d319-0897-e0f1-29c4154ca060@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/11 5:15, Shuah Khan wrote:
> On 2/10/21 11:43 AM, Tetsuo Handa wrote:
>> On 2021/02/11 3:20, Shuah Khan wrote:
>>> On 2/10/21 11:16 AM, Tetsuo Handa wrote:
>>>> On 2021/02/11 3:11, Shuah Khan wrote:
>>>>> I would like to see to see a complete fix. This patch changes
>>>>> kthread_get_run() to return NULL. Without adding handling for
>>>>> NULL in the callers of kthread_get_run(), we will start seeing
>>>>> problems.
>>>>
>>>> What problems are you aware of?
>>>>
>>>
>>> The fact that driver doesn't cleanup after failing to create
>>> the thread is a problem.
>>
>> What are the cleanup functions?
>>
> 
> When user-space requests attaching to a device, attach_store()
> tries to attach the requested device. When kthread_get_run()
> failure is ignored silently, and continue with call to
> rh_port_connect(), user-space assumes attach is successful.
> User thinks attach is successful.

The

  struct kthread_create_info *create = kmalloc(sizeof(*create), GFP_KERNEL);

in __kthread_create_on_node() never fails unless killed by the OOM killer
due to the "too small to fail" memory-allocation rule, and

  wait_for_completion_killable(&done)

in __kthread_create_on_node() never fails unless killed. Creating a kernel
thread as root user unlikely fails, and memory allocations by that kernel
thread also never fails due to the "too small to fail" memory-allocation rule.

Therefore, kthread_get_run() effectively fails only when current thread
which called attach_store() was killed. And

> 
> When and how will this attach failure gets reported to the
> in this scenario?

if the current thread was killed, how can the failure get reported to
the user-space in this scenario?

> 
> Error handling for this case is no different from other error
> paths in attach_store().
> 
> Please see error handling for other errors in attach_store().

Being "killed" means that user-space can never know the result
unlike other error paths in attach_store().

> In this case the right error handling is to rewind the vdev
> init and bail out returning error. This would include setting
> vdev->ud.status to VDEV_ST_NULL.

If the user-space was killed, the kernel is responsible for offering
automatic cleanup which includes setting vdev->ud.status to VDEV_ST_NULL.

> 
> I found the following reproducer that tells me how attach
> is triggered.
> https://syzkaller.appspot.com/text?tag=ReproC&x=128506e4d00000

This reproducer (which is killed after 5 seconds from fork()) uses
only /sys/devices/platform/vhci_hcd.0/attach interface and never uses
detach interface. Detach and cleanup are up to automatic cleanup
offered by the kernel.

> 
> syzbot is helping us harden these paths, which is awesome.
> Fixing these have to consider user api.
> 
> I you would like to fix this, please send me a complete fix.

If you want to handle the unlikely "__kthread_create_on_node() fails without
being killed" case, such change ( the drivers/usb/usbip/vhci_sysfs.c portion in
https://syzkaller.appspot.com/x/patch.diff?x=16c3c090d00000 ) should be a separate
patch. Since this patch declares "Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")",
this patch intends for the minimal change and does not want to do extra things.

