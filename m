Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D890D115F
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 16:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729865AbfJIOgj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 10:36:39 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51032 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728019AbfJIOgj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 10:36:39 -0400
Received: (qmail 2398 invoked by uid 2102); 9 Oct 2019 10:36:38 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Oct 2019 10:36:38 -0400
Date:   Wed, 9 Oct 2019 10:36:38 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 3/5] USB: Implement usb_device_match_id()
In-Reply-To: <20191009134342.6476-4-hadess@hadess.net>
Message-ID: <Pine.LNX.4.44L0.1910091035260.1603-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 9 Oct 2019, Bastien Nocera wrote:

> Match a usb_device with a table of IDs.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/usb/core/driver.c | 15 +++++++++++++++
>  include/linux/usb.h       |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 863e380a272b..50f92da8afcf 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -800,6 +800,21 @@ const struct usb_device_id *usb_match_id(struct usb_interface *interface,
>  }
>  EXPORT_SYMBOL_GPL(usb_match_id);
>  
> +const struct usb_device_id *usb_device_match_id(struct usb_device *udev,
> +				const struct usb_device_id *id)
> +{
> +	if (!id)
> +		return NULL;
> +
> +	for (; id->idVendor || id->idProduct ; id++) {
> +		if (usb_match_device(udev, id))
> +			return id;
> +	}

This would be better if you allowed matching against just the idVendor 
field rather than matching against both.  That would make it a lot 
simpler to match all Apple devices, for instance.

Alan Stern

