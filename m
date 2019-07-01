Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCF425016
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 15:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfEUNYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 09:24:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:39896 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727044AbfEUNYb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 09:24:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 3EA72ADCB;
        Tue, 21 May 2019 13:24:30 +0000 (UTC)
Message-ID: <1558444291.12672.23.camel@suse.com>
Subject: Re: [RFC PATCH] usb: host: xhci: allow __GFP_FS in dma allocation
From:   Oliver Neukum <oneukum@suse.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Christoph Hellwig <hch@infradead.org>
Cc:     Jaewon Kim <jaewon31.kim@gmail.com>, linux-mm@kvack.org,
        gregkh@linuxfoundation.org, Jaewon Kim <jaewon31.kim@samsung.com>,
        m.szyprowski@samsung.com, ytk.lee@samsung.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Date:   Tue, 21 May 2019 15:11:31 +0200
In-Reply-To: <Pine.LNX.4.44L0.1905201011490.1498-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1905201011490.1498-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mo, 2019-05-20 at 10:16 -0400, Alan Stern wrote:
> On Mon, 20 May 2019, Christoph Hellwig wrote:
> 
> > GFP_KERNEL if you can block, GFP_ATOMIC if you can't for a good reason,
> > that is the allocation is from irq context or under a spinlock.  If you
> > think you have a case where you think you don't want to block, but it
> > is not because of the above reasons we need to have a chat about the
> > details.
> 
> What if the allocation requires the kernel to swap some old pages out 
> to the backing store, but the backing store is on the device that the 
> driver is managing?  The swap can't take place until the current I/O 
> operation is complete (assuming the driver can handle only one I/O 
> operation at a time), and the current operation can't complete until 
> the old pages are swapped out.  Result: deadlock.
> 
> Isn't that the whole reason for using GFP_NOIO in the first place?

Hi,

lookig at this it seems to me that we are in danger of a deadlock

- during reset - devices cannot do IO while being reset
	covered by the USB layer in usb_reset_device
- resume & restore - devices cannot do IO while suspended
	covered by driver core in rpm_callback
- disconnect - a disconnected device cannot do IO
	is this a theoretical case or should I do something to
	the driver core?

How about changing configurations on USB?

	Regards
		Oliver

