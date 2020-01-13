Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40967138E71
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 11:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgAMKCA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 05:02:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:40410 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbgAMKCA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 05:02:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 33486ACD7;
        Mon, 13 Jan 2020 10:01:58 +0000 (UTC)
Message-ID: <1578908680.2590.10.camel@suse.com>
Subject: Re: [PATCH] usb: uas: fix a plug & unplug racing
From:   Oliver Neukum <oneukum@suse.com>
To:     EJ Hsu <ejh@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Date:   Mon, 13 Jan 2020 10:44:40 +0100
In-Reply-To: <20200113033035.50875-1-ejh@nvidia.com>
References: <20200113033035.50875-1-ejh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Sonntag, den 12.01.2020, 19:30 -0800 schrieb EJ Hsu:

Hi,

first, thank you for diagnosing this unusual bug.

> When a uas disk is plugged into an external hub, uas_probe()
> will be called by the hub thread to do the probe. It will
> first create a SCSI host and then do the scan for this host.
> During the scan, it will probe the LUN using SCSI INQUERY command
> which will be packed in the URB and submitted to uas disk.
> 
> There might be a chance that this external hub with uas disk
> attached is unplugged during the scan. In this case, uas driver
> will fail to submit the URB (due to the NOTATTACHED state of uas
> device) and try to put this SCSI command back to request queue
> waiting for next chance to run.

Isn't that the bug? A command to a detached device should fail.
Could you please elaborate? This issue would not be limited to uas.

> ---
>  drivers/usb/storage/uas.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 95bba3ba6ac6..d367718fef45 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
> @@ -42,9 +42,11 @@ struct uas_dev_info {
>  	unsigned cmd_pipe, status_pipe, data_in_pipe, data_out_pipe;
>  	unsigned use_streams:1;
>  	unsigned shutdown:1;
> +	unsigned scan_pending:1;
>  	struct scsi_cmnd *cmnd[MAX_CMNDS];
>  	spinlock_t lock;
>  	struct work_struct work;
> +	struct work_struct scan_work;      /* for async scanning */
>  };
>  
>  enum {
> @@ -114,6 +116,20 @@ static void uas_do_work(struct work_struct *work)
>  	spin_unlock_irqrestore(&devinfo->lock, flags);
>  }
>  
> +static void uas_scan_work(struct work_struct *work)
> +{
> +	struct uas_dev_info *devinfo =
> +		container_of(work, struct uas_dev_info, scan_work);
> +	struct Scsi_Host *shost = usb_get_intfdata(devinfo->intf);
> +
> +	dev_dbg(&devinfo->intf->dev, "starting scan\n");
> +	scsi_scan_host(shost);
> +	dev_dbg(&devinfo->intf->dev, "scan complete\n");
> +
> +	usb_autopm_put_interface(devinfo->intf);

scsi_scan_host() does runtime PM on the SCSI level. There is
no need for us to duplicate that.

> +	devinfo->scan_pending = 0;
> +}
> +
>  static void uas_add_work(struct uas_cmd_info *cmdinfo)
>  {
>  	struct scsi_pointer *scp = (void *)cmdinfo;
> @@ -982,6 +998,7 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	init_usb_anchor(&devinfo->data_urbs);
>  	spin_lock_init(&devinfo->lock);
>  	INIT_WORK(&devinfo->work, uas_do_work);
> +	INIT_WORK(&devinfo->scan_work, uas_scan_work);
>  
>  	result = uas_configure_endpoints(devinfo);
>  	if (result)
> @@ -998,7 +1015,11 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	if (result)
>  		goto free_streams;
>  
> -	scsi_scan_host(shost);
> +	/* Submit the delayed_work for SCSI-device scanning */
> +	usb_autopm_get_interface_no_resume(intf);
> +	devinfo->scan_pending = 1;
> +	schedule_work(&devinfo->scan_work);
> +
>  	return result;
>  Is this approach really necessary
>  free_streams:
> @@ -1166,6 +1187,14 @@ static void uas_disconnect(struct usb_interface *intf)
>  	usb_kill_anchored_urbs(&devinfo->data_urbs);
>  	uas_zap_pending(devinfo, DID_NO_CONNECT);
>  
> +	/*
> +	 * Prevent SCSI scanning (if it hasn't started yet)
> +	 * or wait for the SCSI-scanning routine to stop.
> +	 */
> +	cancel_work_sync(&devinfo->scan_work);
> +	if (devinfo->scan_pending)
> +		usb_autopm_put_interface_no_suspend(intf);

It is not enough to do this in disconnect()
We are guarded against runtime PM, but not against system sleep.
You'd need to handle this in suspend() and resume(), too.
And, unfortunately, the device could be reset from another interface.

Is this approach really necessary? It solves the problem, but
if you want to get it right, the corner cases are ugly.

	Regards
		Oliver

