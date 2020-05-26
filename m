Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEB1E1CB6FC
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2020 20:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgEHSTn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 May 2020 14:19:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34043 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726807AbgEHSTn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 May 2020 14:19:43 -0400
Received: (qmail 9518 invoked by uid 500); 8 May 2020 14:19:42 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 May 2020 14:19:42 -0400
Date:   Fri, 8 May 2020 14:19:42 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Tang Bin <tangbin@cmss.chinamobile.com>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Subject: Re: [PATCH v2] USB: host: ehci-mxc: Use the defined variable to
 simplify code
In-Reply-To: <20200508144024.7836-1-tangbin@cmss.chinamobile.com>
Message-ID: <Pine.LNX.4.44L0.2005081419270.7856-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 8 May 2020, Tang Bin wrote:

> Use the defined variable "dev" to make the code cleaner. And
> delete an extra blank line.
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
> Changes from v1:
>  - fix the subject and the code.
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-mxc.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-mxc.c b/drivers/usb/host/ehci-mxc.c
> index c9f91e6c7..09e01397f 100644
> --- a/drivers/usb/host/ehci-mxc.c
> +++ b/drivers/usb/host/ehci-mxc.c
> @@ -36,12 +36,12 @@ static const struct ehci_driver_overrides ehci_mxc_overrides __initconst = {
>  
>  static int ehci_mxc_drv_probe(struct platform_device *pdev)
>  {
> -	struct mxc_usbh_platform_data *pdata = dev_get_platdata(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +	struct mxc_usbh_platform_data *pdata = dev_get_platdata(dev);
>  	struct usb_hcd *hcd;
>  	struct resource *res;
>  	int irq, ret;
>  	struct ehci_mxc_priv *priv;
> -	struct device *dev = &pdev->dev;
>  	struct ehci_hcd *ehci;
>  
>  	if (!pdata) {
> @@ -56,7 +56,7 @@ static int ehci_mxc_drv_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
> +	hcd->regs = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(hcd->regs)) {
>  		ret = PTR_ERR(hcd->regs);
>  		goto err_alloc;
> @@ -69,14 +69,14 @@ static int ehci_mxc_drv_probe(struct platform_device *pdev)
>  	priv = (struct ehci_mxc_priv *) ehci->priv;
>  
>  	/* enable clocks */
> -	priv->usbclk = devm_clk_get(&pdev->dev, "ipg");
> +	priv->usbclk = devm_clk_get(dev, "ipg");
>  	if (IS_ERR(priv->usbclk)) {
>  		ret = PTR_ERR(priv->usbclk);
>  		goto err_alloc;
>  	}
>  	clk_prepare_enable(priv->usbclk);
>  
> -	priv->ahbclk = devm_clk_get(&pdev->dev, "ahb");
> +	priv->ahbclk = devm_clk_get(dev, "ahb");
>  	if (IS_ERR(priv->ahbclk)) {
>  		ret = PTR_ERR(priv->ahbclk);
>  		goto err_clk_ahb;
> @@ -84,13 +84,12 @@ static int ehci_mxc_drv_probe(struct platform_device *pdev)
>  	clk_prepare_enable(priv->ahbclk);
>  
>  	/* "dr" device has its own clock on i.MX51 */
> -	priv->phyclk = devm_clk_get(&pdev->dev, "phy");
> +	priv->phyclk = devm_clk_get(dev, "phy");
>  	if (IS_ERR(priv->phyclk))
>  		priv->phyclk = NULL;
>  	if (priv->phyclk)
>  		clk_prepare_enable(priv->phyclk);
>  
> -
>  	/* call platform specific init function */
>  	if (pdata->init) {
>  		ret = pdata->init(pdev);
> 

