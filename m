Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FE34CD72
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 14:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731678AbfFTMK2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 08:10:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:39586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730596AbfFTMK2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Jun 2019 08:10:28 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0906E2080C;
        Thu, 20 Jun 2019 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561032627;
        bh=gypvzOuIyGej/WLKSteaEHH1Cc+uthJD0zqXxf7LLJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wKQFXj/Kk1YUVHNUjmFWLP/OYg2Z4cD55J+GL9FwDW4/YVfOMZ+Bm5ajPWetKYjUg
         UJ/J9WsCFYnWCc3j+g9/EEOocWMisPtXsvaQ6k8HlsrRbJy8sLYuAFVlad7O2gxuHA
         dOHkFYG1pY93D5BhBFAESLH8hCeT6OGJpSFWDyEc=
Date:   Thu, 20 Jun 2019 14:10:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yinbo Zhu <yinbo.zhu@nxp.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, xiaobo.xie@nxp.com,
        jiafei.pan@nxp.com,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        Nikhil Badola <nikhil.badola@freescale.com>,
        Ran Wang <ran.wang_1@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/5] usb: host: Stops USB controller init if PLL fails
 to lock
Message-ID: <20190620121025.GB19295@kroah.com>
References: <20190614085433.22344-1-yinbo.zhu@nxp.com>
 <20190614085433.22344-4-yinbo.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614085433.22344-4-yinbo.zhu@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 14, 2019 at 04:54:32PM +0800, Yinbo Zhu wrote:
> From: Ramneek Mehresh <ramneek.mehresh@freescale.com>
> 
> USB erratum-A006918 workaround tries to start internal PHY inside
> uboot (when PLL fails to lock). However, if the workaround also
> fails, then USB initialization is also stopped inside Linux.
> Erratum-A006918 workaround failure creates "fsl,erratum_a006918"
> node in device-tree. Presence of this node in device-tree is
> used to stop USB controller initialization in Linux
> 
> Signed-off-by: Ramneek Mehresh <ramneek.mehresh@freescale.com>
> Signed-off-by: Suresh Gupta <suresh.gupta@freescale.com>
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
> ---
> Change in v7:
> 		keep v5 version "fall through"
> 
>  drivers/usb/host/ehci-fsl.c      | 9 +++++++++
>  drivers/usb/host/fsl-mph-dr-of.c | 3 ++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 8f3bf3efb038..ef3dfd33a62e 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -236,6 +236,15 @@ static int ehci_fsl_setup_phy(struct usb_hcd *hcd,
>  		portsc |= PORT_PTS_PTW;
>  		/* fall through */
>  	case FSL_USB2_PHY_UTMI:
> +		/* Presence of this node "has_fsl_erratum_a006918"
> +		 * in device-tree is used to stop USB controller
> +		 * initialization in Linux
> +		 */
> +		if (pdata->has_fsl_erratum_a006918) {
> +			dev_warn(dev, "USB PHY clock invalid\n");
> +			return -EINVAL;
> +		}
> +

You need a /* fall through */ comment here, right?

thanks,

greg k-h
