Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80037175EAE
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 16:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgCBPqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 10:46:21 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:33754 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727083AbgCBPqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Mar 2020 10:46:21 -0500
Received: (qmail 2068 invoked by uid 2102); 2 Mar 2020 10:46:20 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Mar 2020 10:46:20 -0500
Date:   Mon, 2 Mar 2020 10:46:20 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Jim Lin <jilin@nvidia.com>, Greg KH <greg@kroah.com>
cc:     USB list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: Re: [PATCH 1/1] usb: storage: Add quirk for Samsung Fit flash
In-Reply-To: <1583158895-31342-1-git-send-email-jilin@nvidia.com>
Message-ID: <Pine.LNX.4.44L0.2003021045280.1555-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2 Mar 2020, Jim Lin wrote:

> Current driver has 240 (USB2.0) and 2048 (USB3.0) as max_sectors,
> e.g., /sys/bus/scsi/devices/0:0:0:0/max_sectors
> 
> If data access times out, driver error handling will issue a port
> reset.
> Sometimes Samsung Fit (090C:1000) flash disk will not respond to
> later Set Address or Get Descriptor command.
> 
> Adding this quirk to limit max_sectors to 64 sectors to avoid issue
> occurring.
> 
> Signed-off-by: Jim Lin <jilin@nvidia.com>
> ---
>  drivers/usb/storage/unusual_devs.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 1cd9b6305b06..1880f3e13f57 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -1258,6 +1258,12 @@ UNUSUAL_DEV( 0x090a, 0x1200, 0x0000, 0x9999,
>  		USB_SC_RBC, USB_PR_BULK, NULL,
>  		0 ),
>  
> +UNUSUAL_DEV(0x090c, 0x1000, 0x1100, 0x1100,
> +		"Samsung",
> +		"Flash Drive FIT",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_MAX_SECTORS_64),
> +
>  /* aeb */
>  UNUSUAL_DEV( 0x090c, 0x1132, 0x0000, 0xffff,
>  		"Feiya",

Acked-by: Alan Stern <stern@rowland.harvard.edu>

