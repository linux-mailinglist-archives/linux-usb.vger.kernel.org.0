Return-Path: <linux-usb+bounces-4984-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948D82C9B8
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 06:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3977A286BAB
	for <lists+linux-usb@lfdr.de>; Sat, 13 Jan 2024 05:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD74C1D6AA;
	Sat, 13 Jan 2024 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VfjzK0rV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0091A1D522
	for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 05:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cd1ca52f31so82956471fa.3
        for <linux-usb@vger.kernel.org>; Fri, 12 Jan 2024 21:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705124572; x=1705729372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maqz8OOCJx2/2Q8p+D0KjTHVWD1DBWuVM7oX4CTcnm0=;
        b=VfjzK0rVpSsVzWl1s9DGwuu5+VgF7FS61qHUrmj/MlN8/LmLSN1AZ7OVjDn6sdBnFa
         NF1OM01BEnjjK0urYX/8R0oBoOx9ByVM6+40vN71PlGFCPodUOWU/xEn5Z8aPqmSo66j
         O+QYFk9iSzGql5NBAppkl/Eofm4lZvry0LeZkUUUrWwIODGpHkk+izMlFvvZIsJTwK8M
         WGt2pmpP3ufBUoqD7kXKsZTNwWKkl4iM258Ondz1w4QzrMqCLE3I7heBWjs88Mi9VMyB
         Fz7yDqSkwHrrIN9ZvhkfUG5DXiu0fTHXTPvC9FjpGyIjM23zg6R3MQ3Lq+WTxvLkzzcC
         zgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705124572; x=1705729372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maqz8OOCJx2/2Q8p+D0KjTHVWD1DBWuVM7oX4CTcnm0=;
        b=NXOlEuPZLwR5/E846iShPZEoVwtCMf6fmBp3Uvm0qB1KkUwb+qMiCebrHeh6q8Qc2S
         wvXjWRE4fOWnSe8tCeVwCvnUvfy96+fsISSvC2HOHZ40OEP6AUsIrI8uTafo90wMV4ly
         8fizXMkZeW8lXxTWrT7wbDNZvCIlEAYRMvCmHvt5/+OWmU2B5gb90E+YTrI0EG5n6nE5
         K7SNFVAIwPUuCZL5aicyTDqn9BNMV7wIzG9BCOCLhhH0thz1WQTpBw/uimMzmvJn9d0f
         WEn2DLlxZlcevLwBAyoYowL01ulyqfr9jHyDz4c0UOPy6PzNrZy4g6NBzPj/l/gJVya7
         SEqA==
X-Gm-Message-State: AOJu0YzY9lMS0UQhDrRGEn+N96P6QyWz9B+yrovnofrrmtx+Qf49q4lE
	3YMcHAUR/n80qalDWjZZ5pist6aH7ML/FQ==
X-Google-Smtp-Source: AGHT+IFDeHpIKX8sZLltlk2rJ0XufBJkRveFWRaqQvNdBAgjYsprqO7l/OKZS3jBNPfBHCIS0NgyYw==
X-Received: by 2002:a2e:9ed3:0:b0:2cd:1d93:115 with SMTP id h19-20020a2e9ed3000000b002cd1d930115mr1131444ljk.77.1705124572236;
        Fri, 12 Jan 2024 21:42:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020a2eb616000000b002cc71e9168csm677719ljn.129.2024.01.12.21.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 21:42:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 07:42:49 +0200
Subject: [PATCH 12/13] arm64: dts: qcom: sm6115: drop pipe clock selection
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240113-pmi632-typec-v1-12-de7dfd459353@linaro.org>
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
In-Reply-To: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PoyicLEdV7BNvd9Kbg7da0oOR4R7+Utnj7Siv8A91PQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBloiLSvDsuwwJnb055Vspk3eCehqaZ6iqJZUpWE
 /oa9J0doPyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaIi0gAKCRCLPIo+Aiko
 1TT3B/4j9uDIml/uby302RFGIim5onN4fZITAgJi5BzYRNYrhVivYJZGckwa7lgZq+KhqAW9UJj
 in/pp+YCuRiluRiqqqKoj/UsGtCg7Vt1gKTuoOT9SHWZnOKG85aE0bNfb6GInCQP35IDjH9U8dq
 VNRE04ypv3ropnSofTmigJoSe4Nwl9qYtSUq1pSUwOnnM2rMxrXdLj2mfo/DD6zzjCDYospTS12
 bJSs3ep4LybvkMHu9JrXLn+DDmmzwYWS6JyMuS6Ye/OVNltGYRiEDOqgfvCvb61fAVoV++E3Vxo
 7yaz3QEovk27fdg3tGIpgogeITCjS2UBgFHDT9GZE54V2dqu
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Stop selecting UTMI clock as the USB3 PIPE clock. This setting is
incompatible with the USB host working in USB3 (SuperSpeed) mode.

Fixes: 9dd5f6dba729 ("arm64: dts: qcom: sm6115: Add USB SS qmp phy node")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
[DB: fixed commit message, dropped dr_mode setting]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ----
 arch/arm64/boot/dts/qcom/sm6115.dtsi     | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7c19f874fa71..52f31f3166c2 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -607,10 +607,6 @@ &usb {
 	status = "okay";
 };
 
-&usb_dwc3 {
-	maximum-speed = "super-speed";
-};
-
 &usb_hsphy {
 	vdd-supply = <&vreg_l4a_0p9>;
 	vdda-pll-supply = <&vreg_l12a_1p8>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 160e098f1075..76c429e8ebab 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1600,7 +1600,6 @@ &bimc SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
-			qcom,select-utmi-as-pipe-clk;
 			status = "disabled";
 
 			usb_dwc3: usb@4e00000 {

-- 
2.39.2


