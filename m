Return-Path: <linux-usb+bounces-345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6647A53C9
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 22:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 769B028224B
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 20:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EF82868C;
	Mon, 18 Sep 2023 20:18:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2427EE2
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 20:18:42 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAED3128
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 13:18:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50305abe5f0so3563236e87.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 13:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695068319; x=1695673119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jEjcvyS6CReblMj/llRKVSIcv9klWKbGSR5hpu3hTaI=;
        b=BIxesoOAHtH7Ru3HaeIWY+6Buj3DGyQ8VBwUVet7lFrFKzKvdzLc92gda4mmPqTsv8
         NG2Ylzf3FqfNzRSuryxq8tGptkEkULYK57IenlNYpZToBFoidofwSgAubug2/ED47uHQ
         9buC9Mi39hIu/FuiP57ZHNAhfV89irTG+Je7XcZ+iL6U5otKsOVC+zyfYHRs4+men9l2
         /O7j4/WxYMihnlTAqEYyVJ3QAEPT8VeX+/5raUbLb7K6WOM6UGhFTNZJZrfJZyu5EKKI
         q4Go/oc9oOfY1zOu1WpTuXCy36Ysgq2flcsY2E8HWaGIDsbEkPzijkBxaqd/9D9vEhDY
         Pffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695068319; x=1695673119;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEjcvyS6CReblMj/llRKVSIcv9klWKbGSR5hpu3hTaI=;
        b=a7GtqldHtDeWm8CvaMLlJTYDoiwvH0SBVnh7JltI0pAA3mHsbKWVw32u9RHHH5zN0m
         HXNJxVFUKrTUqBtRXtmokah19P0EjiiDc5P6bIygDTUd2gW0liXUF1Iu5+Zl/0xNPqc2
         lRXxj9K7BwIupedVARhiSOWFHnHk02Q/JPcwGys/FVDpq7U4SEgd10PseKss3CUcRYK/
         bG5IFAJwyQaEK5QkixXd73Jw2p1v6I6aY0sb+nZG5zk9wKofJvthgaDxqlj9B1+fKG1q
         OWJonQjJJ1bHby3cqGYt4cW1/PN/A9Cgv0zvUCTctk7BLUR/O45hJ93ZvErXYxkOpQZj
         ozjA==
X-Gm-Message-State: AOJu0YxxLTuUCtHskkkrqMYmi+YTcB4FGq6du2RAJbjmWX5L3nQuod3W
	wmVbZcgHUqFdC26hdI80XI0lHlWj3ESGz5iuGpcgXA==
X-Google-Smtp-Source: AGHT+IFPe4/whAq4HvHLWe07ubJb3d7j4FOxiy0RP340hlHxpJkBuzKiTaqldCS3obe/AAOmx18muw==
X-Received: by 2002:a05:6512:3144:b0:4fe:ecd:4950 with SMTP id s4-20020a056512314400b004fe0ecd4950mr8302805lfi.1.1695068318901;
        Mon, 18 Sep 2023 13:18:38 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id v4-20020aa7d644000000b0052567e6586bsm6528461edr.38.2023.09.18.13.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 13:18:38 -0700 (PDT)
Message-ID: <b7a337f2-a810-d14c-e7cd-15e33a9ecb5d@linaro.org>
Date: Mon, 18 Sep 2023 22:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 1/2] dt-binding: usb: ci-hdrc-usb2: document Nuvoton
 NPCM supprt
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, xu.yang_2@nxp.com, peng.fan@nxp.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 j.neuschaefer@gmx.net
Cc: openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230918165958.2659-1-tmaimon77@gmail.com>
 <20230918165958.2659-2-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918165958.2659-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 18/09/2023 18:59, Tomer Maimon wrote:
> Nuvoton NPCM BMC SoCs use ChipIdea silicon IP for the USB device controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. It's dt-bindings.


> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 1394557517b1..9de4dfe004d1 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -16,6 +16,7 @@ properties:
>        - enum:
>            - chipidea,usb2
>            - lsi,zevio-usb
> +          - nuvoton,npcm-udc

You need SoC specific compatible.

>            - nvidia,tegra20-ehci
>            - nvidia,tegra20-udc
>            - nvidia,tegra30-ehci
> @@ -325,6 +326,20 @@ properties:
>      type: boolean
>      deprecated: true
>  
> +  nuvoton,sysgcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that configures usb phy mux.
> +          - description: offset of usb phy mux selection.
> +          - description: mask usb phy mux selection.
> +          - description: value usb phy mux selection.
> +    description:
> +      A phandle to syscon with three arguments that configure usb phy mux.
> +      The argument one is the offset of usb phy mux selection, the argument two
> +      is the mask usb phy mux selection, the argument three is the mask usb phy
> +      mux selection.

Sorry, you miss phy driver. Don't use syscon instead of proper hardware
devices.


Best regards,
Krzysztof


