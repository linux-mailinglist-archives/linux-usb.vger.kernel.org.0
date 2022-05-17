Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 075F152A11F
	for <lists+linux-usb@lfdr.de>; Tue, 17 May 2022 14:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241563AbiEQMDo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 May 2022 08:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbiEQMDn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 08:03:43 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CEF1082
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 05:03:42 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id fd25so9495596edb.3
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 05:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yZJ549tkUDyfMnj4pDgFXOPxERt74iwRgdcSUgywI0w=;
        b=SLdIpuHsPZOQVlDGwOot7xRTXin9VuhUJWDszbnsNjoGeWE8iBiJ3ukO3F3Z5GZteq
         1cp1K5zu4cgXjLKSEfKvXBjOHbGusbTRY3yPCiSX6aYgQntnubVrjqXBIOjABmNpiKXA
         cP6tVRvsLW4So4q8qv2MUGoSR4JBKO+99YHGO8c58Mccs75L0RDc4CaWqBjoA3fJGxID
         Jo3c20vSluxtLkg3zJt1FPzOAIVrGXZnS32smWQehkwlE3LH5AKrwKGAmwlyCUzgjWmg
         aztEWXc+ige5+ey6GRtLavKzVNZUV74JmNGmBsJI2Mje1F8DfO5sQtnMpAWUMWuUEcYK
         q/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yZJ549tkUDyfMnj4pDgFXOPxERt74iwRgdcSUgywI0w=;
        b=IrIvcJPs+Ht3EM3BFspT0CAqsYuKixFIftN/+B18IQfFf04mKTBV74ujWJWrHXSMd/
         HRfO11nQxzp3eJzxbvO+IEAwXDZrQCxD9bmEVl+Ot/8B9Cd3kOqJvGiByEDCPpOI1V//
         G6vmZDvWPnsHvNVEQcNtT7xYTi/tsyvd/xVgZ50iOeZETfDb2lwtKyFp0Iiq5AuVUmpF
         TvOlsCH2gx/LXNPNeTo+TuAfbbTDW9+a1YGcRajPC+R3vIauNtz3X9I4Rjo8NJOysdjr
         9OTALZdOBYA7IgFURPkRF3qcgD+oNdIjAlH601Pi6EgBcu2z7zyc0ER5BWI0IHhaxKT1
         dqKg==
X-Gm-Message-State: AOAM531hCxz5bX3ppAFEb4WZx7FhOv9nxJsX/UAWFX1SB1sJwbkiFSxS
        ZhKOUlRj6ZBq1ylSEfraAvoo+g==
X-Google-Smtp-Source: ABdhPJzS034eaTCysoZRyeY2Rmi287sAazLAVLGC7BRgRqcCeUbhtN10ECZckeoh/xWSE6rloRIXtw==
X-Received: by 2002:a05:6402:2815:b0:420:c32e:ebe2 with SMTP id h21-20020a056402281500b00420c32eebe2mr18820072ede.1.1652789020781;
        Tue, 17 May 2022 05:03:40 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u12-20020aa7d88c000000b0042ac13e232csm1645442edq.39.2022.05.17.05.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 05:03:40 -0700 (PDT)
Message-ID: <414d09f8-328a-4bf4-c20e-f8ce4a6ddfc7@linaro.org>
Date:   Tue, 17 May 2022 14:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: usb: add documentation for aspeed udc
Content-Language: en-US
To:     Neal Liu <neal_liu@aspeedtech.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Felipe Balbi <balbi@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Li Yang <leoyang.li@nxp.com>
Cc:     linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-4-neal_liu@aspeedtech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220517082558.3534161-4-neal_liu@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17/05/2022 10:25, Neal Liu wrote:
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    usb: usb@1e6a2000 {
> +            compatible = "aspeed,ast2600-udc";

Sorry for not noticing it earlier - slipped through the cracks. You use
here unusual indentation (not matching the rest of the example - above
is 4 spaces, here is 7 or 8).

Just keep 4 spaces for DTS example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
