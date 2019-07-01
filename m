Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177F8239AA
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 16:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733098AbfETOQ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 10:16:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:58744 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730353AbfETOQ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 10:16:58 -0400
Received: (qmail 1756 invoked by uid 2102); 20 May 2019 10:16:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 May 2019 10:16:57 -0400
Date:   Mon, 20 May 2019 10:16:57 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Christoph Hellwig <hch@infradead.org>
cc:     Oliver Neukum <oneukum@suse.com>,
        Jaewon Kim <jaewon31.kim@gmail.com>, <linux-mm@kvack.org>,
        <gregkh@linuxfoundation.org>,
        Jaewon Kim <jaewon31.kim@samsung.com>,
        <m.szyprowski@samsung.com>, <ytk.lee@samsung.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: host: xhci: allow __GFP_FS in dma allocation
In-Reply-To: <20190520101206.GA9291@infradead.org>
Message-ID: <Pine.LNX.4.44L0.1905201011490.1498-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 20 May 2019, Christoph Hellwig wrote:

> On Mon, May 20, 2019 at 11:09:25AM +0200, Oliver Neukum wrote:
> > we actually do. It is just higher up in the calling path:
> 
> Perfect!
> 
> > So, do we need to audit the mem_flags again?
> > What are we supposed to use? GFP_KERNEL?
> 
> GFP_KERNEL if you can block, GFP_ATOMIC if you can't for a good reason,
> that is the allocation is from irq context or under a spinlock.  If you
> think you have a case where you think you don't want to block, but it
> is not because of the above reasons we need to have a chat about the
> details.

What if the allocation requires the kernel to swap some old pages out 
to the backing store, but the backing store is on the device that the 
driver is managing?  The swap can't take place until the current I/O 
operation is complete (assuming the driver can handle only one I/O 
operation at a time), and the current operation can't complete until 
the old pages are swapped out.  Result: deadlock.

Isn't that the whole reason for using GFP_NOIO in the first place?

Alan Stern

