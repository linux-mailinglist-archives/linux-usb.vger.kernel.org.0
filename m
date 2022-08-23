Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BAE59EF1A
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 00:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbiHWW1R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 18:27:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbiHWW0c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 18:26:32 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B43487694
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 15:26:16 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id r15-20020a17090a1bcf00b001fabf42a11cso16083933pjr.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+O2FPSxbUnVXUdDgjFd1g1yzOvw+whxqmpDDzOciTdo=;
        b=lnMrJzZwmKT8/sd8wjIy5XuVx+/iLrGxrcbPkBV/ge8mNN+ZgrcoP4ab564bre8PW3
         vsOsaFB2ln/OxaTfCp8UHn7rYNc2GDhVxHoefwhyU5d8exGJwyDj5c7DdAl0jfaA6ncm
         3kAc5oUOMSO6tR+ygEH5S5j0V07FpCawB0R80tHe2pEdhfFKbWb2okYPHp5oxWTu7l5u
         8VjEVSxJdL7rii5gJJsNhujreHzVrcJ1ms3crFyS9IFaSnGcIM9q3/EPVgD2H/TijutK
         /l+ccdFXM8QB5mqMfmx+rvkcc/a8+kQ9lzHi6Ro6KTJY5ULEDzLpUKKRvjdJPe0iDIdA
         2XpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+O2FPSxbUnVXUdDgjFd1g1yzOvw+whxqmpDDzOciTdo=;
        b=1Y7v0km0awZGWuJ8egYkTivVRGV39dLINAzH57kfd9bU6//7kW1Y7JnmOfawuuXjgT
         74NVuKjEEk3fFow1QogSHhYc94tYDLlWP20I3iwvT5D3QmLe6L3oAkYqLvRpDsGYKv02
         WRl2lIXDHMPvnAPovJ0GH+CUJBp9wJmC7pC8AZDdFoH2po805NNfWES9FLJqrOIwIfnR
         Vb881R/6fkZgUmxLedxUD2LatShBc/VAVJ+9H/SRlriXa+FkXmNHVQpVpTTjSGhekNk9
         t9kd2AxcYykUG9GXEiQuYstxWUhGDXLlC8JTvlnspTJiQCxu7nI6fNfDctiASn5anv3z
         cCOQ==
X-Gm-Message-State: ACgBeo1Y5WCEigQEGCq0qZsCRRcbdpWujygPEWpzczvDvWppu9uxy2FO
        zFt1GOYK9x7LLnRvSr6RDFugbUPRz8jLfg==
X-Google-Smtp-Source: AA6agR4JMzoDl2iCaARxt5hLurJ5fVQsnkohwc/LbHcNi63fmHzAWbsPjHpjuzeD5DVn7sdswxlF5A==
X-Received: by 2002:a17:90b:17ce:b0:1fb:3b43:f6f8 with SMTP id me14-20020a17090b17ce00b001fb3b43f6f8mr5418273pjb.76.1661293575363;
        Tue, 23 Aug 2022 15:26:15 -0700 (PDT)
Received: from [172.30.1.52] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902f78b00b001709e3c750dsm337380pln.194.2022.08.23.15.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 15:26:14 -0700 (PDT)
Message-ID: <760cc00e-0fab-96bd-5118-ef600a7baa36@gmail.com>
Date:   Wed, 24 Aug 2022 07:26:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] extcon: usbc-tusb320: Factor out extcon into
 dedicated functions
Content-Language: en-US
To:     Marek Vasut <marex@denx.de>, linux-usb@vger.kernel.org
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220730180500.152004-1-marex@denx.de>
From:   Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220730180500.152004-1-marex@denx.de>
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

On 22. 7. 31. 03:04, Marek Vasut wrote:
> Move extcon code into separate functions in preparation for addition of
> USB TYPE-C support. No functional change.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
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


Applied it. Thanks.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
