Return-Path: <linux-usb+bounces-837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6647D7B42A1
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 19:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 9ACCF283332
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 17:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D591FC5;
	Sat, 30 Sep 2023 17:22:47 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298871804D
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 17:22:45 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB4BB7
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:22:43 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso23591446e87.1
        for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696094561; x=1696699361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JWtx9dHqmbOflZi0fnqEVpNoq1UTPPJzLzExwXGV3SI=;
        b=IknSE4NhxLd8C0Gi9Fu65zdNIo3A5eb/G8M5qFxaUpcZN+knVIjanOK3H7NJH26L5x
         DYbt/4BSv8gka0/8XyzBuZ/GoPHLNgaqlrp/o1F0gEs1qazFbtgSCByiqfCBdgvrYxgW
         F/5TPGxYyRh5EX+DanwIo45Vp1cV2uEGoaUJl9QxaiZqYamYs/8uQg7hLvdouott4jHV
         kRHLsFfgrRtrUiN/w51R5sltChvXJsFGZyMpfJLTYW8eTVr4Lfkj8+BQ93l1eeHXs9YR
         vZN2GgYdoCgYePnPMan3+EnIs7zWLgO7dKk4RMKzh5gInW8D7eU/l9yqWN9RltHZLVxW
         Ee/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696094561; x=1696699361;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWtx9dHqmbOflZi0fnqEVpNoq1UTPPJzLzExwXGV3SI=;
        b=WkbNFuBvHiNcb3YQeB3ueAUfncBNyzaTjWp+9oAIQFNre3jqa2DZxC7VEkTT1YSKKf
         SSH/6PJ2Cc5s7b1wbe4E0NlSqKd0Nr7tt8HmnmrGNJ6fAt+R9PXenCceOdeC07Tnpwyq
         LL5BuD819z57vuYm17vcePJ0TddCGd9M5kNfV2uljJkXCJqJPvFS+hsIEK3AxghLIIa6
         xXET+ZQoR2/6h+KTQ8JKEUb7yqRw0I+xWsVsssmln062B9UtaDTgtbYkJ1EGi64ark/d
         cGXesjUC6deo5KkVfQO3q5cefuWGRxk7brZL3slWZOJbfbOdXG9SJUbkTPqRlUngGC29
         WDgA==
X-Gm-Message-State: AOJu0Yw6AtbWTy08BTP1aMl0UEr67BTfYstJRIImvgdOPLT+xgb6Iauq
	TvrXgUcxeYQEfPYaIfkTSG8GRg==
X-Google-Smtp-Source: AGHT+IFmPULHC/lTZvEAMtHRivlmdkecp21az20I0qHWTzyMMavZ5xJfz8FMnJKA5soibKeUp+nyEg==
X-Received: by 2002:a05:6512:3a8c:b0:502:cc8d:f20a with SMTP id q12-20020a0565123a8c00b00502cc8df20amr7139739lfu.27.1696094561376;
        Sat, 30 Sep 2023 10:22:41 -0700 (PDT)
Received: from [192.168.246.189] (85-76-98-178-nat.elisa-mobile.fi. [85.76.98.178])
        by smtp.gmail.com with ESMTPSA id z8-20020ac25de8000000b00500ba43a43asm3994414lfq.86.2023.09.30.10.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 10:22:40 -0700 (PDT)
Message-ID: <5bf11343-6ab4-43a8-b12d-f2b072ce388a@linaro.org>
Date: Sat, 30 Sep 2023 20:22:36 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: ipq5332: Add USB Super-Speed PHY
 node
Content-Language: en-GB
To: Praveenkumar I <quic_ipkumar@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 kishon@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, gregkh@linuxfoundation.org, catalin.marinas@arm.com,
 will@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 arnd@arndb.de, neil.armstrong@linaro.org, nfraprado@collabora.com,
 u-kumar1@ti.com, peng.fan@nxp.com, quic_wcheng@quicinc.com,
 quic_varada@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: quic_kathirav@quicinc.com, quic_nsekar@quicinc.com,
 quic_srichara@quicinc.com
References: <20230929084209.3033093-1-quic_ipkumar@quicinc.com>
 <20230929084209.3033093-4-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230929084209.3033093-4-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 29/09/2023 11:42, Praveenkumar I wrote:
> Add USB Super-Speed UNIPHY node and populate the phandle on
> gcc node for the parent clock map.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index d3fef2f80a81..b08ffd8c094e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -158,6 +158,29 @@ usbphy0: phy@7b000 {
>   			status = "disabled";
>   		};
>   
> +		usbphy1: phy@4b0000 {

Are there other USB PHYs on this platform?

> +			compatible = "qcom,ipq5332-usb-uniphy";
> +			reg = <0x4b0000 0x800>;
> +
> +			clocks = <&gcc GCC_PCIE3X1_PHY_AHB_CLK>,
> +				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +				 <&gcc GCC_USB0_PIPE_CLK>;
> +			clock-names = "ahb",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			resets =  <&gcc GCC_USB0_PHY_BCR>;
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "usb0_pipe_clk_src";

I'm not sure, what is the best approach her. For QMP USB and PCIe PHYs 
we had to use fixed names historically. On the other hand for QMP DP 
clocks we are fine with the generated names. I'd prefer the latter case.

> +
> +			qcom,phy-usb-mux-sel = <&tcsr 0x10540>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>   		qfprom: efuse@a4000 {
>   			compatible = "qcom,ipq5332-qfprom", "qcom,qfprom";
>   			reg = <0x000a4000 0x721>;
> @@ -200,7 +223,7 @@ gcc: clock-controller@1800000 {
>   				 <&sleep_clk>,
>   				 <0>,
>   				 <0>,
> -				 <0>;
> +				 <&usbphy1>;
>   		};
>   
>   		tcsr_mutex: hwlock@1905000 {

-- 
With best wishes
Dmitry


