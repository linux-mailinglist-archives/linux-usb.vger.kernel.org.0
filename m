Return-Path: <linux-usb+bounces-3038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39F7F1A08
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 18:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E584B210B1
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 17:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C95D210F9;
	Mon, 20 Nov 2023 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sb35I2lS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E7F185
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 09:32:12 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a00cbb83c82so59080966b.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 09:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700501531; x=1701106331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDgsmQLBT5rQ4HpNZnN0ciu0ZjbXj48vwcFVvWRaR80=;
        b=Sb35I2lSE0rUiNAPIFWIrEccE7pUQEfm/Vg4r5MbNDoMKwRXc9/gNu7LimsN8RGRso
         NFgPAscHLYNWz7FzXwrP5byjs75bzp1vy33hWGyZRXLJGYDsgSgJseeYYouimk48KHWE
         rbqWQQEadhUEBzjGioueV/pDlyXHDKr07dUu5VV/3dSSTAelw9O4IgiQHn3PxsrffrNt
         ptD2RI6TR1Id1FHMditW7fwkG3ykiECX0LRbfEVTWDB3BLvhyTuSmS31LJP6gzoQzaTi
         XH4Nh8YqHqAj2050C7by84/5dkWUeIeTCPAF+IXQJ+E9d98kYCBC6q49Z3lqDlox+Wvl
         USdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501531; x=1701106331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDgsmQLBT5rQ4HpNZnN0ciu0ZjbXj48vwcFVvWRaR80=;
        b=w+z5KU/fBGsgncz2pedfgbIyhf38ZFXDxm407jzJ6Fe9AZFH0QP5nkfy2YlVS4FCsc
         r7pn1Mo6WW7LIM6/F1BiF76guUqgMwhvEC7YtVsoyvPjtKJsW7XFWgic7vVbBDwe6aH1
         lvv1v/qQUqZqM4JsPS02ze+G4VFjAYNbfogLWcI6YQL3jNMQspP1ValXQ4+wi1qNpR6V
         oUytlkIjfi9Gccti0dGiF1WOOlI1Yr6u1dg4LmOkUgkAxLxygT5oIWPAqL2eSdhg4iUC
         nAEPu0bhiDK6BXLxm1+ugSZHD68jJGDAJlIgEFLV/NbWUCzVeCv+Flq0j9Ld9q5sAa7+
         UroA==
X-Gm-Message-State: AOJu0YzYNKGEQhekRnunZ3282gIzwSRF84CWA0EgP9T/I1sypU5rAYga
	5I0mvuOfVA2D7gVyBMMSdHdSVA==
X-Google-Smtp-Source: AGHT+IFa3ZXuU5jtCAYq0jKzGexWbijpVgnOgGhxfTjUJyMIFfKwPmfhLSWOQ6HIcqSPBHp6N2IGwg==
X-Received: by 2002:a17:907:d046:b0:9e2:b87d:9c5c with SMTP id vb6-20020a170907d04600b009e2b87d9c5cmr7951532ejc.36.1700501530750;
        Mon, 20 Nov 2023 09:32:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id lz13-20020a170906fb0d00b009fcbb9162e9sm1965740ejb.174.2023.11.20.09.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:32:10 -0800 (PST)
Message-ID: <6f0da181-717c-4b14-ba3f-d287efe4105b@linaro.org>
Date: Mon, 20 Nov 2023 18:32:07 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: ti,j721e-usb: add ti,j7200-usb
 compatible
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
 <20231120-j7200-usb-suspend-v2-1-038c7e4a3df4@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231120-j7200-usb-suspend-v2-1-038c7e4a3df4@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2023 18:06, Théo Lebrun wrote:
> On this platform, the controller & its wrapper are reset on resume. This
> makes it have a different behavior from other platforms.
> 
> We allow using the new compatible with a fallback onto the original
> ti,j721e-usb compatible. We therefore allow using an older kernel with

Where is fallback ti,j721e-usb used? Please point me to the code.


> a more recent devicetree.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> index 95ff9791baea..69a222dfd9ff 100644
> --- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
> @@ -12,11 +12,15 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - const: ti,j7200-usb
>        - const: ti,j721e-usb
>        - const: ti,am64-usb
>        - items:
>            - const: ti,j721e-usb
>            - const: ti,am64-usb
> +      - items:
> +          - const: ti,j721e-usb

This makes little sense. It's already on the list. Twice! Don't add it
third time.

I am sorry, but this binding makes no sense. I mean, existing binding
makes no sense, but your change is not making it anyhow better.

Best regards,
Krzysztof


