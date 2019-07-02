Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E53D5D1BF
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 16:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGBO3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 10:29:45 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:48442 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726341AbfGBO3p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 10:29:45 -0400
Received: (qmail 2917 invoked by uid 2102); 2 Jul 2019 10:29:44 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Jul 2019 10:29:44 -0400
Date:   Tue, 2 Jul 2019 10:29:44 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1562059312.5819.11.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1907021028200.1647-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2 Jul 2019, Oliver Neukum wrote:

> Am Montag, den 01.07.2019, 10:17 -0400 schrieb Alan Stern:
> > On Mon, 1 Jul 2019, Oliver Neukum wrote:
> > 
> > > Am Donnerstag, den 27.06.2019, 09:52 -0400 schrieb Alan Stern:
> > > 
> > > > 
> > > > Or maybe the WAIT_FOR_RESUME ioctl returns because there was a remote 
> > > > wakeup.  In this case also you would call FORBID_SUSPEND.
> > > > 
> > > > In fact, you should call FORBID_SUSPEND _whenever_ WAIT_FOR_RESUME
> > > 
> > > Well, this kind of indicates that the original syscall should bump
> > > the counter.
> > 
> > Perhaps it does, but...
> > 
> > > > returns, unless your program has decided not to use the device any more
> > > > (in which case you don't care whether the device is suspended or
> > > > resumed).
> > > 
> > > Then you should close the device.
> > 
> > Exactly.  Suppose WAIT_FOR_RESUME is interrupted and then the program
> > closes the device.  There's no need to force the device back to full 
> > power in this situation.
> 
> But that is the error case. You return an error code. The point of that
> is to report that a syscall did not have all requested effects.

Okay, I can change the patch to work as you suggest.  The 
WAIT_FOR_RESUME ioctl will do the equivalent of FORBID_SUSPEND whenever 
it returns with no error.

Alan Stern

