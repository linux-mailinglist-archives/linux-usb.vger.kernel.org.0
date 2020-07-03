Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1623213BB4
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 16:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgGCOTM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 10:19:12 -0400
Received: from netrider.rowland.org ([192.131.102.5]:37425 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726035AbgGCOTM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 10:19:12 -0400
Received: (qmail 623871 invoked by uid 1000); 3 Jul 2020 10:19:11 -0400
Date:   Fri, 3 Jul 2020 10:19:11 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     mathias.nyman@intel.com, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-imx@nxp.com
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Message-ID: <20200703141911.GA623139@rowland.harvard.edu>
References: <20200703062532.29076-1-peter.chen@nxp.com>
 <20200703062532.29076-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703062532.29076-2-peter.chen@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 02:25:32PM +0800, Peter Chen wrote:
> After that, the user could enable controller as wakeup source
> for system suspend through /sys entry.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/host/xhci-plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index cebe24ec80a5..bb5d73f0a796 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_device *pdev)
>  		*priv = *priv_match;
>  	}
>  
> -	device_wakeup_enable(hcd->self.controller);
> +	device_set_wakeup_capable(hcd->self.controller, true);


In fact both this patch and the original code are wrong.  It really should 
be:

	device_init_wakeup(hcd->self.controller, true);

This will add the wakeup entry in sysfs and set it to Enabled.  This is 
the appropriate behavior, as explained in the kerneldoc for 
device_init_wakeup().  The reason is because the controller device doesn't 
create any wakeup events on its own; it merely relays wakeup requests from 
descendant devices (root hubs or USB devices).

Alan Stern
