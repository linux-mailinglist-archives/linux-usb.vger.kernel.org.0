Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A64F31FC71
	for <lists+linux-usb@lfdr.de>; Fri, 19 Feb 2021 16:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhBSPys (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Feb 2021 10:54:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:47182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229755AbhBSPyn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Feb 2021 10:54:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3889464E77;
        Fri, 19 Feb 2021 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613750041;
        bh=iq+6+kFQBSXiIZq1YE/kn0ZurbD43PT1nIL+djy0n1w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T+wKnyvOafRJ12Y+7cavJz386BsuUG0YyZ5yslyNN9DM2O0XnUpSXSkx8rsgI0EaB
         gvFj2Q1KcPUGu+QSII4+v7FDRcC8jKlrGeL0udOYK1cGleYi4EkCnLsWyIqHkct7W4
         78KMsCwx1oFt5XeqJh8QEg18S/uxULFQ5gbzE8sU=
Date:   Fri, 19 Feb 2021 16:53:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: usbip: serialize attach/detach operations
Message-ID: <YC/fF0c7PA3ndTPv@kroah.com>
References: <20210219094744.3577-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20210219150832.4701-1-penguin-kernel@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219150832.4701-1-penguin-kernel@I-love.SAKURA.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Feb 20, 2021 at 12:08:32AM +0900, Tetsuo Handa wrote:
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
>     lookup, kthread_create() and get_task_struct() into
>     usbip_prepare_threads() function.
> 
> (2) Serialize usbip_sockfd_store(), detach_store(), attach_store() and
>     ud->eh_ops.{shutdown,reset,unusable}() operations using
>     usbip_event_mutex mutex (which fixes [2]). Introducing such large
>     mutex should be safe because ud->tcp_{tx,rx} must not wait for
>     event_handler() to flush because event_handler() is processed by a
>     singlethreaded workqueue.
> 
> (3) Add SOCK_STREAM check into usbip_prepare_threads(), for current code
>     is not verifying that a file descriptor passed is actually a stream
>     socket. If the file descriptor passed was a SOCK_DGRAM socket,
>     sock_recvmsg() can't detect end of stream.
> 
> (4) Don't perform ud->tcp_socket = NULL in vhci_device_reset().
>     Since ud->tcp_{tx,rx} depend on ud->tcp_socket != NULL whereas
>     ud->tcp_socket and ud->tcp_{tx,rx} are assigned at the same time,
>     it is never safe to reset ud->tcp_socket from vhci_device_reset()
>     without calling kthread_stop_put() from vhci_shutdown_connection().
> 
> (5) usbip_sockfd_store() must perform
> 
>       if ({sdev,udc}->ud.status != SDEV_ST_AVAILABLE) {
>         /* misc assignments for attach operation */
>         {sdev,udc}->ud.status = SDEV_ST_USED;
>       }
> 
>     atomically, or multiple ud->tcp_{tx,rx} are created (which will later
>     cause a crash like [2]) and refcount on ud->tcp_socket is leaked when
>     usbip_sockfd_store() is concurrently called.
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
>  drivers/usb/usbip/stub_dev.c     | 56 ++++++++++++++++++--------------
>  drivers/usb/usbip/usbip_common.c | 55 +++++++++++++++++++++++++++++++
>  drivers/usb/usbip/usbip_common.h | 25 +++++++-------
>  drivers/usb/usbip/usbip_event.c  | 15 +++++++++
>  drivers/usb/usbip/vhci_hcd.c     |  6 ----
>  drivers/usb/usbip/vhci_sysfs.c   | 50 ++++++++++++++++++++--------
>  drivers/usb/usbip/vudc_sysfs.c   | 50 ++++++++++++++++------------
>  7 files changed, 181 insertions(+), 76 deletions(-)

What changed from v1?  Why isn't that info below the --- line?

Please do a v3 with that fixed up.

thanks,

greg k-h
