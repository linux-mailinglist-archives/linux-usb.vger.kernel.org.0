Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AB831FC87
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 17:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhBSQBQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 11:01:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhBSQBP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Feb 2021 11:01:15 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C3EC061574
        for <linux-usb@vger.kernel.org>; Fri, 19 Feb 2021 08:00:32 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id b16so5522435otq.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Feb 2021 08:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZZ8L0oLinpObCH611YVq3oh2RZ2eHhTqj2ZwknzOsgw=;
        b=aM4YjpSRYJocM7uE1mFHrkaH0SLfhXtZFtZRkjzfm2nQrbPddgxBtsQWBCxNuzf0ie
         aRcU7GC4ryRLvA5iM4FH7vlU3QPWd55UlmiHoKvq683qOLyK/nByrhGGzTJkq3hvEdSE
         HocLOaDt3xdou0g31H10orAvmV/GZVzUL6Bi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZZ8L0oLinpObCH611YVq3oh2RZ2eHhTqj2ZwknzOsgw=;
        b=R7agJh1gP8HjYo7jFX7lLocmXbgJAB7JQa0MFvAxzXvcmbk9o00dfmrXvrA5vVzPlv
         bIL/L2xPG1sKBHspB7yEc+gsQGqmajQkUupDQjzdzmbF8mlSOJG55OLIfEysGwBfWYtW
         SQnCyBrzKbP3Fs1/f3xC7URVt9Drb8r7jkgTUmhbqIK1v+8TSP7+v62lucblZqf+ZyVg
         xNugJvpunu4aW5lJeN4GKX8LtxMdBUgfr5qGKA2GI1qya+KYwzhZXHkt27Fn1WWyzjDE
         BIcw+J0BOZ1wYs73aiXe6dWfFSX1w/euKlGYUFqcWb+uujDY5jaQyoaqMIYiu3E/8KCc
         aqtw==
X-Gm-Message-State: AOAM532VUtXJVRaGRtKnYXD5OM/buLFNA+fM3NxZQ8SCl3QSBeivXnSx
        jRqBVZoNi4lTRd0xvQbz1pQ2ew==
X-Google-Smtp-Source: ABdhPJxqOEz24optiTWVLgxBdi7a5IUyOZDOncLKPg3ctvwDPs173JhaTN8uTrR5p1A7yUUAQ0Xabg==
X-Received: by 2002:a05:6830:13d2:: with SMTP id e18mr7208731otq.225.1613750432252;
        Fri, 19 Feb 2021 08:00:32 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id o9sm1754012otl.39.2021.02.19.08.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 08:00:31 -0800 (PST)
Subject: Re: [PATCH v2] usb: usbip: serialize attach/detach operations
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20210219094744.3577-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20210219150832.4701-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <YC/fF0c7PA3ndTPv@kroah.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <68fe3981-27d2-1f8d-17c6-9cb773382e66@linuxfoundation.org>
Date:   Fri, 19 Feb 2021 09:00:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YC/fF0c7PA3ndTPv@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/19/21 8:53 AM, Greg Kroah-Hartman wrote:
> On Sat, Feb 20, 2021 at 12:08:32AM +0900, Tetsuo Handa wrote:
>> syzbot is reporting an ERR_PTR(-EINTR) pointer dereference at
>> vhci_shutdown_connection() [1], for kthread_create() became killable due
>> to commit 786235eeba0e1e85 ("kthread: make kthread_create() killable").
>>
>> When SIGKILLed while attach_store() is calling kthread_get_run(),
>> ERR_PTR(-EINTR) is stored into vdev->ud.tcp_{rx,tx}, and then
>> kthread_stop_put() is called on vdev->ud.tcp_{rx,tx} from
>> vhci_shutdown_connection() because vdev->ud.tcp_{rx,tx} != NULL.
>>
>> Prior to commit 9720b4bc76a83807 ("staging/usbip: convert to kthread"),
>> "current" pointer is assigned to vdev->ud.tcp_{rx,tx} by usbip_thread()
>> kernel thread, and hence vdev->ud.tcp_{rx,tx} != NULL means a valid task
>> pointer. However, this patch does not make kthread_get_run() return NULL
>> when kthread_create() failed, for this patch removes kthread_get_run() in
>> order to fix the other bug described below.
>>
>> syzbot is also reporting a NULL pointer dereference at sock_sendmsg() [2],
>> for lack of serialization between attach_store() and event_handler()
>> causes vhci_shutdown_connection() to observe vdev->ud.tcp_tx == NULL while
>> vdev->ud.tcp_socket != NULL. Please read the reference link for details of
>> this race window.
>>
>> Therefore, this patch does the following things in order to fix reported
>> bugs and other possible bugs.
>>
>> (1) Handle kthread_create() failure (which fixes [1]) by grouping socket
>>      lookup, kthread_create() and get_task_struct() into
>>      usbip_prepare_threads() function.
>>
>> (2) Serialize usbip_sockfd_store(), detach_store(), attach_store() and
>>      ud->eh_ops.{shutdown,reset,unusable}() operations using
>>      usbip_event_mutex mutex (which fixes [2]). Introducing such large
>>      mutex should be safe because ud->tcp_{tx,rx} must not wait for
>>      event_handler() to flush because event_handler() is processed by a
>>      singlethreaded workqueue.
>>
>> (3) Add SOCK_STREAM check into usbip_prepare_threads(), for current code
>>      is not verifying that a file descriptor passed is actually a stream
>>      socket. If the file descriptor passed was a SOCK_DGRAM socket,
>>      sock_recvmsg() can't detect end of stream.
>>
>> (4) Don't perform ud->tcp_socket = NULL in vhci_device_reset().
>>      Since ud->tcp_{tx,rx} depend on ud->tcp_socket != NULL whereas
>>      ud->tcp_socket and ud->tcp_{tx,rx} are assigned at the same time,
>>      it is never safe to reset ud->tcp_socket from vhci_device_reset()
>>      without calling kthread_stop_put() from vhci_shutdown_connection().
>>
>> (5) usbip_sockfd_store() must perform
>>
>>        if ({sdev,udc}->ud.status != SDEV_ST_AVAILABLE) {
>>          /* misc assignments for attach operation */
>>          {sdev,udc}->ud.status = SDEV_ST_USED;
>>        }
>>
>>      atomically, or multiple ud->tcp_{tx,rx} are created (which will later
>>      cause a crash like [2]) and refcount on ud->tcp_socket is leaked when
>>      usbip_sockfd_store() is concurrently called.
>>
>> [1] https://syzkaller.appspot.com/bug?extid=a93fba6d384346a761e3
>> [2] https://syzkaller.appspot.com/bug?extid=95ce4b142579611ef0a9
>>
>> Reported-and-tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
>> Reported-by: syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>
>> Reported-by: syzbot <syzbot+95ce4b142579611ef0a9@syzkaller.appspotmail.com>
>> References: https://lkml.kernel.org/r/676d4518-0faa-9fab-15db-0db8d216d7fb@i-love.sakura.ne.jp
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")
>> ---
>>   drivers/usb/usbip/stub_dev.c     | 56 ++++++++++++++++++--------------
>>   drivers/usb/usbip/usbip_common.c | 55 +++++++++++++++++++++++++++++++
>>   drivers/usb/usbip/usbip_common.h | 25 +++++++-------
>>   drivers/usb/usbip/usbip_event.c  | 15 +++++++++
>>   drivers/usb/usbip/vhci_hcd.c     |  6 ----
>>   drivers/usb/usbip/vhci_sysfs.c   | 50 ++++++++++++++++++++--------
>>   drivers/usb/usbip/vudc_sysfs.c   | 50 ++++++++++++++++------------
>>   7 files changed, 181 insertions(+), 76 deletions(-)
> 
> What changed from v1?  Why isn't that info below the --- line?
> 
> Please do a v3 with that fixed up.
> 

+1 on this.

Also please run the usbip test on your changes:
tools/testing/selftests/drivers/usb/usbip/usbip_test.sh

thanks,
-- Shuah



