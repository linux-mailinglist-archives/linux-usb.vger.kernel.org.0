Return-Path: <linux-usb+bounces-129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4F87A1B5A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 11:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36A3728290D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 09:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD9FDF55;
	Fri, 15 Sep 2023 09:54:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCB7DF41
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 09:54:09 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B4830D4
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 02:52:56 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52a5c0d949eso2211051a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694771575; x=1695376375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDsOEvzMdfN45BN2wHh3BSnjcShqUj+1nKnRADTq9kg=;
        b=tP4hH3dUA/lJgOpm+J3gr46lOFDcV7gBmd0izochaHSgmv0QNYglypNVidXXHILuFL
         RI6ndubnP53fmoWm7dPLMEe4TZJa4on8qbq/A4FeeK44LN0Lt4s5TNuqg03UgKc0h9LX
         yMq3Ddyq3vZw6NfBQesXfpq8squ1En4eymYlgMyv8coeA9+gjb7igzxVLI/dI2FivJi6
         7r06TElDMddeMNnPbR1HkgLVZqeJO+w52mpvZtsIYtcm1cOWjZZiMy7cXBpzzw/xqJX2
         NpLexGK9ZcUELh9posqFU0zlhZ1biPxnKbSFaX7nkhLRl+3F0ICGvb/IasWQL/Y0zEnZ
         e/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694771575; x=1695376375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDsOEvzMdfN45BN2wHh3BSnjcShqUj+1nKnRADTq9kg=;
        b=HnvHMa5/nSIWcjAjokAkXneCvWRfZDJR4xyYSvrsNTWGDDSEBMHe9x7kUJ1YAWRC7a
         +7o97CeF63KYSrdGiWbpQmhgGKzUatu8FBR4To02SuirmUpX1UrVTY8yGbY7Kn4gOvQ/
         n4i97U8TieQplX4tXzFIC6FidzIWM/mRd1q+BTiMCGDp9wtv3nLSzsu3z0krjKE3yz9Z
         AM9WEE5ikxyVddVYymc6XGPq+f4tnLfEm2g6qRE4tB1MSKti7iIqmUllQWoj3fSUa/lx
         GHorHIK4VwHvDSscccYygIhZQMiHGB3Brs0F0nqp4DnBRPTC3xRQ3nVDosyOzTM6nOyo
         effA==
X-Gm-Message-State: AOJu0Yx75Xsd/q759in+JHkZShrl0aaWwVTz3wzrnVu8ktjpG1+saJ1y
	QAbCT98e19EZu41CnAjt9Lpi2g==
X-Google-Smtp-Source: AGHT+IEyHoyb9BJwB5cKwuUb5J0gUjviPBraM53FhmXZ7ynAynY44X8lL3dyLbHDSdBrSx/FH4cLgA==
X-Received: by 2002:a17:906:150:b0:9a5:cab0:b061 with SMTP id 16-20020a170906015000b009a5cab0b061mr959202ejh.51.1694771575119;
        Fri, 15 Sep 2023 02:52:55 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id rp26-20020a170906d97a00b009ad829ed144sm2161019ejb.130.2023.09.15.02.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 02:52:54 -0700 (PDT)
Message-ID: <ca9075db-de92-4545-8c47-d6c292d57ad9@linaro.org>
Date: Fri, 15 Sep 2023 10:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: typec: tps6598x: add reset gpio support
Content-Language: en-US
To: Javier Carrasco <javier.carrasco@wolfvision.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230912-topic-tps6598x_reset-v1-0-78dc0bf61790@wolfvision.net>
 <20230912-topic-tps6598x_reset-v1-1-78dc0bf61790@wolfvision.net>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230912-topic-tps6598x_reset-v1-1-78dc0bf61790@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 15/09/2023 07:50, Javier Carrasco wrote:
> The TPS6598x PD controller provides an active-high hardware reset input
> that reinitializes all device settings. If it is not grounded by
> design, the driver must be able to de-assert it in order to initialize
> the device.
> 
> The PD controller is not ready for registration right after the reset
> de-assertion and a delay must be introduced in that case. According to
> TI, the delay can reach up to 1000 ms [1], which is in line with the
> experimental results obtained with a TPS65987D.
> 
> Add a GPIO descriptor for the reset signal and basic reset management
> for initialization and suspend/resume.
> 
> [1] https://e2e.ti.com/support/power-management-group/power-management/
> f/power-management-forum/1269856/tps65987d-tps65987d-reset-de-assert-
> to-normal-operation/4809389#4809389
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>   drivers/usb/typec/tipd/core.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 37b56ce75f39..550f5913e985 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -8,6 +8,7 @@
>   
>   #include <linux/i2c.h>
>   #include <linux/acpi.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/power_supply.h>
> @@ -43,6 +44,9 @@
>   /* TPS_REG_SYSTEM_CONF bits */
>   #define TPS_SYSCONF_PORTINFO(c)		((c) & 7)
>   
> +/* reset de-assertion to ready for operation */
> +#define SETUP_MS			1000
> +
>   enum {
>   	TPS_PORTINFO_SINK,
>   	TPS_PORTINFO_SINK_ACCESSORY,
> @@ -86,6 +90,7 @@ struct tps6598x {
>   	struct mutex lock; /* device lock */
>   	u8 i2c_protocol:1;
>   
> +	struct gpio_desc *reset;
>   	struct typec_port *port;
>   	struct typec_partner *partner;
>   	struct usb_pd_identity partner_identity;
> @@ -717,6 +722,13 @@ static int tps6598x_probe(struct i2c_client *client)
>   	mutex_init(&tps->lock);
>   	tps->dev = &client->dev;
>   
> +	tps->reset = devm_gpiod_get_optional(tps->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(tps->reset))
> +		return dev_err_probe(tps->dev, PTR_ERR(tps->reset),
> +				     "failed to get reset GPIO\n");
> +	if (tps->reset)
> +		msleep(SETUP_MS);
> +

This looks a bit odd to me, shouldn't you drive reset to zero ?

if (tps->reset) {
     gpiod_set_value_cansleep(tps->reset, 0);
     msleep(SETUP_MS);
}

also wouldn't it make sense to functionally decompose that and reuse in 
probe() and tps6598x_resume() ?

tps6598x_reset() {
     if (tps->reset) {
         gpiod_set_value_cansleep(tps->reset, 0);
         msleep(SETUP_MS);
     }
}

---
bod

