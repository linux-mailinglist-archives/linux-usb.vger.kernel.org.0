Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1F33E279B
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 03:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390009AbfJXBLC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 21:11:02 -0400
Received: from verein.lst.de ([213.95.11.211]:43036 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388218AbfJXBLC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 21:11:02 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id BD36968BE1; Thu, 24 Oct 2019 03:10:59 +0200 (CEST)
Date:   Thu, 24 Oct 2019 03:10:59 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>,
        Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>,
        Seth Bollinger <Seth.Bollinger@digi.com>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] UAS: Revert commit 3ae62a42090f ("UAS: fix alignment
 of scatter/gather segments")
Message-ID: <20191024011059.GB5067@lst.de>
References: <20191023015348.GA16123@lst.de> <Pine.LNX.4.44L0.1910231132470.1878-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1910231132470.1878-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 23, 2019 at 11:34:33AM -0400, Alan Stern wrote:
> Commit 3ae62a42090f ("UAS: fix alignment of scatter/gather segments"),
> copying a similar commit for usb-storage, attempted to solve a problem
> involving scatter-gather I/O and USB/IP by setting the
> virt_boundary_mask for mass-storage devices.
> 
> However, it now turns out that the analogous change in usb-storage
> interacted badly with commit 09324d32d2a0 ("block: force an unlimited
> segment size on queues with a virt boundary"), which was added later.
> A typical error message is:
> 
> 	ehci-pci 0000:00:13.2: swiotlb buffer is full (sz: 327680 bytes),
> 	total 32768 (slots), used 97 (slots)
> 
> There is no longer any reason to keep the virt_boundary_mask setting
> in the uas driver.  It was needed in the first place only for
> handling devices with a block size smaller than the maxpacket size and
> where the host controller was not capable of fully general
> scatter-gather operation (that is, able to merge two SG segments into
> a single USB packet).  But:
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
> with no need for any special virt_boundary_mask.  So in order to head
> off potential problems similar to those affecting usb-storage, this
> patch reverts commit 3ae62a42090f.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: Oliver Neukum <oneukum@suse.com>
> CC: <stable@vger.kernel.org>

Looks good,

Acked-by: Christoph Hellwig <hch@lst.de>
