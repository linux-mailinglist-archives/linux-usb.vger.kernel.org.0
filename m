Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB7B275260
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2019 17:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389020AbfGYPSK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jul 2019 11:18:10 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39460 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2388457AbfGYPSK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jul 2019 11:18:10 -0400
Received: (qmail 1410 invoked by uid 2102); 25 Jul 2019 11:18:09 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jul 2019 11:18:09 -0400
Date:   Thu, 25 Jul 2019 11:18:09 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Greg KH <greg@kroah.com>
cc:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usbfs: Add ioctls for runtime suspend and resume
In-Reply-To: <20190725091844.GA18907@kroah.com>
Message-ID: <Pine.LNX.4.44L0.1907251112390.1343-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 25 Jul 2019, Greg KH wrote:

> > > Still to do: Write up the documentation.  In fact, the existing
> > > description of usbfs in Documentation/driver-api/usb/usb.rst is sadly
> > > out of date.  And it deserves to be split out into a separate file of
> > > its own -- but I'm not sure where it really belongs, considering that
> > > it is an API for userspace, not an internal kernel API.
> > > 
> > > Greg, suggestions?
> > 
> > Hi Greg,
> > 
> > Did you got a chance to look into the above documentation query by Alan?
> > How should we go about documenting these new IOCTLs?
> 
> Not yet, sorry, dealing with the backlog of patches after the merge
> window closed.
> 
> Give me a week or so...
> 
> But if you want to try your hand at it first, it's always easier to
> review a patch than it is to come up with a new one.

Would Documentation/userspace-api/ be the right place to put this 
information?  It looks like we could take a large chunk of 
driver-api/usb/usb.rst (most of it, in fact) and move it over there.

By the way, do you know anything about how the information in
Documentation/userspace-api gets presented to users in general?  Is
there anything comparable to the Linux man-pages project?  Or are
people just supposed to get hold of the kernel source from somewhere
and read the files there?

Alan Stern

