Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4353595CE
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 08:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233475AbhDIGuU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 02:50:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:39232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233423AbhDIGuS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 02:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA09561057;
        Fri,  9 Apr 2021 06:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617951006;
        bh=hFit1WxZJh5xzRyMVS0Gfh23kRK3nC8G1f5CZ5SIKoM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kbwvg1177vjceCtWKubsyRX4WoCAD/3ztdPbWYkAA1/a8jQLEfz5aGFJ52rmyF3ws
         1f8aXsI4Eb4tCPXfrnKwBVgSdDSPoNcfk9X3Q1nfzO0tVVuGkgxjXI63dlCyijvpD8
         uabql7pqSKWndqQkYiHcAqq0n4wKp2erdIAEb0lM=
Date:   Fri, 9 Apr 2021 08:50:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/6] usb: xhci: Move quirks definitions to common usb
 header
Message-ID: <YG/5HOGqQ0jFUy3N@kroah.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
 <4e1d73ed75334611578eb607bfdb5ba979abef3c.1617929509.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e1d73ed75334611578eb607bfdb5ba979abef3c.1617929509.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 06:41:59PM -0700, Thinh Nguyen wrote:
> DWC3 (and possibly others such as CDNS3) will need to access these xHCI
> quirks' definitions to initialize their hosts. Currently, to set these
> quirks, we'd need to create new DT properties matching the quirks. This
> may not be necessary as the driver can check the controller IP and
> version at runtime to determine which quirks are needed. Let's move
> these quirks' definitions to a common header under include/linux/usb so
> DWC3 can properly access them.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/host/xhci-plat.c    |  1 -
>  drivers/usb/host/xhci-plat.h    | 25 -----------
>  drivers/usb/host/xhci-rcar.c    |  1 -
>  drivers/usb/host/xhci.h         | 53 +----------------------
>  include/linux/usb/xhci-quirks.h | 77 +++++++++++++++++++++++++++++++++
>  5 files changed, 78 insertions(+), 79 deletions(-)
>  delete mode 100644 drivers/usb/host/xhci-plat.h
>  create mode 100644 include/linux/usb/xhci-quirks.h
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c1edcc9b13ce..716ef3a338db 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -21,7 +21,6 @@
>  #include <linux/usb/of.h>
>  
>  #include "xhci.h"
> -#include "xhci-plat.h"
>  #include "xhci-mvebu.h"
>  #include "xhci-rcar.h"
>  
> diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
> deleted file mode 100644
> index 561d0b7bce09..000000000000
> --- a/drivers/usb/host/xhci-plat.h
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * xhci-plat.h - xHCI host controller driver platform Bus Glue.
> - *
> - * Copyright (C) 2015 Renesas Electronics Corporation
> - */
> -
> -#ifndef _XHCI_PLAT_H
> -#define _XHCI_PLAT_H
> -
> -#include "xhci.h"	/* for hcd_to_xhci() */
> -
> -struct xhci_plat_priv {
> -	const char *firmware_name;
> -	unsigned long long quirks;
> -	int (*plat_setup)(struct usb_hcd *);
> -	void (*plat_start)(struct usb_hcd *);
> -	int (*init_quirk)(struct usb_hcd *);
> -	int (*suspend_quirk)(struct usb_hcd *);
> -	int (*resume_quirk)(struct usb_hcd *);
> -};
> -
> -#define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
> -#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
> -#endif	/* _XHCI_PLAT_H */
> diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
> index 1bc4fe7b8c75..7690bee365fd 100644
> --- a/drivers/usb/host/xhci-rcar.c
> +++ b/drivers/usb/host/xhci-rcar.c
> @@ -14,7 +14,6 @@
>  #include <linux/sys_soc.h>
>  
>  #include "xhci.h"
> -#include "xhci-plat.h"
>  #include "xhci-rcar.h"
>  
>  /*
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 2595a8f057c4..9a4e2808668b 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -17,6 +17,7 @@
>  #include <linux/kernel.h>
>  #include <linux/usb/hcd.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/usb/xhci-quirks.h>
>  
>  /* Code sharing between pci-quirks and xhci hcd */
>  #include	"xhci-ext-caps.h"
> @@ -1840,58 +1841,6 @@ struct xhci_hcd {
>  #define XHCI_STATE_HALTED	(1 << 1)
>  #define XHCI_STATE_REMOVING	(1 << 2)
>  	unsigned long long	quirks;
> -#define	XHCI_LINK_TRB_QUIRK	BIT_ULL(0)
> -#define XHCI_RESET_EP_QUIRK	BIT_ULL(1)
> -#define XHCI_NEC_HOST		BIT_ULL(2)
> -#define XHCI_AMD_PLL_FIX	BIT_ULL(3)
> -#define XHCI_SPURIOUS_SUCCESS	BIT_ULL(4)
> -/*
> - * Certain Intel host controllers have a limit to the number of endpoint
> - * contexts they can handle.  Ideally, they would signal that they can't handle
> - * anymore endpoint contexts by returning a Resource Error for the Configure
> - * Endpoint command, but they don't.  Instead they expect software to keep track
> - * of the number of active endpoints for them, across configure endpoint
> - * commands, reset device commands, disable slot commands, and address device
> - * commands.
> - */
> -#define XHCI_EP_LIMIT_QUIRK	BIT_ULL(5)
> -#define XHCI_BROKEN_MSI		BIT_ULL(6)
> -#define XHCI_RESET_ON_RESUME	BIT_ULL(7)
> -#define	XHCI_SW_BW_CHECKING	BIT_ULL(8)
> -#define XHCI_AMD_0x96_HOST	BIT_ULL(9)
> -#define XHCI_TRUST_TX_LENGTH	BIT_ULL(10)
> -#define XHCI_LPM_SUPPORT	BIT_ULL(11)
> -#define XHCI_INTEL_HOST		BIT_ULL(12)
> -#define XHCI_SPURIOUS_REBOOT	BIT_ULL(13)
> -#define XHCI_COMP_MODE_QUIRK	BIT_ULL(14)
> -#define XHCI_AVOID_BEI		BIT_ULL(15)
> -#define XHCI_PLAT		BIT_ULL(16)
> -#define XHCI_SLOW_SUSPEND	BIT_ULL(17)
> -#define XHCI_SPURIOUS_WAKEUP	BIT_ULL(18)
> -/* For controllers with a broken beyond repair streams implementation */
> -#define XHCI_BROKEN_STREAMS	BIT_ULL(19)
> -#define XHCI_PME_STUCK_QUIRK	BIT_ULL(20)
> -#define XHCI_MTK_HOST		BIT_ULL(21)
> -#define XHCI_SSIC_PORT_UNUSED	BIT_ULL(22)
> -#define XHCI_NO_64BIT_SUPPORT	BIT_ULL(23)
> -#define XHCI_MISSING_CAS	BIT_ULL(24)
> -/* For controller with a broken Port Disable implementation */
> -#define XHCI_BROKEN_PORT_PED	BIT_ULL(25)
> -#define XHCI_LIMIT_ENDPOINT_INTERVAL_7	BIT_ULL(26)
> -#define XHCI_U2_DISABLE_WAKE	BIT_ULL(27)
> -#define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	BIT_ULL(28)
> -#define XHCI_HW_LPM_DISABLE	BIT_ULL(29)
> -#define XHCI_SUSPEND_DELAY	BIT_ULL(30)
> -#define XHCI_INTEL_USB_ROLE_SW	BIT_ULL(31)
> -#define XHCI_ZERO_64B_REGS	BIT_ULL(32)
> -#define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
> -#define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
> -#define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
> -#define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
> -#define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
> -#define XHCI_DISABLE_SPARSE	BIT_ULL(38)
> -#define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
> -#define XHCI_NO_SOFT_RETRY	BIT_ULL(40)
>  
>  	unsigned int		num_active_eps;
>  	unsigned int		limit_active_eps;
> diff --git a/include/linux/usb/xhci-quirks.h b/include/linux/usb/xhci-quirks.h
> new file mode 100644
> index 000000000000..c2cb35c5b273
> --- /dev/null
> +++ b/include/linux/usb/xhci-quirks.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This file holds the definitions of quirks found in xHCI USB hosts.
> + */
> +
> +#ifndef __LINUX_USB_XHCI_QUIRKS_H
> +#define __LINUX_USB_XHCI_QUIRKS_H
> +
> +#define	XHCI_LINK_TRB_QUIRK		BIT_ULL(0)
> +#define XHCI_RESET_EP_QUIRK		BIT_ULL(1)
> +#define XHCI_NEC_HOST			BIT_ULL(2)
> +#define XHCI_AMD_PLL_FIX		BIT_ULL(3)
> +#define XHCI_SPURIOUS_SUCCESS		BIT_ULL(4)
> +/*
> + * Certain Intel host controllers have a limit to the number of endpoint
> + * contexts they can handle.  Ideally, they would signal that they can't handle
> + * anymore endpoint contexts by returning a Resource Error for the Configure
> + * Endpoint command, but they don't.  Instead they expect software to keep track
> + * of the number of active endpoints for them, across configure endpoint
> + * commands, reset device commands, disable slot commands, and address device
> + * commands.
> + */
> +#define XHCI_EP_LIMIT_QUIRK		BIT_ULL(5)
> +#define XHCI_BROKEN_MSI			BIT_ULL(6)
> +#define XHCI_RESET_ON_RESUME		BIT_ULL(7)
> +#define	XHCI_SW_BW_CHECKING		BIT_ULL(8)
> +#define XHCI_AMD_0x96_HOST		BIT_ULL(9)
> +#define XHCI_TRUST_TX_LENGTH		BIT_ULL(10)
> +#define XHCI_LPM_SUPPORT		BIT_ULL(11)
> +#define XHCI_INTEL_HOST			BIT_ULL(12)
> +#define XHCI_SPURIOUS_REBOOT		BIT_ULL(13)
> +#define XHCI_COMP_MODE_QUIRK		BIT_ULL(14)
> +#define XHCI_AVOID_BEI			BIT_ULL(15)
> +#define XHCI_PLAT			BIT_ULL(16)
> +#define XHCI_SLOW_SUSPEND		BIT_ULL(17)
> +#define XHCI_SPURIOUS_WAKEUP		BIT_ULL(18)
> +/* For controllers with a broken beyond repair streams implementation */
> +#define XHCI_BROKEN_STREAMS		BIT_ULL(19)
> +#define XHCI_PME_STUCK_QUIRK		BIT_ULL(20)
> +#define XHCI_MTK_HOST			BIT_ULL(21)
> +#define XHCI_SSIC_PORT_UNUSED		BIT_ULL(22)
> +#define XHCI_NO_64BIT_SUPPORT		BIT_ULL(23)
> +#define XHCI_MISSING_CAS		BIT_ULL(24)
> +/* For controller with a broken Port Disable implementation */
> +#define XHCI_BROKEN_PORT_PED		BIT_ULL(25)
> +#define XHCI_LIMIT_ENDPOINT_INTERVAL_7	BIT_ULL(26)
> +#define XHCI_U2_DISABLE_WAKE		BIT_ULL(27)
> +#define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	BIT_ULL(28)
> +#define XHCI_HW_LPM_DISABLE		BIT_ULL(29)
> +#define XHCI_SUSPEND_DELAY		BIT_ULL(30)
> +#define XHCI_INTEL_USB_ROLE_SW		BIT_ULL(31)
> +#define XHCI_ZERO_64B_REGS		BIT_ULL(32)
> +#define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
> +#define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
> +#define XHCI_SNPS_BROKEN_SUSPEND	BIT_ULL(35)
> +#define XHCI_RENESAS_FW_QUIRK		BIT_ULL(36)
> +#define XHCI_SKIP_PHY_INIT		BIT_ULL(37)
> +#define XHCI_DISABLE_SPARSE		BIT_ULL(38)
> +#define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
> +#define XHCI_NO_SOFT_RETRY		BIT_ULL(40)
> +
> +struct usb_hcd;
> +
> +struct xhci_plat_priv {
> +	const char *firmware_name;
> +	unsigned long long quirks;
> +	int (*plat_setup)(struct usb_hcd *hcd);
> +	void (*plat_start)(struct usb_hcd *hcd);
> +	int (*init_quirk)(struct usb_hcd *hcd);
> +	int (*suspend_quirk)(struct usb_hcd *hcd);
> +	int (*resume_quirk)(struct usb_hcd *hcd);
> +};
> +
> +#define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
> +#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)

Why do you need this tructure and #defines for xhci priv stuff need to
be in a public .h file?

I would think that at most you just need the xhci bit fields.

thanks,

greg k-h
