Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 424B614F389
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 22:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgAaVEO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 16:04:14 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:56558 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726102AbgAaVEO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 16:04:14 -0500
Received: (qmail 20846 invoked by uid 2102); 31 Jan 2020 16:04:12 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 31 Jan 2020 16:04:12 -0500
Date:   Fri, 31 Jan 2020 16:04:12 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Paul Zimmerman <pauldzim@gmail.com>
cc:     Greg KH <greg@kroah.com>,
        David Heinzelmann <heinzelmann.david@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: hub: Don't record a connect-change event during
 reset-resume
In-Reply-To: <20200131123653.2ef373e4@EliteBook>
Message-ID: <Pine.LNX.4.44L0.2001311559490.1577-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 31 Jan 2020, Paul Zimmerman wrote:

> > Note that performing the unnecessary check is not actually a bug.
> > Devices are supposed to be able to send descriptors back to the host
> > even when they are busy doing something else.  The underlying cause of
> > Paul's problem lies in his Bluetooth adapter.  Nevertheless, we
> > shouldn't perform the same check twice in a row -- and as a nice side
> > benefit, removing the extra check allows the Bluetooth adapter to work
> > more reliably.
> 
> Actually, at the time the failure happens, the bluetooth driver is putting
> the device into a "manufacturer mode" and downloading a firmware patch to
> the device. So I don't think we can fault the device for not responding to
> a get-descriptor request at that point. Probably there should be some kind
> of locking in the driver while that is being done.

Heh.  We don't have any locking of that sort in the kernel.  Any user 
at any time can run "lsusb -v" and that program will try to communicate 
with every attached USB device.  There's no way to claim exclusive 
rights to a device.

The fact that firmware loading works at all is more or less a matter of
luck (although the odds are with us).

> Nevertheless, your patch makes everything work again, so I think it's
> "good enough" :)
> 
> Thanks,
> Paul

You're welcome.

Alan Stern

