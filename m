Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E660625AEDE
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 17:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgIBPaX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 11:30:23 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34337 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728312AbgIBPaJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 11:30:09 -0400
Received: (qmail 626846 invoked by uid 1000); 2 Sep 2020 11:30:08 -0400
Date:   Wed, 2 Sep 2020 11:30:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH v2 1/2] uas: bump hw_max_sectors to 2048 blocks for SS or
 faster drives
Message-ID: <20200902153008.GE624583@rowland.harvard.edu>
References: <20200901145535.GC587030@rowland.harvard.edu>
 <20200902000937.2204-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902000937.2204-1-tom.ty89@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 02, 2020 at 08:09:36AM +0800, Tom Yan wrote:
> There's no reason for uas to use a smaller value of max_sectors than
> usb-storage.
> 
> Also copying the dma max mapping size clamping from usb-storage.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> ---
>  drivers/usb/storage/uas.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 08f9296431e9..813c49914b9a 100644
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
> @@ -839,6 +834,20 @@ static int uas_slave_configure(struct scsi_device *sdev)
>  {
>  	struct uas_dev_info *devinfo = sdev->hostdata;
>  
> +	struct us_data *us = host_to_us(sdev->host);
> +	struct device *dev = us->pusb_dev->bus->sysdev;

Yeah, this won't work.  The uas driver doesn't use struct us_data at 
all.  Instead you should have:

	struct device *dev = devinfo->udev->bus->sysdev;

except that now you probably don't need it.

> +
> +	if (devinfo->flags & US_FL_MAX_SECTORS_64)
> +		blk_queue_max_hw_sectors(sdev->request_queue, 64);
> +	else if (devinfo->flags & US_FL_MAX_SECTORS_240)
> +		blk_queue_max_hw_sectors(sdev->request_queue, 240);
> +	else if (us->pusb_dev->speed >= USB_SPEED_SUPER)

Same thing here: devinfo->udev->speed.

> +		blk_queue_max_hw_sectors(sdev->request_queue, 2048);

Also, you might want to check before doing this.  If it would decrease 
the max_hw_sectors value, there's no point doing it.

> +
> +	blk_queue_max_hw_sectors(sdev->request_queue,
> +		min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
> +		      dma_max_mapping_size(dev) >> SECTOR_SHIFT));

And presumably this will be unnecessary.

Alan Stern
