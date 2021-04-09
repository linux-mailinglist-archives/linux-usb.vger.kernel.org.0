Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC43F3595DD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 08:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233369AbhDIGxV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 02:53:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:39786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231540AbhDIGxU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Apr 2021 02:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC2DD610FC;
        Fri,  9 Apr 2021 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617951188;
        bh=CWgnKo2R1JWhhcL6cLGMIUWSmwSI6u78i8ozgB5S9Ng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kUDVgY+OG6iylqZzjMNVmdhtjYL2teOLmGpbRmk30RfYKlHj8uxg1QCGe+g1a2NgX
         lNRpicpV0o1c1PNMcDdqwy/eJR9vB2HI7nT078VJKwBFhY3yR/PXTp3G/b9mx6/6ye
         ajQ6sHRljcXMVS4x4A28v79wAJGpRA4pioV8uhZw=
Date:   Fri, 9 Apr 2021 08:53:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 6/6] usb: dwc3: host: Set quirks base on version
Message-ID: <YG/50kPULbzZRlFj@kroah.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
 <a792b1ea6b7083d400b3a6b38dcca70588fc5587.1617929509.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a792b1ea6b7083d400b3a6b38dcca70588fc5587.1617929509.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 06:42:32PM -0700, Thinh Nguyen wrote:
> We can check for host quirks at runtime base on the controller IP and
> version check. Set the following quirks for the DWC_usb31 IP host mode
> before creating a platform device for the xHCI driver:
> 
>  * XHCI_ISOC_BLOCKED_DISCONNECT
>  * XHCI_LIMIT_FS_BI_INTR_EP
>  * XHCI_LOST_DISCONNECT_QUIRK
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/host.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index f29a264635aa..a486d7fbb163 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/platform_device.h>
> +#include <linux/usb/xhci-quirks.h>
>  
>  #include "core.h"
>  
> @@ -42,6 +43,17 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>  	return irq;
>  }
>  
> +static void dwc3_host_init_quirks(struct dwc3 *dwc, struct xhci_plat_priv *priv)
> +{
> +	memset(priv, 0, sizeof(*priv));
> +
> +	if (DWC3_VER_IS_WITHIN(DWC31, ANY, 190A)) {
> +		priv->quirks |= XHCI_ISOC_BLOCKED_DISCONNECT;
> +		priv->quirks |= XHCI_LIMIT_FS_BI_INTR_EP;
> +		priv->quirks |= XHCI_LOST_DISCONNECT_QUIRK;
> +	}
> +}
> +
>  int dwc3_host_init(struct dwc3 *dwc)
>  {
>  	struct property_entry	props[4];
> @@ -49,6 +61,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	int			ret, irq;
>  	struct resource		*res;
>  	struct platform_device	*dwc3_pdev = to_platform_device(dwc->dev);
> +	struct xhci_plat_priv	dwc3_priv;

Tying the dwc3 code to the xhci code like this feels really wrong to me,
are you sure this is the correct resolution?

greg k-h
