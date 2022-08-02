Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4F44587801
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 09:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbiHBHj2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 03:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbiHBHjY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 03:39:24 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215F6BCA0
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659425963; x=1690961963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G+h1Kxy9uECFEk20Z5RoX0uLUf6xAFGvk0gy0eZvTJI=;
  b=gDNT8pVn1MrXJhRksKskOVqdNTeURxPoXUhFa88AVoY0MfCjO4lH3BEI
   OwIycInFvgnPlP0zCCUkn2lFm76jstNqh5QRRP+TrMulymh6En7Gh8LNR
   WMRH+f0RIP/xm8ZnEgvnUxoqCHnBCY+uZqSSlY2Iy5MjaTgfMbzwBfl+f
   AO+bylV8pEsYMdFS+dXCmKsO+IJMz1nallia+CzdJ8aG0R/NhGaNN+9tP
   O6iNk7pl6JjGegzKYKHpLX0Mav9X+1d0YQo0ORD3v9nnWXOHT1hLGlTHq
   Tg6z9vx+653wD1l8Yu64Fgw44xzazyuOopFweuVjr+0bLK11jAq1paQqt
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="375647579"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="375647579"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 00:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="744576210"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Aug 2022 00:39:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Aug 2022 10:39:19 +0300
Date:   Tue, 2 Aug 2022 10:39:19 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-usb@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 1/2] extcon: usbc-tusb320: Factor out extcon into
 dedicated functions
Message-ID: <YujUpym5ldiUU3Jv@kuha.fi.intel.com>
References: <20220730180500.152004-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730180500.152004-1-marex@denx.de>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 30, 2022 at 08:04:59PM +0200, Marek Vasut wrote:
> Move extcon code into separate functions in preparation for addition of
> USB TYPE-C support. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Yassine Oudjana <y.oudjana@protonmail.com>
> To: linux-usb@vger.kernel.org
> ---
>  drivers/extcon/extcon-usbc-tusb320.c | 75 +++++++++++++++++-----------
>  1 file changed, 46 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usbc-tusb320.c b/drivers/extcon/extcon-usbc-tusb320.c
> index 6ba3d89b106d0..aced4bbb455dc 100644
> --- a/drivers/extcon/extcon-usbc-tusb320.c
> +++ b/drivers/extcon/extcon-usbc-tusb320.c
> @@ -184,19 +184,9 @@ static struct tusb320_ops tusb320l_ops = {
>  	.get_revision = tusb320l_get_revision,
>  };
>  
> -static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
> +static void tusb320_extcon_irq_handler(struct tusb320_priv *priv, u8 reg)
>  {
> -	struct tusb320_priv *priv = dev_id;
>  	int state, polarity;
> -	unsigned reg;
> -
> -	if (regmap_read(priv->regmap, TUSB320_REG9, &reg)) {
> -		dev_err(priv->dev, "error during i2c read!\n");
> -		return IRQ_NONE;
> -	}
> -
> -	if (!(reg & TUSB320_REG9_INTERRUPT_STATUS))
> -		return IRQ_NONE;
>  
>  	state = (reg >> TUSB320_REG9_ATTACHED_STATE_SHIFT) &
>  		TUSB320_REG9_ATTACHED_STATE_MASK;
> @@ -219,6 +209,22 @@ static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
>  	extcon_sync(priv->edev, EXTCON_USB_HOST);
>  
>  	priv->state = state;
> +}
> +
> +static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
> +{
> +	struct tusb320_priv *priv = dev_id;
> +	unsigned int reg;
> +
> +	if (regmap_read(priv->regmap, TUSB320_REG9, &reg)) {
> +		dev_err(priv->dev, "error during i2c read!\n");
> +		return IRQ_NONE;
> +	}
> +
> +	if (!(reg & TUSB320_REG9_INTERRUPT_STATUS))
> +		return IRQ_NONE;
> +
> +	tusb320_extcon_irq_handler(priv, reg);
>  
>  	regmap_write(priv->regmap, TUSB320_REG9, reg);
>  
> @@ -230,8 +236,32 @@ static const struct regmap_config tusb320_regmap_config = {
>  	.val_bits = 8,
>  };
>  
> -static int tusb320_extcon_probe(struct i2c_client *client,
> -				const struct i2c_device_id *id)
> +static int tusb320_extcon_probe(struct tusb320_priv *priv)
> +{
> +	int ret;
> +
> +	priv->edev = devm_extcon_dev_allocate(priv->dev, tusb320_extcon_cable);
> +	if (IS_ERR(priv->edev)) {
> +		dev_err(priv->dev, "failed to allocate extcon device\n");
> +		return PTR_ERR(priv->edev);
> +	}
> +
> +	ret = devm_extcon_dev_register(priv->dev, priv->edev);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "failed to register extcon device\n");
> +		return ret;
> +	}
> +
> +	extcon_set_property_capability(priv->edev, EXTCON_USB,
> +				       EXTCON_PROP_USB_TYPEC_POLARITY);
> +	extcon_set_property_capability(priv->edev, EXTCON_USB_HOST,
> +				       EXTCON_PROP_USB_TYPEC_POLARITY);
> +
> +	return 0;
> +}
> +
> +static int tusb320_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
>  {
>  	struct tusb320_priv *priv;
>  	const void *match_data;
> @@ -257,12 +287,6 @@ static int tusb320_extcon_probe(struct i2c_client *client,
>  
>  	priv->ops = (struct tusb320_ops*)match_data;
>  
> -	priv->edev = devm_extcon_dev_allocate(priv->dev, tusb320_extcon_cable);
> -	if (IS_ERR(priv->edev)) {
> -		dev_err(priv->dev, "failed to allocate extcon device\n");
> -		return PTR_ERR(priv->edev);
> -	}
> -
>  	if (priv->ops->get_revision) {
>  		ret = priv->ops->get_revision(priv, &revision);
>  		if (ret)
> @@ -272,16 +296,9 @@ static int tusb320_extcon_probe(struct i2c_client *client,
>  			dev_info(priv->dev, "chip revision %d\n", revision);
>  	}
>  
> -	ret = devm_extcon_dev_register(priv->dev, priv->edev);
> -	if (ret < 0) {
> -		dev_err(priv->dev, "failed to register extcon device\n");
> +	ret = tusb320_extcon_probe(priv);
> +	if (ret)
>  		return ret;
> -	}
> -
> -	extcon_set_property_capability(priv->edev, EXTCON_USB,
> -				       EXTCON_PROP_USB_TYPEC_POLARITY);
> -	extcon_set_property_capability(priv->edev, EXTCON_USB_HOST,
> -				       EXTCON_PROP_USB_TYPEC_POLARITY);
>  
>  	/* update initial state */
>  	tusb320_irq_handler(client->irq, priv);
> @@ -313,7 +330,7 @@ static const struct of_device_id tusb320_extcon_dt_match[] = {
>  MODULE_DEVICE_TABLE(of, tusb320_extcon_dt_match);
>  
>  static struct i2c_driver tusb320_extcon_driver = {
> -	.probe		= tusb320_extcon_probe,
> +	.probe		= tusb320_probe,
>  	.driver		= {
>  		.name	= "extcon-tusb320",
>  		.of_match_table = tusb320_extcon_dt_match,
> -- 
> 2.35.1

-- 
heikki
