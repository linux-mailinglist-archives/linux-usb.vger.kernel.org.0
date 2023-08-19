Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5F07817FB
	for <lists+linux-usb@lfdr.de>; Sat, 19 Aug 2023 09:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344178AbjHSHLd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Aug 2023 03:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344293AbjHSHLP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Aug 2023 03:11:15 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4E74222
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 00:11:11 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bcfe28909so200555566b.3
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 00:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692429070; x=1693033870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gbh+zj6TUQz7WB8MTKvhqMntfC0KIpevkiEL4WE+7h8=;
        b=spqFUb43eAt5lhdQMZj8mCAs0BwOlGvwjs+RLniY/rjuAoQnVoxsrf8xwRl8StWQUX
         qqrc62LMvqd8pw5o6XBemv4H/Fxl2ABqGBgj/XTWZeZGN+FyRHcoXDZ6Yvb8SW6Fjzj0
         DgWH4BV2el3S6MPwP7Vq5vpdhmSlXgKqHT6Tujj8r8me6nOdXuhDc+17FtMOhYL9JHcx
         qxLCqvaSiZgJoMyKDjhlibeG3/Jp76/VdzD70h37b5L3uaOzzDWeRcfOGSihM2tX9U1M
         Efpe2zcfxC2ZmHxqykJDwqHb0WWtNKH3ryUI3BwtkhLNymOmdUDOwhlLCMPwayMWCTb0
         Q2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692429070; x=1693033870;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbh+zj6TUQz7WB8MTKvhqMntfC0KIpevkiEL4WE+7h8=;
        b=k6Dj12gLDceml/2XkI67Eo7pL80IvY7taMYHF1+m6Ranzp2wbeSG/yzv1jqvkZ8LuQ
         mgYIamqRdBIiuuJb49t7H4vOFopBzZXAeG3xb1obEQPaVUqWQfko5sXbGSEhWn0jQ3/L
         EvwVrYbv/ntHIghCraDWmToHVgFZwYI32oIjQmhpljZDTm2qzAHPk7rbghAPAd8eB5Lc
         iKudE1CoI/R+JQ6Rht79JWp9ZcAqkFegFAC2JOmu9RDVGtcW0nMDJxm+Ce9wEkbLN58c
         2P62WczF9dRNpW9vXFp4gnIYTngHF0QveNWL7Y+NXe+fGF+AwFj4+58NP3HM8NZw4srQ
         kKCg==
X-Gm-Message-State: AOJu0YzCQzLeSJPqcG50FbQ8U6fBhgzyyqKY5VRIObRNEKu4UKRcXl5Z
        9vxUDcGvJRTd5/+8HbdQtmtetA==
X-Google-Smtp-Source: AGHT+IGkN3LlsbRazKDBXLBfvXRO5WxCook3IWgnrdlgh47mG8ypb8zcrg/RgcRHXhCd60RFy311Kw==
X-Received: by 2002:a17:906:4d2:b0:988:8be0:3077 with SMTP id g18-20020a17090604d200b009888be03077mr770298eja.31.1692429070122;
        Sat, 19 Aug 2023 00:11:10 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id fy3-20020a170906b7c300b009894b476310sm2158982ejb.163.2023.08.19.00.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 00:11:09 -0700 (PDT)
Message-ID: <517510a4-ab77-c34e-0fcb-33761786936f@linaro.org>
Date:   Sat, 19 Aug 2023 09:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/8] dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos850
 support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
 <20230819031731.22618-3-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230819031731.22618-3-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/08/2023 05:17, Sam Protsenko wrote:
> Document Exynos850 compatible. USB 2.0 DRD PHY on Exynos850 has two
> clocks (ref and phy), which is already described in bindings.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

You should probably split the patchset between separate subsystems, so
Greg and Vinod can easily pick up their parts.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

