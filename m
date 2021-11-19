Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F33A456A59
	for <lists+linux-usb@lfdr.de>; Fri, 19 Nov 2021 07:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbhKSGmp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Nov 2021 01:42:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:40086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhKSGmp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Nov 2021 01:42:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E7B861A09;
        Fri, 19 Nov 2021 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637303983;
        bh=Mb37KHTUfsrAQocUlJPfaWQnz0Y3er+DsAs4wHtng3Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ck/SoFiPiNhD7974yWd3pGfwtqMGTGEIpFvoWCn/ir7exvLq1nByVz4LL0FR9cquP
         ddfUs2AxxEB/txWLZX9IUqfJSTFLFChG/ctnsT42pqzp4jiqWVM5IUUaaJgqZpbYIk
         41dhkZTTbmuC4EEOUl+ZzlmJXwW38eRBK4+iE82E=
Date:   Fri, 19 Nov 2021 07:39:41 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>
Subject: Re: [PATCH] usb: f_fs: Fix use-after-free for epfile
Message-ID: <YZdGrfDPa5XCNTF3@kroah.com>
References: <1637299915-10477-1-git-send-email-quic_ugoswami@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637299915-10477-1-git-send-email-quic_ugoswami@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 19, 2021 at 11:01:55AM +0530, Udipto Goswami wrote:
> From: Pratham Pratap <quic_ppratap@quicinc.com>
> 
> Consider a case where ffs_func_eps_disable is called from
> ffs_func_disable as part of composition switch and at the
> same time ffs_epfile_release get called from userspace.
> ffs_epfile_release will free up the read buffer and call
> ffs_data_closed which in turn destroys ffs->epfiles and
> mark it as NULL. While this was happening the driver has
> already initialized the local epfile in ffs_func_eps_disable
> which is now freed and waiting to acquire the spinlock. Once
> spinlock is acquired the driver proceeds with the stale value
> of epfile and tries to free the already freed read buffer
> causing use-after-free.
> 
> Following is the illustration of the race:
> 
>       CPU1                                  CPU2
> 
>    ffs_func_eps_disable
>    epfiles (local copy)
> 					ffs_epfile_release
> 				  __ffs_epfile_read_buffer_free
> 					kfree(read_buffers)
> 					kfree(epfile)
> (epfiles still accessible
>  since local copy)
> kfree(read_buffers) <use_after_free>
> 
> Another possibility of user after free is with the read_buffers
> Currently, ffs_func_eps_disable & ffs_epfile_release can race,
> if ffs_epfile_release ran in between while ffs_func_eps_disable
> was executing, due to not being in any lock it can go ahead
> and free the read buffer, but since ffs_func_eps_disable
> maintains a local copy of epfiles, it will still be valid here
> which when tried to free again will cause a user_after_free.
> Following is the illustration of the case:
>       CPU1				      CPU2
> 
>    ffs_func_eps_disable
>    spin_lock_irqsave
>    (epfile) local copy
> 	   				ffs_epfile_release
> 					__ffs_epfile_read_buffer_free
> 					kfree(epfile->read_buffer)
>    __ffs_epfile_read_buffer_free
>    kfree(epfile->read_buffer)
>      <<use_after_free>>
> 
> Fix this races by taking epfile local copy & assigning it under
> spinlock and if epfile(local) is null then update it in ffs->epfiles
> then finally destroy it.
> 
> Change-Id: I85b1a0aea88c0033fbeef4c5db5104caac211540

Always run scripts/checkpatch.pl on your changes so you do not get
grumpy maintainers asking you to run scripts/checkpatch.pl on your
changes.


