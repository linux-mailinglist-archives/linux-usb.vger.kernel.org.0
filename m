Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48845631CA6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiKUJRO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiKUJRM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:17:12 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AFC87A6E
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669022230; x=1700558230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=D1RvxjkA9C7JZzMXqFryDJUaJuX5hf+ZD3Os0J1T+4g=;
  b=cSH8mT+FfidSPBklc9I+BijVxSXt5E6sqqK4Xvq/w+UMP8tNFNPC8mwl
   NhDLSD/c8tCxrMpQWHPFKaK1Vz33gu7QKS0fSmfemtOIG3BsxEMaB2p5m
   JyevMRBbDl1ZfjR5HT/31V1FsMvZbwT3DIT9GpgPOsCg00hLZl1tNX6ug
   ZMOtJqgxVclLfzaM/mDQ+oJpz7GobTaJ3wL49kWTbfyhXtD3EnJ+Hq+iC
   GZ00y9WGTBmntDjItMcoWsNp7hvlQhOWJAT41Gk9BLEsnqL5Znavuk9/O
   Ba0Uy0jy35bNNhlIDbDfeEodAm6cP3QRnkvUf8Lbfmy16tpZpjtBVfzNQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="315334531"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="315334531"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 01:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="783380777"
X-IronPort-AV: E=Sophos;i="5.96,180,1665471600"; 
   d="scan'208";a="783380777"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 21 Nov 2022 01:17:07 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 21 Nov 2022 11:17:06 +0200
Date:   Mon, 21 Nov 2022 11:17:06 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-usb@vger.kernel.org,
        Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] extcon: usbc-tusb320: Update state on probe even if no
 IRQ pending
Message-ID: <Y3tCEvyueYpwh5BH@kuha.fi.intel.com>
References: <20221120141509.81012-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221120141509.81012-1-marex@denx.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Nov 20, 2022 at 03:15:09PM +0100, Marek Vasut wrote:
> Currently this driver triggers extcon and typec state update in its
> probe function, to read out current state reported by the chip and
> report the correct state to upper layers. This synchronization is
> performed correctly, but only in case the chip indicates a pending
> interrupt in reg09 register.
> 
> This fails to cover the situation where all interrupts reported by
> the chip were already handled by Linux before reboot, then the system
> rebooted, and then Linux starts again. In this case, the TUSB320 no
> longer reports any interrupts in reg09, and the state update does not
> perform any update as it depends on that interrupt indication.
> 
> Fix this by turning tusb320_irq_handler() into a thin wrapper around
> tusb320_state_update_handler(), where the later now contains the bulk
> of the code of tusb320_irq_handler(), but adds new function parameter
> "force_update". The "force_update" parameter can be used by the probe
> function to assure that the state synchronization is always performed,
> independent of the interrupt indicated in reg09. The interrupt handler
> tusb320_irq_handler() callback uses force_update=false to avoid state
> updates on potential spurious interrupts and retain current behavior.
> 
> Fixes: 06bc4ca115cdd ("extcon: Add driver for TI TUSB320")
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Cc: Alvin Šipraga <alsi@bang-olufsen.dk>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  drivers/extcon/extcon-usbc-tusb320.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usbc-tusb320.c b/drivers/extcon/extcon-usbc-tusb320.c
> index 2a120d8d3c272..9dfa545427ca1 100644
> --- a/drivers/extcon/extcon-usbc-tusb320.c
> +++ b/drivers/extcon/extcon-usbc-tusb320.c
> @@ -313,9 +313,9 @@ static void tusb320_typec_irq_handler(struct tusb320_priv *priv, u8 reg9)
>  		typec_set_pwr_opmode(port, TYPEC_PWR_MODE_USB);
>  }
>  
> -static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
> +static irqreturn_t tusb320_state_update_handler(struct tusb320_priv *priv,
> +						bool force_update)
>  {
> -	struct tusb320_priv *priv = dev_id;
>  	unsigned int reg;
>  
>  	if (regmap_read(priv->regmap, TUSB320_REG9, &reg)) {
> @@ -323,7 +323,7 @@ static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  	}
>  
> -	if (!(reg & TUSB320_REG9_INTERRUPT_STATUS))
> +	if (!force_update && !(reg & TUSB320_REG9_INTERRUPT_STATUS))
>  		return IRQ_NONE;
>  
>  	tusb320_extcon_irq_handler(priv, reg);
> @@ -340,6 +340,13 @@ static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
> +{
> +	struct tusb320_priv *priv = dev_id;
> +
> +	return tusb320_state_update_handler(priv, false);
> +}
> +
>  static const struct regmap_config tusb320_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
> @@ -466,7 +473,7 @@ static int tusb320_probe(struct i2c_client *client,
>  		return ret;
>  
>  	/* update initial state */
> -	tusb320_irq_handler(client->irq, priv);
> +	tusb320_state_update_handler(priv, true);
>  
>  	/* Reset chip to its default state */
>  	ret = tusb320_reset(priv);
> @@ -477,7 +484,7 @@ static int tusb320_probe(struct i2c_client *client,
>  		 * State and polarity might change after a reset, so update
>  		 * them again and make sure the interrupt status bit is cleared.
>  		 */
> -		tusb320_irq_handler(client->irq, priv);
> +		tusb320_state_update_handler(priv, true);
>  
>  	ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
>  					tusb320_irq_handler,

thanks,

-- 
heikki
