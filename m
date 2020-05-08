Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE78C1CB6FA
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 20:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgEHSTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 14:19:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39253 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727815AbgEHSTQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 14:19:16 -0400
Received: (qmail 9470 invoked by uid 500); 8 May 2020 14:19:15 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 May 2020 14:19:15 -0400
Date:   Fri, 8 May 2020 14:19:15 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Tang Bin <tangbin@cmss.chinamobile.com>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH v2] USB: EHCI: ehci-mv: Fix unused assignment in
 mv_ehci_probe()
In-Reply-To: <20200508142136.4232-1-tangbin@cmss.chinamobile.com>
Message-ID: <Pine.LNX.4.44L0.2005081419010.7856-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 8 May 2020, Tang Bin wrote:

> Delete unused initialized value, because 'retval' will be assigined
> by the function mv_ehci_enable(). And delete the extra blank lines.
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>


> Changes from v1
>  - fix the commit message.
> ---
>  drivers/usb/host/ehci-mv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-mv.c b/drivers/usb/host/ehci-mv.c
> index bd4f6ef53..1c079953e 100644
> --- a/drivers/usb/host/ehci-mv.c
> +++ b/drivers/usb/host/ehci-mv.c
> @@ -108,7 +108,7 @@ static int mv_ehci_probe(struct platform_device *pdev)
>  	struct ehci_hcd *ehci;
>  	struct ehci_hcd_mv *ehci_mv;
>  	struct resource *r;
> -	int retval = -ENODEV;
> +	int retval;
>  	u32 offset;
>  
>  	if (usb_disabled())
> @@ -142,8 +142,6 @@ static int mv_ehci_probe(struct platform_device *pdev)
>  		goto err_put_hcd;
>  	}
>  
> -
> -
>  	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	ehci_mv->base = devm_ioremap_resource(&pdev->dev, r);
>  	if (IS_ERR(ehci_mv->base)) {
> 

