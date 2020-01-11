Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49839138367
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2020 21:01:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731056AbgAKUBx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 15:01:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:55678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731003AbgAKUBx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Jan 2020 15:01:53 -0500
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6C5CB2146E;
        Sat, 11 Jan 2020 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578772913;
        bh=x7anT0WviHjXwoOAzsSA65nKLbQryrmcSAqwqUoZu9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=woaBIiKHMkMP+pPg/yr+H45f+xqHLBJwLeT9taBWl88GrqCHOgq7YQ3ECA9F+VPVm
         6e0KNylssaR0EvkBf0+Rwh6GYk3pYTmu1fcH9rXsKkhEFjUaHvFkb6pjbzY1iRl1yZ
         M1mHdCC+hybN+ggbjSijlTVWDr598qFBnQem5yDs=
Date:   Sat, 11 Jan 2020 20:25:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        pawell@cadence.com, rogerq@ti.com, jun.li@nxp.com
Subject: Re: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Message-ID: <20200111192559.GB435222@kroah.com>
References: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 09, 2020 at 05:35:58PM +0800, Peter Chen wrote:
> There is a Cadence USB3 core for imx8qm and imx8qxp SoCs, the cdns
> core is the child for this glue layer device.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
> Changes for v2:
> - Add COMPILE_TEST Kconfig option
> - Using BIT Macro for definition
> - Delete runtime pm operation
> 
>  drivers/usb/cdns3/Kconfig     |  10 ++
>  drivers/usb/cdns3/Makefile    |   1 +
>  drivers/usb/cdns3/cdns3-imx.c | 216 ++++++++++++++++++++++++++++++++++
>  3 files changed, 227 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdns3-imx.c
> 
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> index 2a1e89d12ed9..84716d216ae5 100644
> --- a/drivers/usb/cdns3/Kconfig
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -53,4 +53,14 @@ config USB_CDNS3_TI
>  
>  	  e.g. J721e.
>  
> +config USB_CDNS3_IMX
> +	tristate "Cadence USB3 support on NXP i.MX platforms"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	default USB_CDNS3
> +	help
> +	  Say 'Y' or 'M' here if you are building for NXP i.MX
> +	  platforms that contain Cadence USB3 controller core.
> +
> +	  For example, imx8qm and imx8qxp.

What will the module name be?

