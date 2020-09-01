Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0E62591CC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 16:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgIAOzs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 10:55:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:43571 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727943AbgIAOzg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 10:55:36 -0400
Received: (qmail 588446 invoked by uid 1000); 1 Sep 2020 10:55:35 -0400
Date:   Tue, 1 Sep 2020 10:55:35 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, cyrozap@gmail.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] usb-storage: always set hw_max_sectors in
 slave_configure to avoid inappropriate clamping
Message-ID: <20200901145535.GC587030@rowland.harvard.edu>
References: <20200901055417.1732-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901055417.1732-1-tom.ty89@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Patch submissions should have text lines limited to fewer than 80 
columns.

On Tue, Sep 01, 2020 at 01:54:17PM +0800, Tom Yan wrote:
> When the scsi request queue is initialized/allocated, the scsi driver 
> clamps hw_max_sectors against the dma max mapping size of 
> sdev->host->dma_dev. The clamping is apparently inappriorate to USB 
> drives.

Wouldn't it be more accurate to say that the clamping _is_ appropriate, 
but it should be performed using the sysdev device rather than the 
nominal parent?  Thus the error lies in allowing shost->dma_dev to be 
set incorrectly.

> Either way we are calling blk_queue_max_hw_sectors() in the usb 
> drivers for some (but not all) cases, which causes the clamping to be 
> overriden (inconsistently) anyway.
> 
> Therefore the usb driver should always set hw_max_sectors and do the 
> clamping against the right device itself.

How about fixing the dma_dev assignment instead?

Alan Stern

> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> ---
>  drivers/usb/storage/scsiglue.c | 37 ++++++++++++++++------------------
>  drivers/usb/storage/uas.c      | 23 ++++++++++++++++-----
>  2 files changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index e5a971b83e3f..804cbc0ba4da 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -120,6 +120,23 @@ static int slave_configure(struct scsi_device *sdev)
>  		 * better throughput on most devices.
>  		 */
>  		blk_queue_max_hw_sectors(sdev->request_queue, 2048);
> +	} else {
> +	    /*
> +	     * Some devices are known to choke with anything larger. It seems like
> +	     * the problem stems from the fact that original IDE controllers had
> +	     * only an 8-bit register to hold the number of sectors in one transfer
> +	     * and even those couldn't handle a full 256 sectors.
> +	     *
> +	     * Because we want to make sure we interoperate with as many devices as
> +	     * possible, we will maintain a 240 sector transfer size limit for USB
> +	     * Mass Storage devices.
> +	     *
> +	     * Tests show that other operating have similar limits with Microsoft
> +	     * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> +	     * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> +	     * and 2048 for USB3 devices.
> +	     */
> +		blk_queue_max_hw_sectors(sdev->request_queue, 240);
>  	}
>  
>  	/*
> @@ -626,26 +643,6 @@ static const struct scsi_host_template usb_stor_host_template = {
>  	/* lots of sg segments can be handled */
>  	.sg_tablesize =			SG_MAX_SEGMENTS,
>  
> -
> -	/*
> -	 * Limit the total size of a transfer to 120 KB.
> -	 *
> -	 * Some devices are known to choke with anything larger. It seems like
> -	 * the problem stems from the fact that original IDE controllers had
> -	 * only an 8-bit register to hold the number of sectors in one transfer
> -	 * and even those couldn't handle a full 256 sectors.
> -	 *
> -	 * Because we want to make sure we interoperate with as many devices as
> -	 * possible, we will maintain a 240 sector transfer size limit for USB
> -	 * Mass Storage devices.
> -	 *
> -	 * Tests show that other operating have similar limits with Microsoft
> -	 * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
> -	 * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
> -	 * and 2048 for USB3 devices.
> -	 */
> -	.max_sectors =                  240,
> -
>  	/* emulated HBA */
>  	.emulated =			1,
>  
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 08f9296431e9..cffa435afd84 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -827,11 +827,6 @@ static int uas_slave_alloc(struct scsi_device *sdev)
>  	 */
>  	blk_queue_update_dma_alignment(sdev->request_queue, (512 - 1));
>  
> -	if (devinfo->flags & US_FL_MAX_SECTORS_64)
> -		blk_queue_max_hw_sectors(sdev->request_queue, 64);
> -	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> -		blk_queue_max_hw_sectors(sdev->request_queue, 240);
> -
>  	return 0;
>  }
>  
> @@ -839,6 +834,24 @@ static int uas_slave_configure(struct scsi_device *sdev)
>  {
>  	struct uas_dev_info *devinfo = sdev->hostdata;
>  
> +	struct us_data *us = host_to_us(sdev->host);
> +	struct device *dev = us->pusb_dev->bus->sysdev;
> +
> +	if (devinfo->flags & US_FL_MAX_SECTORS_64)
> +		blk_queue_max_hw_sectors(sdev->request_queue, 64);
> +	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> +		blk_queue_max_hw_sectors(sdev->request_queue, 240);
> +	else
> +		blk_queue_max_hw_sectors(sdev->request_queue, SCSI_DEFAULT_MAX_SECTORS);
> +
> +	/*
> +	 * The max_hw_sectors should be up to maximum size of a mapping for
> +	 * the device. Otherwise, a DMA API might fail on swiotlb environment.
> +	 */
> +	blk_queue_max_hw_sectors(sdev->request_queue,
> +		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> +		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
> +
>  	if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
>  		sdev->no_report_opcodes = 1;
>  
> -- 
> 2.28.0
> 
