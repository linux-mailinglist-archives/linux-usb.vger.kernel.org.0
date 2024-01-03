Return-Path: <linux-usb+bounces-4706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51635823659
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 21:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7C92857E2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 20:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA4E1EB5C;
	Wed,  3 Jan 2024 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="je0E91ZM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166071EA84
	for <linux-usb@vger.kernel.org>; Wed,  3 Jan 2024 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e7d6565b5so8019970e87.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Jan 2024 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704312958; x=1704917758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hbiB6tdnnMQ24hCb1VT6gYRHp21EZ3VUAmZLEGkw/Q=;
        b=je0E91ZM5QdWXGqCP9KoguqCBQOyUD0YD+nDpCmDqMrMo/kcJ4dZWT9nrNX2Xt+HHV
         OFelW/zKjM7oa1mnLaxKgBwN4Pa24db6zwrH90O2LtK7o14RxzmmNY6M2fKYzwoCR/Ds
         be1kynAGADWA469HJif653hdxEGUmcdnjT4yh8dT9xxW+OXaJbiwxb1A2Jg/+OnTLaCY
         zeA2fknGSgIs+J9fceJnaXDvYRuvB9iJIxisS2vPklcBFp6f8AmTTp5RtihCgOPfugyb
         bt7HohvOKZCS3IptkzfrgAYkAXt3L5S8I7WJsHm+QU6iLlv23n1EoJXYRbvDkN6rEF0Z
         Pv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704312958; x=1704917758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hbiB6tdnnMQ24hCb1VT6gYRHp21EZ3VUAmZLEGkw/Q=;
        b=VE5Zxp3m3b1r1ZMOHwmeGLRdeOBCNHxrrGlwoAafTqWePpBmI1FHucETblAVtKVj1D
         YC2hcfZlJ3J/KDmjRwvK+asUZfG18FrpTc6s0+bJ3NEO9WxButuOORjsoN9mjueD3VFl
         Dpb9sn5q7Y4mMjR5/Roy3Nj89/eZQfVgIDtaGiv0Zp6p7PjhiIYBPimu6r52lg2yb9SX
         XMVcV5T9zbDNaN5MUQnYUC9eEZrk1npfI5t9lSsq6cJtxPHG/yFJwpc++r8iVoyvhAk7
         GC8qioJ27Zwvg8/2XeocWJji5po4G3Cj56JYX4MAUzV8GVDkj87TY29rFmgy8vi6xnwU
         45OA==
X-Gm-Message-State: AOJu0YyNR1IcjnyDaVusfGz8JHOXyPn3QrGQmdv4fOizN7IGplGRw/T9
	epxaReGe17GlCCwMwftNl/3BXcSXyG41FA==
X-Google-Smtp-Source: AGHT+IF+PX1H5YpNkKHol6f02kdPeRx82Wa/Rkf4Fpbw5Q1iLBaNpm5ydmT3t4fBzavvFWxbsSKc9g==
X-Received: by 2002:ac2:4e4c:0:b0:50e:5aab:a287 with SMTP id f12-20020ac24e4c000000b0050e5aaba287mr7355382lfr.8.1704312958294;
        Wed, 03 Jan 2024 12:15:58 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id fg9-20020a056402548900b00552691fc7f9sm17549670edb.66.2024.01.03.12.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:15:58 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 21:15:36 +0100
Subject: [PATCH v3 6/9] arm64: dts: qcom: msm8939: Drop RPM bus clocks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v3-6-a66e698932e3@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v3-0-a66e698932e3@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v3-0-a66e698932e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704312946; l=1930;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=iAST6Bi3i5Py4hFCq2uz7LHvVl/s5kvpbNjyyM0F4x4=;
 b=2R6ks9a76Dvsfe5auiqvqhip6ClBOvXKYnTJ/pC1kYCapQIL5V0+tMo0rRPly12pPuyHEcmVG
 iL8baUaPiu3DK2b7qA+EF263xvgEHrlXW/wWUiNYedw8B+8WEeBL2hc
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some nodes are abusingly referencing some of the internal bus clocks,
that were recently removed in Linux (because the original implementation
did not make much sense), managing them as if they were the only devices
on an NoC bus.

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 29f6bd9df2eb..82d85ff61045 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -602,9 +602,6 @@ rpm_msg_ram: sram@60000 {
 		bimc: interconnect@400000 {
 			compatible = "qcom,msm8939-bimc";
 			reg = <0x00400000 0x62000>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 			#interconnect-cells = <1>;
 		};
 
@@ -648,25 +645,16 @@ restart@4ab000 {
 		pcnoc: interconnect@500000 {
 			compatible = "qcom,msm8939-pcnoc";
 			reg = <0x00500000 0x11000>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 			#interconnect-cells = <1>;
 		};
 
 		snoc: interconnect@580000 {
 			compatible = "qcom,msm8939-snoc";
 			reg = <0x00580000 0x14080>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 			#interconnect-cells = <1>;
 
 			snoc_mm: interconnect-snoc {
 				compatible = "qcom,msm8939-snoc-mm";
-				clock-names = "bus", "bus_a";
-				clocks = <&rpmcc RPM_SMD_SYSMMNOC_CLK>,
-					 <&rpmcc RPM_SMD_SYSMMNOC_A_CLK>;
 				#interconnect-cells = <1>;
 			};
 		};

-- 
2.43.0


