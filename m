Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42D7E2FC03F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 20:44:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbhASTld (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 14:41:33 -0500
Received: from netrider.rowland.org ([192.131.102.5]:52747 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2390640AbhASTl0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 14:41:26 -0500
Received: (qmail 184245 invoked by uid 1000); 19 Jan 2021 14:40:27 -0500
Date:   Tue, 19 Jan 2021 14:40:27 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Doug Kingston <dpk@randomnotes.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: USB Sound Device detection problem
Message-ID: <20210119194027.GA183526@rowland.harvard.edu>
References: <CAGPaoUucowcpa5k_9VVjnRnrUkiG=npiCJYaOyT6-Ya7hEfJKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGPaoUucowcpa5k_9VVjnRnrUkiG=npiCJYaOyT6-Ya7hEfJKg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 19, 2021 at 10:20:34AM -0800, Doug Kingston wrote:
> I am doing some work setting up some radio data nodes that use USB
> soundcard devices to attach to radios.  I am building a system with
> two radios and two identical soundcard devices attached to a Raspberry
> Pi running Raspbian.  The devices are discovered at boot time by the
> hid-generic subsystem:
> 
> (see dmesg output below)
> 
> I am accessing the sound devices from Wine via the ALSA stack.  The
> problem I have is that
> the product string is identical for both devices and they show up
> identically to the Windows app ("USB PnP Sound Device").

Why is that bad?

Suppose instead of using a Raspberry Pi, you plugged these two sound 
cards into a desktop system that actually was running Windows.  How 
would they show up then?  How would the Windows app handle them?  
Whatever this turns out to be, Wine should be able to emulate it.

>  I need to
> find a way to alter this string so that they are different.

Why do the strings need to be different?  They wouldn't be different in 
the desktop-running-Windows case, would they?

>  If they
> were processed by udev I might be able to do something there.

They are processed by udev, but I have no idea whether Wine gets this 
information from udev or from somewhere else (such as directly from the 
sound cards themselves).

> The options seem to be:
> 1) fix at kernel usb discovery

As Greg said, the kernel isn't going to be changed to do this.  And even 
if you did change your own copy of the kernel, it wouldn't help if Wine 
gets the product strings directly from the sound cards.

> 2) somehow fix in the ALSA library (snd_*)

That might be feasible.  I don't know much about ALSA's internals.

> 3) fix in Wine (mmsys.drv / winealsa.drv/mmdevdrv.c

That also might work.  But in fact, I would expect Wine to handle these 
things the same way that native Windows does, whatever that is.  So if 
Windows doesn't alter the strings, most likely you shouldn't ask Wine to 
do so.

> 4) somewhere else?

How about in the app that uses the strings?

> And, we need to do this in a supportable fashion that does not break
> existing users of this subsystem.
> 
> Do you have any suggestions?

As Greg mentioned, the app could use the device ID numbers or other 
topology information to distinguish the two sound cards, even if the 
product strings are identical.

Alan Stern
