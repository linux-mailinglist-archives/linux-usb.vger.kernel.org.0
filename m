Return-Path: <linux-usb+bounces-23598-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDCAA5B46
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 08:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA3E34A09E8
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 06:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E202B27CB03;
	Thu,  1 May 2025 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RLXEqPSF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99648277012
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 06:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082163; cv=none; b=NUDlwaNTSAef0LdORuYu8UDBFqsjxoW7tcYiq1uAWqW7Qjt9Y3dzRy20J5UmsUJPmoLoaQqOE5iOQDg324gO8L6paQCjvAUO/TNcIJsvp6EB54FBpnUG4lZaG8ZjtKWtfdxUEWFRSIW25FjoKae78QK2AzXerAs+FoMt5yBS9zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082163; c=relaxed/simple;
	bh=Sh5t/bH2gJJPW7SbEZodCgPiVxpAzM0Pppe4K5oZ31c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EG52QzvMQ1bVVcrZafuSBWrIEBVnMzsi5t2NS0XGP1yzcSibKcstmyFcp7+/LPzgUQIXrHzT5yRV5h3VZJiBCJu3zmL1XAIDbmRyUuN/MiNXzOCgsu3ymLq1Pg3HwzjFs6+cUoaNfKi7gJflityzNIkB10V3I/6l74UKVrFpJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RLXEqPSF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso859116a12.3
        for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 23:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082158; x=1746686958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Igk6ayaj75+ghid1GHXFHByChbhFXicBE1h0kwGqpQ=;
        b=RLXEqPSFeuJs6GHFR1TPT5LivPP20JVWE8EeUN1wd8cixIjHzacyJ9R7aZPT15VXpS
         BX7fl3qfm9N6Fn/v1czQauA2EamEhQz3bXk+EnWGMGSmtYfnSRp9RtwbYfoz85ol7yap
         atjPER3TuFNWp6EE4ukwqBaSu2hQovnNUHrrE2HiAJeXEZmd+NbwVckBw3qD544gE6eL
         6D8kK2j5/p+GeRSaJ3Kgd6anQvD/8gHbf1d+HeIXQxURYO6GJydJJR7T6nbXULWBozte
         lgXXyOEFT58FJkEgAYPSSmd4dEX2Nj97hBUlHZWYqnWh2ZMUVkKoyHRCiuagmQh2/42Q
         3BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082158; x=1746686958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Igk6ayaj75+ghid1GHXFHByChbhFXicBE1h0kwGqpQ=;
        b=C9bPk6itCSHcv1DMlrsGRRy5/OiXVaJVwKcmbDwjaxkfnaG8VD9CpzOImW3cvIelkD
         8JkqBXFnzvarhXSv95pK5donBDspT3ypW/ay5APKIdaUe23cIycLO02h2RobsAh8KR+z
         GawwSk991/nLCPDymzeXSbBIEqk+RVaulmAxs56lnXhsVj0qEqXHToIsxCW34thZLfJZ
         kGbG3nym0YPGaSkphhnXAz5tzsGGrXXCjMeVTTpOWWDOigZwFSa03rC9qhgMGdbmdHMk
         nsijQ41ERgusosXwypcMMfyZ1X+7GlFXbFgnIVXA4AQfAd1rko2aGkICpG45MMhRol63
         4CFA==
X-Forwarded-Encrypted: i=1; AJvYcCX6YbA74coGkzf8Ep7gz7ktuA+C0kUS1cYnQO8koNKJmV0SnBDDEEvC7/UYxoOwhAJcB/YEs2WkouI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdeCpivenXGHizanv8HuNlYKWTGgBW2Zhtl5uXA4eLljQX6oUQ
	zvZkDvGUTGOlmgD49dDTFSOFdQ+ARGf2SUlX7ELJdaWe/gtRswoB+PJpcD9hPrs=
X-Gm-Gg: ASbGnctASNpGpmRWHuesRiXt8GBbmlnlLrTgWdL4RdRMq5EFuylso8lMETMyH1u17/3
	OM9END2WDIUrwpYGK4t6LYu0jvdyk0fi4K0hb9TbXrGu5mqDuxD5UK78EiB0OXBTRFIThSFKiww
	UMSGloaiz/FS2Mawn6DiNU7MoM39N0qva+GFCDf4CPUNpjZMGTNCdUF8JcD+oqaiXPCmmsx9T5L
	t4VKPxs5eEtLa4p5FUudLCcLVX/FinpP7PFHpwG7I+AC5feCX2dRjnaKFhUU+jN1CtSDRcMmHR4
	hnwXnWnyw/o1NiKOBTXv2ZT//70Z85TjBpCl82J1Yn83lWOZSZbju0PwTEIUUaD4WYLjpM3klaf
	zi/g=
X-Google-Smtp-Source: AGHT+IGVxD0MSnxKGSW58BMIJjAYV2RjRFnNb0AvJCsbEYNmr3gmdyyW8NV4x2iCSwgQ93sstTrkzA==
X-Received: by 2002:a17:907:1c2a:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-acedc552691mr545705466b.9.1746082158623;
        Wed, 30 Apr 2025 23:49:18 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:51 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-5-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Enable USB audio offloading which allows to play audio via a USB-C
headset with lower power consumption and enabling some other features.

This can be used like the following:

  $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
  $ aplay --device=plughw:0,0 test.wav

Compared to regular playback to the USB sound card no xhci-hcd
interrupts appear during playback, instead the ADSP will be handling the
USB transfers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi              |  3 ++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 36 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 92a2f6e0c3d856eb2549a89509486979a7439cd8..864874472248dbdc5ab6483108bdb286afa77de5 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2956,6 +2956,9 @@ wifi: wifi@18800000 {
 		};
 	};
 
+	sound: sound {
+	};
+
 	thermal-zones {
 		aoss0-thermal {
 			thermal-sensors = <&tsens0 0>;
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 71e87ab929551b339216a5fa583833ed8661a606..60ad7884c635ec28a3706da506c16a78b3214265 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -19,6 +19,7 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm7225.dtsi"
 #include "pm6150l.dtsi"
@@ -955,6 +956,12 @@ channel@644 {
 	};
 };
 
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+};
+
 &qup_uart1_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power
@@ -1023,6 +1030,35 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "fairphone,fp4-sndcard";
+	model = "Fairphone 4";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	usb-dai-link {
+		link-name = "USB Playback";
+
+		codec {
+			sound-dai = <&q6usbdai USB_RX>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai USB_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <13 4>, <56 2>;
 

-- 
2.49.0


