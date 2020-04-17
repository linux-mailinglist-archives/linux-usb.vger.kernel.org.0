Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7131AE671
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 22:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730751AbgDQUGF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Apr 2020 16:06:05 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52665 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730573AbgDQUGF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Apr 2020 16:06:05 -0400
Received: (qmail 31793 invoked by uid 500); 17 Apr 2020 16:06:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 17 Apr 2020 16:06:04 -0400
Date:   Fri, 17 Apr 2020 16:06:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Cyril Roelandt <tipecaml@gmail.com>
cc:     USB list <linux-usb@vger.kernel.org>, <sellis@redhat.com>,
        <pachoramos@gmail.com>, <labbott@fedoraproject.org>,
        <gregkh@linuxfoundation.org>, <javhera@gmx.com>
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
In-Reply-To: <20200417183203.GA1889@Susan>
Message-ID: <Pine.LNX.4.44L0.2004171539350.25043-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 17 Apr 2020, Cyril Roelandt wrote:

> On 2020-04-15 21:21, Alan Stern wrote:

> > > I do not really mind not being able to use uas, however I would like to
> > > be able to mount my partitions using usb-storage.
> > 
> > It's entirely possible that the blacklisting is not necessary any more.  
> > After all, it was added four and a half years ago; the kernel has
> > improved since then.  I guess you're not in a position to test this,
> > but maybe Steve Ellis or Takeo Nakayama is...?
> > 
> > Does 5.3 work if you add a similar blacklist entry?
> 
> I cloned Linus' tree, and cherry-picked
> bc3bdb12bbb3492067c8719011576370e959a2e6 on top of v5.3, rebuilt the
> kernel and rebooted: I had the exact same issue.
> 
> > 
> > Can you collect usbmon traces showing what happens with both uas and
> > usb-storage?  Perhaps different sequences of commands get sent to the
> > drive with the two drivers.
> 
> Here it is:

Two things.  First, you started the usbmon traces _after_ plugging in
the drive.  As a result the traces do not contain a complete record of
all the transfers between the computer and the drive; it's possible
that something in the missing portions is responsible for your problem.
For example, why does your uas log include a line ("[sdb] 4096-byte 
physical blocks") that is missing in the usb-storage log?

Second, the usbmon traces do show exactly where the problem appears.  
Let's start with the preceding command, which is a READ(10).  With uas:

ffff9d62594efe40 1213006464 S Bo:002:01 -115 32 = 01000001 00000000 00000000 00000000 28003a04 08000000 08000000 00000000
--------------------------------------------------------------------------------------^^^^^^^^^^^^^^^^^^^^^^
ffff9d62594efe40 1213006480 C Bo:002:01 0 32 >
ffff9d62594efb40 1213006651 C Bi:002:03 0 4096 = c03b3998 00000004 00000000 00001000 00008000 00000001 0000c685 00000000
ffff9d62594ef240 1213006663 C Bi:002:02 0 16 = 03000001 00000000 00000000 00000000

This is a little difficult to follow, but I have marked the portion
which contains the actual 10-byte SCSI command.  It transfers 4096
bytes of data to the computer, as shown in the second-to-last line
(only the first 32 bytes are saved in the trace).

The same thing happens with usb-storage:

ffff8c08b51be3c0 3314212 S Bo:012:02 -115 31 = 55534243 84000000 00100000 80000a28 003a0408 00000008 00000000 000000
--------------------------------------------------------------------------------^^^^^^^^^^^^^^^^^^^^^^^
ffff8c08b51be3c0 3314233 C Bo:012:02 0 31 >
ffff8c0a8a278180 3314252 S Bi:012:01 -115 4096 <
ffff8c0a8a278180 3314323 C Bi:012:01 0 4096 = c03b3998 00000004 00000000 00001000 00008000 00000001 0000c685 00000000
ffff8c08b51be3c0 3314334 S Bi:012:01 -115 13 <
ffff8c08b51be3c0 3314362 C Bi:012:01 0 13 = 55534253 84000000 00000000 00

Again, I have marked the actual command.  You can see that it matches 
exactly, as does the data sent back by the drive.

The next command is a WRITE(10).  The uas version:

ffff9d62594ef840 1213008271 S Bo:002:04 -115 4096 = 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffff9d62594efa80 1213008273 S Bo:002:01 -115 32 = 01000001 00000000 00000000 00000000 2a080000 08000000 08000000 00000000
--------------------------------------------------------------------------------------^^^^^^^^^^^^^^^^^^^^^^
ffff9d62594efa80 1213008295 C Bo:002:01 0 32 >
ffff9d62594ef840 1213008550 C Bo:002:04 0 4096 >
ffff9d62594efc00 1213008589 C Bi:002:02 0 16 = 03000001 00000000 00000000 00000000

The first 32 bytes of the data being written are all 0, shown in the 
first line.  The same command with usb-storage:

ffff8c08b51be3c0 3318170 S Bo:012:02 -115 31 = 55534243 85000000 00100000 00000a2a 08000008 00000008 00000000 000000
--------------------------------------------------------------------------------^^^^^^^^^^^^^^^^^^^^^^^
ffff8c08b51be3c0 3318184 C Bo:012:02 0 31 >
ffff8c089903c180 3318189 S Bo:012:02 -115 4096 = 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
ffff8c089903c180 3318233 C Bo:012:02 0 4096 >
ffff8c08b51be3c0 3318239 S Bi:012:01 -115 13 <
ffff8c08b51be3c0 3318262 C Bi:012:01 0 13 = 55534253 85000000 00100000 01

The 01 at the end of the last line is a status indicator; it says that
the command failed.  The following command (not shown here) gets more
detailed status from the drive; you've already seen that information in
your logs (Invalid Request, Invalid field in cdb).

Of course, this makes no sense because the drive had no problem
understanding the exact same command when it was sent by uas.

At this point, all I can say is that something about the combination of
the enclosure and the drive works with the UAS transport but not with
the USB Mass-Storage transport.  As far as we can see from the usbmon 
traces, the kernel isn't doing anything wrong.

Alan Stern

