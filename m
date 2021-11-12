Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D795B44E20A
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 07:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbhKLGvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 01:51:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:33850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230259AbhKLGvm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Nov 2021 01:51:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55E3D60F45;
        Fri, 12 Nov 2021 06:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636699731;
        bh=qXKu3Oe2wMvXvs1f/dFwbf2Z0G6CVAGucvDoGOiPeyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1IWVkOD+N2zw7/XHibGVlA4XQGlT5LpWnWjy3MrcML8q/p2jkH8fCLFKmiw4v6n77
         yrvbSuh7jNlnskjVDGNd3NAKoSGbKMqco3hIOw3xzXVcsIRxYcnbWIxuwQdZIDh6+O
         0Wfr/VvROtR/uoBwsdlvxHKm/h55i3ehDwtaFoMM=
Date:   Fri, 12 Nov 2021 07:48:47 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Jack Pham <jackp@codeaurora.org>,
        Peter Chen <peter.chen@nxp.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] usb: gadget: f_fs: Use stream_open() for endpoint
 files
Message-ID: <YY4OT37EoO23s+Hm@kroah.com>
References: <20211111120636.GA11612@hu-pkondeti-hyd.qualcomm.com>
 <1636632958-22802-1-git-send-email-quic_pkondeti@quicinc.com>
 <YY0WvD57FGums0a8@kroah.com>
 <20211112031730.GB11612@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112031730.GB11612@hu-pkondeti-hyd.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 08:47:30AM +0530, Pavan Kondeti wrote:
> Hi Greg,
> 
> On Thu, Nov 11, 2021 at 02:12:28PM +0100, Greg Kroah-Hartman wrote:
> > On Thu, Nov 11, 2021 at 05:45:56PM +0530, Pavankumar Kondeti wrote:
> > > Function fs endpoint files does not have the notion of file position.
> > > So switch to stream like functionality. This allows concurrent threads
> > > to be blocked in the ffs read/write operations which use ffs_mutex_lock().
> > > The ffs mutex lock deploys interruptible wait. Otherwise, threads are
> > > blocking for the mutex lock in __fdget_pos(). For whatever reason, ff the
> > > host does not send/receive data for longer time, hung task warnings
> > > are observed.
> > 
> > So the current code is broken?  What commit caused it to break?
> 
> This is not a serious bug that can affect functionality. if hung_task_panic
> sysctl is not enabled, probably nobody would notice this except an obscure
> warning in the kernel dmesg log. It is all about the task state while
> it is blocked for I/O. The function fs code uses interruptible wait but
> we are not reaching there and getting blocked at VFS layer due to the below
> commit introduced from 3.14 kernel.
> 
> commit 9c225f2655e36a470c4f58dbbc99244c5fc7f2d4
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Mon Mar 3 09:36:58 2014 -0800
> 
>     vfs: atomic f_pos accesses as per POSIX
> 
>     Our write() system call has always been atomic in the sense that you get
>     the expected thread-safe contiguous write, but we haven't actually
>     guaranteed that concurrent writes are serialized wrt f_pos accesses, so
>     threads (or processes) that share a file descriptor and use "write()"
>     concurrently would quite likely overwrite each others data.
> 
> We have uncovered this issue via customer bug report which happens very rarely.
> It only happens like when host does not pull the data for a very long time.
> Since function fs does not care about file position, thought stream_open()
> is the right thing to do here.
> 
> > 
> > Doesn't this change cause a change in behavior for existing userspace
> > tools, or will they still work as-is?
> > 
> 
> I don't think it affects user space as it just changes the task state from 
> UNINTERRUPTIBLE to INTERRUPTIBLE while waiting for the USB transfers to
> finish. However there is a slight change to the O_NONBLOCK behavior.
> Earlier threads that are using O_NONBLOCK are also getting blocked
> inside fdget_pos(). Now they reach to f_fs and error code is returned. IOW,
> we are actually fixing the non blocking behavior here.
> 
> PS: I believe you asked these questions since the commit description does not
> cover it. I can happily add all this information to it. Since it is all historical,
> I did not mention it.

Please add all of this to the commit log description so that we can
properly understand it in the future.

thnaks,

greg k-h
