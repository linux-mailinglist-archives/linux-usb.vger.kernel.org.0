Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28A2D1BA655
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 16:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgD0O1p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 10:27:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57249 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727902AbgD0O1o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Apr 2020 10:27:44 -0400
Received: (qmail 19014 invoked by uid 500); 27 Apr 2020 10:27:43 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Apr 2020 10:27:43 -0400
Date:   Mon, 27 Apr 2020 10:27:43 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Greg KH <gregkh@linuxfoundation.org>
cc:     Dave Mielke <Dave@mielke.cc>, <linux-usb@vger.kernel.org>,
        Samuel Thibault <Samuel.Thibault@ens-lyon.org>,
        Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Writing to /sys/../power/autosuspend when not root.
In-Reply-To: <20200427103009.GA2362731@kroah.com>
Message-ID: <Pine.LNX.4.44L0.2004271024100.17025-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 27 Apr 2020, Greg KH wrote:

> On Sun, Apr 26, 2020 at 03:08:38PM -0400, Dave Mielke wrote:
> > We're working on getting brltty to run as an unprivileged user with just a few
> > required capabilities. We don't want one of those required capabilities to be
> > CAP_DAC_OVERRIDE (bypass file permission checks).
> > 
> > Some USB-connected braille devices don't respond very well to being
> > autosuspended. We get around this, when running as root, by writing to the
> > SYSFS power/autosuspend file associated with the device. Our problem is that
> > only the root user can write to it.
> > 
> > Other than using CAP_DAC_OVERRIDE (which we don't want to do), what other
> > way(s) might we be able to use to overcome this restriction? For example, is
> > there some kind of safe (enough) udev rule?
> 
> Have a udev rule that turns autosuspend off for each specific USB device
> that you know does not work with autosuspend.  Do you have such a list?
> 
> If so, we can add it to the USB core with the
> USB_QUIRK_DISCONNECT_SUSPEND flag.  Or is it the USB_QUIRK_NO_LPM that
> they need?  I can't remember, but you can test it out from userspace
> by reading about those in the
> Documentation/admin-guide/kernel-parameters.txt file.

A udev rule will probably work a lot better than a quirk flag.  In 
fact, I don't think we have a quirk flag for "don't autosuspend".  
DISCONNECT_SUSPEND doesn't affect autosuspends, only system sleeps.  
And NO_LPM only affects USB-3 devices.

A suitable udev rule should be pretty easy to write.

Alan Stern

