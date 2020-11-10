Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 629E52AE111
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 21:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731788AbgKJUvR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 15:51:17 -0500
Received: from netrider.rowland.org ([192.131.102.5]:40601 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730618AbgKJUvP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Nov 2020 15:51:15 -0500
Received: (qmail 206073 invoked by uid 1000); 10 Nov 2020 15:51:14 -0500
Date:   Tue, 10 Nov 2020 15:51:14 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <20201110205114.GB204624@rowland.harvard.edu>
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 10, 2020 at 02:20:50PM -0500, Alberto Sentieri wrote:
> I’ve seen many kernel locks caused by a particular user-level application.
> After the kernel locks, there is no report left in the machine, neither in
> the logs. These locks have to do with USB input and output.
> 
> The objective of this email is to get guidance about how to collect more
> data related to the locks.
> 
> Follows a description of the problem.
> 
> I manage a few remote machines installed at a manufacturing facility, which
> run Ubuntu 18.04. For months I had seen unexpected kernel locks, which I
> could not explain. By locks I mean that the machine completely dies. The
> graphical screen and keyboard freezes. I cannot ping or connect through ssh
> during the locks. The only way of making the machine come back is through a
> “pull the plug”. After rebooting I cannot find anything meaningful about the
> lock in the logs. The machine is a good quality one with a 6-core Xeon, 32
> GB ECC memory (and the application is using about 1GB). Exact the same
> problem happens in two identical machines, one running kernel 5.0.0-37
> generic and the other running kernel 5.3.0-62-generic.

Can you update either machine to a 5.9 kernel?

> A few days ago I was able to create a sequence of events that produce the
> locks in a couple of minutes. These events have to do with USB 2.0 interrupt
> I/O on USB devices connected at 12 Mbits/s and the frequency URBs are
> submitted and reaped . It is necessary to have at least 36 devices connected
> to reproduce the problem easily, which I cannot do from where I am. The
> machines are in a country other than the one I live, and my physical access
> to them is not possible due to COVID-19 restrictions.
> 
> There is no special USB drivers installed. However, there is a NVIDIA
> manufacturer driver installed, which I installed using the Ubuntu regular
> tools for non-free software. All USB I/O is done by a regular user opening
> /dev/bus/usb/xxx/xxx (the device group is set to the user group by udev).
> 
> Each set of 18 USB devices is connected to a 10-Amp.-power-supply powered
> HUB. Each hub has its own USB 2.0 root, I mean, I installed multiple USB 2.0
> PCI express expansion cards, and only one port of each expansion card is
> used for each HUB.
> 
> The protocol to talk to any of the 36 devices is pretty simple. It uses USB
> interrupt frames. A 64-byte frame is sent to the device (request packet). I
> use ioctl (USBDEVFS_SUBMITURB). The file descriptor is monitored by epoll
> and when an answer comes back, the response packet (another 64-byte
> interrupt packet) is recovered by ioctl (USBDEVFS_REAPURBNDELAY). Then a
> 64-byte packet (confirmation packet) is sent through USBDEVFS_SUBMITURB.
> This sequence happens once every few seconds and the delay between the three
> packets is just a couple of milliseconds. All process of dealing with the 36
> devices is in a unique thread, under the same epoll loop.

This sentence is ambiguous.  Do you mean there is a single unique thread 
which talks to all 36 devices?  Or do you mean there is a separate 
unique thread for each device (so 36 threads)?

> So if I synchronize all 36 devices, I mean, I try to talk to all them
> basically at the same time, the kernel will lock in about 2 minutes or less.
> By “at the same time” I mean to submit the URBs for the request packet
> around the same time for all of them, and then sit there, waiting for the
> proper epoll wake-up to deal with the state machine (response and
> confirmation packets).
> 
> However, if I lock a semaphore before sending the request packet for one
> device, and only unlock after reaping the URB I used to send the
> confirmation packet, it ran for ate least 72 hours without problems. So, one
> device at a time (using basically the same software plus the semaphore) does
> not cause the kernel lock.
> 
> My point is that simple ioctl calls to USB devices should not break the
> kernel. I need help to address the kernel issue. The problem is difficult to
> reproduce at my office because it needs many devices connected to it, which
> are available only in a place I do not have physical access to, due to
> COVID-19 travel restrictions.
> 
> My guess is that, for a regular user, this bug rarely manifests itself and
> it may be there for a long time.
> 
> I would like to figure out exactly where the problem is and I am looking for
> your guidance to get more information about it.

You could try using a network console.  Or have someone who is on-site 
take a picture of the computer screen when a crash occurs.

Alan Stern
