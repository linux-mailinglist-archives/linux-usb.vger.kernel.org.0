Return-Path: <linux-usb+bounces-841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829157B42BD
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 19:27:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 359862839D7
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 17:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621D3182D1;
	Sat, 30 Sep 2023 17:27:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58D9182A2
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 17:27:40 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4553F1
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:27:38 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-503065c4b25so23368200e87.1
        for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696094857; x=1696699657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1esDqgq5T+kok5ueaCGLW9C7Tb/ZQUvYJBezpRqqynU=;
        b=iFS1+XVjx/MRL0qSa545fvWlrHYxf84NPHkqGeHPUWR4gy+BbXZYLA1u4q33f/Wd/Q
         abtFzF0SiKlUa1ht0PQ75Q0opB2fZPp979qHS4zdSNFCuGdbTnmPiiq7tdEQMNDA9T18
         ql7A5dun1jjfQvJrQj/Kw8AuqN6X1dvuR392ZZWv1THlfppQ8oSokw0JY5OmKlP3rG/s
         yWnF1/Tje1BnSxHfqOMAFaVH23v0zfG8iNQSEYatmlWDnUiJaW9NUJqhkgQmaiu09RV9
         srpssoZHPzvl1A+CU1WhQoijSbt5pOfhNzsrjaYq1vwzyQWm4+GljFSU+/IcsGUSro08
         +Hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696094857; x=1696699657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1esDqgq5T+kok5ueaCGLW9C7Tb/ZQUvYJBezpRqqynU=;
        b=ww4Orj5woO0DXA9S/DIvbSIiDUakvS1EB2UjUHiAlS006za4x4oNTOrnJ3i9BhnSjU
         3tsar+xjlfk+g1zaMb4b/sHRfETkmwhH6Kn759dxU+0I7Mh6/+1xGk/TCOKnVTZ8W4xl
         roBxj7uYuu7o2gvL4iLEhIp9LxftamP2/BVmGIZzN+j/GXlSgyiqnhrxHZwSUWOw1jkw
         3ekGPj8eDftysMg0L5A6sHMUIA1Wr7hnEAzUfXFZOZSuI5pBqXCFW1FfsFXHcVqXndaT
         4dc2ixvp7XEtDkuGT9UKDDJypQEm0xlf5SMe4vL+SzXHuZrLp26xoBGiVr+urrJHldcN
         8dkQ==
X-Gm-Message-State: AOJu0YzC1agdedEzQ+t/NMmAMnxq4yq5W4VKiy3uUnV7Mx3qHlTapYKW
	6IrrmrCz/H2m2uLYr+3wAGFGrQ==
X-Google-Smtp-Source: AGHT+IGW8pBqaaoPrjB/MmYzrMfiR0lUdFnOEoGcH/Kv0byQNThkUo9CXJPl8eHVnzwlIQ2tH11BeA==
X-Received: by 2002:a05:6512:3902:b0:505:7113:1d12 with SMTP id a2-20020a056512390200b0050571131d12mr3223204lfu.3.1696094857086;
        Sat, 30 Sep 2023 10:27:37 -0700 (PDT)
Received: from [192.168.246.189] (85-76-98-178-nat.elisa-mobile.fi. [85.76.98.178])
        by smtp.gmail.com with ESMTPSA id z8-20020ac25de8000000b00500ba43a43asm3994414lfq.86.2023.09.30.10.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 10:27:36 -0700 (PDT)
Message-ID: <cc6e2145-ee6f-4872-9c47-8f618b47dc27@linaro.org>
Date: Sat, 30 Sep 2023 20:27:33 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: ipq5332: Add Super-Speed UNIPHY in
 USB node
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
 <20230929084209.3033093-7-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230929084209.3033093-7-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 29/09/2023 11:42, Praveenkumar I wrote:
> Add UNIPHY node in USB to support Super-speed. As the SS PHY has
> pipe clock, removed "qcom,select-utmi-as-pipe-clk" flag.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 1813b9fa4bb5..8fe4e45bfc18 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -349,8 +349,6 @@ usb: usb@8af8800 {
>   
>   			resets = <&gcc GCC_USB_BCR>;
>   
> -			qcom,select-utmi-as-pipe-clk;
> -
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges;
> @@ -363,8 +361,8 @@ usb_dwc: usb@8a00000 {
>   				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>   				clock-names = "ref";
>   				interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> -				phy-names = "usb2-phy";
> -				phys = <&usbphy0>;
> +				phy-names = "usb2-phy", "usb3-phy";
> +				phys = <&usbphy0>, <&usbphy1>;

Ah, I see now. Maybe usbphy_ss_0 or something like that would be a 
better label for this PHY. I'd expect usbphy1 to be used for other host 
than usbphy0.

>   				tx-fifo-resize;
>   				snps,is-utmi-l1-suspend;
>   				snps,hird-threshold = /bits/ 8 <0x0>;

-- 
With best wishes
Dmitry


