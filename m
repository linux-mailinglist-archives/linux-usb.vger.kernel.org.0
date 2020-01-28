Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49C614BE0C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2020 17:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgA1Qvs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jan 2020 11:51:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:54160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbgA1Qvs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jan 2020 11:51:48 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3CDD214AF;
        Tue, 28 Jan 2020 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580230307;
        bh=fl9jAAi0i/w9hVsplSShd6GlQeW4irEW3nyhOqlTgkI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OzzJ30W2qQYtp44dvdEFG1Fe9Ah97q3A5YxUW2FeeGVvnNOE5s17J41jHHD1K/fTm
         muhfwRnArrE0x557swygqP2WKjnZLe09kpR2izXDDEM/CTYWQCWy9/oS+tlsj0sneH
         TmlyTFV6iJpB6EHy0uNgb4cHCJX23sVAx/LFg8Jc=
Date:   Tue, 28 Jan 2020 17:51:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mans Rullgard <mans@mansr.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND][PATCH 2/2] usb: hub: use non-removable-ports DT property
Message-ID: <20200128165144.GB3666045@kroah.com>
References: <20200124152504.23411-1-mans@mansr.com>
 <20200124152504.23411-2-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124152504.23411-2-mans@mansr.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 24, 2020 at 03:25:04PM +0000, Mans Rullgard wrote:
> Mark any ports listed in the non-removable-ports DT property as
> hardwired. This is useful for boards with built-in USB devices
> that cannot be (or have not been) marked as fixed in hardware.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  drivers/usb/core/hub.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 4ac74b354801..97f8f15fb632 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -1366,6 +1366,9 @@ static int hub_configure(struct usb_hub *hub,
>  	unsigned unit_load;
>  	unsigned full_load;
>  	unsigned maxchild;
> +	struct property *prop;
> +	const __be32 *cur;
> +	u32 val;
>  
>  	hub->buffer = kmalloc(sizeof(*hub->buffer), GFP_KERNEL);
>  	if (!hub->buffer) {
> @@ -1667,6 +1670,19 @@ static int hub_configure(struct usb_hub *hub,
>  		}
>  	}
>  
> +	of_property_for_each_u32(hub_dev->of_node, "non-removable-ports",
> +				 prop, cur, val) {
> +		if (val < 1 || val > hdev->maxchild) {
> +			dev_warn(hub_dev,
> +				 "bad port number %u in non-removable-ports\n",
> +				 val);
> +			continue;
> +		}
> +
> +		hub->ports[val - 1]->connect_type =
> +			USB_PORT_CONNECT_TYPE_HARD_WIRED;
> +	}
> +

Is this doing the same thing that ACPI does?  It doesn't seem like it,
why not do this in usb_hub_adjust_deviceremovable()?  Or wherever ACPI
does this...

thanks,

greg k-h
