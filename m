Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2A5572EBC9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 21:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbjFMTRm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 15:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjFMTRj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 15:17:39 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496E2C3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 12:17:38 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso10054385a12.0
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686683857; x=1689275857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93qZriFSRFXKcWPzylxuUuCclKMCIydNYI0fQlylMiE=;
        b=YqPr33OceNzDlHmWcCZ8VZkcvJcZxD4IIpSNePFd3i00YG4JKWk2ppEy1QGpSYA/S9
         egAWndeJj+c9tOLbj5tbvrmfOw6nW1ap3AmizpUOpYoNGndDCaxkSBaoI9n/2HCyjJII
         SVONdOFjrqyE7g6QBSkhGMGZYv1CQnfsQ7KQRkZNW50vXv4BLQCB+Hi4ylZM1gZImhRX
         jZXUWl7Hp9uw0O0GBwYYeh1STCE+rG1jRRhnjo2w1VH3FKFzkB/GOt1WGGYo13+Mn5Ey
         +E13zylpUFU+yRsue6SpzZ7ikDle7IUsfGeqZcDNvFTrRUrH30Vt37Y3i4IezDRv3FM4
         jWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686683857; x=1689275857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93qZriFSRFXKcWPzylxuUuCclKMCIydNYI0fQlylMiE=;
        b=Dh1OwctzOv3aolQl7b8zlu0UnA1nTP7QY4Jf0+108LX2z6M1BQc8Rh7wYm/Ln8/WXk
         HPt7AbjP5Rv9/6uL44JViJCEaMwZzz9PNkBYeHMcfzVgZzPQc9yfYZYmE+GhYe7w4D7Y
         lZxD1Y0Prv+eq+ss7lHy/rFgdpaTR3/iN5f/GEVATwTmyLEd7KiL5JF4Xr2n24QN78z4
         dAm1s9yAbj1ptWCLZxGF2UPzB6FdwfGNf87wKk7ssufT2srnWjWummVvo5wGLUTc5udh
         WeqT0H6J8og8mL5hhZfYS7PXIjbqAAtMhS8Tm6SAxASujPN7LB82jHGnNSbI+bH5rs9o
         bFyg==
X-Gm-Message-State: AC+VfDzWA99odFis1sj6tlRJsJw5Kqw0apffMkKjKAcDVTNlz2qdgxpW
        GrE6Qb6LgQRu9V6a4qM+vUeikA==
X-Google-Smtp-Source: ACHHUZ4UY2DC8kT7+5aDoOESAH1A6ED4BE58jwrTzmeHd9E9SqXiJLo8ZrtWO1FYNdZBlkD5mZ5ovQ==
X-Received: by 2002:a17:907:986:b0:971:1717:207b with SMTP id bf6-20020a170907098600b009711717207bmr15907519ejc.35.1686683856689;
        Tue, 13 Jun 2023 12:17:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u1-20020a170906780100b00977cad140a8sm7006621ejm.218.2023.06.13.12.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 12:17:36 -0700 (PDT)
Message-ID: <224e69e6-ac1e-70c3-c0b3-4b72cc3cb0ad@linaro.org>
Date:   Tue, 13 Jun 2023 21:17:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] dt-bindings: phy: mxs-usb-phy: add imx8ulp and
 imx8qm compatible
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        jun.li@nxp.com
References: <20230608033642.4097956-1-xu.yang_2@nxp.com>
 <20230608033642.4097956-2-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608033642.4097956-2-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/06/2023 05:36, Xu Yang wrote:
> The imx8ulp and imx8qm are compatible with imx8dxl. This will add such
> compatible.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - no change
> ---
>  Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> index 1b6b19fdf491..1395a982c387 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> @@ -32,7 +32,10 @@ properties:
>            - const: fsl,imx7ulp-usbphy
>            - const: fsl,imx6ul-usbphy
>        - items:
> -          - const: fsl,imx8dxl-usbphy
> +          - enum:
> +              - fsl,imx8ulp-usbphy
> +              - fsl,imx8dxl-usbphy
> +              - fsl,imx8qm-usbphy

Keep the items sorted. Your previous patch also had wrongly ordered
imx6ul in enum.

Best regards,
Krzysztof

