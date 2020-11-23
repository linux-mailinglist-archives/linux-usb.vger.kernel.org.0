Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46B82C0E93
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 16:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731949AbgKWPPS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 10:15:18 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59287 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729718AbgKWPPR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 10:15:17 -0500
Received: (qmail 709648 invoked by uid 1000); 23 Nov 2020 10:15:15 -0500
Date:   Mon, 23 Nov 2020 10:15:15 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: ehci-omap: Fix PM disable depth umbalance in
 ehci_hcd_omap_probe
Message-ID: <20201123151515.GA708586@rowland.harvard.edu>
References: <20201123145719.1455849-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123145719.1455849-1-zhangqilong3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 23, 2020 at 10:57:19PM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Imbalance

That's backward.  pm_runtime_enable _decrements_ the power-disable 
depth.

> depth will resulted in enabling runtime PM of device fails later.
> Thus a pairing decrement must be needed on the error handling path
> to keep it balanced.
> 
> Fixes: 6c984b066d84b ("ARM: OMAP: USBHOST: Replace usbhs core driver APIs by Runtime pm APIs")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/usb/host/ehci-omap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
> index 8771a2ed6926..7f4a03e8647a 100644
> --- a/drivers/usb/host/ehci-omap.c
> +++ b/drivers/usb/host/ehci-omap.c
> @@ -220,6 +220,7 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
>  
>  err_pm_runtime:
>  	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
>  
>  err_phy:
>  	for (i = 0; i < omap->nports; i++) {

Apart from that one typo,

Acked-by: Alan Stern <stern@rowland.harvard.edu>
