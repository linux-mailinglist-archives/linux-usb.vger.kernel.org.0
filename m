Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F2A61EC92
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 09:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbiKGIIJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 03:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbiKGIIH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 03:08:07 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480EA12AB3
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 00:08:06 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j4so15731644lfk.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Nov 2022 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t33PrZNjyM279K9PQ8T9tJZdu/EDxPT6K4ux2xaOCHQ=;
        b=QJgKzsAsQm/R3C0V+DeOMgLX/aFB+Q+OErmN2vjSgPy6tXMXOjKBQ320RzFDM3e57J
         KtuVDjcF9d8jppKmstXsJqnJ9Ogx5l1Snxz7zDSkr40HPT+nrtJRJU751I1+17JFc50C
         5GpTOFsLEUNYDIHmRSxWgpGrwSoN4PmdWaYc90yTnB49OxDzNv6jVY9KOYB+qN08FjY7
         KtawOk8vpKyDlrGt2qALzBIDXe8KkASTHm95gApgmoAPqJTob1w18ZtV9liyEXDDsDvh
         H5d7VcvSQugotLUKVGJGrU7hP3SEIjUr9Yrg1+X5bVJXv79Gs3Fbv7fIPJQvZZ4k0j7R
         jj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t33PrZNjyM279K9PQ8T9tJZdu/EDxPT6K4ux2xaOCHQ=;
        b=AaXol41jlgPy5HTfVVbgfAb58nXUG1hBCrEC1NtpOEpBHKDYtIxMP93GLvsezJCj7J
         Rqsu/iTyJMwkx84rQEKDj9A8NwlgaZHrKS/pEmsOh2DXi14UWe22vIPNVGiBcF/NKbJX
         LSV0Iia4ACChb17HEMt8Sd1nP+ZAzh31DNkiG4BqDbawmPz1loTYxhVWYEGJECSv/R77
         Q6dNiiMDEHYuU9LxOWY2eM77LUkaLRVZYwyXJ5+3VC+5FqRWL6dHECEsfVt5U5pJ64/Z
         611ytIzSVuHz6RzOpN3WN2CiiU2r2nxCGidUoZ8YhA9Uh2KlfkZPeOi3lkercFXzRge/
         n7xg==
X-Gm-Message-State: ACrzQf13eSEkQiRyCFN1ZVR+4r4rUhLaYUV/hF5AE7s0mjAZAkTiPv7Z
        j9vKQSbmysLgSQ1b6HOc7kMDkg==
X-Google-Smtp-Source: AMsMyM5kOdoblEEly6Q/0rdLMvnQsaLIP0nnygRpDSbgrPK1mYfSxpTHHwmTML57YWNfjJJNF63qiQ==
X-Received: by 2002:a05:6512:3d1d:b0:4a2:588b:d78 with SMTP id d29-20020a0565123d1d00b004a2588b0d78mr19643444lfv.375.1667808484549;
        Mon, 07 Nov 2022 00:08:04 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id w9-20020a05651c102900b0026fbac7468bsm1060085ljm.103.2022.11.07.00.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 00:08:03 -0800 (PST)
Message-ID: <64359734-9014-a0a9-9655-7e673214da23@linaro.org>
Date:   Mon, 7 Nov 2022 09:08:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3] dt-bindings: usb: usb251xb: Convert to YAML schema
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org
References: <20221106223438.223592-1-marex@denx.de>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221106223438.223592-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/11/2022 23:34, Marek Vasut wrote:
> Convert the usb251xb hub DT bindings from text to yaml schema so it is
> possible to validate DTs against the schema.


> +
> +  power-on-time-ms:
> +    maximum: 510
> +    default: 100
> +    description: |
> +      Specifies the time it takes from the time the host initiates the
> +      power-on sequence to a port until the port has adequate power.
> +
> +  swap-dx-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: |
> +      Specifies the ports which will swap the differential-pair (D+/D-),
> +      default is not-swapped.
> +
> +unevaluatedProperties: false

I should notice it earlier - this should be additionalProperties: false,
because you do not reference any other schema in top level.

With this:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

