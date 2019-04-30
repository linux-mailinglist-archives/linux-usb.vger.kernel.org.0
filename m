Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE803FBD3
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 16:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfD3Or1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 10:47:27 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35592 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726053AbfD3Or1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 10:47:27 -0400
Received: (qmail 3188 invoked by uid 2102); 30 Apr 2019 10:47:26 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Apr 2019 10:47:26 -0400
Date:   Tue, 30 Apr 2019 10:47:26 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     gregKH@linuxfoundation.org, <miquel@df.uba.ar>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3] rio500: refuse more than one device at a time
In-Reply-To: <20190430142326.25815-1-oneukum@suse.com>
Message-ID: <Pine.LNX.4.44L0.1904301045260.1465-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 30 Apr 2019, Oliver Neukum wrote:

> This driver is using a global variable. It cannot handle more than
> one device at a time. The issue has been exisying since the dawn

s/exisying/existing/

> of the driver.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: syzbot+35f04d136fc975a70da4@syzkaller.appspotmail.com
> ---
>  drivers/usb/misc/rio500.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/rio500.c b/drivers/usb/misc/rio500.c
> index 13e4889bc34f..a4b6fbea975f 100644
> --- a/drivers/usb/misc/rio500.c
> +++ b/drivers/usb/misc/rio500.c
> @@ -449,7 +449,12 @@ static int probe_rio(struct usb_interface *intf,
>  	struct rio_usb_data *rio = &rio_instance;
>  	int retval;
>  
> -	dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
> +	if (rio->present) {
> +		dev_info(&intf->dev, "Second USB Rio at address %d refused\n", dev->devnum);
> +		return -EBUSY;
> +	} else {
> +		dev_info(&intf->dev, "USB Rio found at address %d\n", dev->devnum);
> +	}

This will race if more than one Rio is probed at the same time.  You 
should hold the rio500_mutex throughout this routine.

Alan Stern

