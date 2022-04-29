Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7CB514FB2
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 17:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378592AbiD2Pk4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 11:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378569AbiD2Pky (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 11:40:54 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 553FAD64F5
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 08:37:33 -0700 (PDT)
Received: (qmail 950759 invoked by uid 1000); 29 Apr 2022 11:37:32 -0400
Date:   Fri, 29 Apr 2022 11:37:32 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Vincent Shih <vincent.sunplus@gmail.com>
Cc:     gregkh@linuxfoundation.org, p.zabel@pengutronix.de,
        davem@davemloft.net, vladimir.oltean@nxp.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, wells.lu@sunplus.com
Subject: Re: [PATCH v4 1/2] usb: host: ehci-sunplus: Add driver for ehci in
 Sunplus SP7021
Message-ID: <YmwGPDNXNfx2RqLY@rowland.harvard.edu>
References: <1651220876-26705-1-git-send-email-vincent.sunplus@gmail.com>
 <1651220876-26705-2-git-send-email-vincent.sunplus@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651220876-26705-2-git-send-email-vincent.sunplus@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 29, 2022 at 04:27:55PM +0800, Vincent Shih wrote:
> Add driver for ehci in Sunplus SP7021
> 
> Signed-off-by: Vincent Shih <vincent.sunplus@gmail.com>
> ---
> Changes in v4:
>   - Implement power_on, power_off and power_suspend functions.

Did you test these?  Did you try to rmmod the ehci-sunplus module after 
adding these functions?

> diff --git a/drivers/usb/host/ehci-sunplus.c b/drivers/usb/host/ehci-sunplus.c
> new file mode 100644
> index 0000000..4d8e20d
> --- /dev/null
> +++ b/drivers/usb/host/ehci-sunplus.c
> @@ -0,0 +1,289 @@

...

> +static void sp_ehci_platform_power_off(struct platform_device *pdev)
> +{
> +	struct usb_hcd *hcd = platform_get_drvdata(pdev);
> +	struct sp_ehci_priv *sp_priv = hcd_to_sp_ehci_priv(hcd);
> +
> +	phy_power_off(sp_priv->phy);
> +	phy_exit(sp_priv->phy);

Notice that this dereferences a field contained in the sp_ehci_priv 
extension to the usb_hcd structure.

...

> +static int ehci_sunplus_remove(struct platform_device *pdev)
> +{
> +	struct usb_hcd *hcd = platform_get_drvdata(pdev);
> +	struct usb_ehci_pdata *pdata = pdev->dev.platform_data;
> +
> +	usb_remove_hcd(hcd);
> +	usb_put_hcd(hcd);

This call deallocates the usb_hcd structure.

> +
> +	if (pdata->power_off)
> +		pdata->power_off(pdev);

But here you dereference a field that it contains.  This power-off 
operation must occur _before_ the usb_put_hcd() call.

Alan Stern
