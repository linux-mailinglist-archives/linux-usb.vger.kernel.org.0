Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A4B788513
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 12:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244465AbjHYKjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Aug 2023 06:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244496AbjHYKix (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Aug 2023 06:38:53 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 927B4198E
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 03:38:51 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-52a250aa012so1153190a12.3
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692959930; x=1693564730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3C+86T5StrlLjJhPZobulBJ5EM1n9ZhQMafts6OhmY=;
        b=Iny/APsjg2ZXEcZFuPYahGnFXzs8Q673KdHP1n472FNMvhnQWGofqWgUnF49fL9H4j
         psTf3gW2UqW4XbRj1XFRwBcpF7O7kr6M7yV3tMs6l+Zei6sxDEX2Nf01ijNoabDSpYJg
         9F0FEjPZDm8DyIuovK0QdtM44Qnd0V7HDlXmxmllZO09wj9zZMigiCJj8Ikl6TdGk//i
         /M9zfowc1aCclRT7FVoDSdueNEuS1IkmX9zyeRh3J44wvpHWkcrJzU4L174L6lgtwq1q
         Yl3I8Wp/EwvZSGqIJFrnDCyrdALRjWVgDH1B6dU3frUdRWzAGe772l4wz4/8CcT//qbC
         Gnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692959930; x=1693564730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3C+86T5StrlLjJhPZobulBJ5EM1n9ZhQMafts6OhmY=;
        b=k5mwKvXS1gc5Pdq0648WWPxUQpacJ4tE6YyErjVG6yOFJXC7vuoyqYaVqNA/YyhMX3
         /Xxn1PUJ7j7HBqilN+R+q+AlHUiO/TrB32jZz3AmoR5PZHJVHz0ZMujyHXbfXFQowyPv
         jv6aL//18FulGMcltNFdJIPd0ap94ZFfR4TbB3NLjV6YtLB9JajuZo4quiesFx8KXDdV
         nKUgV1gWb3PKCh5WKZOAymD+Y6XIOxNFthMIt7BtlVv/tRA1M0+gy/wjPmQy2H9gvhle
         6VCBosmPG6l3TRw7LV4uzr204303r4Ke89ZQMGCS4noFlsNcgnsZR+Tev2uzV3Qh14wa
         dlYA==
X-Gm-Message-State: AOJu0YxDqvT/dDnuZ9k3vVonUlRGkdRtsdbJn+kKB9PUN+yWa3TucjH5
        B41fTHNv7mTciz/poKrb705e4w==
X-Google-Smtp-Source: AGHT+IFN8932Eby5S9OZDlGNpVF0+Zju5KfZZSZwwcQkQWqVLGGgaDFmghzjTCLMy5XUEKel54LPSg==
X-Received: by 2002:a17:906:9be3:b0:992:3897:1985 with SMTP id de35-20020a1709069be300b0099238971985mr14396652ejc.43.1692959930048;
        Fri, 25 Aug 2023 03:38:50 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id r22-20020a170906365600b009a1b857e3a5sm818029ejb.54.2023.08.25.03.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 03:38:49 -0700 (PDT)
Message-ID: <5373a7b5-df23-47df-b732-60a31c1ea6d0@linaro.org>
Date:   Fri, 25 Aug 2023 12:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5018: Enable USB
Content-Language: en-US
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     Amandeep Singh <quic_amansing@quicinc.com>
References: <20230825093531.7399-1-quic_nsekar@quicinc.com>
 <20230825093531.7399-6-quic_nsekar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825093531.7399-6-quic_nsekar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/08/2023 11:35, Nitheesh Sekar wrote:
> Enable USB2 in host mode.
> 
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index e636a1cb9b77..cdf5e22ec54e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -70,3 +70,15 @@
>  &xo_board_clk {
>  	clock-frequency = <24000000>;
>  };
> +
> +&usbphy0 {

u is before x

Best regards,
Krzysztof

