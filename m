Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA46D2665E
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 16:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbfEVO4C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 10:56:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55528 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727975AbfEVO4C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 May 2019 10:56:02 -0400
Received: (qmail 2691 invoked by uid 2102); 22 May 2019 10:56:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 22 May 2019 10:56:01 -0400
Date:   Wed, 22 May 2019 10:56:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     Jaewon Kim <jaewon31.kim@gmail.com>,
        Christoph Hellwig <hch@infradead.org>, <linux-mm@kvack.org>,
        <gregkh@linuxfoundation.org>,
        Jaewon Kim <jaewon31.kim@samsung.com>,
        <m.szyprowski@samsung.com>, <ytk.lee@samsung.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: host: xhci: allow __GFP_FS in dma allocation
In-Reply-To: <1558506702.12672.28.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1905221055190.1410-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 22 May 2019, Oliver Neukum wrote:

> On Di, 2019-05-21 at 10:00 -0400, Alan Stern wrote:
> > 
> > Changing configurations amounts to much the same as disconnecting,
> > because both operations destroy all the existing interfaces.
> > 
> > Disconnect can arise in two different ways.
> > 
> >         Physical hot-unplug: All I/O operations will fail.
> > 
> >         Rmmod or unbind: I/O operations will succeed.
> > 
> > The second case is probably okay.  The first we can do nothing about.  
> > However, in either case we do need to make sure that memory allocations
> > do not require any writebacks.  This suggests that we need to call
> > memalloc_noio_save() from within usb_unbind_interface().
> 
> I agree with the problem, but I fail to see why this issue would be
> specific to USB. Shouldn't this be done in the device core layer?

Only for drivers that are on the block-device writeback path.  The 
device core doesn't know which drivers these are.

Alan Stern

