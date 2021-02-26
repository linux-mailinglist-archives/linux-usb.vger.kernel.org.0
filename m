Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8C325A7A
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 01:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhBZABj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 19:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhBZABg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Feb 2021 19:01:36 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946E0C061574
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 16:00:56 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id s24so7861304iob.6
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 16:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GqySx3nmTbXl72PHRRjC9orvwwuIPYhmL3JjlQaD1YY=;
        b=fYMfZR0UWPq74CbwXl6avjh6YOEKziX2wAxobYXcEgCR0icqGRmnuFxDYDIn5pLA5g
         2oxfR9bRjRC24J+cQQ3ajpwrqirSEtsRWQuMbwUim2fNTsj6Cp/EordeB1ki/YpF9+sB
         pgdxHwgbr//AeVhxf111v7UDuzvPOegKWQoMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GqySx3nmTbXl72PHRRjC9orvwwuIPYhmL3JjlQaD1YY=;
        b=ciUMhUFMrw7tmvkKw2any1bTa3EV2HcO7YswyVAIlN3eJJ7MKCHk9vIlhbEbxqW9BQ
         XufILkNg7pipWaORTVZia2KImd+Zp/bUEWJKblBS0AbW/DTbuvENI3AcKo8G2FKoTG9i
         C1jj3z3fTmlRIApX59WgvfOC7qKfGneYQCNui5IOSVv04wIEvMi8Myp2RXv75XfKGLti
         b3ilK05UBvoK/OCkW57IWxVqiqim02bXpYVzO1FQSrfmGCZOGOCfOnz0fm9h5T93BzDO
         +IH3GGRPXwDsoZEGUF2Sb1F0clkwEp+gxP2YUtKeQMn9JK3Z6bNIRv28z3kWysCKVRgE
         +Ggg==
X-Gm-Message-State: AOAM532sJwCFZR1wTP8gx3x/sqPNbD7qcwnVjZ8TSTdALoiJF6/bgyCO
        +H0a9paXPV1lC3iPwy5i6O5oTg==
X-Google-Smtp-Source: ABdhPJyUcDJNhrQXyGkyKN5NVLkVz0GOnO6Hh3Gb8NQel4gXZowYWFOP+5lbDL6QMSAvZVW5KnbGtQ==
X-Received: by 2002:a05:6602:80d:: with SMTP id z13mr468467iow.17.1614297656026;
        Thu, 25 Feb 2021 16:00:56 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id a14sm3987082ilm.68.2021.02.25.16.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 16:00:55 -0800 (PST)
Subject: Re: [PATCH v3] usb: usbip: serialize attach/detach operations
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>,
        The kernel test robot <lkp@intel.com>
References: <YDCzLfhawx4u28dd@kroah.com>
 <20210223015907.3506-1-penguin-kernel@I-love.SAKURA.ne.jp>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <95d1398b-6b95-2da4-43f7-7a6b0c87c4f8@linuxfoundation.org>
Date:   Thu, 25 Feb 2021 17:00:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223015907.3506-1-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/22/21 6:59 PM, Tetsuo Handa wrote:
> syzbot is reporting an ERR_PTR(-EINTR) pointer dereference at
> vhci_shutdown_connection() [1], for kthread_create() became killable due
> to commit 786235eeba0e1e85 ("kthread: make kthread_create() killable").
> 
> When SIGKILLed while attach_store() is calling kthread_get_run(),
> ERR_PTR(-EINTR) is stored into vdev->ud.tcp_{rx,tx}, and then
> kthread_stop_put() is called on vdev->ud.tcp_{rx,tx} from
> vhci_shutdown_connection() because vdev->ud.tcp_{rx,tx} != NULL.
> 
> Prior to commit 9720b4bc76a83807 ("staging/usbip: convert to kthread"),
> "current" pointer is assigned to vdev->ud.tcp_{rx,tx} by usbip_thread()
> kernel thread, and hence vdev->ud.tcp_{rx,tx} != NULL means a valid task
> pointer. However, this patch does not make kthread_get_run() return NULL
> when kthread_create() failed, for this patch removes kthread_get_run() in
> order to fix the other bug described below.
> 
> syzbot is also reporting a NULL pointer dereference at sock_sendmsg() [2],
> for lack of serialization between attach_store() and event_handler()
> causes vhci_shutdown_connection() to observe vdev->ud.tcp_tx == NULL while
> vdev->ud.tcp_socket != NULL. Please read the reference link for details of
> this race window.
> 
> Therefore, this patch does the following things in order to fix reported
> bugs and other possible bugs.
> 
> (1) Handle kthread_create() failure (which fixes [1]) by grouping socket
>      lookup, kthread_create() and get_task_struct() into
>      usbip_prepare_threads() function.
> 
> (2) Serialize usbip_sockfd_store(), detach_store(), attach_store() and
>      ud->eh_ops.{shutdown,reset,unusable}() operations using
>      usbip_event_mutex mutex (which fixes [2]). Introducing such large
>      mutex should be safe because ud->tcp_{tx,rx} must not wait for
>      event_handler() to flush because event_handler() is processed by a
>      singlethreaded workqueue.
> 
> (3) Add SOCK_STREAM check into usbip_prepare_threads(), for current code
>      is not verifying that a file descriptor passed is actually a stream
>      socket. If the file descriptor passed was a SOCK_DGRAM socket,
>      sock_recvmsg() can't detect end of stream.
> 
> (4) Don't perform ud->tcp_socket = NULL in vhci_device_reset().
>      Since ud->tcp_{tx,rx} depend on ud->tcp_socket != NULL whereas
>      ud->tcp_socket and ud->tcp_{tx,rx} are assigned at the same time,
>      it is never safe to reset ud->tcp_socket from vhci_device_reset()
>      without calling kthread_stop_put() from vhci_shutdown_connection().
> 
> (5) usbip_sockfd_store() must perform
> 
>        if ({sdev,udc}->ud.status != SDEV_ST_AVAILABLE) {
>          /* misc assignments for attach operation */
>          {sdev,udc}->ud.status = SDEV_ST_USED;
>        }
> 
>      atomically, or multiple ud->tcp_{tx,rx} are created (which will later
>      cause a crash like [2]) and refcount on ud->tcp_socket is leaked when
>      usbip_sockfd_store() is concurrently called.
> 
> [1] https://syzkaller.appspot.com/bug?extid=a93fba6d384346a761e3
> [2] https://syzkaller.appspot.com/bug?extid=95ce4b142579611ef0a9
> 
> Reported-and-tested-by: syzbot <syzbot+a93fba6d384346a761e3@syzkaller.appspotmail.com>
> Reported-by: syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>
> Reported-by: syzbot <syzbot+95ce4b142579611ef0a9@syzkaller.appspotmail.com>
> References: https://lkml.kernel.org/r/676d4518-0faa-9fab-15db-0db8d216d7fb@i-love.sakura.ne.jp
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Fixes: 9720b4bc76a83807 ("staging/usbip: convert to kthread")
> ---
> Changes since v1:
> 
>    Tetsuo Handa found that the PTR_ERR() access in usbip_prepare_threads()
>    in v1 was wrong, and fixed it in v2.
> 
> Changes since v2:
> 
>    The kernel test robot <lkp@intel.com> found the same error using
>    scripts/coccinelle/tests/odd_ptr_err.cocci and
>    Julia Lawall <julia.lawall@inria.fr> sent us a patch, but nothing
>    changed because that error was already fixed in v2.
> 
>   drivers/usb/usbip/stub_dev.c     | 56 ++++++++++++++++++--------------
>   drivers/usb/usbip/usbip_common.c | 55 +++++++++++++++++++++++++++++++
>   drivers/usb/usbip/usbip_common.h | 25 +++++++-------
>   drivers/usb/usbip/usbip_event.c  | 15 +++++++++
>   drivers/usb/usbip/vhci_hcd.c     |  6 ----
>   drivers/usb/usbip/vhci_sysfs.c   | 50 ++++++++++++++++++++--------
>   drivers/usb/usbip/vudc_sysfs.c   | 50 ++++++++++++++++------------
>   7 files changed, 181 insertions(+), 76 deletions(-)
> 

This patch makes changes to 3 different drivers. Please split these
patches. Makes it easier to revert or fix them.

Patch1 could add common routines and use them in stud_dev and vudc
Same for usbip_event_lock_killable() and usbip_event_unlock().
Introduce them in a separate patch.

__usbip_sockfd_store() could be made common to stub_dev and vudc
similar to usbip_prepare_threads() and usbip_unprepare_threads()

It will lot easier to review if this large patch is split into
smaller patches.

thanks,
-- Shuah
