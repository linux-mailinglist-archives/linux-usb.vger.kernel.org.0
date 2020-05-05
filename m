Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44C71C5C53
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 17:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbgEEPqa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 11:46:30 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49765 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729666AbgEEPqa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 11:46:30 -0400
Received: (qmail 26239 invoked by uid 500); 5 May 2020 11:46:28 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 5 May 2020 11:46:28 -0400
Date:   Tue, 5 May 2020 11:46:28 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Hannes Reinecke <hare@suse.de>, Greg KH <greg@kroah.com>
cc:     Oliver Neukum <oneukum@suse.de>,
        USB list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: Re: [PATCH] sierra-ms: do not call scsi_get_host_dev()
In-Reply-To: <20200505143019.57418-1-hare@suse.de>
Message-ID: <Pine.LNX.4.44L0.2005051146040.23429-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 5 May 2020, Hannes Reinecke wrote:

> scsi_get_host_dev() will create a virtual device such that either
> the target id is ignored from scanning (if 'this_id' is set to
> something which can be reached during scanning) or if the driver
> needs a scsi device for the HBA to send commands to.
> Neither is true for sierra-ms; 'this_id' remains at the default
> value '-1' and the created device is never ever used within
> the driver.
> So kill it.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/usb/storage/sierra_ms.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/storage/sierra_ms.c b/drivers/usb/storage/sierra_ms.c
> index e605cbc3d8bf..b9f78ef3edc3 100644
> --- a/drivers/usb/storage/sierra_ms.c
> +++ b/drivers/usb/storage/sierra_ms.c
> @@ -129,15 +129,11 @@ int sierra_ms_init(struct us_data *us)
>  	int result, retries;
>  	struct swoc_info *swocInfo;
>  	struct usb_device *udev;
> -	struct Scsi_Host *sh;
>  
>  	retries = 3;
>  	result = 0;
>  	udev = us->pusb_dev;
>  
> -	sh = us_to_host(us);
> -	scsi_get_host_dev(sh);
> -
>  	/* Force Modem mode */
>  	if (swi_tru_install == TRU_FORCE_MODEM) {
>  		usb_stor_dbg(us, "SWIMS: Forcing Modem Mode\n");
> 

Acked-by: Alan Stern <stern@rowland.harvard.edu>

