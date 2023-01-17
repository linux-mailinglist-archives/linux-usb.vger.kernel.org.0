Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B19766DC0C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 12:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbjAQLPI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 06:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236817AbjAQLOV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 06:14:21 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D979533463
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:17 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id z5so29141950wrt.6
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cO6AFziXGC+KpcHbu+/A+8FnY3OCRPyzyDvT638H6Jw=;
        b=pBMQiXW3+m2rhClbC5n2voc9R392J9OF8Yk0XJszmwDflUiQUldtELr3MnMtGhqYTu
         RebSBP7v3lIbmLA1kAPUBOw9RmyF8tSVRjYpgeyCEDAxwb804+rlb4mu7XRjnu1R/BGE
         lkT/bUYk2qvKdy3nYVv9BztXqRLXwuXIyNG6z+qAkhZnUdoyvFMQmo/WqLluAQl9NOAZ
         sc1t8QEKaEiTiSgFxpIkmhhAyAWWY+3e3eTaYl2BbU4x+oAfIADyVeGpVhtIHDoBqHVS
         ylUvVN4FBV2sUdIqqMILMioIo7TqG5zFk9YkQdaVZulz+S9FQwrIsCHQe9vs0c8raP6H
         gvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cO6AFziXGC+KpcHbu+/A+8FnY3OCRPyzyDvT638H6Jw=;
        b=wZbvxtP2RwXm0mn0AU5UsFOaiZ60x7ce9AM/FP+RfVnUZw6rsDv7tmeZNomC+FGc6O
         hfd5JS+oABLefIhUTn9HMJ7YvWGbk5PzvNG1UD64Jo3a1vYBTbnQXtOvrjD3FR7myOLg
         1CoyyrCwX6XiTQu4sZ83NmXf9JpXziODUw7p6bJMquGqRjhY9K3QLqTJGcVBzgrJdBeI
         adUgEO0u+6o4WBZQVYXGePmNsQ3IVkuVQ+cqYfsRLUfW84Z2lmO7MdjDIz/pFywkJh0O
         ePtyYo22LZ/eFZ8E2uhrWVhVmo6MB9u8a+ImcAYXTAwAmdUJRM2r47e7otDzDwupuU1p
         1dOg==
X-Gm-Message-State: AFqh2kr4Vo0PgzUNIGLl8cuXjqZoJYmeybP8OBF9ppoIApXGIDKQMab0
        +0/friBM9zuI+bYppxP8uyIWNA==
X-Google-Smtp-Source: AMrXdXsx+EXkd6COJHr9h/kPZW5zweiWKz4Wsfvp/OGcbhJMuA5X4G0yWz2vjpJw720RK590iR2o+w==
X-Received: by 2002:a5d:43cf:0:b0:2bb:dca3:b29 with SMTP id v15-20020a5d43cf000000b002bbdca30b29mr2279070wrr.36.1673954056055;
        Tue, 17 Jan 2023 03:14:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c1d8e00b003db0673ea0asm1749607wms.15.2023.01.17.03.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:14:15 -0800 (PST)
Message-ID: <cd2dc5bf-7609-341a-adb1-87471c41072f@linaro.org>
Date:   Tue, 17 Jan 2023 12:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND PATCH V4 2/5] arm64: tegra: Add dma-coherent property for
 Tegra194 XUDC
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230116151917.94193-1-jonathanh@nvidia.com>
 <20230116151917.94193-3-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116151917.94193-3-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16/01/2023 16:19, Jon Hunter wrote:
> DMA operations for XUSB device controller (XUDC) are coherent for
> Tegra194 and so add the 'dma-coherent' property for this device.
> 
> Fixes: bc8788b2f3a0 ("arm64: tegra: Add XUDC node on Tegra194")
> 

No blank line.

> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V4: This is new in this version

Best regards,
Krzysztof

