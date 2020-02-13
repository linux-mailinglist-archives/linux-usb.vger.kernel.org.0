Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 959F915C0AD
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 15:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgBMOta (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 09:49:30 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:59984 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726780AbgBMOta (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 09:49:30 -0500
Received: (qmail 1587 invoked by uid 2102); 13 Feb 2020 09:49:28 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Feb 2020 09:49:28 -0500
Date:   Thu, 13 Feb 2020 09:49:28 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Sam Lewis <sam.vr.lewis@gmail.com>
cc:     Oliver Neukum <oneukum@suse.de>, <linux-usb@vger.kernel.org>
Subject: Re: USB hub driver over-current behavior
In-Reply-To: <CA+ZLECuKY0zOfGW4=5U1o0fYuYta9Xxdxwvbj5zS5TB6NVoqFQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2002130947420.1572-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 13 Feb 2020, Sam Lewis wrote:

> On Tue, 11 Feb 2020 at 01:53, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, 10 Feb 2020, Oliver Neukum wrote:
> > > error handling at this level has gotten little love.
> >
> > Indeed.  This is mostly because the issue does not crop up in normal
> > usage very often.  And most hubs don't have very good over-current
> > protection anyway.
> >
> > I believe the original expectation was that over-current events would
> > generally be intermittent and very short-lived.  So when an event did
> > occur, it would make sense to wait a little while and then try to
> > switch the port back on.  Nobody ever bothered to implement a total
> > time or retry limit on this behavior, probably because there weren't
> > any complaints.
> 
> Thanks for the responses. This makes sense, especially if most
> consumer hubs aren't very high quality.
> 
> > > The basic problem is that we have no good way to switch a portback on
> > > after we have given up on it. Feel free to propose a patch to the
> > > kernel and a tool to use it and we can discuss them.
> >
> > Yes, patches are welcome.
> >
> 
> How receptive would you (and other contributors/maintainers) be to a
> patch that adds configuration that allows a port to stay off if it
> receives an OC event? This obviously wouldn't be the desired behaviour
> in the general case, but could be useful for embedded devices (such as
> mine) where the design of the hub electronics are such that you can be
> confident that an OC event is not just an glitch and is indicative of
> a real problem.

That would be okay.  You could even do something where the port would 
stay powered off until the user tells the kernel to turn it back on.

> If it isn't acceptable to have a USB port off until the system is
> rebooted, what would be the appropriate mechanism of allowing a
> userspace application to manually turn the port back on?

A sysfs attribute file is the way to go.  Probably under the port
device.

Alan Stern

