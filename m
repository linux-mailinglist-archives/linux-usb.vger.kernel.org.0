Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B85A4587805
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 09:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbiHBHk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 03:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235895AbiHBHkJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 03:40:09 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15005DFEE
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 00:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659426008; x=1690962008;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U1RPAsF5QGDk+ZpsiY2oE+qSMypOu6vxTkZr4vRr3QU=;
  b=l1Q8gVk5qeBrr3UwbMtMiSI8nGit2orYjYrZ9SC7aaWUtwl/eWGAVqrg
   u4roxypwGCxU2kfkC0LD0GJ55nPu4sd/BpKzpiHUB+oPNAkOV78gjhhg6
   WHNTe5NueV9gzSs4UPL8QEuilsVQPsQiiCAIP/VODW9mX8M1qFscA0m2+
   bLPQZ/K+a21cCeHol5JGqdqnpD2Nxep+o9GeFpojniLR3iH96WFlImlxf
   sp1TPoqwNNvHUUagVEzYFnuUyLZHNaF1omEIz69IdvsTD1+UFSA989lqn
   logjzNxNfydMJLuHlpHnBkbqyJny/YCv+BmHuWpcgRWj6e02MBvgExCs6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="315185432"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="315185432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 00:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; 
   d="scan'208";a="744576444"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Aug 2022 00:40:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 02 Aug 2022 10:40:04 +0300
Date:   Tue, 2 Aug 2022 10:40:04 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-usb@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Message-ID: <YujU1Nnert6h/691@kuha.fi.intel.com>
References: <20220730180500.152004-1-marex@denx.de>
 <20220730180500.152004-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730180500.152004-2-marex@denx.de>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
> which can expose details collected by the TUSB320 in a far more
> precise way than extcon. Since there are existing users in the
> kernel and in DT which depend on the extcon interface, keep it
> for now.
> 
> Add TYPE-C interface and expose the supported supply current,
> direction and connector polarity via the TYPE-C interface.
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
>  drivers/extcon/Kconfig               |   2 +-
>  drivers/extcon/extcon-usbc-tusb320.c | 159 +++++++++++++++++++++++++++
>  2 files changed, 160 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
> index c69d40ae5619a..7684b3afa6304 100644
> --- a/drivers/extcon/Kconfig
> +++ b/drivers/extcon/Kconfig
> @@ -180,7 +180,7 @@ config EXTCON_USBC_CROS_EC
>  
>  config EXTCON_USBC_TUSB320
>  	tristate "TI TUSB320 USB-C extcon support"
> -	depends on I2C
> +	depends on I2C && TYPEC
>  	select REGMAP_I2C
>  	help
>  	  Say Y here to enable support for USB Type C cable detection extcon
> diff --git a/drivers/extcon/extcon-usbc-tusb320.c b/drivers/extcon/extcon-usbc-tusb320.c
> index aced4bbb455dc..edb8c3f997c91 100644
> --- a/drivers/extcon/extcon-usbc-tusb320.c
> +++ b/drivers/extcon/extcon-usbc-tusb320.c
> @@ -6,6 +6,7 @@
>   * Author: Michael Auchter <michael.auchter@ni.com>
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/extcon-provider.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
> @@ -13,6 +14,24 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> +#include <linux/usb/typec.h>
> +
> +#define TUSB320_REG8				0x8
> +#define TUSB320_REG8_CURRENT_MODE_ADVERTISE	GENMASK(7, 6)
> +#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_USB	0x0
> +#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_15A	0x1
> +#define TUSB320_REG8_CURRENT_MODE_ADVERTISE_30A	0x2
> +#define TUSB320_REG8_CURRENT_MODE_DETECT	GENMASK(5, 4)
> +#define TUSB320_REG8_CURRENT_MODE_DETECT_DEF	0x0
> +#define TUSB320_REG8_CURRENT_MODE_DETECT_MED	0x1
> +#define TUSB320_REG8_CURRENT_MODE_DETECT_ACC	0x2
> +#define TUSB320_REG8_CURRENT_MODE_DETECT_HI	0x3
> +#define TUSB320_REG8_ACCESSORY_CONNECTED	GENMASK(3, 2)
> +#define TUSB320_REG8_ACCESSORY_CONNECTED_NONE	0x0
> +#define TUSB320_REG8_ACCESSORY_CONNECTED_AUDIO	0x4
> +#define TUSB320_REG8_ACCESSORY_CONNECTED_ACC	0x5
> +#define TUSB320_REG8_ACCESSORY_CONNECTED_DEBUG	0x6
> +#define TUSB320_REG8_ACTIVE_CABLE_DETECTION	BIT(0)
>  
>  #define TUSB320_REG9				0x9
>  #define TUSB320_REG9_ATTACHED_STATE_SHIFT	6
> @@ -55,6 +74,10 @@ struct tusb320_priv {
>  	struct extcon_dev *edev;
>  	struct tusb320_ops *ops;
>  	enum tusb320_attached_state state;
> +	struct typec_port *port;
> +	struct typec_capability	cap;
> +	enum typec_port_type port_type;
> +	enum typec_pwr_opmode pwr_opmode;
>  };
>  
>  static const char * const tusb_attached_states[] = {
> @@ -184,6 +207,44 @@ static struct tusb320_ops tusb320l_ops = {
>  	.get_revision = tusb320l_get_revision,
>  };
>  
> +static int tusb320_set_adv_pwr_mode(struct tusb320_priv *priv)
> +{
> +	u8 mode;
> +
> +	if (priv->pwr_opmode == TYPEC_PWR_MODE_USB)
> +		mode = TUSB320_REG8_CURRENT_MODE_ADVERTISE_USB;
> +	else if (priv->pwr_opmode == TYPEC_PWR_MODE_1_5A)
> +		mode = TUSB320_REG8_CURRENT_MODE_ADVERTISE_15A;
> +	else if (priv->pwr_opmode == TYPEC_PWR_MODE_3_0A)
> +		mode = TUSB320_REG8_CURRENT_MODE_ADVERTISE_30A;
> +	else	/* No other mode is supported. */
> +		return -EINVAL;
> +
> +	return regmap_write_bits(priv->regmap, TUSB320_REG8,
> +				 TUSB320_REG8_CURRENT_MODE_ADVERTISE,
> +				 FIELD_PREP(TUSB320_REG8_CURRENT_MODE_ADVERTISE,
> +					    mode));
> +}
> +
> +static int tusb320_port_type_set(struct typec_port *port,
> +				 enum typec_port_type type)
> +{
> +	struct tusb320_priv *priv = typec_get_drvdata(port);
> +
> +	if (type == TYPEC_PORT_SRC)
> +		return priv->ops->set_mode(priv, TUSB320_MODE_DFP);
> +	else if (type == TYPEC_PORT_SNK)
> +		return priv->ops->set_mode(priv, TUSB320_MODE_UFP);
> +	else if (type == TYPEC_PORT_DRP)
> +		return priv->ops->set_mode(priv, TUSB320_MODE_DRP);
> +	else
> +		return priv->ops->set_mode(priv, TUSB320_MODE_PORT);
> +}
> +
> +static const struct typec_operations tusb320_typec_ops = {
> +	.port_type_set	= tusb320_port_type_set,
> +};
> +
>  static void tusb320_extcon_irq_handler(struct tusb320_priv *priv, u8 reg)
>  {
>  	int state, polarity;
> @@ -211,6 +272,47 @@ static void tusb320_extcon_irq_handler(struct tusb320_priv *priv, u8 reg)
>  	priv->state = state;
>  }
>  
> +static void tusb320_typec_irq_handler(struct tusb320_priv *priv, u8 reg9)
> +{
> +	struct typec_port *port = priv->port;
> +	struct device *dev = priv->dev;
> +	u8 mode, role, state;
> +	int ret, reg8;
> +	bool ori;
> +
> +	ori = reg9 & TUSB320_REG9_CABLE_DIRECTION;
> +	typec_set_orientation(port, ori ? TYPEC_ORIENTATION_REVERSE :
> +					  TYPEC_ORIENTATION_NORMAL);
> +
> +	state = (reg9 >> TUSB320_REG9_ATTACHED_STATE_SHIFT) &
> +		TUSB320_REG9_ATTACHED_STATE_MASK;
> +	if (state == TUSB320_ATTACHED_STATE_DFP)
> +		role = TYPEC_SOURCE;
> +	else
> +		role = TYPEC_SINK;
> +
> +	typec_set_vconn_role(port, role);
> +	typec_set_pwr_role(port, role);
> +	typec_set_data_role(port, role == TYPEC_SOURCE ?
> +				  TYPEC_HOST : TYPEC_DEVICE);
> +
> +	ret = regmap_read(priv->regmap, TUSB320_REG8, &reg8);
> +	if (ret) {
> +		dev_err(dev, "error during reg8 i2c read, ret=%d!\n", ret);
> +		return;
> +	}
> +
> +	mode = FIELD_GET(TUSB320_REG8_CURRENT_MODE_DETECT, reg8);
> +	if (mode == TUSB320_REG8_CURRENT_MODE_DETECT_DEF)
> +		typec_set_pwr_opmode(port, TYPEC_PWR_MODE_USB);
> +	else if (mode == TUSB320_REG8_CURRENT_MODE_DETECT_MED)
> +		typec_set_pwr_opmode(port, TYPEC_PWR_MODE_1_5A);
> +	else if (mode == TUSB320_REG8_CURRENT_MODE_DETECT_HI)
> +		typec_set_pwr_opmode(port, TYPEC_PWR_MODE_3_0A);
> +	else	/* Charge through accessory */
> +		typec_set_pwr_opmode(port, TYPEC_PWR_MODE_USB);
> +}
> +
>  static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
>  {
>  	struct tusb320_priv *priv = dev_id;
> @@ -225,6 +327,7 @@ static irqreturn_t tusb320_irq_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  
>  	tusb320_extcon_irq_handler(priv, reg);
> +	tusb320_typec_irq_handler(priv, reg);
>  
>  	regmap_write(priv->regmap, TUSB320_REG9, reg);
>  
> @@ -260,6 +363,58 @@ static int tusb320_extcon_probe(struct tusb320_priv *priv)
>  	return 0;
>  }
>  
> +static int tusb320_typec_probe(struct i2c_client *client,
> +			       struct tusb320_priv *priv)
> +{
> +	struct fwnode_handle *connector;
> +	const char *cap_str;
> +	int ret;
> +
> +	/* The Type-C connector is optional, for backward compatibility. */
> +	connector = device_get_named_child_node(&client->dev, "connector");
> +	if (!connector)
> +		return 0;
> +
> +	/* Type-C connector found. */
> +	ret = typec_get_fw_cap(&priv->cap, connector);
> +	if (ret)
> +		return ret;
> +
> +	priv->port_type = priv->cap.type;
> +
> +	/* This goes into register 0x8 field CURRENT_MODE_ADVERTISE */
> +	ret = fwnode_property_read_string(connector, "typec-power-opmode", &cap_str);
> +	if (ret)
> +		return ret;
> +
> +	ret = typec_find_pwr_opmode(cap_str);
> +	if (ret < 0)
> +		return ret;
> +	if (ret == TYPEC_PWR_MODE_PD)
> +		return -EINVAL;
> +
> +	priv->pwr_opmode = ret;
> +
> +	/* Initialize the hardware with the devicetree settings. */
> +	ret = tusb320_set_adv_pwr_mode(priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->cap.revision		= USB_TYPEC_REV_1_1;
> +	priv->cap.accessory[0]		= TYPEC_ACCESSORY_AUDIO;
> +	priv->cap.accessory[1]		= TYPEC_ACCESSORY_DEBUG;
> +	priv->cap.orientation_aware	= true;
> +	priv->cap.driver_data		= priv;
> +	priv->cap.ops			= &tusb320_typec_ops;
> +	priv->cap.fwnode		= connector;
> +
> +	priv->port = typec_register_port(&client->dev, &priv->cap);
> +	if (IS_ERR(priv->port))
> +		return PTR_ERR(priv->port);
> +
> +	return 0;
> +}
> +
>  static int tusb320_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> @@ -300,6 +455,10 @@ static int tusb320_probe(struct i2c_client *client,
>  	if (ret)
>  		return ret;
>  
> +	ret = tusb320_typec_probe(client, priv);
> +	if (ret)
> +		return ret;
> +
>  	/* update initial state */
>  	tusb320_irq_handler(client->irq, priv);
>  
> -- 
> 2.35.1

-- 
heikki
