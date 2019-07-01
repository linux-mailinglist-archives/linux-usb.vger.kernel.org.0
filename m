Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A30E62514E
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 16:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbfEUOAL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 10:00:11 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:32990 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727624AbfEUOAL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 10:00:11 -0400
Received: (qmail 1871 invoked by uid 2102); 21 May 2019 10:00:10 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 May 2019 10:00:10 -0400
Date:   Tue, 21 May 2019 10:00:10 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Christoph Hellwig <hch@infradead.org>,
        Jaewon Kim <jaewon31.kim@gmail.com>, <linux-mm@kvack.org>,
        <gregkh@linuxfoundation.org>,
        Jaewon Kim <jaewon31.kim@samsung.com>,
        <m.szyprowski@samsung.com>, <ytk.lee@samsung.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: host: xhci: allow __GFP_FS in dma allocation
In-Reply-To: <1558444291.12672.23.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1905210950170.1634-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 21 May 2019, Oliver Neukum wrote:

> On Mo, 2019-05-20 at 10:16 -0400, Alan Stern wrote:
> > On Mon, 20 May 2019, Christoph Hellwig wrote:
> > 
> > > GFP_KERNEL if you can block, GFP_ATOMIC if you can't for a good reason,
> > > that is the allocation is from irq context or under a spinlock.  If you
> > > think you have a case where you think you don't want to block, but it
> > > is not because of the above reasons we need to have a chat about the
> > > details.
> > 
> > What if the allocation requires the kernel to swap some old pages out 
> > to the backing store, but the backing store is on the device that the 
> > driver is managing?  The swap can't take place until the current I/O 
> > operation is complete (assuming the driver can handle only one I/O 
> > operation at a time), and the current operation can't complete until 
> > the old pages are swapped out.  Result: deadlock.
> > 
> > Isn't that the whole reason for using GFP_NOIO in the first place?
> 
> Hi,
> 
> lookig at this it seems to me that we are in danger of a deadlock
> 
> - during reset - devices cannot do IO while being reset
> 	covered by the USB layer in usb_reset_device
> - resume & restore - devices cannot do IO while suspended
> 	covered by driver core in rpm_callback
> - disconnect - a disconnected device cannot do IO
> 	is this a theoretical case or should I do something to
> 	the driver core?
> 
> How about changing configurations on USB?

Changing configurations amounts to much the same as disconnecting,
because both operations destroy all the existing interfaces.

Disconnect can arise in two different ways.

	Physical hot-unplug: All I/O operations will fail.

	Rmmod or unbind: I/O operations will succeed.

The second case is probably okay.  The first we can do nothing about.  
However, in either case we do need to make sure that memory allocations
do not require any writebacks.  This suggests that we need to call
memalloc_noio_save() from within usb_unbind_interface().

Alan Stern

