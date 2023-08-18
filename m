Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582477813F3
	for <lists+linux-usb@lfdr.de>; Fri, 18 Aug 2023 21:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379817AbjHRT5d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Aug 2023 15:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379680AbjHRT5G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 15:57:06 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCB926AB
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 12:57:04 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-565f9b2f626so1015714a12.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692388624; x=1692993424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FVy8/I6+hZEhbfOu9dBJY0K2hcEvw4odHhWMeKKSlSQ=;
        b=Wa22YcrQ8hR7kutK9Cs/OH6zIDYKtTp61fXYhWf3xpUE1rqFQJonTLOePXKjLIqpSz
         j2x/7uPJk/GM8YxKmVNls9MGZGNQD3t9xkZRItjXW4vSRODwNYKArVV9kowRbFjUBD3T
         EeMVyocQhxPysCYBODX9xNHP15zKYz0J16vHc6N9tOd7MCRM+TTLKIFA9POjzFm4YkMa
         /rE9XxV5ER/TpdwhtCrq1BtafPFYepIcJeD6IXS/QzlufzIZ8EARXG8GoHoB6ufUV4My
         HRiHGcHReaBnQIPYT4DEZvQmHXqtFEJfXslFzNPFxplwDUsYVVIW/XW4jEDLtBuYeFjw
         8WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692388624; x=1692993424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVy8/I6+hZEhbfOu9dBJY0K2hcEvw4odHhWMeKKSlSQ=;
        b=KMAWazPdYjdBe5MFwZLg1kXOtll7ayTmpdbUujFGCTQMFN22j0Xdl0JiXBmN865ECN
         d9xWdMiieh/EDV4ZLxYDEDpMtfflD6top80TyI0lYzXHqY9NKpwvI4Tm31OXG+rxZ9eq
         yLJC8KG1j82FRCAG0LbDwDKJ6Po+JQ46gLj3fHxm4qAfL8SObh0mBXnhbd5plMmSGKB0
         6mRN6BleP7ECHnOYZw07e31Mb3NOfX/6Py2v7UU61v0fgU+vE+S8yVy7UtuF6Xop0Grc
         BarCNQPwXMDh+H10gWlD/LZipCpSg3WwEmH4vqVf/VOCZQBZ++xrnpL/ZZXsw+Of2ReP
         Xs5g==
X-Gm-Message-State: AOJu0YwXLLj04tiqj+8fe08QFJ0DIxK6qcCTjlCILDBmSaaXXtoCYEO6
        wyEX6d7qro/Avf23ImqvNaKvITz/0o79H4hXT3c3XA==
X-Google-Smtp-Source: AGHT+IG1AUyT+kHxOcDxv2bvger1UKXAP+l8gqMIhxZAF556A4JVr7/WDWdrcG8dpTGWzJ7hKbnfj/3TE43gBySo1CQ=
X-Received: by 2002:a17:90b:4f4a:b0:268:300b:ee82 with SMTP id
 pj10-20020a17090b4f4a00b00268300bee82mr190016pjb.19.1692388623694; Fri, 18
 Aug 2023 12:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230818102911.18388-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230818102911.18388-1-krzysztof.kozlowski@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 18 Aug 2023 14:56:52 -0500
Message-ID: <CAPLW+4kiGoHvOjKxCNxb3adL+i1V2FMbun8Cq3bw0M1aeYfjAQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: fix order of
 clocks on Exynos5433
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 18 Aug 2023 at 05:29, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The Exynos5433 DTSI had always different order of DWC USB3 controller
> clocks than the binding.  The order in the binding was introduced in the
> commit 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to
> dtschema") converting to DT schema.  The Linux driver does not care
> about order and was always getting clocks by name.  Therefore assume the
> DTS is the preferred order and correct the binding.
>
> Fixes: 949ea75b7ba4 ("dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema")
> Cc: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> index 240f41b7133a..deeed2bca2cd 100644
> --- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
> @@ -82,8 +82,8 @@ allOf:
>            items:
>              - const: aclk
>              - const: susp_clk
> -            - const: pipe_pclk
>              - const: phyclk
> +            - const: pipe_pclk
>
>    - if:
>        properties:
> --
> 2.34.1
>
