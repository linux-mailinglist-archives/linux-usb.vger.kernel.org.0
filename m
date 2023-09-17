Return-Path: <linux-usb+bounces-290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 659707A36CB
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 19:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D0831C21100
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 17:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232E163D4;
	Sun, 17 Sep 2023 17:31:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A299B5386
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 17:30:58 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9527512C
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 10:30:56 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50308217223so1399926e87.3
        for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694971855; x=1695576655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgdmuKIbpz+gFfxV0UYSueDkWKXzE83GuFLx8gl3zAM=;
        b=yCyK4c/GkTmHbLZSSrgiYdI3XfWTNzcUUIArLPIKz5pXfeZasarrLovnX/hTSE3/+o
         T/fDxro/noU7I+XYsGEiCsvAscMjl1D4quJMjNZQoyM0q5xGx65VhYnWpd+xK6x74WEy
         DvTwxfC2yX4p0ZiAMJWRlobHo6KYKq7QNUopa1EVBGfxylRGN0g7tLNXMez2Rrtiy7PJ
         Nq4fSDs6jkwmJwN95z8F69N2/4GNMU89Kw37ATaAAsbhz8hAMZdrA3W7AYZ6rKEXc/pe
         GeGjda3GkRho/a446hTteK3OFhgJYKCbQRr3JkLx0I3HBt/1vfPGi8ouiss9u872eLSZ
         iI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694971855; x=1695576655;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgdmuKIbpz+gFfxV0UYSueDkWKXzE83GuFLx8gl3zAM=;
        b=GySTpW1XHLFXxfv7iIoiEJFxxO8fwxbtcTEJ8UpFF63xqOsoJHoS/9CY0xdAP/xl4h
         5Q441J30tjbDUq7hqFmJQpBSI4/SsqmlCiuO8v/i7UHeDbHn6Uh4TrXb6ZVai4n24SeH
         vD0ZXz6crZltvZgJrWVFoVWMRPTMKrkEwijKEI+l6fgZgqM6W8q9eQM/XQR0OI5HuZwj
         NuOE/tYOqBhA2pzv/O40J2epO0Mo5bTzhrCIcwLnfX0BhENDlkr8DiqcOek3fzWhTRTN
         EvEOjkjIkSPFAlr/r4GsPKODQuJC1ordb8LyctR5FfggmK6WPSX8wEGRbs50m1muuQC7
         Qbog==
X-Gm-Message-State: AOJu0YyzxhXv3Daci7pzJUMkxCSBznyr0qvWdXNRpyd1lMKD+cqrmVjS
	HQ8IygfS1FFTSxQj7DsiChPioQ==
X-Google-Smtp-Source: AGHT+IHiMAYhJA3KFVfQBrnhXJaEI+iFM+WRbZvD/OAAp6SUHtzAea54pd+PHetHdZOGheq5BtZAJw==
X-Received: by 2002:ac2:4831:0:b0:500:9dd4:2969 with SMTP id 17-20020ac24831000000b005009dd42969mr5011212lft.59.1694971854193;
        Sun, 17 Sep 2023 10:30:54 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id d23-20020a1709064c5700b009920e9a3a73sm5254791ejw.115.2023.09.17.10.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 10:30:53 -0700 (PDT)
Message-ID: <384eb2c7-5aff-ef50-2f89-81cf8dd6e724@linaro.org>
Date: Sun, 17 Sep 2023 19:30:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 01/15] dt-bindings: usb: tps6598x: Add tps25750
Content-Language: en-US
To: Abdel Alkuor <alkuor@gmail.com>, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, bryan.odonoghue@linaro.org
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, abdelalkuor@geotab.com
References: <20230917152639.21443-1-alkuor@gmail.com>
 <20230917152639.21443-2-alkuor@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230917152639.21443-2-alkuor@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 17/09/2023 17:26, Abdel Alkuor wrote:
> From: Abdel Alkuor <abdelalkuor@geotab.com>
> 
> TPS25750 is USB TypeC PD controller which is a subset of TPS6598x.
> 
> Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> ---
>  .../devicetree/bindings/usb/ti,tps6598x.yaml  | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> index 5497a60cddbc..e49bd92b5276 100644
> --- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> @@ -20,6 +20,8 @@ properties:
>      enum:
>        - ti,tps6598x
>        - apple,cd321x
> +      - ti,tps25750
> +
>    reg:
>      maxItems: 1
>  
> @@ -32,10 +34,45 @@ properties:
>      items:
>        - const: irq
>  
> +  firmware-name:
> +    description: |
> +      Should contain the name of the default patch binary
> +      file located on the firmware search path which is
> +      used to switch the controller into APP mode.
> +      This is used when tps25750 doesn't have an EEPROM
> +      connected to it.
> +    maxItems: 1
> +
> +  ti,patch-address:
> +    description: |
> +      One of PBMs command data field is I2C slave address
> +      which is used when writing the patch for TPS25750.
> +      The slave address can be any value except 0x00, 0x20,
> +      0x21, 0x22, and 0x23

Why this cannot be another entry in the reg?

> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 0x7e
> +
>  required:
>    - compatible
>    - reg
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: ti,tps25750
> +    then:
> +      required:
> +        - ti,patch-address
> +        - connector


Why? Connector should be required or not required for both devices. What
is different between them?


Best regards,
Krzysztof


