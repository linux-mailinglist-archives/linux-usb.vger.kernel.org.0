Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE42468A11
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 09:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhLEIYJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 03:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbhLEIYI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 03:24:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407A9C061751
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 00:20:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE59F60AD3
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 08:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8409DC341C1;
        Sun,  5 Dec 2021 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638692440;
        bh=iqzD/gY69nd+o8dPTjt/1u2nLN6g5BniUv04ICgJODU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z4l4ywpzhC9RsIvABLniCNAPkmuu5bS5kIfct4E/ckcnGQQ3S6leduFNamqg8SMix
         9KUQOQ3ypn1hfJ0aOa+pgeegSuxFY0BCtY/30HXEwLljoAPBQsdeaqD/l/DiQIfdUQ
         9MFeim/kkvRHQ9p+m4Uaecu8lrPymtIlEJR7AJLA=
Date:   Sun, 5 Dec 2021 09:20:36 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pavankumar Kondeti <pkondeti@codeaurora.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Regression: "xhci: Fix command ring pointer corruption while
 aborting a command" breaks USB on Intel controllers
Message-ID: <Yax2VOHGzG7ToVec@kroah.com>
References: <0a4d723c-221f-a42a-434c-34283a4cdab7@redhat.com>
 <3a5e7a4d-9986-9862-b601-cd7e8bd06855@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5e7a4d-9986-9862-b601-cd7e8bd06855@leemhuis.info>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Dec 05, 2021 at 07:46:39AM +0100, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> On 04.12.21 15:15, Hans de Goede wrote:
> > Hi All,
> > 
> > There are several bug reports (arch and Fedora) about USB problems
> > starting with kernel 5.14.14 (5.14.13 is ok):
> > 
> > https://bugzilla.redhat.com/show_bug.cgi?id=2019788
> > https://bbs.archlinux.org/viewtopic.php?pid=2006862
> > 
> > And 5.16.6, which has the hub address0_mutex fixes does not
> > fix these problems for some users.
> > 
> > Looking at the history between those 2 commit ff0e50d3564f
> > ("xhci: Fix command ring pointer corruption while aborting a command"):
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff0e50d3564f
> > 
> > stood out to me as a possible cause of this. So I've build
> > a test 5.15.6 kernel for Fedora users with that commit reverted
> > and 2 users have now reported that this fixes things for them
> > (see https://bugzilla.redhat.com/show_bug.cgi?id=2019788).
> > 
> > The reason why this stood out to me is because doing a 32 bit
> > write over a possibly 64 bit databus to the xHCI controller may
> > result in the hw doing a 64 bit read + modify 32 bit + 64 bit write,
> > so I think that the following is happening after the commit:
> > 
> > sw: read 32 bit
> > hw: read 64 bit, return 32 bit
> > sw: modify it
> > sw: write 32 bit
> > hw: read 64 bit
> > hw: modify 32 bit of 64 bit wor5d
> > hw: write 64 bit
> > 
> > Which actually makes the chances of hitting the problem the commit
> > tries to fix larger on controllers using a 64 bit data bus.
> > 
> > Note this is just a theory, but it seems plausible to me.
> > 
> > All problem reports are people using integrated Intel xHCI controllers
> > which I believe are likely to use a 64 bit data-bus.
> 
> FWIW, the commit is known to cause problems, one of them is found here:
> 
> https://lore.kernel.org/lkml/35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org/
> 
> This commit should improve the situation (and afaics hopefully fix all
> problems related to it):
> 
> https://lore.kernel.org/stable/20211126122340.1193239-2-mathias.nyman@linux.intel.com/
> 
> Greg wants to sent it upstream today:
> 
> https://lore.kernel.org/lkml/YatGfEzzniH%2FSrn4@kroah.com/
> 
> Guess he soon after will backport it to the stable trees as well.
> 
> HTH, Ciao, Thorsten
> 
> #regzbot ^backmonitor
> https://lore.kernel.org/lkml/35f7428b39f996c793f5b4a6a314772681c73d7a.camel@apache.org/

Ah, I should have read the whole thread, yes, this should be the fix for
this.

thanks,

greg k-h
