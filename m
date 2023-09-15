Return-Path: <linux-usb+bounces-123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 628587A169C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 08:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864171C210C1
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 06:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ABE79C5;
	Fri, 15 Sep 2023 06:56:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199F809
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 06:56:11 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9781A2723
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 23:56:07 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9936b3d0286so247281866b.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 23:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694760966; x=1695365766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltJuwa423HiOTIp2QE2F7B4IlgvNgI+I1HiwiC0w6k0=;
        b=pjMoU+ZwLr4ExweTVifcnRyLVL/V+RU221cWKHg2lOC0168+UqJP+SXwFU9t4zUZ+H
         RmBzbNXQWO8E3G7T/KxQGhFvtb9s4PyMoAMq5pn2fo3VPpyNUys/SgyfWh7bH6hdK00D
         X5URPFBSIwXPcSIcPGKPqGFjfcnhAeHxxi9tLKaBJ0wYEPLzLKywKTYC02MdJLZQyNMz
         GhXMeYcYTkLixRWFbqODbtYZtwmHfX49Zc34GYKB1iISes2WkQ/zO7kRLlTWxal8dz+Z
         A69RQa9tPK+K3o+uH9uqAMfUmCehkEtduS3nYri9KVf1WD73/KQm1QX5WVtrH4BdmRBf
         8xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694760966; x=1695365766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltJuwa423HiOTIp2QE2F7B4IlgvNgI+I1HiwiC0w6k0=;
        b=Oz0KuCwxeHmTKZ1LP0W8sYzVoQgcjaqq5gIp+5/2GkK4vRMw7kg3+Xau74j00wHj50
         7DCMtOIm2MIrRi4lriPg1pfiXXQqFfbG1FBpNnJ4WeE8dbbrTDh7xfMyEr8WDMa2I+Rp
         aovOgKbGwT5PRQx9kujdaYRsPho/TbCPF90wcbfJY1w2EE03RIVgdG/CDDyfy+iPP+wO
         hccyvN6w2nVnbAfbIj9YR8pGFGud73KP5vsIuLr2o8Kx0yYpHGNZ+sYIgcjsvaeXZVOV
         56cC0XayhBmlkMCo6iGiE7OgvsLOODZA08eW5juCYhNMSC4lXLwwzBxPF42WgAHZ9Oa9
         4T6g==
X-Gm-Message-State: AOJu0YyZG8ygxiUyzbGDq5Ses4/pGxfZSwNeKSFkQ12BAbTzasHYIkdf
	uHwEqFpOvzxbDbMxA6s0RTh4epcvvygPsq/brK8=
X-Google-Smtp-Source: AGHT+IHrYQakxC7i2ztZo8CHtMZzEPwiiHt2oaQ/EMEOa+o0maCDcZHF1ZYRrhEJTf32eaAsHra9YQ==
X-Received: by 2002:a17:906:1050:b0:9a1:cb3c:ba5c with SMTP id j16-20020a170906105000b009a1cb3cba5cmr570091ejj.68.1694760966103;
        Thu, 14 Sep 2023 23:56:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906080a00b00997d76981e0sm1973363ejd.208.2023.09.14.23.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 23:56:05 -0700 (PDT)
Message-ID: <232585f0-772d-36a4-02de-f2698ec7bb5e@linaro.org>
Date: Fri, 15 Sep 2023 08:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] dt-bindings: usb: tps6598x: add reset-gpios property
Content-Language: en-US
To: Javier Carrasco <javier.carrasco@wolfvision.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230912-topic-tps6598x_reset-v1-0-78dc0bf61790@wolfvision.net>
 <20230912-topic-tps6598x_reset-v1-2-78dc0bf61790@wolfvision.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912-topic-tps6598x_reset-v1-2-78dc0bf61790@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 15/09/2023 08:50, Javier Carrasco wrote:
> The TPS6598x driver supports an optional high-level reset GPIO.

What driver supports or not, it does not matter. The question is (and
commit msg should say) whether hardware has such reset pin or not.

> Document the new property and add it to the example.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  Documentation/devicetree/bindings/usb/ti,tps6598x.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> index 5497a60cddbc..b1a621e06127 100644
> --- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> @@ -23,6 +23,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  reset-gpios:
> +    description: GPIO used for the HRESET pin.

This probably answers that yes - it is a pin in hardware...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


