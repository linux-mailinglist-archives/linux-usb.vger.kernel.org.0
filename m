Return-Path: <linux-usb+bounces-4707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EBC82365C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 21:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8F841C244A5
	for <lists+linux-usb@lfdr.de>; Wed,  3 Jan 2024 20:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F081F959;
	Wed,  3 Jan 2024 20:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HzbOpo2c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6E1EB4C
	for <linux-usb@vger.kernel.org>; Wed,  3 Jan 2024 20:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-554e902064aso8605947a12.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Jan 2024 12:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704312960; x=1704917760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yKEX12Nc6DjhIWZVWWjaSHZ/t3DyThSHvq2IuZgMy9A=;
        b=HzbOpo2cyGZFFT6+WlYsqlA+5C1WdLM34TYKq76XxxqDS4JxZqOeZ/CGm7K7iTTZWF
         syxLV/iSHp6ZYWg4X+DALhlAsB8iIozeQ4d9dXYyZgM1Ok9yimpkPxFWa0nAr0epGjd/
         hqV/8IGycZF8V0Qg82rKbYW9w5IxXi411XLCBfv7v8aWEtym8Od9oQpdm/F5BarRJwgA
         rKXFWILNLVxMpsITZ6lVgAR6un08Rj5Z5XsAymxq54Joq36izl8dZNp9qJ2KIMNK9ZPw
         vxo5GqNWkGkZ9zsxSbENE6d0Kw1IoN+2Em4oEv83PY5GH1qOHtSRgssakvim8yKNtEBj
         cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704312960; x=1704917760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKEX12Nc6DjhIWZVWWjaSHZ/t3DyThSHvq2IuZgMy9A=;
        b=CshSk5Dx4isbJ/3sIl+5pPFYhcoiPGn6uaj9iUiUKmWxj6FNxYO3A6VJA+KTyrhiJk
         WASJAiaKyTAzfskPUOuKr3y9J3QU+VfDnm2HmAp13lz9VYn3Ip/y16jahUQOxfH7u4Qr
         SB/vwbY+jsuBhG3aqUqF0tNjNPRG+/NmsZ2ZlyeXwGmlunUauHZDADw4GPvimwSiICvG
         L2WpYYpW4qwFkM/vVHJuo+Tp/w2T9Yp40ou6Z2MaxvDJhDiraMEvp0kWz/dPPfResR2d
         rvcfDL/WnHdj4rFVs4LNDo7VpOtqiuBqqihMyCfowenDch1lv4YpKN1oxWy7FsNJDRJL
         iT1A==
X-Gm-Message-State: AOJu0Yy0uKKKbAfdLsiXfWlWPzHufXjMlD6tjdrKfHNmnEpuxy4eGfTa
	zpN4svwkO2OBbElrz1AR72bxCT11zUoYwA==
X-Google-Smtp-Source: AGHT+IHGBkq46I3bFv2XJv6gtLYhVLjB1InDN1jLNbKI/me2ByK5wd6gPOHoPurroyLMqn+nmLf0jQ==
X-Received: by 2002:a50:eb0c:0:b0:552:d00a:2837 with SMTP id y12-20020a50eb0c000000b00552d00a2837mr10533229edp.52.1704312960076;
        Wed, 03 Jan 2024 12:16:00 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id fg9-20020a056402548900b00552691fc7f9sm17549670edb.66.2024.01.03.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 12:15:59 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 03 Jan 2024 21:15:37 +0100
Subject: [PATCH v3 7/9] arm64: dts: qcom: msm8998: Remove AGGRE2 clock from
 SLPI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v3-7-a66e698932e3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704312946; l=889;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QUVffHTCSnWfsgGf1+xud40WCLg0YN+mizl7weLMh3w=;
 b=F9SiuNHQoFhocMEUUpWIY06aYxFlcou+Qit2pKRbW8/aBdr8x3BX/URHRZ0Z1OVahQFaFYvZA
 y6LzikAvXx8DrTM0qgTxDZcR5Qu63KADCZLgPyDs/EaxS3JcT5zIS2l
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The AGGRE2 clock is a clock for the entire AGGRE2 bus, managed from
within the interconnect driver. Attaching it to SLPI was a total hack.
Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index bb591c6bf573..2793cc22d381 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1605,9 +1605,8 @@ remoteproc_slpi: remoteproc@5800000 {
 
 			px-supply = <&vreg_lvs2a_1p8>;
 
-			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-				 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
-			clock-names = "xo", "aggre2";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
 
 			memory-region = <&slpi_mem>;
 

-- 
2.43.0


