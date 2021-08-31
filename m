Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38BAE3FC676
	for <lists+linux-usb@lfdr.de>; Tue, 31 Aug 2021 13:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241457AbhHaLLg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Aug 2021 07:11:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:59196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239539AbhHaLLe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 31 Aug 2021 07:11:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B40260249;
        Tue, 31 Aug 2021 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630408239;
        bh=J98eFGfJs5G7nTcHfSh/P7rS3iKA0V+g+wt/xaVf9dQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q48E5TnQdxTBKCZc3dQLPVo7kMYcgxtSk2GJ/ehwDgJrIpbBPmakaP03Rso83T44X
         uAnRLHdQiqVjuoXBA8n4JM8VO232a1N5TARQa0WPHAuHy04ZrUCEIY7MiQGPr6N+Zb
         OmzqljEbqo5n+JGgCvKSB60fuoB4T6I1aq+Se2X86AfjX36kUReGdMZgYKdfNGk7YJ
         nKuZ3c10mpDlrVbEg+VOBVmw8NUMvr3R8i80N7jUHBYJqHdRsPa+5iu3rzDECT3Fz2
         G3BJabLkBw4VIZ+C7obcFAIW5WPFJuu12I7nqj0EwAzsBXlNDE07P9knnmnObzfzPR
         omYtx6nKbhbeQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mL1ey-0001DZ-60; Tue, 31 Aug 2021 13:10:32 +0200
Date:   Tue, 31 Aug 2021 13:10:32 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+ada0f7d3d9fd2016d927@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Make usb_start_wait_urb() interruptible
Message-ID: <YS4OKKox+gZZZ/vV@hovoldconsulting.com>
References: <20210828180358.GA291431@rowland.harvard.edu>
 <0000000000000f37f405caa41e79@google.com>
 <20210829015825.GA297712@rowland.harvard.edu>
 <YSyPQqMPHRiUvYEx@hovoldconsulting.com>
 <20210830144613.GA332514@rowland.harvard.edu>
 <YS3y14DBrg0+n/iI@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS3y14DBrg0+n/iI@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 31, 2021 at 11:13:59AM +0200, Johan Hovold wrote:
> On Mon, Aug 30, 2021 at 10:46:13AM -0400, Alan Stern wrote:

> > Consider that a control message in a driver is likely to use the 
> > default USB_CTRL_[GS]ET_TIMEOUT value of 5 seconds.  Does it make sense 
> > to allow uninterruptible wait states to last as long as that?
> 
> Perhaps sometimes? I don't have a use case at hand, but I haven't
> reviewed all drivers either.
> 
> The comment above usb_start_wait_urb() (which also needs to be updated,
> by the way) even suggests that drivers should "implement their own
> interruptible routines" so perhaps this has just gone unnoticed for 20
> odd years. And the question then becomes, why didn't we use
> interruptible sleep from the start?
> 
> And trying to answer that I find that that's precisely what we did, but
> for some reason it was changed to uninterruptible sleep in v2.4.11
> without a motivation (that I could easily find spelled out).

Here it is:

	https://lore.kernel.org/lkml/20010818013101.A7058@devserv.devel.redhat.com/

It's rationale does not seem valid anymore (i.e. the NULL deref), but
the example is still instructive.

If you close for example a v4l application you still expect the device
to be shut down orderly but with interruptible sleep all control
requests during shutdown will be aborted immediately.

Similar for USB serial devices which would for example fail to deassert
DTR/RTS, etc. (I just verified with the patch applied.)

Johan
