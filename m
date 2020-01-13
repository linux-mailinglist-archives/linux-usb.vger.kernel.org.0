Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A690013948A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 16:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbgAMPPD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 10:15:03 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:56032 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726567AbgAMPPD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 10:15:03 -0500
Received: (qmail 1568 invoked by uid 2102); 13 Jan 2020 10:15:02 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Jan 2020 10:15:02 -0500
Date:   Mon, 13 Jan 2020 10:15:02 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Samuel Sadok <samuel.sadok@bluewin.ch>
cc:     USB list <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>, <yu.c.chen@intel.com>,
        <mironov.ivan@gmail.com>
Subject: Re: [BUG] SD card reader disappears after suspend
In-Reply-To: <CAJ4e7SX=vJXx1=AQ+f9ajJK_BBgzV-u_vr9V+uLffyv4+vO+ug@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2001131006400.1502-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 13 Jan 2020, Samuel Sadok wrote:

> Hello,
> 
> It's been a while that there was any discussion on this bug so here's
> a brief context: There's a bug on some MacBook Pro's where the
> built-in SD card reader would be missing after a suspend/resume cycle.
> 
> After looking at the schematics for my laptop I noticed that
> `OC6*/GPIO10` of the Intel PCH is connected to a net called
> `SD_PWR_EN`. So I tried to set this pin to 0 and then to 1 again in
> order to completely power cycle the card reader. Turns out this
> finally makes the card reader appear after a suspend/resume cycle.
> 
> For the record, here's the user space workaround:
> https://gist.github.com/samuelsadok/6d7b3e3015d3370a92ed4702e4d3c4b5#gistcomment-3134437
> 
> Are there other buggy devices for which the kernel already implements
> such a power cycle? Otherwise, where would be the right place to add
> this?

This is a platform-specific solution, so it belongs in a
platform-specific region of the kernel.  Any necessary changes would
mostly have to go outside the USB stack -- after all, GPIO lines aren't
USB devices.

If the kernel already contains some system-setup code specific to the 
MacBook Pro, that's where such a fix belongs.

> Additional observations:
>  - by default (after boot), GPIO10 is configured as input and shows
> the state "high". In the schematics there's a pull-up resistor. and I
> assume it goes to a mosfet (off-sheet). So the problem is not that the
> card reader has no power after suspend. It just needs a power cycle.
>  - the card reader is connected to the PCH via the four USB3 data
> lines, but the two USB2 data lines are not connected. Is this a legal
> configuration? Might this prevent the card reader from receiving power
> state commands?

It is not allowed for a generic connection (i.e., to an external
device) but I think it's okay for something that's built into the
platform.  It could prevent the card reader from working correctly if
for some reason the USB-3 signalling failed and the device tried to
switch over to USB-2 signalling.

On the other hand, there's no real reason I can think of for the card 
reader to need a power cycle following resume.  Fixing that problem, 
whatever it is, would be a better solution.

Alan Stern

