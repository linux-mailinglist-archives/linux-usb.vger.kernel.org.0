Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29DFE575D38
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jul 2022 10:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbiGOIRg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jul 2022 04:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbiGOIRg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jul 2022 04:17:36 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19EA7E83B
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 01:17:34 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id w17so4909119ljh.6
        for <linux-usb@vger.kernel.org>; Fri, 15 Jul 2022 01:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s9W/XdjFP9+KQHF/tqY2mVW8SA67g63il1VbZxwL808=;
        b=e9UMm+zKgMsZQFdvLl9oUS39E7XzYzP8V6W2y8aOC1ikKwDXG+P848/z4sdjIg4Iw5
         KdxDuUhUZsG4aJluwjJQfVipyjCvCTFNpLFs13/A4KWhANsoGdLpD53jhEE5/UebWU78
         JMB2DAtnScw4Yrzfvva2hEdN0sspdYw+WSUIuxVUqNmqeNaXsXcXAfYSLEnYiIn8DcyJ
         TqzrplOaG3qxaT2mwgf9+pzdE4i9CgXo3Z2xi1ObQfZAcwIfdyNu5IWV6wec5KSyPPC8
         eA3nirJx/QCqtjG/Ch0R34rp7Jx85NxFtGMzT111EU8IfzXnF/NsTL7H55IEO13JP359
         gY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s9W/XdjFP9+KQHF/tqY2mVW8SA67g63il1VbZxwL808=;
        b=iAQUdOIlYoHVbsvXaw7lrrK9uXc6wPXf8oGfxax1tGnyv/Wmkkm7gCzo1VSfKxhfM8
         hpZjPCG/WZiJ4vE+/GRaDLnBv74kgeeZFJmPR/+TMgtngr7QZNSCbPVFWy1K4vRFZMd8
         f+r4goWAsjU5MzQru7/kUmOomJWDmzd3TUAvfUWT3Fj9dOk7GKKi65mA6pSnNWHzCVRE
         4vkh1UR5bM3wZStuYSD0kkwx9B6bRp34dVrv8Y7oeAWEIiu/ZgIjjvg+CuTAt076jOdk
         A9emIt+i2ENVtXLXUkkxAG/Fqs/SfnswHIvXV8KayIu2sH0++ur7KyRkZpv6c3453oN0
         IERQ==
X-Gm-Message-State: AJIora/cFgkEnQIbnzbTIOeDs8KAvOh3bi1xoXGjzw6CovAnkY6GV6zA
        iI5RS2lqiuo4HlxGT20aePt4pQ==
X-Google-Smtp-Source: AGRyM1v/mgNffd/k50++KMX8gRdYJyXoiTRPm9WsmlaRfo5rSrq7NAA6RVl9GC6g/Wg8UkHNKEWvIA==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr6596209ljh.78.1657873053294;
        Fri, 15 Jul 2022 01:17:33 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id a26-20020ac2505a000000b0047f6b4a53cdsm780989lfm.172.2022.07.15.01.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 01:17:32 -0700 (PDT)
Message-ID: <bdbec92d-877f-effd-e2bc-ebc380f107d5@linaro.org>
Date:   Fri, 15 Jul 2022 10:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: Add binding for TI USB8041 hub
 controller
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715073300.868087-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15/07/2022 09:32, Alexander Stein wrote:
> The TI USB8041 is a USB 3.0 hub controller with 4 ports.
> 
> This initial version of the binding only describes USB related aspects
> of the USB8041, it does not cover the option of connecting the controller
> as an i2c slave.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Removed 'items' from compatible, it's just en enum now
> * Rename reset-gpio to reset-gpios
> * Use 'items' for reset-gpios
> * Adjust description of vdd-supply
> * Sorted required list
> * Adjusted example
> 
>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> new file mode 100644
> index 000000000000..7fe7416e2b51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Binding for the TI USB8041 USB 3.0 hub controller
> +
> +maintainers:
> +  - Matthias Kaehlcke <mka@chromium.org>
> +
> +allOf:
> +  - $ref: usb-device.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - usb451,8140
> +      - usb451,8142
> +
> +  reg: true
> +
> +  reset-gpios:
> +    items:
> +      - description: GPIO specifier for GRST# pin.
> +
> +  vdd-supply:
> +    description:
> +      "VDD power supply to the hub"

No quotes needed.



Best regards,
Krzysztof
