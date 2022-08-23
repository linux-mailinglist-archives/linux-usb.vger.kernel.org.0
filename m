Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BF059EF4E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 00:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiHWWg7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 18:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiHWWg5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 18:36:57 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45046EF21
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 15:36:56 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id io24so788335plb.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 15:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=RoSOuTaZaTQja3t5b0ky+mPQJ7ct65ni9Yc6fMHZjhQ=;
        b=ppIlgToqSWwvcKTK53h5ZSCCwiEZM3NMJBlzijAqazPw45qmm1Lze/cAZgXdI1s267
         d2noRBlWaSdaPkjcrSCiMygrcOdUAEStaembOAU70P5AeowX4INiOf5vcLDzKd8//zzU
         InFwfJqcz9T2LAZREvP96B1OMGmRi4Heid6SXFFR2VBmSo9pj3AOeVcwbyWWLk9ySz4k
         oEFkkcgdDCiD5P7HYb4akJEd2rq87NchkXylfBH2JYdKo67xndzXS6ReAvdRNyNrwZd8
         r2J5ZE8WOMCMaR4W7yzZMl5bZykdU8rHwvnnjmB4f74L3SLZVSA/4hG1NJY100HtlyPL
         u5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RoSOuTaZaTQja3t5b0ky+mPQJ7ct65ni9Yc6fMHZjhQ=;
        b=y52lqumSXqaEuop4vB/UonHz/XS+sxvXe0R4fcF2lfWwoVLKeBubuAa9GAdYkUzQ2o
         +95/XiV7PeV2J4rqKd0URXhmIm0yCc7c9wjisGV0MYZ9m8OXTTIrSSqIuSQg+r4e+h1L
         CWMnk7IQEr+NoVaPYxNySnY+hmakRbU3PNCg/Zso6NS2kbPV35eIRbqTuZwENq+XyjEh
         pWBW93DnkFWwmFEO+ScOzJc/BzBjelmJQNsTyIxcSPq5OdYb8xVcHhcYHdOBB9mBGm4y
         XttT0tyo3RMS6fOQuDUeQ/0FFoaO27XXDAEH92IBwhxWzRET4mFyFC9VjocthFGCEZM9
         TIow==
X-Gm-Message-State: ACgBeo1i2R3P8UInfEziJu6Wb7OZEb0EFOMCqKpvuflNnOMnRz4BJXQw
        exX7XCxpSzSKCWKgE0A0yLE=
X-Google-Smtp-Source: AA6agR45lyglociGY3Mb8G0UQAeOk4JZdHP1V8elm8tBZCypBfc4BVN8qrrNX5SD5Ss2a5VPfVFWVg==
X-Received: by 2002:a17:902:e887:b0:16e:ef31:416b with SMTP id w7-20020a170902e88700b0016eef31416bmr26236770plg.51.1661294216186;
        Tue, 23 Aug 2022 15:36:56 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902780300b0016fa99912d7sm10938237pll.141.2022.08.23.15.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 15:36:55 -0700 (PDT)
Message-ID: <7eea5047-01eb-cdb0-654e-f05e210e2f08@gmail.com>
Date:   Wed, 24 Aug 2022 07:36:52 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-usb@vger.kernel.org
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220730180500.152004-1-marex@denx.de>
 <20220730180500.152004-2-marex@denx.de>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220730180500.152004-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22. 7. 31. 03:05, Marek Vasut wrote:
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

Applied it. Thanks.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
