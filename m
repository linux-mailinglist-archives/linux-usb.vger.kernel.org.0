Return-Path: <linux-usb+bounces-4702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99414823648
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 21:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2C31C23C12
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 20:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9070A1DA26;
	Wed,  3 Jan 2024 20:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LaXd1qRG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61CA1D541
	for <linux-usb@vger.kernel.org>; Wed,  3 Jan 2024 20:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so3156757a12.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Jan 2024 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704312952; x=1704917752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDBL+ZocNtOP6hdOYdCIjY2YelurQjTsh53hsAvej2s=;
        b=LaXd1qRGQ0wa8uJINhDf0axDrJbOUQvQ2XG70f6OzCKJGjJ+iyaF3YQRf9Anc7+IN3
         2FzUyvO3jjjRwlWWkdK1defGim0FtMZGON89EqchFS2+YIsc0K/eoVxb/Xk25wEVBPzU
         UU44XzMXayA7MOiOHw012rZwtcopXIgy2uuxffqJubXVLqk4xUhi1yxGpJ0sYSUmW4PW
         5HldCB9RF25QsrSarbmOYf4J/Uwiu+fQuiaZy/EbOonlJWnlvkdqHJuZQxyVCgKXxXY9
         wxhl/JfVM//YBOMSYsZwg7dNSqq2y7UtdFKF+X52KF5NrhpP1OuGlIcWvvKOp+BW2QVg
         wX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704312952; x=1704917752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDBL+ZocNtOP6hdOYdCIjY2YelurQjTsh53hsAvej2s=;
        b=C8L6fl/loQwYNprmlb15pRY9jZggfjqtBMC901yZLjn7S6JSfziW4tShKeiqgBPOYD
         XtH/OGr2WPliriZsHAgaWQuhKD8aIblRhlgfHCJgsmhS9aVcl7Y0xaChY3Gne+DiQMMz
         C42IzPPQe2/pUDn3EyUhoNvWl/0nxcrUeW81ibmfSDbMS1PeqIrs8G3LaAMTqCBxXFV/
         U2xLzdjxyB+yiYONBXfskOcumKtJq6JnmBjZgnMTVrjdehVZxLoS9cAX6lI78UI18UML
         hBhNd/+cgBStKRzztlylGOKcXJSJGtvEMw+UpH6szlaaExRU3qlt2+EbtzW3ekirDscI
         Y0og==
X-Gm-Message-State: AOJu0YxaDJ0bXtmugyFq6rwJIO9d7wiNOAzqL72z7yRW9tS8wGOGEyd0
	CSJu64pzGGREX6hfIoi5RjB0bv7CL1+Bww==
X-Google-Smtp-Source: AGHT+IFq8/tH9MdIJtzW2XmGC4rUW27NUasEFUqz6pRuL6RPg4bUdev1qVb/uaXX1RqljrAB4L8dtA==
X-Received: by 2002:a05:6402:228a:b0:556:f13c:f537 with SMTP id cw10-20020a056402228a00b00556f13cf537mr104634edb.66.1704312952133;
        Wed, 03 Jan 2024 12:15:52 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id fg9-20020a056402548900b00552691fc7f9sm17549670edb.66.2024.01.03.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:15:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 21:15:32 +0100
Subject: [PATCH v3 2/9] arm64: dts: qcom: msm8916: Drop RPM bus clocks
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v3-2-a66e698932e3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704312946; l=1623;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Cb6EkrvDlISC/vJRhBJBoI3xr7u+kqmI1z+hE1DNnAQ=;
 b=XAndl2eWyF+UJpGi5bb0fmCJjHBpe4Yha4R6ToFN5IPMmLxgOzRBBsv9MrICCEYrwn72ddNcN
 wciE6o3Ppu2BOeRkwg7Fb5h2MWLZLQbtRennRYZ5K7vDjjc50G5ELXb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some nodes are abusingly referencing some of the internal bus clocks,
that were recently removed in Linux (because the original implementation
did not make much sense), managing them as if they were the only devices
on an NoC bus.

These clocks are now handled from within the icc framework and are
no longer registered from within the CCF. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 7f8327b0dbdb..e423c57ddd41 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -540,9 +540,6 @@ bimc: interconnect@400000 {
 			compatible = "qcom,msm8916-bimc";
 			reg = <0x00400000 0x62000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
-				 <&rpmcc RPM_SMD_BIMC_A_CLK>;
 		};
 
 		tsens: thermal-sensor@4a9000 {
@@ -575,18 +572,12 @@ pcnoc: interconnect@500000 {
 			compatible = "qcom,msm8916-pcnoc";
 			reg = <0x00500000 0x11000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_PCNOC_CLK>,
-				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 		};
 
 		snoc: interconnect@580000 {
 			compatible = "qcom,msm8916-snoc";
 			reg = <0x00580000 0x14000>;
 			#interconnect-cells = <1>;
-			clock-names = "bus", "bus_a";
-			clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
-				 <&rpmcc RPM_SMD_SNOC_A_CLK>;
 		};
 
 		stm: stm@802000 {

-- 
2.43.0


