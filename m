Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01727360E4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 18:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728671AbfFEQL4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 12:11:56 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:56846 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728560AbfFEQLz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 12:11:55 -0400
Received: (qmail 5092 invoked by uid 2102); 5 Jun 2019 12:11:54 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Jun 2019 12:11:54 -0400
Date:   Wed, 5 Jun 2019 12:11:54 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <4f2e5b456eb0f53b8c921465c1b1c4813b918f65.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1906051206350.1788-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 5 Jun 2019, Andrea Vai wrote:

> Hi,
> Il giorno mer, 05/06/2019 alle 10.26 -0400, Alan Stern ha scritto:
> > On Wed, 5 Jun 2019, Andrea Vai wrote:
> > 
> > > Hi,
> > > Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> > > > On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > > > > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha
> > scritto:
> > > > > > [...]
> > > > > Hi,
> > > > > 
> > > > > > Any chance you can use 'git bisect' to find the offending
> > > > commit?
> > > > > Yes, I am doing it as I managed to build the kernel from
> > source
> > > > 
> > > > Great!  What did you find?
> > > 
> > > # first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
> > > drm/atomic: Use explicit old crtc state in
> > > drm_atomic_add_affected_planes()
> > > 
> > > By the way, as I am not expert, is there a way to double-check
> > that I
> > > bisected correctly? (such as, e.g., test with the version before
> > this
> > > one, and then with this commit applied?)
> > 
> > That is exactly the way to do it: Build a kernel from that commit
> > and 
> > see that it fails, then revert the commit and see that the
> > resulting 
> > kernel succeeds.
> > 
> > (Note: The notion of "version before" doesn't have a firm meaning
> > in 
> > the kernel, because some commits have multiple parents.  The best
> > way 
> > to see if a single commit caused a change is to do what I said
> > above: 
> > revert the commit and see what happens.)
> ok, thank you for pointing it out. So, my question is: how to revert a
> commit? (sorry, I prefer to ask you because I am afraid I could do
> something wrong, and don't trust too much myself and what I pick up
> searching on the web. In the special case, I found "git revert", but
> for example how could I revert back a "reversion"? :-/ (I know I miss
> the basis, I never worked with git, so sorry for the stupid
> question)).

In this case it's very simple, since the 534903d60376 commit does have 
a single parent.  You can just do "git checkout 534903d60376^".

More generally, you could do "git show 534903d60376 | git apply -R -".  
That would tell git to write out the commit in the form of a patch and 
then apply the patch in reverse.

Alan Stern

> > Incidentally, it seems very unlikely that a commit for the drm 
> > subsystem would have any effect on the behavior of a USB storage 
> > device.
> 
> well, I had the same doubt and that's the reason I was trying to do
> the check: I'm afraid I have done something wrong or made a mess with
> the bisect process.
> 
> Thank you,
> Andrea

