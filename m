Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2A12B9934
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 18:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729061AbgKSRWv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 12:22:51 -0500
Received: from netrider.rowland.org ([192.131.102.5]:39173 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728551AbgKSRWv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Nov 2020 12:22:51 -0500
Received: (qmail 577983 invoked by uid 1000); 19 Nov 2020 12:22:50 -0500
Date:   Thu, 19 Nov 2020 12:22:50 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <20201119172250.GC576844@rowland.harvard.edu>
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
 <20201116170625.GC436089@rowland.harvard.edu>
 <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 16, 2020 at 01:42:46PM -0500, Alberto Sentieri wrote:
> Alan,
> 
> I am not sure if that would give you any clue, but I enabled usbfs_snoop in
> the kernel and I got URB error -108 (endpoint shutdown) just before the
> kernel lock.
> 
> Just after starting the program, I got something like that:
> 
> [  174.325977] usb 1-1.1.1: opened by process 2961: ate
> [  174.326006] usb 1-1.1.1: usbdev_do_ioctl: GETDRIVER
> [  174.326015] usb 1-1.1.1: usbdev_do_ioctl: IOCTL
> [  174.326334] usb 1-1.1.1: usbdev_do_ioctl: CLAIMINTERFACE
> [  174.326371] usb 1-1.1.1: usbdev_do_ioctl: SETINTERFACE
> [  174.326582] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326592] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326617] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326623] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326629] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326635] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326640] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326645] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326652] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326657] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326663] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326668] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326674] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326679] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326685] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326691] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326696] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326702] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326708] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326713] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326718] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326723] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326729] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326734] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326740] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326745] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326751] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326756] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326762] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326767] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.326773] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
> [  174.326783] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.327565] usb 1-1.3.1: opened by process 2961: ate
> [  174.327584] usb 1-1.3.1: usbdev_do_ioctl: GETDRIVER
> [  174.327593] usb 1-1.3.1: usbdev_do_ioctl: IOCTL
> [  174.327855] usb 1-1.3.1: usbdev_do_ioctl: CLAIMINTERFACE
> [  174.327881] usb 1-1.3.1: usbdev_do_ioctl: SETINTERFACE
> [  174.328180] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB
> [  174.328188] usb 1-1.3.1: userurb 0000000000000000, ep1 int-in, length 64
> [  174.328205] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB

Can you post the output from "lsusb -t" for your test system?  The
device numbers aren't what I expected to see.  Not wrong, just
unexpected.

Apart from that, this looks like normal initialization.  Why does the
program submit 16 URBs all for the same endpoint without waiting?
Wouldn't two or three be enough?

> During the program execution, I got many lines like that:
> 
> [  178.537958] usb 1-1.4.1: urb complete
> [  178.537975] usb 1-1.4.1: userurb         pK-error, ep1 int-out,
> actual_length 64 status 0
> [  178.538000] usb 1-1.2.1: urb complete
> [  178.538006] usb 1-1.2.1: userurb         pK-error, ep1 int-out,
> actual_length 64 status 0
> 
> I am not sure if pK-error has a special meaning there.

It's an error in the debugging output.  I have just submitted a patch
to fix the error (see
<https://marc.info/?l=linux-usb&m=160580539818074&w=2>).  In any case,
it should be irrelevant for your problem.

> However, just before the lock, I got this sequence:
> 
> [  387.326795] usb 1-1.5.3.1: usbdev_do_ioctl: SUBMITURB
> [  387.326801] usb 1-1.5.3.1: userurb 0000000000000000, ep1 int-in, length
> 64
> [  387.327531] usb 1-1.5.3.1: urb complete
> [  387.327539] usb 1-1.5.3.1: userurb         pK-error, ep1 int-out,
> actual_length 64 status 0
> [  387.327582] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
> [  387.327590] usb 1-1.5.3.1: reap 0000000000000000
> [  387.327598] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.109400] usb 3-1.5.7.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.110032] usb 3-1.6.7.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.110169] usb 3-1.5.5.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.110605] usb 3-1.6.5.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.111394] usb 3-1.1.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.403278] usb 3-1.6.4.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.404011] usb 3-1.5.1.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.404344] usb 3-1.6.3.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.404649] usb 3-1.4.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.404790] usb 3-1.3.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.405283] usb 3-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.407828] usb 3-1.6.1.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.408771] usb 3-1.5.4.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.409155] usb 3-1.5.2.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.409452] usb 3-1.5.6.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.409743] usb 3-1.6.6.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.409848] usb 3-1.2.1: usbdev_do_ioctl: REAPURBNDELAY
> [  388.410840] usb 3-1.6.2.1: usbdev_do_ioctl: REAPURBNDELAY

This rapid sequence of reap requests with no completions or actual
reaps is odd.  Is this the sort of thing you expect your program to
do?  Maybe you can add some debugging output to the program.

Also, can you turn on dynamic debugging for usbcore before starting
the test?

	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

> [  389.612597] usb 3-1.5.7.1: opened by process 2961: ate
> [  389.612622] usb 3-1.5.7.1: usbdev_do_ioctl: GETDRIVER
> [  389.612631] usb 3-1.5.7.1: usbdev_do_ioctl: IOCTL
> [  389.614965] usb 3-1.5.7.1: urb complete
> [  389.614981] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in,
> actual_length 0 status -108
> [  389.614989] usb 3-1.5.7.1: urb complete
> [  389.614994] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in,
> actual_length 0 status -108

The -108 erroro codes are ESHUTDOWN.  They indicate that the device
was disconnected or something like that, although I don't see any
other indication of this in the log.

> [  389.616926] usb 3-1.5.7.1: usbdev_do_ioctl: CLAIMINTERFACE
> [  389.616964] usb 3-1.5.7.1: usbdev_do_ioctl: SETINTERFACE

And if the device had been disconnected, these calls would have failed.

> As you can see, it locked in 215 seconds, in this test. Do you see anything
> special in this sequence?

No, but several things are puzzling.  But there's nothing that
indicates any reason for the system to freeze.

Alan Stern
