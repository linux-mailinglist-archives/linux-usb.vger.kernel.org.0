Return-Path: <linux-usb+bounces-4709-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55452823666
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 21:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE5FAB22F2A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 20:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6932033E;
	Wed,  3 Jan 2024 20:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yaH2ymto"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AE200DD
	for <linux-usb@vger.kernel.org>; Wed,  3 Jan 2024 20:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e835800adso6940798e87.0
        for <linux-usb@vger.kernel.org>; Wed, 03 Jan 2024 12:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704312963; x=1704917763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agWOk7w6rgV8y2OB/j9TiP5HID7PZwKq37+MydcMd3Q=;
        b=yaH2ymtosQorCjffDM2nq133azvGr/KkHcFP2jkaXGKV3hh+uqJV5wI42eNBMnTHGb
         tEjGWN3xgf8s07+C0L4KsA+8tSh1gPVHuUh+JlFWUJnEUcnXwCvi1yta/ZsFV1qGDn0l
         upDS8XYcVQ7PcsSSHr+15vt9k5GlzE0x/u0fM6d6SWDpSOtyu1KufVMOv7DaEZcJDnuK
         DfVAgLpog2eZUTtufVi2SR9N71gZF/s9w6z2AVrp3LU7J43qW1t2w+Aqdqj7JH46ZE/2
         QDlhqoKKNSEgTmgmm6ew9kcZWmWInVbqCHd1iLDFGu/URiotvGZmVUsBl2elb+ir2P2U
         mlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704312963; x=1704917763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agWOk7w6rgV8y2OB/j9TiP5HID7PZwKq37+MydcMd3Q=;
        b=nqxmIcIgTd7xRN8xE3wb3KwIxXy/Y5cEkuqH/DhmcB259/Vd3J1qORtIGtmmo0g0b4
         ITG+nmeFyDq/QhA2uhcnRVyup9SKCIvIQSZGfotA7h4JeIkYKkZ+5pyl5B1gKTaW6TdU
         GlFIt++QR8MEWUdcRnSWqKRyz121WhNTMK88hyydvVcGWuSDylj+EwC/9eBic4qdCXUK
         0MDSvQ09boV2cuSYcpO1JFm1W9QoEvl4CHnhVS5N936muxFT7HiYuufNWOQ4ZTQcByJa
         uUPylNtWOqpp4r5xSOpJN+ZqoYg6GFclvAJVVFsV7Gjl9p6gl4xze7NkZ92KXrzU6AH1
         h0MQ==
X-Gm-Message-State: AOJu0YyoB9QGg6uw9LNNGRMyrUvI0OvFsyj72bE3hATFs5XIFONDKNNl
	O0DmMKVsIAx8Zv0Zy/3eV/xKOSCbLVzM8g==
X-Google-Smtp-Source: AGHT+IHKQKRuYd+I0nrZXegy4ZNvuCWzu8ez/JtqTR3BixAbs6pNVBJay8L2h0a30COQ6YXXT35IFg==
X-Received: by 2002:ac2:41c2:0:b0:50e:7044:704b with SMTP id d2-20020ac241c2000000b0050e7044704bmr4312375lfi.90.1704312963418;
        Wed, 03 Jan 2024 12:16:03 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id fg9-20020a056402548900b00552691fc7f9sm17549670edb.66.2024.01.03.12.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:16:03 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 21:15:39 +0100
Subject: [PATCH v3 9/9] arm64: dts: qcom: msm8996: Remove PNoC clock from
 MSS
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v3-9-a66e698932e3@linaro.org>
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
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704312946; l=1234;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=lDN9I443Hl2d8DVCOQ4aNKeHtWkZFlxqcP4xR6KB6zk=;
 b=EL7JckzCpuqfY1C5Jg62k+EicmGHKeLrQolwseYXNXDeyuOumzO8IUKBRA1/gjGZHSoJP9ld0
 vGGnQXQ6jTrDDzjCYW3tjwB9ltzeS8AaO4BPUKpSSvZ2h7SNgJOFm1t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The PNoC clock is a clock for the entire PNoC bus, managed from
within the interconnect driver. Attaching it to MSS was a total hack.
Get rid of it and take the liberty to make the clock-names entries
more readable.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 174eb410824b..8d41ed261adf 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2513,10 +2513,15 @@ mss_pil: remoteproc@2080000 {
 				 <&gcc GCC_MSS_GPLL0_DIV_CLK>,
 				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
 				 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_CLK>,
 				 <&rpmcc RPM_SMD_QDSS_CLK>;
-			clock-names = "iface", "bus", "mem", "xo", "gpll0_mss",
-				      "snoc_axi", "mnoc_axi", "pnoc", "qdss";
+			clock-names = "iface",
+				      "bus",
+				      "mem",
+				      "xo",
+				      "gpll0_mss",
+				      "snoc_axi",
+				      "mnoc_axi",
+				      "qdss";
 
 			resets = <&gcc GCC_MSS_RESTART>;
 			reset-names = "mss_restart";

-- 
2.43.0


