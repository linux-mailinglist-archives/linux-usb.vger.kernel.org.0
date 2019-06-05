Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7192335F2C
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 16:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbfFEO0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 10:26:45 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:56538 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728290AbfFEO0p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 10:26:45 -0400
Received: (qmail 2056 invoked by uid 2102); 5 Jun 2019 10:26:44 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 Jun 2019 10:26:44 -0400
Date:   Wed, 5 Jun 2019 10:26:44 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Greg KH <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
Subject: Re: Slow I/O on USB media
In-Reply-To: <9b013238be4e3c63e33181a954d1ecc3287d22e4.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1906051022380.1788-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 5 Jun 2019, Andrea Vai wrote:

> Hi,
> Il giorno mar, 04/06/2019 alle 07.43 +0200, Greg KH ha scritto:
> > On Mon, Jun 03, 2019 at 01:13:48PM +0200, Andrea Vai wrote:
> > > Il giorno gio, 30/05/2019 alle 06.25 -0700, Greg KH ha scritto:
> > > > [...]
> > > Hi,
> > > 
> > > > Any chance you can use 'git bisect' to find the offending
> > commit?
> > > Yes, I am doing it as I managed to build the kernel from source
> > 
> > Great!  What did you find?
> 
> # first bad commit: [534903d60376b4989b76ec445630aa10f2bc3043]
> drm/atomic: Use explicit old crtc state in
> drm_atomic_add_affected_planes()
> 
> By the way, as I am not expert, is there a way to double-check that I
> bisected correctly? (such as, e.g., test with the version before this
> one, and then with this commit applied?)

That is exactly the way to do it: Build a kernel from that commit and 
see that it fails, then revert the commit and see that the resulting 
kernel succeeds.

(Note: The notion of "version before" doesn't have a firm meaning in 
the kernel, because some commits have multiple parents.  The best way 
to see if a single commit caused a change is to do what I said above: 
revert the commit and see what happens.)

Incidentally, it seems very unlikely that a commit for the drm 
subsystem would have any effect on the behavior of a USB storage 
device.

Alan Stern

