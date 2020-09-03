Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3760C25C5C9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 17:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgICPyk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 11:54:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60639 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728337AbgICPyj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 11:54:39 -0400
Received: (qmail 664116 invoked by uid 1000); 3 Sep 2020 11:54:38 -0400
Date:   Thu, 3 Sep 2020 11:54:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH v5 1/2] usb-storage: fix sdev->host->dma_dev
Message-ID: <20200903155438.GC663761@rowland.harvard.edu>
References: <20200903083404.GA2169202@kroah.com>
 <20200903085035.307720-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903085035.307720-1-tom.ty89@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 03, 2020 at 04:50:34PM +0800, Tom Yan wrote:
> Use scsi_add_host_with_dma() instead of scsi_add_host() in usb.c and uas.c.
> 
> When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
> to the dma max mapping size. Therefore, the correct device that should be used
> for the clamping needs to be set.
> 
> The same clamping is still needed in the USB drivers as hw_max_sectors could be
> changed there. The original clamping would be invalidated in such cases.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> ---
> v2: fix commit message line length; bump hw_max_sectors to 2048 for SS UAS
> drives; split the "fallback" hw_max_sectors setting into another patch
> v3: use a different approach: fix the dma_dev instead
> v4: add the changelog of the patch series
> v5: fix changelog line length
>  drivers/usb/storage/scsiglue.c |  2 +-
>  drivers/usb/storage/uas.c      | 17 +++++++++++------
>  drivers/usb/storage/usb.c      |  5 +++--
>  3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index e5a971b83e3f..560efd1479ba 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -92,7 +92,7 @@ static int slave_alloc (struct scsi_device *sdev)
>  static int slave_configure(struct scsi_device *sdev)
>  {
>  	struct us_data *us = host_to_us(sdev->host);
> -	struct device *dev = us->pusb_dev->bus->sysdev;
> +	struct device *dev = sdev->host->dma_dev;
>  
>  	/*
>  	 * Many devices have trouble transferring more than 32KB at a time,
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 08f9296431e9..f4beeb8a8adb 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -827,17 +827,22 @@ static int uas_slave_alloc(struct scsi_device *sdev)
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
>  static int uas_slave_configure(struct scsi_device *sdev)
>  {
>  	struct uas_dev_info *devinfo = sdev->hostdata;
> +	struct device *dev = sdev->host->dma_dev;
> +
> +	if (devinfo->flags & US_FL_MAX_SECTORS_64)
> +		blk_queue_max_hw_sectors(sdev->request_queue, 64);
> +	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> +		blk_queue_max_hw_sectors(sdev->request_queue, 240);
> +
> +	blk_queue_max_hw_sectors(sdev->request_queue,
> +		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> +		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));
>  
>  	if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
>  		sdev->no_report_opcodes = 1;
> @@ -1023,7 +1028,7 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	shost->can_queue = devinfo->qdepth - 2;
>  
>  	usb_set_intfdata(intf, shost);
> -	result = scsi_add_host(shost, &intf->dev);
> +	result = scsi_add_host_with_dma(shost, &intf->dev, udev->bus->sysdev);
>  	if (result)
>  		goto free_streams;
>  
> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 94a64729dc27..c2ef367cf257 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -1049,8 +1049,9 @@ int usb_stor_probe2(struct us_data *us)
>  		goto BadDevice;
>  	usb_autopm_get_interface_no_resume(us->pusb_intf);
>  	snprintf(us->scsi_name, sizeof(us->scsi_name), "usb-storage %s",
> -					dev_name(&us->pusb_intf->dev));
> -	result = scsi_add_host(us_to_host(us), dev);
> +					dev_name(dev));
> +	result = scsi_add_host_with_dma(us_to_host(us), dev,
> +					us->pusb_dev->bus->sysdev);
>  	if (result) {
>  		dev_warn(dev,
>  				"Unable to add the scsi host\n");
> -- 
> 2.28.0

These changes look fine.

However, usb-storage and uas are two separate drivers.  Could you split 
the patch into two, one containing the changes to usb.c and scsiglue.c 
(those are part of usb-storage) and the other containing the changes to 
uas.c?

Alan Stern
