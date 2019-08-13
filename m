Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 833728C1AF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 21:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfHMTwI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 15:52:08 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:42446 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726604AbfHMTwI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Aug 2019 15:52:08 -0400
Received: (qmail 2597 invoked by uid 2102); 13 Aug 2019 15:52:07 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Aug 2019 15:52:07 -0400
Date:   Tue, 13 Aug 2019 15:52:07 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Vai <andrea.vai@unipv.it>
cc:     Johannes Thumshirn <jthumshirn@suse.de>,
        Jens Axboe <axboe@kernel.dk>, <linux-usb@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Slow I/O on USB media after commit f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
In-Reply-To: <e3f87757f7a0fdf551e911ad32fc8122eebe04c7.camel@unipv.it>
Message-ID: <Pine.LNX.4.44L0.1908131541170.1941-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 9 Aug 2019, Andrea Vai wrote:

> Il giorno lun, 08/07/2019 alle 11.38 -0400, Alan Stern ha scritto:
> > 
> > [...]
> >  Andrea, another thing you could try is to collect a usbmon trace
> > under 
> > > > one of the "slow" kernels.  Follow the instructions in 
> > > > Documentation/usb/usbmon.txt.  I think you could kill the file-
> > copy 
> > > > operation after just a couple of seconds; that should provide
> > enough 
> > > > trace information to help see what causes the slowdown.
> > > > 
> > > > (If you want, do the same test with a "fast" kernel and then
> > we'll 
> > > > compare the results.)
> > > > 
> > > > Alan Stern
> > > > 
> > > 
> > > Thanks Alan,
> > >   so I attach two ouputs, one for a "good" and one for a "bad"
> > kernel.
> > 
> > [...]
> > I don't know what the results mean, but I _can_ tell you what's
> > happening.  Every so often (at intervals of about a second) the pen
> > drive completely stops communicating with the "bad" kernel for about
> > one second and then starts up again.
> > 
> > Here's a short example from the "bad" trace:
> > 
> > ffff9169f0d399c0 513072808 S Bo:6:008:2 -115 122880 = 00000000
> > 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > ffff9169f0d399c0 514262176 C Bo:6:008:2 0 122880 >
> > 
> > The second column is a timestamp (in microseconds).  This little
> > extract shows a 120-KB write starting at time 513.072 and ending at
> > 514.262, more than a second later.  Normally such a write would
> > complete in about 0.06 s.
> > 
> > The cumulative effect of all these delays is to slow the transfer 
> > drastically.  The "good" kernel trace shows a few delays like this,
> > but 
> > only one or two.
> > 
> > I have no idea how commit f664a3cc17b7, getting rid of the legacy
> > IO 
> > path, could have caused these delays.  It seems more likely that
> > the 
> > pen drive itself is the cause, perhaps because it is flushing
> > buffers 
> > more often under the "bad" kernel.
> > 
> > I'd like you to try doing another pair of usbmon tests.  This time,
> > start collecting the usbmon trace _before_ you plug in the pen
> > drive,
> > and stop the trace shortly after the pen drive has been mounted.  
> > Don't try to transfer any data.  Perhaps the two kernels are
> > initializing the pen drive with different settings and that accounts
> > for the different behaviors.
> 
> Thanks Alan, sorry for the delay (I haven't had physical access to the
> device for a while). I attach the two new usbmon logs.
> 
> Meanwhile, I can try with other pendrives, although I already tried
> two more and both behave "bad" (but one is identical to the first, and
> the other one is similar).

I looked through your two traces.  Unfortunately they don't help --
they are essentially identical.  Exactly the same sequence of commands
was sent to the device in both traces, except for a couple of
inconsequential TEST UNIT READY commands.

There are some timing differences, but they occur in between commands,
not during a command.  They probably are the times you spent typing
stuff into the terminal.

Can you run another test?  Similar to the last one, but this time start
collecting the usbmon trace at least 10 seconds after the drive is
plugged in.  Then mount the drive, copy a small file (say less than 500
bytes) to it, unmount it, and then stop the trace.

Alan Stern

