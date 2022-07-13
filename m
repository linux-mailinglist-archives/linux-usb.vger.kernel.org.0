Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E689357387F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 16:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235802AbiGMOMg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 10:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235187AbiGMOMf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 10:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 07761326FF
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657721552;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YhNVgFhX89B7Or7dxJO6r91xjY7lqXIdMrL3sFKe62o=;
        b=AlLfBgvKinI/jy2ccoVbqybBo/BAMR5BACLEUd44tVgNwrn2gdAS5tAdmSOPmeEyuYrh8O
        NNOJvoeBc+8ATFCpPN27/F3JYwzgHhfCmFxE6t6AFhWLV5y7ErJd3sxmL4XbAH/d+mjohx
        EGnis2r1tucfq564h10TqYGmnL6wVKU=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-gE9JLUJlP_Ojips6rdXwrQ-1; Wed, 13 Jul 2022 10:12:31 -0400
X-MC-Unique: gE9JLUJlP_Ojips6rdXwrQ-1
Received: by mail-oi1-f197.google.com with SMTP id r24-20020a056808211800b0033a0214cfd0so4698873oiw.4
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 07:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YhNVgFhX89B7Or7dxJO6r91xjY7lqXIdMrL3sFKe62o=;
        b=QfvKuIsCmzYIux1oA4uqO8RK2QtZtSsp5G0B5BNHO9/8J2OPEi73jbKexHzhKbhdsV
         ycwku7ock2/c+jCobjtp6qr7RNIquS1eYAg8cyRlvY4O/c7bNtn+6f0/O6194UCfvLfO
         pMS0vo6J5QEtQ4Xgmgg/++GNoP112XFaoF0R4VtvHeVpHqyR4wnpfrdwoHemxbN20xGk
         nKRIBFqUfq/vU7Wbp3mOFM/A50eP55xcULoR7mjL8TJksC+eDjAJoAtcfj7qjr91m0pu
         YZsVrJrZgmJk1Cd4LxQf4hqKb9Aqnz9PZM4voytxBoMH9Gvqg+q4WQ5w3Dn4ZFVxnuVT
         0bKg==
X-Gm-Message-State: AJIora+1wTLRWmV2aJGsATBt/LSgEm/cm+a4dPQmhA1aaQOnIjSKokiY
        eBkJqwoAwxYDMwBzv3XS7OzkHIxlEMn3xbMXIo1tPNYASnD1Gu6pxUtarfpjHR/vlxqXkCIM1oN
        Lu79PraUK9mugoUbxefJr
X-Received: by 2002:a05:6870:73c7:b0:10c:24de:63d4 with SMTP id a7-20020a05687073c700b0010c24de63d4mr1824451oan.76.1657721551046;
        Wed, 13 Jul 2022 07:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1spJxbEpfi2ss2QX18y+16qhda8NVczHl6f2bXHBKRgiIdBeWnn3ihlz7RHzcUQDgWHPCHuqg==
X-Received: by 2002:a05:6870:73c7:b0:10c:24de:63d4 with SMTP id a7-20020a05687073c700b0010c24de63d4mr1824432oan.76.1657721550855;
        Wed, 13 Jul 2022 07:12:30 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id t17-20020a056830225100b00616929b93d6sm4860341otd.14.2022.07.13.07.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 07:12:30 -0700 (PDT)
Date:   Wed, 13 Jul 2022 09:12:28 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc8280xp: fix USB interrupts
Message-ID: <20220713141228.5z5rmgepj6mepjyp@halaneylaptop>
References: <20220713131340.29401-1-johan+linaro@kernel.org>
 <20220713131340.29401-6-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713131340.29401-6-johan+linaro@kernel.org>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 13, 2022 at 03:13:38PM +0200, Johan Hovold wrote:
> The two single-port SC8280XP USB controllers do not have an hs_phy_irq
> interrupt. Instead they have a pwr_event interrupt which is distinct
> from the former and not yet supported by the driver.
> 
> Fix the USB node interrupt names so that they match the devicetree
> binding.
> 
> Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index 45cc7d714fd2..4a7aa9992f3a 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -1875,8 +1875,10 @@ usb_0: usb@a6f8800 {
>  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
> -					  "dm_hs_phy_irq", "ss_phy_irq";
> +			interrupt-names = "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";
>  
>  			power-domains = <&gcc USB30_PRIM_GDSC>;
>  
> @@ -1925,8 +1927,10 @@ usb_1: usb@a8f8800 {
>  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
>  					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
> -			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
> -					  "dm_hs_phy_irq", "ss_phy_irq";
> +			interrupt-names = "pwr_event",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq",
> +					  "ss_phy_irq";

For this specific change to pwr_event:

    Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

That being said, I was reviewing this against the (fairly old)
downstream release I have, and the IRQs defined there look like this:

		interrupts-extended = <&pdc 12 IRQ_TYPE_EDGE_RISING>,
				<&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
				<&pdc 136 IRQ_TYPE_LEVEL_HIGH>,
				<&pdc 13 IRQ_TYPE_EDGE_RISING>;
		interrupt-names = "dp_hs_phy_irq", "pwr_event_irq",
				"ss_phy_irq", "dm_hs_phy_irq";

The part I want to highlight is that the "pwr_event" irq downstream maps
to <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>, but the current upstream
devicetree I'm looking at has it mapped to <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>

Do you happen to have any source you can also check to confirm if this
is a bug or not?

Thanks,
Andrew

>  
>  			power-domains = <&gcc USB30_SEC_GDSC>;
>  
> -- 
> 2.35.1
> 

