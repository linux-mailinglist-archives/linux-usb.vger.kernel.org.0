Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F422AB812
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 13:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgKIMU1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 07:20:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:42236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729038AbgKIMU1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 07:20:27 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4BA6207BC;
        Mon,  9 Nov 2020 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604924426;
        bh=IT9Kle1TvfEfzXu8PaXs3sb/7A9qOoV1Wq+MhTmK7IE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FAkf3Rtn4Hse+y/CRwsr9FCFhv5jpFznbUjHhJ5VBCA7/MvERxrh1zJ9J4zXeqIQ8
         k1CZNU5wKh4mzEqpcifFLUKVev1Bd2Pv+M6mwetQ+cZUN2KqBbHBCbDVGS/Gmzg+gT
         szKowWZLml0d6gZJV8C7MbVWKOVIRcg5YFtoMuME=
Date:   Mon, 9 Nov 2020 13:21:20 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Add typec_enter_usb() helper function
Message-ID: <20201109122120.GA1834779@kroah.com>
References: <20201109120524.50255-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109120524.50255-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 09, 2020 at 03:05:24PM +0300, Heikki Krogerus wrote:
> This function configures the muxes according to the
> requested USB mode in the Enter_USB Message that was
> communicated with the partner.
> 
> In practice the function just fills struct typec_mux_state
> for the caller by extracting the connector mode (so USB
> mode) from the EUDO (Enter_USB Data Object), and then passes
> that structure to typec_mux_set().
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/class.c | 32 ++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  1 +
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 35eec707cb512..22f82e924d585 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -11,6 +11,7 @@
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>  #include <linux/slab.h>
> +#include <linux/usb/pd.h>
>  
>  #include "bus.h"
>  
> @@ -1579,6 +1580,37 @@ int typec_set_mode(struct typec_port *port, int mode)
>  }
>  EXPORT_SYMBOL_GPL(typec_set_mode);
>  
> +/**
> + * typec_enter_usb - Set USB Mode for USB Type-C connector
> + * @port: USB Type-C connector
> + * @data: Enter_USB Message details.
> + *
> + * This function is called when Enter_USB Message is used. It configures @port
> + * muxes for the USB mode (USB 2.0, USB 3.2 or USB4).
> + */
> +int typec_enter_usb(struct typec_port *port, struct enter_usb_data *data)
> +{
> +	struct typec_mux_state mux_state;
> +
> +	switch ((data->eudo & EUDO_USB_MODE_MASK) >> EUDO_USB_MODE_SHIFT) {
> +	case EUDO_USB_MODE_USB4:
> +		mux_state.mode = TYPEC_MODE_USB4;
> +		break;
> +	case EUDO_USB_MODE_USB3:
> +		mux_state.mode = TYPEC_MODE_USB3;
> +		break;
> +	default:
> +		mux_state.mode = TYPEC_MODE_USB2;
> +		break;
> +	}
> +
> +	mux_state.alt = NULL; /* Not an alt mode */
> +	mux_state.data = data;
> +
> +	return typec_mux_set(port->mux, &mux_state);
> +}
> +EXPORT_SYMBOL_GPL(typec_enter_usb);

We can't add symbols/functions for no in-kernel users, so perhaps submit
this as part of a series that actually uses it?

thanks,

greg k-h
