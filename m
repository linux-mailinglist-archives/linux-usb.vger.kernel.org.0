Return-Path: <linux-usb+bounces-839-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB37B42B2
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 19:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0F5C7283779
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 17:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357CA182C0;
	Sat, 30 Sep 2023 17:25:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26DAD31
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 17:25:28 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24330E1
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:25:27 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-504a7f9204eso5303635e87.3
        for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696094725; x=1696699525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K3/pQc7G9YXn5ECWFLpWUyohMguEa9gLmKEtRixcmtc=;
        b=S77KD6BGqbGLE3Ikhiq0IdVL9tYiYQDuuGg2WY/ikBieqQFlFHNbh9/mtZ1i757krJ
         1MEg979yPpUNma09//qR9HqO1lBkO2QD/0fveshtL52nt8ppftZ9iiGiG4nUC5u05i4c
         wJK55KXnVVPxOIFcQI+4p4KFKYiD6b7a2LsqBM07k92avaepfpx8omnK/h0WTcAxmnOp
         loCCBzdoccSY4dODBD6nEQ5lng//50DFPuyKCnml3j6e08k69oKhFfvTqM3LaLDC3kco
         vw777LAlUOQH9V4VvqtEfSJz7F5S8DSc6n+Fyd9HYKBL/XVQQ9lWizeFQ2+TeDRNwgcY
         Rk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696094725; x=1696699525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3/pQc7G9YXn5ECWFLpWUyohMguEa9gLmKEtRixcmtc=;
        b=HMh/9XiBldIk7uRsbO13m4UwI1Folh3WYKYcs314HA3Wv5G9S/PNbEL6lwiJv6XP3y
         jty+JEkYbj11OQZcUUuU6K6EOFc0NgXfb6xGwULmS/EIJ1r87BnFKpXtboysfjAyeHVf
         95eMJKfg6HTjv3ZrlADLRh5Hmn7FaQZXiyWso605fu4Q6lgmLAIRBEGpS1+0jZg62nTu
         cmjOflLlQ4cXV11ZRikO6NdgyXpe4Ae7r+GALua5ZL/m/3yuuPwPAExKlAAmbihrQ7BN
         JEbcgW3keC9jSzC+RnCl0UGZsF5oteP7P+0bczpQl6SMWEnI1z+ev4XMEzZxmhXrmRtq
         KtUA==
X-Gm-Message-State: AOJu0YzF0GrjP0ZNBWB7oURNBfh9vjVbDa0JqDflOSSKqMGMk+mfME35
	zvSZNfT3KwJ3MzsLCJzWCGNkbQ==
X-Google-Smtp-Source: AGHT+IHk9azgmfZgCNdAFYq2Dl2bXcIZ52kyt8A/dpLS9o+udZJ2qDbPgdpuMwMxbDEVb3AxRgL35Q==
X-Received: by 2002:a05:6512:3f7:b0:503:3680:6722 with SMTP id n23-20020a05651203f700b0050336806722mr4914648lfq.46.1696094725336;
        Sat, 30 Sep 2023 10:25:25 -0700 (PDT)
Received: from [192.168.246.189] (85-76-98-178-nat.elisa-mobile.fi. [85.76.98.178])
        by smtp.gmail.com with ESMTPSA id z8-20020ac25de8000000b00500ba43a43asm3994414lfq.86.2023.09.30.10.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Sep 2023 10:25:24 -0700 (PDT)
Message-ID: <356a4f97-a483-4202-a6da-b48351d9b209@linaro.org>
Date: Sat, 30 Sep 2023 20:25:21 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] arm64: dts: qcom: ipq5332: Add clocks for USB
 Super-Speed
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
 <20230929084209.3033093-6-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230929084209.3033093-6-quic_ipkumar@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 29/09/2023 11:42, Praveenkumar I wrote:
> Add aux and lfps clocks in USB node for Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5332.dtsi | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index b08ffd8c094e..1813b9fa4bb5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -336,11 +336,16 @@ usb: usb@8af8800 {
>   			clocks = <&gcc GCC_USB0_MASTER_CLK>,
>   				 <&gcc GCC_SNOC_USB_CLK>,
>   				 <&gcc GCC_USB0_SLEEP_CLK>,
> -				 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
> +				 <&gcc GCC_USB0_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB0_AUX_CLK>,
> +				 <&gcc GCC_USB0_LFPS_CLK>;

This looks like a strange change. Usually the DTB is considered to be 
the ABI, so older DTBs should continue to work with newer kernels. Is 
there a reason why the AUX and LFPS clocks were not a part of the 
original submission?

> +
>   			clock-names = "core",
>   				      "iface",
>   				      "sleep",
> -				      "mock_utmi";
> +				      "mock_utmi",
> +				      "aux",
> +				      "lfps";
>   
>   			resets = <&gcc GCC_USB_BCR>;
>   

-- 
With best wishes
Dmitry


