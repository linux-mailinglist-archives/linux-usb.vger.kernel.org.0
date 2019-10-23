Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E622DE0FCC
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 03:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730597AbfJWBxv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 21:53:51 -0400
Received: from verein.lst.de ([213.95.11.211]:38029 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727582AbfJWBxv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Oct 2019 21:53:51 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9E23968BE1; Wed, 23 Oct 2019 03:53:48 +0200 (CEST)
Date:   Wed, 23 Oct 2019 03:53:48 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        Seth Bollinger <Seth.Bollinger@digi.com>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb-storage: Revert commit 747668dbc061 ("usb-storage:
 Set virt_boundary_mask to avoid SG overflows")
Message-ID: <20191023015348.GA16123@lst.de>
References: <20191017175306.GA3014@lazy.lzy> <Pine.LNX.4.44L0.1910211145520.1673-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1910211145520.1673-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 21, 2019 at 11:48:06AM -0400, Alan Stern wrote:
> There is no longer any reason to keep the virt_boundary_mask setting
> for usb-storage.  It was needed in the first place only for handling
> devices with a block size smaller than the maxpacket size and where
> the host controller was not capable of fully general scatter-gather
> operation (that is, able to merge two SG segments into a single USB
> packet).  But:
> 
> 	High-speed or slower connections never use a bulk maxpacket
> 	value larger than 512;
> 
> 	The SCSI layer does not handle block devices with a block size
> 	smaller than 512 bytes;
> 
> 	All the host controllers capable of SuperSpeed operation can
> 	handle fully general SG;
> 
> 	Since commit ea44d190764b ("usbip: Implement SG support to
> 	vhci-hcd and stub driver") was merged, the USB/IP driver can
> 	also handle SG.
> 
> Therefore all supported device/controller combinations should be okay
> with no need for any special virt_boundary_mask.  So in order to fix
> the swiotlb problem, this patch reverts commit 747668dbc061.

That's great to know.  The same should also apply to uas, shouldn't
it?

Otherwise:

Acked-by: Christoph Hellwig <hch@lst.de>
