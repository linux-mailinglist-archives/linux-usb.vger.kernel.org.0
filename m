Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E40C4A2B1
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 15:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729356AbfFRNsD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 09:48:03 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39866 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729121AbfFRNsC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 09:48:02 -0400
Received: (qmail 2328 invoked by uid 2102); 18 Jun 2019 09:48:01 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Jun 2019 09:48:01 -0400
Date:   Tue, 18 Jun 2019 09:48:01 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Marcos Paulo de Souza <marcos.souza.org@gmail.com>
cc:     Kernel development list <linux-kernel@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB MASS STORAGE DRIVER" <linux-usb@vger.kernel.org>,
        "open list:USB MASS STORAGE DRIVER" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: [PATCH 2/2] usb: storage: scsiglue: Do not skip VPD if try_vpd_pages
 is set
In-Reply-To: <20190618013146.21961-3-marcos.souza.org@gmail.com>
Message-ID: <Pine.LNX.4.44L0.1906180946160.1659-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 17 Jun 2019, Marcos Paulo de Souza wrote:

> If BLIST_TRY_VPD_PAGES is set for a device, even for an USB, it should
> be honored, so only set skip_vpd_pages is try_vpd_pages is not set.
> 
> Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
> ---
>  drivers/usb/storage/scsiglue.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
> index 59190d88fa9f..0a9520780771 100644
> --- a/drivers/usb/storage/scsiglue.c
> +++ b/drivers/usb/storage/scsiglue.c
> @@ -195,8 +195,11 @@ static int slave_configure(struct scsi_device *sdev)
>  		 */
>  		sdev->skip_ms_page_8 = 1;
>  
> -		/* Some devices don't handle VPD pages correctly */
> -		sdev->skip_vpd_pages = 1;
> +		/*
> +		 * Some devices don't handle VPD pages correctly, so skip vpd
> +		 * pages if not forced by SCSI layer.
> +		 */
> +		sdev->skip_vpd_pages = sdev->try_vpd_pages == 0;
>  
>  		/* Do not attempt to use REPORT SUPPORTED OPERATION CODES */
>  		sdev->no_report_opcodes = 1;

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Although I think it would be clearer to write:

		sdev->skip_vpd_pages = !sdev->try_vpd_pages;

But that's just personal preference.  This is okay as it is.

Alan Stern

