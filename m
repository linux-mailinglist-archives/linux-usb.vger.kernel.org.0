Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E30C2F4FC4
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 17:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbhAMQUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 11:20:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:43056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727081AbhAMQUT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Jan 2021 11:20:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AC2F2313C;
        Wed, 13 Jan 2021 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610554778;
        bh=P8YfqyxeUpmTgxjSFmZaPSgIiYXmaEKMsiFceSe0dJA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eFSMYdp4KhniJmec1P2W1pmdQV57hsWSR+6fW8pWEtR1kAHw68cDGzj98TZZLw5LP
         x75XUcCGJDHSP+VtbJ9lTbRzPivk8eL2XK877EfUYXcSjPBOsAcG9VDm5DE8MpCgME
         krE7tlK+y4weDVTIftMxGWv4VaJpaeLL6y/FQ6jk=
Date:   Wed, 13 Jan 2021 17:20:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, zenczykowski@gmail.com
Subject: Re: [PATCH v2] usb: gadget: u_ether: support configuring interface
 names.
Message-ID: <X/8d3bI5HP4FYnge@kroah.com>
References: <20210113154550.789244-1-lorenzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113154550.789244-1-lorenzo@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 14, 2021 at 12:45:50AM +0900, Lorenzo Colitti wrote:
> This patch allows the administrator to configure the interface
> name of a function using u_ether (e.g., eem, ncm, rndis).
> 
> Currently, all such interfaces, regardless of function type, are
> always called usb0, usb1, etc. This makes it very cumbersome to
> use more than one such type at a time, because userspace cannnot
> easily tell the interfaces apart and apply the right
> configuration to each one. Interface renaming in userspace based
> on driver doesn't help, because the interfaces all have the same
> driver. Without this patch, doing this require hacks/workarounds
> such as setting fixed MAC addresses on the functions, and then
> renaming by MAC address, or scraping configfs after each
> interface is created to find out what it is.
> 
> Setting the interface name is done by writing to the same
> "ifname" configfs attribute that reports the interface name after
> the function is bound. The write must contain an interface
> pattern such as "usb%d" (which will cause the net core to pick
> the next available interface name starting with "usb").
> This patch does not allow writing an exact interface name (as
> opposed to a pattern) because if the interface already exists at
> bind time, the bind will fail and the whole gadget will fail to
> activate. This could be allowed in a future patch.
> 
> For compatibility with current userspace, when reading an ifname
> that has not currently been set, the result is still "(unnamed
> net_device)". Once a write to ifname happens, then reading ifname
> will return whatever was last written.
> 
> Tested by configuring an rndis function and an ncm function on
> the same gadget, and writing "rndis%d" to ifname on the rndis
> function and "ncm%d" to ifname on the ncm function. When the
> gadget was bound, the rndis interface was rndis0 and the ncm
> interface was ncm0.
> 
> Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
> ---
>  Documentation/usb/gadget-testing.rst          | 30 +++++++--------
>  drivers/usb/gadget/function/u_ether.c         | 37 +++++++++++++++++--
>  drivers/usb/gadget/function/u_ether.h         | 12 ++++++
>  .../usb/gadget/function/u_ether_configfs.h    | 15 +++++++-
>  4 files changed, 75 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> index 2eeb3e9299e4..2085e7b24eeb 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -91,9 +91,9 @@ The ECM function provides these attributes in its function directory:
>  
>  and after creating the functions/ecm.<instance name> they contain default
>  values: qmult is 5, dev_addr and host_addr are randomly selected.
> -Except for ifname they can be written to until the function is linked to a
> -configuration. The ifname is read-only and contains the name of the interface
> -which was assigned by the net core, e. g. usb0.
> +The ifname can be written to if the function is not bound. A write must be an
> +interface pattern such as "usb%d", which will cause the net core to choose the
> +next free usbX interface. By default, it is set to "usb%d".
>  
>  Testing the ECM function
>  ------------------------
> @@ -131,9 +131,9 @@ The ECM subset function provides these attributes in its function directory:
>  
>  and after creating the functions/ecm.<instance name> they contain default
>  values: qmult is 5, dev_addr and host_addr are randomly selected.
> -Except for ifname they can be written to until the function is linked to a
> -configuration. The ifname is read-only and contains the name of the interface
> -which was assigned by the net core, e. g. usb0.
> +The ifname can be written to if the function is not bound. A write must be an
> +interface pattern such as "usb%d", which will cause the net core to choose the
> +next free usbX interface. By default, it is set to "usb%d".
>  
>  Testing the ECM subset function
>  -------------------------------
> @@ -171,9 +171,9 @@ The EEM function provides these attributes in its function directory:
>  
>  and after creating the functions/eem.<instance name> they contain default
>  values: qmult is 5, dev_addr and host_addr are randomly selected.
> -Except for ifname they can be written to until the function is linked to a
> -configuration. The ifname is read-only and contains the name of the interface
> -which was assigned by the net core, e. g. usb0.
> +The ifname can be written to if the function is not bound. A write must be an
> +interface pattern such as "usb%d", which will cause the net core to choose the
> +next free usbX interface. By default, it is set to "usb%d".
>  
>  Testing the EEM function
>  ------------------------
> @@ -453,9 +453,9 @@ The NCM function provides these attributes in its function directory:
>  
>  and after creating the functions/ncm.<instance name> they contain default
>  values: qmult is 5, dev_addr and host_addr are randomly selected.
> -Except for ifname they can be written to until the function is linked to a
> -configuration. The ifname is read-only and contains the name of the interface
> -which was assigned by the net core, e. g. usb0.
> +The ifname can be written to if the function is not bound. A write must be an
> +interface pattern such as "usb%d", which will cause the net core to choose the
> +next free usbX interface. By default, it is set to "usb%d".
>  
>  Testing the NCM function
>  ------------------------
> @@ -591,9 +591,9 @@ The RNDIS function provides these attributes in its function directory:
>  
>  and after creating the functions/rndis.<instance name> they contain default
>  values: qmult is 5, dev_addr and host_addr are randomly selected.
> -Except for ifname they can be written to until the function is linked to a
> -configuration. The ifname is read-only and contains the name of the interface
> -which was assigned by the net core, e. g. usb0.
> +The ifname can be written to if the function is not bound. A write must be an
> +interface pattern such as "usb%d", which will cause the net core to choose the
> +next free usbX interface. By default, it is set to "usb%d".
>  
>  Testing the RNDIS function
>  --------------------------
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index c019f2b0c0af..a4ade7983402 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -78,8 +78,9 @@ struct eth_dev {
>  	unsigned long		todo;
>  #define	WORK_RX_MEMORY		0
>  
> -	bool			zlp;
> -	bool			no_skb_reserve;
> +	bool			zlp:1;
> +	bool			no_skb_reserve:1;
> +	bool			ifname_set:1;

Not to be a pain, but "bool var:1"?  What's wrong with just a bool
itself?  gcc is known to have issues with setting/clearing bit fields
like this, and there is no size issues here with this device, adding one
more byte is just fine.

So just add:
	bool		ifname_set;
please.

thanks,

greg k-h
