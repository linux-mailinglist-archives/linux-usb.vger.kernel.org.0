Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B427D168FCA
	for <lists+linux-usb@lfdr.de>; Sat, 22 Feb 2020 16:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbgBVPht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Feb 2020 10:37:49 -0500
Received: from netrider.rowland.org ([192.131.102.5]:39421 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727266AbgBVPht (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Feb 2020 10:37:49 -0500
Received: (qmail 27503 invoked by uid 500); 22 Feb 2020 10:37:48 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 Feb 2020 10:37:48 -0500
Date:   Sat, 22 Feb 2020 10:37:48 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     jerry willson <Mywifiextsetupus@gmail.com>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [Bug 11159] reset high speed USB device using ehci_hcd
In-Reply-To: <bug-11159-1728-jCcXkBT7CO@https.bugzilla.kernel.org/>
Message-ID: <Pine.LNX.4.44L0.2002221033300.26570-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 22 Feb 2020 bugzilla-daemon@bugzilla.kernel.org wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=11159
> 
> jerry willson (Mywifiextsetupus@gmail.com) changed:
> 
>            What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                  CC|                            |Mywifiextsetupus@gmail.com

This bug report has been closed for 5 years.  Are you really sure you 
want to start referring to it onw?

> --- Comment #108 from jerry willson (Mywifiextsetupus@gmail.com) ---
> log files of different OSes caused and not caused by this problem
> 
> The OSes:
> 1. Windows 7
> 2. Windows XP
> 3. FreeBSD 9.3
> are not affected by "new high-speed USB device number" problem. They works
> fine.
> The FreeBSD 9.3 just report about some error for umass:
> 
> Oct 18 00:30:23  kernel: (probe0:umass-sim0:0:0:0): INQUIRY. CDB: 12 00 00 00
> 24 00 
> Oct 18 00:30:23  kernel: (probe0:umass-sim0:0:0:0): CAM status: CCB request
> completed with an error
> Oct 18 00:30:23  kernel: (probe0:umass-sim0:0:0:0): Retrying command
> Oct 18 00:30:23  kernel: (probe0:umass-sim0:0:0:0): INQUIRY. CDB: 12 00 00 00
> 24 00 
> Oct 18 00:30:23  kernel: (probe0:umass-sim0:0:0:0): CAM status: CCB request
> completed with an error
> Oct 18 00:30:23  kernel: (probe0:umass-sim0:0:0:0): Error 5, Retries exhausted
> 
> 
> 4. cinnamon mint 15 (3.8.0-19-generic) works fine, but kern.log file is spamed
> by this messages:
> 
> Oct 21 13:54:17 kes-desktop kernel: [ 4260.504011] usb 1-2: new high-speed USB
> device number 34 using ehci-pci
> Oct 21 13:54:17 kes-desktop kernel: [ 4260.572330] hub 1-0:1.0: unable to
> enumerate USB device on port 2
> Oct 21 13:54:17 kes-desktop kernel: [ 4260.788218] hub 1-0:1.0: unable to
> enumerate USB device on port 2
> 
> 5. ubuntu 12.04 also is not affected.
> 
> These has problems:
> 1. ubuntu 14.04. It is loading too slow and after loading I can not visit sites
> that uses adobe_flash plugin. The browser is halted (see print_screen:
> ubuntu-14.04-ishalted.png).
> 
> 2. cinnamon-mint-16
> 3. Fresh installation of 17.1
> 
> I also want to check how work mint 14 and 13, but I can not install them due to
> the installer error
> 
> The detailed log messages for those systems see at attachment
> 
> It seems some bug is introduced to the new kernels. If someone give me detaided
> instructions how to use bisect and how to compile/install kernels from source I
> can complete that.

You put so many different things into this message that I can't tell 
what your main point is.  If you want to report a problem in the 
kernel, please give details and include the kernel log in your bug 
report.

Information on how to use git-bisect and build kernels is readily 
available on the web.  All you have to do is ask Google.

Alan Stern

