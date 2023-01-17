Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB3F66DC03
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jan 2023 12:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236787AbjAQLOO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Jan 2023 06:14:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235245AbjAQLOD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Jan 2023 06:14:03 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFD0222EF
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:02 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id q8so10137022wmo.5
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 03:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5c6PQv5GDgoyaWnn5uofPaSB861bzKOXtS7P1VBEJ/U=;
        b=Nk/wdM/1VqUObTxcVlYCjIrEQiOGg01+NejeWKj3A0J0beqUDjQppB8tjx7tBpvlkr
         rngzVdxAPrEZo51OICubrBRkuIyx58Wu8ssiLWJOMxUNByovxd8mQ/49jpjupLAmQfjC
         iOQRZk1hPaV+HJYW4HJZVjt2uIhEHcowGRcV3lieECu5lsvrByPBb6Vv4ioKXwdE4LrW
         NoFPu0Gjt2z3g12+u59NAC60TaBR6mMknCF7h7nA4W29YuIC6+8mBNc0dV39+ZO6v9OE
         tmkSXoli1xeWAZOBR9Xj1AK3BKtirK/oFhFfttnofHpq2paqhlgdPS6ya2eVrHNf7WKb
         dftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5c6PQv5GDgoyaWnn5uofPaSB861bzKOXtS7P1VBEJ/U=;
        b=wuTVXDaos4GGpOZ71hOKAbu4Je8pQqRO4C1rqEgpzgEcCDwlx9OsEqMcaMEDSpNxZP
         oZq1rp/NZkiCbtbOkV/2XgPwuyEE5QSw3qDNinLM1GGZ6R1OOZ1ERRUsr6dzBUXJBnC/
         r6M6C9n05VQdnVIkJXQu9yCy95NGH5RAgbi0KKmdgyHNnjCOQ9qPP2VrPDn/61IRjRSX
         O4sT+qbFf/mRGGq1Fa0LMfOG9sUkAk1CzZolNazEhlUUHJBO7hX6AAPHc5WJpNIqiRUx
         CtF+6+YzCwf5EJ5pEBGTq6o0Nt53AVyQKBVDS545dnZjSbHD/yNnUezkA8qe+lqPLLeA
         VsQQ==
X-Gm-Message-State: AFqh2kp89/oCz4n0bGgBhY2Ore+fiYvGg+73C6AzduyC+tbZsOP8M8mA
        stHVD5tBGN9icvnl/KwDIRrPew==
X-Google-Smtp-Source: AMrXdXuJrE/xyfiC0e2ujkxah8GjLYIzyARgUfH5DW/c0SrRHy2YVO0pgerg1muM2XJiTBtv7/MUcA==
X-Received: by 2002:a05:600c:1e08:b0:3da:f443:9f0f with SMTP id ay8-20020a05600c1e0800b003daf4439f0fmr2682284wmb.18.1673954040940;
        Tue, 17 Jan 2023 03:14:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c350800b003d990372dd5sm46086006wmq.20.2023.01.17.03.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:14:00 -0800 (PST)
Message-ID: <d1d2ca7c-bdae-9c68-398a-8efa151dcdd0@linaro.org>
Date:   Tue, 17 Jan 2023 12:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND PATCH V4 1/5] dt-bindings: usb: tegra-xudc: Add
 dma-coherent for Tegra194
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230116151917.94193-1-jonathanh@nvidia.com>
 <20230116151917.94193-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116151917.94193-2-jonathanh@nvidia.com>
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
> DMA operations for XUSB device controller are coherent for Tegra194 and
> so update the device-tree binding to add this property.
> 
> Fixes: 394b012a422d ("dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support")
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V4: This is new in this version

Same comments as before resend.

Best regards,
Krzysztof

