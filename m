Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F78025C8BB
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 20:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728085AbgICSbp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 14:31:45 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39263 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726990AbgICSbp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 14:31:45 -0400
Received: (qmail 669461 invoked by uid 1000); 3 Sep 2020 14:31:44 -0400
Date:   Thu, 3 Sep 2020 14:31:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH v6 1/3] usb-storage: fix sdev->host->dma_dev
Message-ID: <20200903183144.GA668415@rowland.harvard.edu>
References: <20200903155438.GC663761@rowland.harvard.edu>
 <20200903181725.2931-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903181725.2931-1-tom.ty89@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 04, 2020 at 02:17:23AM +0800, Tom Yan wrote:
> Use scsi_add_host_with_dma() instead of scsi_add_host().
> 
> When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
> to the dma max mapping size. Therefore, the correct device that should be used
> for the clamping needs to be set.
> 
> The same clamping is still needed in usb-storage as hw_max_sectors could be
> changed there. The original clamping would be invalidated in such cases.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> ---
> v2: fix commit message line length; bump hw_max_sectors to 2048 for SS UAS
> drives; split the "fallback" hw_max_sectors setting into another patch
> v3: use a different approach: fix the dma_dev instead
> v4: add the changelog of the patch series
> v5: fix changelog line length
> v6: split dma_dev fix for usb-storage and uas
>  drivers/usb/storage/scsiglue.c | 2 +-
>  drivers/usb/storage/usb.c      | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
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

For all three patches:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
