Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78D661FC69
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbiKGR7z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:59:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbiKGR7d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:59:33 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB162A73B;
        Mon,  7 Nov 2022 09:56:19 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id n12so32191130eja.11;
        Mon, 07 Nov 2022 09:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5M84yR8KNE7J//HkmOfrU2wJfnp3oxXpkFv2HPRJ1U=;
        b=VzR9NOF7ibds6GvNg4Oy9x9HMK67mAuNUmqRtlTryLB1r8/IBq2VvzQCSlh/yUuLIO
         OIE/VdoZcyKManiV+u7N9cn0WiG0OR7CWkUM72C5E0FR2DQYqCKPMbq+mrigEkrqMCE4
         3B8ypglfllMhz5a88p6Y9vNxgD3nzzvd+NcajZ/2mwRPuPdLFLRV8buCHi40d7/tLbQ6
         ivjiLLaCDPO/pzXnQs5kqJRB2wdPeq5K2yK5jj+LpidjQdJy9kdf83miDY2csU5y4OG/
         zJqND2qonYyDXaWy9LaKkmOQZDeIBtot684WOkLQqZQGjt0F3NyfkiFIredeSVHv3uuI
         okPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5M84yR8KNE7J//HkmOfrU2wJfnp3oxXpkFv2HPRJ1U=;
        b=n62YKyGx31cc53xTYmzbSveEMc7LWc5VBMgtdigLcVvnp8pYxu66v7vlA+tx2XdH1P
         XWs3znXoHRZf+7cxGkT3QZ16OM7djCqsa29PQaaEqANcoe4Q7h1KH9Ekc0ni3L+Ish0i
         OG8bC0rUIqR3FxhCz964nHhfZHJj46/ZbHsio5bJsiGGwaobFzPX6osCbeqIAl5VrJY/
         nz4vNEac0RUD7f2iY4Hls5HGF8PURyx3/sfto7hKIkBK4VYSqk9vj5zKrcmnKXla/Gu/
         /jR6YZjkpPILkm/6dAoGXW6Qj/i+zFRC+yWPtIfbBlzD9nz0/WJfoIE0JlGyg6GY+5QS
         42lQ==
X-Gm-Message-State: ACrzQf0SvWCC6t122GSbDN3oajgEe7p9qKaNVbmpTII3FzEaEmtDYA0V
        VV7x5uK1mVjCs6WNLnP21dY=
X-Google-Smtp-Source: AMsMyM73NaXR5bS3Tds0v+JWeAryVlqO+sjHd7Q3UjZyhgcmfE25ZUhpkCzu1RdXg83KzF6K6uyS3Q==
X-Received: by 2002:a17:907:c24:b0:7ae:41b3:6a67 with SMTP id ga36-20020a1709070c2400b007ae41b36a67mr15286323ejc.254.1667843777564;
        Mon, 07 Nov 2022 09:56:17 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id kx23-20020a170907775700b00773f3cb67ffsm3655524ejc.28.2022.11.07.09.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:56:17 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH v3 11/11] usb: musb: sunxi: Introduce config struct
Date:   Mon, 07 Nov 2022 18:56:13 +0100
Message-ID: <8137106.T7Z3S40VBb@kista>
In-Reply-To: <20221106154826.6687-12-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-12-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Andre!

Dne nedelja, 06. november 2022 ob 16:48:26 CET je Andre Przywara napisal(a):
> Currently the probe routine explicitly compares the compatible string of
> the device node to figure out which features and quirks a certain
> Allwinner MUSB model requires. This gets harder to maintain for new
> SoCs.
> 
> Add a struct sunxi_musb_cfg that names the features and quirks
> explicitly, and create instances of this struct for every type of MUSB
> device we support. Then bind this to the compatible strings via the OF
> data feature.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/usb/musb/sunxi.c | 101 +++++++++++++++++++++++++++++----------
>  1 file changed, 75 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index 4b368d16a73a..266f8baf5af0 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -15,6 +15,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/phy/phy-sun4i-usb.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> @@ -67,6 +68,13 @@
>  #define SUNXI_MUSB_FL_NO_CONFIGDATA		7
>  #define SUNXI_MUSB_FL_PHY_MODE_PEND		8
> 
> +struct sunxi_musb_cfg {
> +	int nr_endpoints;
> +	bool has_sram;
> +	bool has_reset;
> +	bool no_configdata;
> +};
> +
>  /* Our read/write methods need access and do not get passed in a musb ref
> :| */ static struct musb *sunxi_musb;
> 
> @@ -625,7 +633,7 @@ static const struct musb_platform_ops sunxi_musb_ops = {
> #define SUNXI_MUSB_MAX_EP_NUM	6
>  #define SUNXI_MUSB_RAM_BITS	11
> 
> -static struct musb_fifo_cfg sunxi_musb_mode_cfg[] = {
> +static struct musb_fifo_cfg sunxi_musb_mode_cfg_5eps[] = {
>  	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
>  	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
>  	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
> @@ -641,7 +649,7 @@ static struct musb_fifo_cfg sunxi_musb_mode_cfg[] = {
>  /* H3/V3s OTG supports only 4 endpoints */
>  #define SUNXI_MUSB_MAX_EP_NUM_H3	5
> 
> -static struct musb_fifo_cfg sunxi_musb_mode_cfg_h3[] = {
> +static struct musb_fifo_cfg sunxi_musb_mode_cfg_4eps[] = {
>  	MUSB_EP_FIFO_SINGLE(1, FIFO_TX, 512),
>  	MUSB_EP_FIFO_SINGLE(1, FIFO_RX, 512),
>  	MUSB_EP_FIFO_SINGLE(2, FIFO_TX, 512),
> @@ -652,18 +660,18 @@ static struct musb_fifo_cfg sunxi_musb_mode_cfg_h3[] =
> { MUSB_EP_FIFO_SINGLE(4, FIFO_RX, 512),
>  };
> 
> -static const struct musb_hdrc_config sunxi_musb_hdrc_config = {
> -	.fifo_cfg       = sunxi_musb_mode_cfg,
> -	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg),
> +static const struct musb_hdrc_config sunxi_musb_hdrc_config_5eps = {
> +	.fifo_cfg       = sunxi_musb_mode_cfg_5eps,
> +	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_5eps),
>  	.multipoint	= true,
>  	.dyn_fifo	= true,
>  	.num_eps	= SUNXI_MUSB_MAX_EP_NUM,
>  	.ram_bits	= SUNXI_MUSB_RAM_BITS,
>  };
> 
> -static struct musb_hdrc_config sunxi_musb_hdrc_config_h3 = {
> -	.fifo_cfg       = sunxi_musb_mode_cfg_h3,
> -	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_h3),
> +static struct musb_hdrc_config sunxi_musb_hdrc_config_4eps = {

While at it, you can mark above struct as const. 5eps struct is already marked 
as const.

> +	.fifo_cfg       = sunxi_musb_mode_cfg_4eps,
> +	.fifo_cfg_size  = ARRAY_SIZE(sunxi_musb_mode_cfg_4eps),
>  	.multipoint	= true,
>  	.dyn_fifo	= true,
>  	.num_eps	= SUNXI_MUSB_MAX_EP_NUM_H3,
> @@ -677,6 +685,7 @@ static int sunxi_musb_probe(struct platform_device
> *pdev) struct platform_device_info	pinfo;
>  	struct sunxi_glue		*glue;
>  	struct device_node		*np = pdev->dev.of_node;
> +	const struct sunxi_musb_cfg	*cfg;
>  	int ret;
> 
>  	if (!np) {
> @@ -713,29 +722,35 @@ static int sunxi_musb_probe(struct platform_device
> *pdev) return -EINVAL;
>  	}
>  	pdata.platform_ops	= &sunxi_musb_ops;
> -	if (!of_device_is_compatible(np, "allwinner,sun8i-h3-musb"))
> -		pdata.config = &sunxi_musb_hdrc_config;
> -	else
> -		pdata.config = &sunxi_musb_hdrc_config_h3;
> +
> +	cfg = of_device_get_match_data(&pdev->dev);
> +	if (!cfg)
> +		return -EINVAL;
> +
> +	switch (cfg->nr_endpoints) {
> +	case 4:
> +		pdata.config = &sunxi_musb_hdrc_config_4eps;
> +		break;
> +	case 5:
> +		pdata.config = &sunxi_musb_hdrc_config_5eps;
> +		break;
> +	default:
> +		dev_err(&pdev->dev, "Only 4 or 5 endpoints 
supported\n");
> +		return -EINVAL;
> +	}

Overall nice cleanup! Only thing I would rather see different is to use pointer 
to struct musb_fifo_cfg directly in config struct. That way you avoid above 
switch case.

Best regards,
Jernej

> 
>  	glue->dev = &pdev->dev;
>  	INIT_WORK(&glue->work, sunxi_musb_work);
>  	glue->host_nb.notifier_call = sunxi_musb_host_notifier;
> 
> -	if (of_device_is_compatible(np, "allwinner,sun4i-a10-musb") ||
> -	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
> +	if (cfg->has_sram)
>  		set_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags);
> -	}
> 
> -	if (of_device_is_compatible(np, "allwinner,sun6i-a31-musb"))
> +	if (cfg->has_reset)
>  		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
> 
> -	if (of_device_is_compatible(np, "allwinner,sun8i-a33-musb") ||
> -	    of_device_is_compatible(np, "allwinner,sun8i-h3-musb") ||
> -	    of_device_is_compatible(np, "allwinner,suniv-f1c100s-musb")) {
> -		set_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags);
> +	if (cfg->no_configdata)
>  		set_bit(SUNXI_MUSB_FL_NO_CONFIGDATA, &glue->flags);
> -	}
> 
>  	glue->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(glue->clk)) {
> @@ -813,12 +828,46 @@ static int sunxi_musb_remove(struct platform_device
> *pdev) return 0;
>  }
> 
> +static const struct sunxi_musb_cfg sun4i_a10_musb_cfg = {
> +	.nr_endpoints = 5,
> +	.has_sram = true,
> +};
> +
> +static const struct sunxi_musb_cfg sun6i_a31_musb_cfg = {
> +	.nr_endpoints = 5,
> +	.has_reset = true,
> +};
> +
> +static const struct sunxi_musb_cfg sun8i_a33_musb_cfg = {
> +	.nr_endpoints = 5,
> +	.has_reset = true,
> +	.no_configdata = true,
> +};
> +
> +static const struct sunxi_musb_cfg sun8i_h3_musb_cfg = {
> +	.nr_endpoints = 4,
> +	.has_reset = true,
> +	.no_configdata = true,
> +};
> +
> +static const struct sunxi_musb_cfg suniv_f1c100s_musb_cfg = {
> +	.nr_endpoints = 5,
> +	.has_sram = true,
> +	.has_reset = true,
> +	.no_configdata = true,
> +};
> +
>  static const struct of_device_id sunxi_musb_match[] = {
> -	{ .compatible = "allwinner,sun4i-a10-musb", },
> -	{ .compatible = "allwinner,sun6i-a31-musb", },
> -	{ .compatible = "allwinner,sun8i-a33-musb", },
> -	{ .compatible = "allwinner,sun8i-h3-musb", },
> -	{ .compatible = "allwinner,suniv-f1c100s-musb", },
> +	{ .compatible = "allwinner,sun4i-a10-musb",
> +	  .data = &sun4i_a10_musb_cfg, },
> +	{ .compatible = "allwinner,sun6i-a31-musb",
> +	  .data = &sun6i_a31_musb_cfg, },
> +	{ .compatible = "allwinner,sun8i-a33-musb",
> +	  .data = &sun8i_a33_musb_cfg, },
> +	{ .compatible = "allwinner,sun8i-h3-musb",
> +	  .data = &sun8i_h3_musb_cfg, },
> +	{ .compatible = "allwinner,suniv-f1c100s-musb",
> +	  .data = &suniv_f1c100s_musb_cfg, },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_musb_match);
> --
> 2.35.5


