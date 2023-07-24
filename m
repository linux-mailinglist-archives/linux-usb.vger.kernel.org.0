Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E73E475EC7F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 09:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjGXH2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 03:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjGXH2J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 03:28:09 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48773194
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:28:08 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99454855de1so597718166b.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 00:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183687; x=1690788487;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1D7JxGWEi15YQpN/MEZ6bQcN7S94G0+H/CxjK29RS8=;
        b=faR0wBZhnjEyT3jTR/OEuxkp1ixI21qjkLt8Ljp7L8XE1eTvWQjExM6nZ/oDBytvBw
         XMqwzPtWaBvLPAkdxs0LPOcUzkAlRM4yWyzcuUVqgkDsYIQ4XrMXHzaEgUi1zD3zU3QU
         6r2dC4N60wMq9jMhO/tJ273L662zZ97eSGTUJqS89RMSH530h+DmR4OGyvm5rFFIxV8y
         Tuxbv855OYiIytYyZv9QvSdjUtRl8+WB0VIlMqTK4KP6TXYNHqgSrxL0wizOWlrsF2Km
         /15jL/3LI4uY/rp05NJcZpKbfDBKZi5CRohw0ronofbYMvXvJbPdG10ofJGLcJIDs6Sg
         MzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183687; x=1690788487;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1D7JxGWEi15YQpN/MEZ6bQcN7S94G0+H/CxjK29RS8=;
        b=a0wCzjRh/bXqbQnyJFQl57bApovBnyJ+VqmS8s155LrCE5q+PvBk9OiXxRd5JB0+rT
         qiV2W3rpk5WPeH2oXMHmjIfrz2TYaAryUaA8peDdeHKkBTusuKuVxRUWUq4Aol4fZfrJ
         +h0reKYrTydYJD2y/ebJsSS4H0PdfrefBNcBVQlQMh2S9+6Nl+QpJZZ84v0iDShxLXq0
         YMCZ5WMFrRL8MeFoXafP/sbtNuhdkKEshLvTFW835FZxEcjR90HkRLo3XxWry+G7qTDA
         6PAfaj9TlP0ndixJruoDIHMJvHsY8oQkGtchp9My0ctWcRWT9dITIyYNBowWo7/oPUVM
         N3kw==
X-Gm-Message-State: ABy/qLZJCAI2szTNFzbDdv6XyeaeyRljb42ctQXiTmlLgJ2a0X+yQwT3
        stR4sV/hi2/HnkuVbFKvhXJFWA==
X-Google-Smtp-Source: APBJJlE2IUEn6ct2v9AAPUywPVrAOq0jB1Eco8sKlwYRZOxosCrijoMGlJOOnVwMhb3ELPSySwtQhw==
X-Received: by 2002:a17:906:5a60:b0:98d:d6b2:3377 with SMTP id my32-20020a1709065a6000b0098dd6b23377mr8530684ejc.30.1690183686834;
        Mon, 24 Jul 2023 00:28:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rk15-20020a170907214f00b009927a49ba94sm6284600ejb.169.2023.07.24.00.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:28:06 -0700 (PDT)
Message-ID: <62995eb7-70c4-3f2c-c874-6a5f196b1859@linaro.org>
Date:   Mon, 24 Jul 2023 09:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] usb: dwc3: of-simple: Add compatible string for
 Intel Agilex5 platform
Content-Language: en-US
To:     adrian.ho.yin.ng@intel.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        p.zabel@pengutronix.de
References: <cover.1690179693.git.adrian.ho.yin.ng@intel.com>
 <42ae4193a9f1383fae49ae84917c7cf1d1d1bbd9.1690179693.git.adrian.ho.yin.ng@intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <42ae4193a9f1383fae49ae84917c7cf1d1d1bbd9.1690179693.git.adrian.ho.yin.ng@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24/07/2023 08:37, adrian.ho.yin.ng@intel.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> 
> Add compatible string to use this generic glue layer to support
> Intel Agilex5 dwc3 controller.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
> ---
>  drivers/usb/dwc3/dwc3-of-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
> index 7e6ad8fe61a5..3c4640a7e663 100644
> --- a/drivers/usb/dwc3/dwc3-of-simple.c
> +++ b/drivers/usb/dwc3/dwc3-of-simple.c
> @@ -175,6 +175,7 @@ static const struct of_device_id of_dwc3_simple_match[] = {
>  	{ .compatible = "allwinner,sun50i-h6-dwc3" },
>  	{ .compatible = "hisilicon,hi3670-dwc3" },
>  	{ .compatible = "intel,keembay-dwc3" },
> +	{ .compatible = "intel,agilex5-dwc3" },

NAK. Your binding says something entirely different. Explanation you
gave me also says different.

Best regards,
Krzysztof

