Return-Path: <linux-usb+bounces-291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAAB7A36CF
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 19:32:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 483DA2829DD
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 17:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A48D6AAC;
	Sun, 17 Sep 2023 17:32:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F49538F
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 17:32:31 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E56D212D
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 10:32:28 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bfb1167277so61394031fa.2
        for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 10:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694971947; x=1695576747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAUrGwSXliSzl6do0piL0fUoJFOhBx16PQ2kuiIjv0E=;
        b=hyOU7VIcNNwwe2F1NyXMasjYdxABwiInez23PZpdyVTHOJvYEnNn//qyoh4AwQirP8
         eIunm9tAYIJL/hNCOtSzG0FPJatLqDHt3iP8KtgFcR4IdlKGnXZkWw7zD02ElWtHGUQW
         BmN701nPbZoCa6eRHZL1y09mpDDKLCM3ZRL4FMA6nx9bBA4hX5+gLDsNxn3F8lv8M/O/
         BxlWM3HFTRUBr0T/tfUE52dGllR/pTOJ22aQ4SpN9ph8I8NEbUXMAMN6p8FCfUDaNALg
         eN56WzV7F5GOQDgjtzD8iAPSMMk+A49rYumC7pzzakGBCX67l8ElyD8kwFwkV5EIjkg1
         wouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694971947; x=1695576747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAUrGwSXliSzl6do0piL0fUoJFOhBx16PQ2kuiIjv0E=;
        b=KRzqnsytBOVz2B2f4Z3ERi0QnO4OEuSe5k9Z2njhh5cxiPfx9lxUQQclbxB8+xWenr
         rh1xXVlah3XdxBaw98xSWhgJa53KEz3PiHL+9U/N3QlLfvRAy2+l6iKZTQopWhJTFOU9
         LfMf4M0ltokD0xy90rLBAPfymK6LaIwJsi1hXCnN9SZDbgbQDPBgVcULicRErdm/PzWX
         O9v314ZwS4+P8ZUpfd27pMuBP/nj9LDPdBfcCwVbmJW+AclKmQact06J7zTG6UL9i8cC
         mQrHZPosUxgJOp44MD3oFZh2oost6Sbxn0GSfNTuxKC3IIhn2xVML7RAkg5U8HpyjdsN
         xkOA==
X-Gm-Message-State: AOJu0YyOyDm83FwI4jc+WOsEficqDjy9gCiXNqYs+7pqitVRvwJ5ZPfa
	7feO14/GHYXrAtHRTXGB4jtCgA==
X-Google-Smtp-Source: AGHT+IHpuEJOb2kc1LZ7icvbDz8sWqxmRdmM5s1F83iX4feIQVNLKNFPf1XMTFlpL8xUVcJwClqwtw==
X-Received: by 2002:a2e:2416:0:b0:2b6:eb5a:d377 with SMTP id k22-20020a2e2416000000b002b6eb5ad377mr6054055ljk.5.1694971946989;
        Sun, 17 Sep 2023 10:32:26 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906350b00b009a5f1d1564dsm5171907eja.126.2023.09.17.10.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 10:32:26 -0700 (PDT)
Message-ID: <43fdd3de-50cf-49f6-0577-61667288453e@linaro.org>
Date: Sun, 17 Sep 2023 19:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 11/15] USB: typec: Enable sleep mode for tps25750
Content-Language: en-US
To: Abdel Alkuor <alkuor@gmail.com>, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, bryan.odonoghue@linaro.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, abdelalkuor@geotab.com
References: <20230917152639.21443-1-alkuor@gmail.com>
 <20230917152639.21443-12-alkuor@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230917152639.21443-12-alkuor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 17/09/2023 17:26, Abdel Alkuor wrote:
> From: Abdel Alkuor <abdelalkuor@geotab.com>
> 
> Allow controller to enter sleep mode after the device
> is idle for sleep time.
> 
> Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> ---
>  drivers/usb/typec/tipd/core.c     | 29 ++++++++++++++++++++++++++++-
>  drivers/usb/typec/tipd/tps6598x.h |  3 +++
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index a97fda68cb54..3d9877551160 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -42,6 +42,7 @@
>  #define TPS_REG_PD_STATUS		0x40
>  #define TPS_REG_RX_IDENTITY_SOP		0x48
>  #define TPS_REG_DATA_STATUS		0x5f
> +#define TPS_REG_SLEEP_CONF		0x70
>  
>  /* TPS_REG_SYSTEM_CONF bits */
>  #define TPS_SYSCONF_PORTINFO(c)		((c) & 7)
> @@ -205,6 +206,11 @@ static inline int tps6598x_read64(struct tps6598x *tps, u8 reg, u64 *val)
>  	return tps6598x_block_read(tps, reg, val, sizeof(u64));
>  }
>  
> +static inline int tps6598x_write8(struct tps6598x *tps, u8 reg, u8 val)
> +{
> +	return tps6598x_block_write(tps, reg, &val, sizeof(u8));
> +}
> +
>  static inline int tps6598x_write64(struct tps6598x *tps, u8 reg, u64 val)
>  {
>  	return tps6598x_block_write(tps, reg, &val, sizeof(u64));
> @@ -977,6 +983,24 @@ static int tps25750_apply_patch(struct tps6598x *tps)
>  	return 0;
>  };
>  
> +static int tps25750_init(struct tps6598x *tps)
> +{
> +	int ret;
> +
> +	ret = tps25750_apply_patch(tps);
> +	if (ret)
> +		return ret;
> +
> +	ret = tps6598x_write8(tps, TPS_REG_SLEEP_CONF,
> +			      TPS_SLEEP_CONF_SLEEP_MODE_ALLOWED);
> +	if (ret)
> +		dev_warn(tps->dev,
> +			 "%s: failed to enable sleep mode: %d\n",
> +			 __func__, ret);
> +
> +	return 0;
> +}
> +
>  static int
>  tps6598x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
>  {
> @@ -1131,6 +1155,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  		irq_handler = cd321x_interrupt;
>  	} else {
>  		tps->is_tps25750 = of_device_is_compatible(np, "ti,tps25750");
> +
>  		/* Enable power status, data status and plug event interrupts */
>  		mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
>  			TPS_REG_INT_DATA_STATUS_UPDATE |
> @@ -1138,6 +1163,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  	}
>  
>  	tps->irq_handler = irq_handler;
> +

Drop

>  	/* Make sure the controller has application firmware running */
>  	ret = tps6598x_check_mode(tps, &mode);
>  	if (ret)
> @@ -1149,6 +1175,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  			return ret;
>  	}
>  
> +

That's not really relevant, neither correct.

>  	ret = tps6598x_write64(tps, TPS_REG_INT_MASK1, mask1);
>  	if (ret)
>  		goto err_reset_controller;
> @@ -1286,7 +1313,7 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
>  		return ret;

Best regards,
Krzysztof


