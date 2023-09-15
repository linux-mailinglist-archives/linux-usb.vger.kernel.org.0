Return-Path: <linux-usb+bounces-130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 282CD7A1BB8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 373C51C20364
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 10:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3EFDF66;
	Fri, 15 Sep 2023 10:05:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B4D268
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:05:45 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E8CD3590
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 03:03:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-500a8b2b73eso3165895e87.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694772211; x=1695377011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrWZrC7VA07vTu2VYx3e4Tz7ds8I9QblZBEXqmyJTtI=;
        b=kK987kB0wWsGRzVZoQkfrGsK51z95+8bf6SKy11lddIulYxKlughHj82on9iZmEwnR
         gCbpSSBEWJc6Wc17kSRyoDlG98d9Y+c9SdyWA2L0n88k+BAxUie2BLWfs7+jkUN1w25o
         ZfNjA0u66c8i/I9YGoxxKJEVXQ11EUTxiRRmSpuKYqr93L921X0ZhtnpmN1B3sKVFGqK
         kstfGJxIH3c+jNk1PhRmznFc2WzMbH5TU+xR/UIgQeqjLTKGSGUJFSNmjKaL/6pJ54wX
         t+tmkgVu9KbT+9sbmJ2HJ7gKz5cKXdYUSqfB/yxeAbHuKVG+sZqadyDCPTjwG80CRe52
         y7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694772211; x=1695377011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrWZrC7VA07vTu2VYx3e4Tz7ds8I9QblZBEXqmyJTtI=;
        b=RpjAGW0nmHFbMDdXnd7/B78dY+KRUYxDiZvyaM1HPqZvXrfB1utzk9bMDRlUArvKuk
         GtYcGJcEFRSdAPD4nbVMW+i5gIwfkMPVPI9akH8uOBr6aAhM4eJVQME9EWj9HwuhnkWm
         Wq1SCbHU+pWEuV7bWvNXmULVJP9AJOvdCpwsWCwn8+b45rhD2z60IRGZpck5uJcaxBF7
         SSrwCuRBSqqGekCsAm+5R41fFJNmf2pw0aUpu2xREP3U9/YL0FmJCbuUVGae3ng+l8oO
         Lar5clJuTM31DJeL6zgIW2z8QehMx5U7k14B4/L2wungRqAqoKeVNwmrTBu9seT1lojJ
         QPtw==
X-Gm-Message-State: AOJu0YwD4Hcwn8vu/7fhHnGQPj762ga4igt1Q1p/A18gVsWcQY7mljjE
	gcuLdI2CrjXByyPChSxI7qSS4A==
X-Google-Smtp-Source: AGHT+IGviFKWXpNdbTlH9iY6lSh8S+N53F24MqnwsIYyEUPqqmXsdSOqI71TMI5ntSEBGFFZsJo9Kg==
X-Received: by 2002:ac2:5e22:0:b0:4fb:caed:95c3 with SMTP id o2-20020ac25e22000000b004fbcaed95c3mr1115977lfg.53.1694772210725;
        Fri, 15 Sep 2023 03:03:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id i8-20020a0564020f0800b005309eb7544fsm315907eda.45.2023.09.15.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 03:03:30 -0700 (PDT)
Message-ID: <b6828042-3e6b-7d63-c66d-5fc1dbf2b7dd@linaro.org>
Date: Fri, 15 Sep 2023 12:03:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] usb: typec: tps6598x: add reset gpio support
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Javier Carrasco <javier.carrasco@wolfvision.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230912-topic-tps6598x_reset-v1-0-78dc0bf61790@wolfvision.net>
 <20230912-topic-tps6598x_reset-v1-1-78dc0bf61790@wolfvision.net>
 <ca9075db-de92-4545-8c47-d6c292d57ad9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ca9075db-de92-4545-8c47-d6c292d57ad9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 15/09/2023 11:52, Bryan O'Donoghue wrote:
>> +	struct gpio_desc *reset;
>>   	struct typec_port *port;
>>   	struct typec_partner *partner;
>>   	struct usb_pd_identity partner_identity;
>> @@ -717,6 +722,13 @@ static int tps6598x_probe(struct i2c_client *client)
>>   	mutex_init(&tps->lock);
>>   	tps->dev = &client->dev;
>>   
>> +	tps->reset = devm_gpiod_get_optional(tps->dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(tps->reset))
>> +		return dev_err_probe(tps->dev, PTR_ERR(tps->reset),
>> +				     "failed to get reset GPIO\n");
>> +	if (tps->reset)
>> +		msleep(SETUP_MS);
>> +
> 
> This looks a bit odd to me, shouldn't you drive reset to zero ?
> 
> if (tps->reset) {
>      gpiod_set_value_cansleep(tps->reset, 0);

It is driven by GPIOD_OUT_LOW.

>      msleep(SETUP_MS);
> }
> 
> also wouldn't it make sense to functionally decompose that and reuse in 
> probe() and tps6598x_resume() ?
> 
> tps6598x_reset() {
>      if (tps->reset) {
>          gpiod_set_value_cansleep(tps->reset, 0);
>          msleep(SETUP_MS);
>      }
> }


Best regards,
Krzysztof


