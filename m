Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 443364F77AB
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 09:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241902AbiDGHhG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 03:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241943AbiDGHgu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 03:36:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704DC1A54E4
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 00:34:44 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id x20so5338890edi.12
        for <linux-usb@vger.kernel.org>; Thu, 07 Apr 2022 00:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=D0eewgzwxQKM6rJm3nMWSPJRt+DNSKba6io2SPOxSUw=;
        b=Z62JlS8D0nSV6/VKnpdKI7q7XoAQgwVimEZAlXcOruIWVu8e12ojkZCGKrX/0ZSlgv
         Kp82XWDG7rdVVyPgnHK1mgBnr2JsyHR0yxXUwvhepp1VLr8zFelNlP07ytHOEOWjr2L+
         m5BDXBZz4fonZV6mVCCRYXamTNR6K9FYSeXre37O3DFvXy/Ydw8Z77YKi1SCYhinGj9Y
         Biu9Aq/7tb44Jnq+w6+KhJBwOf4p9JBYM7cYdTZIc4ev1Y2mESKgguEfWBAhah54uD2f
         BJdMmn5ENX997m1grd82HbZzgfChTo6HXpsZ7PudpUvYYB4OuS4ct3rM1QKO9k+7r+35
         0ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=D0eewgzwxQKM6rJm3nMWSPJRt+DNSKba6io2SPOxSUw=;
        b=Da4Qm0lmGAQTSKlPU0I+dKcuqaP5wPUn3fDvs9W7Lv2VMkcs4a1OtF32DBrYBsqk6f
         alZ2vaT6iMm2j2OtACTd6AuG5n3U5wjqjzOVkqrpDM+Om955gGsnpyFQnNGHfcwJFTwp
         x+bK6CsJ4GXHQtljGSW6xSI8+PPEwcAcW0jp4p5E33Pjs5tfD4zy/eKi12SSsmCDQppm
         VocXVvMtFAYf7Hi3Ktf6SupqeWwCLXAKeGz3tWywR/py4Zrcf/wA/8lheI6s/Gk3RvYX
         cq9wM6pjelBeWXUFnfw3byoebcqInVWIUAYheFV1zH4H+UXmAmuaajDxaKwFeaFP6h23
         mDsQ==
X-Gm-Message-State: AOAM533mf6+qZ2TG9zi/HXjxmfreFdr2WJ44LgKVjpgYKU525DAlWpGt
        xgwiTyj7Rh0F7hZQfZPj/Q7lLA==
X-Google-Smtp-Source: ABdhPJxFuFxmy/rxMdEhYWXQIH/1JyMCkjI+Js9rkyfTp2rZ3T+uDfui+0IYKUP5knnDnKoHCzd/hg==
X-Received: by 2002:aa7:cdd9:0:b0:41d:10cc:7904 with SMTP id h25-20020aa7cdd9000000b0041d10cc7904mr80897edw.202.1649316883063;
        Thu, 07 Apr 2022 00:34:43 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id b5-20020a17090630c500b006e8044fa76bsm2998844ejb.143.2022.04.07.00.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 00:34:42 -0700 (PDT)
Message-ID: <6b070220-a8f9-f2a2-72b7-7adc807ef754@linaro.org>
Date:   Thu, 7 Apr 2022 09:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: Add documentation for AM62 USB
 Wrapper module
Content-Language: en-US
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220406135214.6989-1-a-govindraju@ti.com>
 <20220406135214.6989-2-a-govindraju@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406135214.6989-2-a-govindraju@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/04/2022 15:52, Aswath Govindraju wrote:
> Add bindings for the TI's AM62 wrapper module for the Synopsys USBSS-DRD
> controller.
> 
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---
> 
> changes since v2:
> - Removed the implementation of detecting the role from the wrapper
>   driver and moved the implementation to using linux,extcon-usb-gpio
>   driver for role detection.
> - Updated the binding documentation and example to reflect the same.
> 
>  .../devicetree/bindings/usb/ti,am62-usb.yaml  | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
