Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6E03C9F5B
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jul 2021 15:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237063AbhGONVW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jul 2021 09:21:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:49282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229624AbhGONVV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Jul 2021 09:21:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D22E601FA;
        Thu, 15 Jul 2021 13:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626355108;
        bh=W8Y66XpPOxxHnfrY7aFtpu5gHCgQkczS+HzXfR8u7rM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NBloRd/Q80iQGxWmBfuSdl64Zn+dHByiB1yhQ9SpBWRVeIcDfTm+VsiwG2z2p36Ip
         YO8P7KybRxsreUdJxeG3g6jzMZYHP7c923PbZjomyhod/hMqAwljgJqkEjihjSQi8E
         lGyTdLLnPnhaTYn0PRpcbmgtHUkj8D/tl4dpUWZg=
Date:   Thu, 15 Jul 2021 15:18:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: [PATCH 2/2] usb: hub: Disable USB 3 device initiated lpm if exit
 latency is too high
Message-ID: <YPA1ots7vdRclUkE@kroah.com>
References: <20210715131544.1984726-1-mathias.nyman@linux.intel.com>
 <20210715131544.1984726-2-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715131544.1984726-2-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 15, 2021 at 04:15:44PM +0300, Mathias Nyman wrote:
> The device initiated link power management U1/U2 states should not be
> enabled in case the system exit latency plus one bus interval (125us) is
> greater than the shortest service interval of any periodic endpoint.
> 
> This is the case for both U1 and U2 sytstem exit latencies and link states.
> 
> See USB 3.2 section 9.4.9 "Set Feature" for more details
> 
> If host initiated lpm is enabled but device initiated is not due to exit
> latency limitations then still set the udev->usb3_lpm_ux_enabled flag so
> that sysfs users can see the link may go to U1/U2.
> 
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/core/hub.c | 68 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 56 insertions(+), 12 deletions(-)

Do either of these need to go to older kernels?

> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index a35d0bedafa3..63e150982da9 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4116,6 +4116,47 @@ static int usb_set_lpm_timeout(struct usb_device *udev,
>  	return 0;
>  }
>  
> +/*
> + * Don't allow device intiated U1/U2 if the system exit latency + one bus
> + * interval is greater than the minimum service interval of any active
> + * periodic endpoint. See USB 3.2 section 9.4.9
> + */
> +static bool usb_device_may_initiate_lpm(struct usb_device *udev,
> +					enum usb3_link_state state)
> +{
> +	unsigned long long sel;		/* us */

Do you mean u64 here?  If so, you might want to use that :)

thanks,

greg k-h
