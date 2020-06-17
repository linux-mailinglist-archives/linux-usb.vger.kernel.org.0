Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D141FC9C4
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 11:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgFQJXQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 17 Jun 2020 05:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgFQJXQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 05:23:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DEEC061573
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2020 02:23:15 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jlUHl-0006Tm-AZ; Wed, 17 Jun 2020 11:23:09 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1jlUHj-0001aP-SH; Wed, 17 Jun 2020 11:23:07 +0200
Message-ID: <4897543a82b601b6e568130f749265a794763eaa.camel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] usb: phy: Add USB3 PHY support for Intel LGM SoC
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        linux-kernel@vger.kernel.org, balbi@kernel.org, robh@kernel.org
Cc:     gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, yin1.li@intel.com,
        andriy.shevchenko@intel.com
Date:   Wed, 17 Jun 2020 11:23:07 +0200
In-Reply-To: <20200617035818.54110-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200617035818.54110-1-vadivel.muruganx.ramuthevar@linux.intel.com>
         <20200617035818.54110-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Vadivel,

On Wed, 2020-06-17 at 11:58 +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add support for USB PHY on Intel LGM SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  drivers/usb/phy/Kconfig       |  11 ++
>  drivers/usb/phy/Makefile      |   1 +
>  drivers/usb/phy/phy-lgm-usb.c | 275 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 287 insertions(+)
>  create mode 100644 drivers/usb/phy/phy-lgm-usb.c
> 
[...]
> diff --git a/drivers/usb/phy/phy-lgm-usb.c b/drivers/usb/phy/phy-lgm-usb.c
> new file mode 100644
> index 000000000000..3da772dfd736
> --- /dev/null
> +++ b/drivers/usb/phy/phy-lgm-usb.c
> @@ -0,0 +1,275 @@
[...]
> +	for (i = 0; i < ARRAY_SIZE(CTL_RESETS); i++) {
> +		resets[i] = devm_reset_control_get_exclusive(dev, CTL_RESETS[i]);
> +		if (IS_ERR(resets[i])) {
> +			dev_err(dev, "%s reset not found\n", CTL_RESETS[i]);
> +			return PTR_ERR(resets[i]);
> +		}
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(PHY_RESETS); i++) {
> +		ta->resets[i] = devm_reset_control_get_exclusive(dev, PHY_RESETS[i]);
> +		if (IS_ERR(ta->resets[i])) {
> +			dev_err(dev, "%s reset not found\n", PHY_RESETS[i]);
> +			return PTR_ERR(ta->resets[i]);
> +		}
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(CTL_RESETS); i++)
> +		reset_control_assert(resets[i]);
> +
> +	for (i = 0; i < ARRAY_SIZE(PHY_RESETS); i++)
> +		reset_control_assert(ta->resets[i]);
> +	/*
> +	 * Out-of-band reset of the controller after PHY reset will cause
> +	 * controller malfunctioning, so we should use in-band controller
> +	 * reset only and leave the controller de-asserted here.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(CTL_RESETS); i++)
> +		reset_control_deassert(resets[i]);

This driver could probably benefit from a reset_bulk API similar to the
clk_bulk and regulator_bulk APIs, but that doesn't exist yet.

For the reset handling in this driver,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
