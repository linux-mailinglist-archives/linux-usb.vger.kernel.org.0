Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B39658AC
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2019 16:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728421AbfGKOUL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 10:20:11 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47081 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728511AbfGKOUL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Jul 2019 10:20:11 -0400
Received: (qmail 4551 invoked by uid 500); 11 Jul 2019 10:20:10 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 11 Jul 2019 10:20:10 -0400
Date:   Thu, 11 Jul 2019 10:20:10 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Greg KH <greg@kroah.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usbfs: Add ioctls for runtime suspend and resume
In-Reply-To: <1562836586.4259.6.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1907111013400.2503-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 11 Jul 2019, Mayuresh Kulkarni wrote:

> On Fri, 2019-07-05 at 14:51 -0400, Alan Stern wrote:
> > On Wed, 3 Jul 2019, Mayuresh Kulkarni wrote:
> > 
> > > 
> > > As you had mentioned in one of the comment before, the only addition
> > > to
> > > the patch I have locally is -
> > > usbfs_notify_resume() has usbfs_mutex lock around list traversal.
> > > 
> > > Could you please send the patch for review? Please note, I think I
> > > am
> > > not a part of linux-usb mailing-list, so probably need to be in cc
> > > to
> > > get the patch email. Do let me know if something else is needed from
> > > me.
> > Here it is.  There are two changes from the previous version:
> > 
> > 1.	This is rebased on top of a separate patch which Greg has 
> > 	already accepted:
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit?
> > id=ffed60971f3d95923b99ea970862c6ab6a22c20f
> > 
> > 2.	I implemented Oliver's recommendation that the
> > WAIT_FOR_RESUME
> > 	ioctl should automatically do FORBID_SUSPEND before it returns, 
> > 	if the return code is 0 (that is, it wasn't interrupted by a 
> > 	signal).
> > 
> 
> Hi Alan,
> 
> This patch looks good.
> Let me know the next step(s) and if anything else is needed from me.

The next step is to see if there are any comments.  If there aren't, I
will submit the patch officially.

> Thanks.
> 
> > Still to do: Write up the documentation.  In fact, the existing
> > description of usbfs in Documentation/driver-api/usb/usb.rst is sadly
> > out of date.  And it deserves to be split out into a separate file of
> > its own -- but I'm not sure where it really belongs, considering that
> > it is an API for userspace, not an internal kernel API.
> > 
> > Greg, suggestions?
> > 
> > Alan Stern
> > 
> 
> A request -
> 
> I will highly appreciate if someone from Google/Android's USB team
> comment on this patch. The reason being, when this is merged, I imagine
> there will be suitable APIs in some future version of Google/Android's
> USB manager to enable suspend/resume for apps.

Nobody on Google/Android's USB team is likely to comment unless you 
bring this directly to their attention.  Don't assume they will just 
happen to see it on the mailing list.

Also, the last I looked, Android was using version 4.9 of the kernel.  
Since this patch won't get into the kernel until version 5.4 at the
earliest, it may be quite a while before it shows up in Android.

Alan Stern

