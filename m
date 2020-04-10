Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69801A3D5A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2020 02:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgDJA3s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Apr 2020 20:29:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55587 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726917AbgDJA3s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Apr 2020 20:29:48 -0400
Received: (qmail 32211 invoked by uid 500); 9 Apr 2020 20:29:48 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Apr 2020 20:29:48 -0400
Date:   Thu, 9 Apr 2020 20:29:48 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Andrey Konovalov <andreyknvl@google.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Testing endpoint halt support for raw-gadget
In-Reply-To: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.2004092015180.30065-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 9 Apr 2020, Andrey Konovalov wrote:

> Hi Alan and Greg,
> 
> I've been thinking about what kind of features raw-gadget might be
> missing, that would allow more flexibility in emulating USB devices.
> One of the things that is currently missing is halting endpoints.
> Adding this functionality seems to be fairly easy, but it's unclear to
> me how to test it. Any suggestions?

You should use the usbtest driver along with the testusb program in
tools/usb.  Of course, to do it you will need a userspace driver for
raw-gadget.  usbtest works best with gadget-zero, but it can be used
(in degraded form) with any USB device.

> Also, are there some other features that might make sense to add? I
> see that e.g. GadgetFS has GADGETFS_FIFO_STATUS/FLUSH ioctls. Are
> those useful?

I believe that was included just as an emulation of some existing UDC 
hardware.  It's rather controller-specific, not of general interest.
(The general idea is that the UDC says that an IN request completes 
when its data has been loaded into the controller's FIFO, rather than 
when the data has actually been sent to the host.)

Have you implemented wedge as well as halt?  Wedge is needed for the
mass-storage protocol; as far as I know it isn't used anywhere else.  

And have you given any thought to suspend/resume support?  It's a bit 
tricky because you have to consider both gadget suspend and USB bus 
suspend.

Nothing else springs to mind.

Alan Stern

