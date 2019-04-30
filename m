Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A47FBE3
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbfD3Ou2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:50:28 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35604 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726053AbfD3Ou2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:50:28 -0400
Received: (qmail 3199 invoked by uid 2102); 30 Apr 2019 10:50:27 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Apr 2019 10:50:27 -0400
Date:   Tue, 30 Apr 2019 10:50:27 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     gregKH@linuxfoundation.org, <linux-usb@vger.kernel.org>
Subject: Re: [PATCHv2] UAS: fix alignment of scatter/gather segments
In-Reply-To: <20190430102145.7423-1-oneukum@suse.com>
Message-ID: <Pine.LNX.4.44L0.1904301047430.1465-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 30 Apr 2019, Oliver Neukum wrote:

> This is the UAS version of
> 
> 747668dbc061b3e62bc1982767a3a1f9815fcf0e
> usb-storage: Set virt_boundary_mask to avoid SG overflows
> 
> We are not as likely to be vulnerable as storage, as it is unlikelier

s/unlikelier/less likely/

A matter of English grammatical style -- it might be even better to 
write: "... as UAS is less likely to run ...".

> that UAS is run over a controller without native support for SG,
> but the issue exists.
> The issue has been existing since the inception of the driver.
> 
> Fixes: 115bb1ffa54ac ("USB: Add UAS driver")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/storage/uas.c | 35 ++++++++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 6d71b8fff9df..3856f34b89b8 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -789,24 +789,33 @@ static int uas_slave_alloc(struct scsi_device *sdev)
>  {
>  	struct uas_dev_info *devinfo =
>  		(struct uas_dev_info *)sdev->host->hostdata;
> +	int maxp;
>  
>  	sdev->hostdata = devinfo;
>  
>  	/*
> -	 * USB has unusual DMA-alignment requirements: Although the
> -	 * starting address of each scatter-gather element doesn't matter,
> -	 * the length of each element except the last must be divisible
> -	 * by the Bulk maxpacket value.  There's currently no way to
> -	 * express this by block-layer constraints, so we'll cop out
> -	 * and simply require addresses to be aligned at 512-byte
> -	 * boundaries.  This is okay since most block I/O involves
> -	 * hardware sectors that are multiples of 512 bytes in length,
> -	 * and since host controllers up through USB 2.0 have maxpacket
> -	 * values no larger than 512.
> +	 * We have two requirements here. We must satisfy the requirements
> +	 * of the physical HC and the demands of the protocol, as we
> +	 * definitely want no additional memory allocation in this path
> +	 * ruling out using bounce buffers.
>  	 *
> -	 * But it doesn't suffice for Wireless USB, where Bulk maxpacket
> -	 * values can be as large as 2048.  To make that work properly
> -	 * will require changes to the block layer.
> +	 * For a transmission on USB to continue we must never send
> +	 * a package that is smaller than maxpacket. Hence the length of each
> +         * scatterlist element except the last must be divisible by the
> +         * Bulk maxpacket value.

Spaces vs. tabs.

Alan Stern

> +	 * If the HC does not ensure that through SG,
> +	 * the upper layer must do that. We must assume nothing
> +	 * about the capabilities off the HC, so we use the most
> +	 * pessimistic requirement.
> +	 */
> +
> +	maxp = usb_maxpacket(devinfo->udev, devinfo->data_in_pipe, 0);
> +	blk_queue_virt_boundary(sdev->request_queue, maxp - 1);
> +
> +	/*
> +	 * The protocol has no requirements on alignment in the strict sense.
> +	 * Controllers may or may not have alignment restrictions.
> +	 * As this is not exported, we use an extremely conservative guess.
>  	 */
>  	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));

