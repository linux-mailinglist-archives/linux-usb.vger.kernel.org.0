Return-Path: <linux-usb+bounces-10585-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7378CFDD0
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 12:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0B0CB210E0
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32BF13D60D;
	Mon, 27 May 2024 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYP8TUHT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D80813BC30
	for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804241; cv=none; b=BsxQ/GClUPj+XhdBy9RsI51dIK6kd6FePUtob4ED1rLOvYFP21CkPt+dpW5kb633W+xahN2Ch6oiOcG05LzLQZF46oms5mUovEHeQRzB5MqDK58TOrwllfLs4XY0j0glCgYeb01SoYPOa+UqHm8JT+/ceCWbyo1Cs6O2H7GbzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804241; c=relaxed/simple;
	bh=1f4iet1HTBS4Mmb9vrYq33EtT3IRuk2VufwStag23ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLlSOhdPM3QLHkb/F/g+dzGCPiIU0igesG1eH742l7CJlmFODN05EVWDTMSa2E0sxmuaHE8lsiRiBv7vCN1jYF1owmMZ0KF17chwt0jEcjByWX8My3r94YyGQCeYoYXTE3CPp2uedYv1HrJXBMLO5bN5EmFruHBqfwQD9A5LI1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYP8TUHT; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e96f298fbdso20087531fa.1
        for <linux-usb@vger.kernel.org>; Mon, 27 May 2024 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716804236; x=1717409036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhsQ0AxYI/taNxhIBwrt/kibagKuJoiy3QOR9Xxw7P8=;
        b=lYP8TUHTIJePAfWJdEPzAnEt8Kh7WBp/xPLomukaY+kqYLesQ5HpCgh4GnhSqNr9ta
         iAPj51nuBc4TwPAPuzI02JLxDscZJC0l8knqxQ26SCx+akIjP0+FNB6XMwge644kG+S7
         67BKApyWakR6WTfSLCbOCAeWi2BnEXQZ5i86tI+BP0QjZBXmGm2WOZPg7raz0Q4IkVXG
         PLBZwrSfk7tIwLl0zfidTmyolmzh/ccN+YzeTXZ+a3qy/jPfiV+etSyMtIYzRIHfTE8w
         unz8F+h8MEVBsGi33ISJSyUMGgZb9FlOLaLqCcPqPvmIqN7SFOWxTeA8+3vq4kbhBxgG
         nbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716804236; x=1717409036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhsQ0AxYI/taNxhIBwrt/kibagKuJoiy3QOR9Xxw7P8=;
        b=g+nZa4jUdGonzeq/TKLEiAKriI4J1/qLDQy5eYaYksCb2D0dKbfKdL4iy78dIxpmcr
         RFwi9oe2QVr5XsuiMQJdCbu6CfRt3XInXprCbrGYxSqg992dpDgSaaQe/oy26eFlhQ0K
         wj2QuTgdr6TZ6GRV1xsMLzZntTMlxMb7wnokeLy+F3z2FYdlZ6Ttb//XD+jsL026cI/N
         /K6hZGCo2VUuEi6WavuBvPZ2RQ70ZXrwlW2kISiuNxLGNoGkorsVxSOPVI+gj7y1D3Uc
         dnvDS0B5r4loZID0aCdkgxK+KzUmCGzXB8Z5XOK4+o28zzXUvsEsH3h0a9Ku7IOLvXcD
         qXXw==
X-Forwarded-Encrypted: i=1; AJvYcCUJZrqzNJJAlTPkEqp1xp4II98Dt8eLTNex9RwTBdIiaQY2olqLNM2ySUXds4JYRWdlqDWdaCB82BPifL5T/3FfBdhvOH+e79eV
X-Gm-Message-State: AOJu0YxOLogvVrkQFBxp2S/43m7WIPa2aeodV5aMr87BpS/ei2hqcBFU
	CB/g3/ukgy40lo3A8UyyzZgBzyZUVrEPUQYuN3taiGakdxMi1S6zyAhn9N9oNz4=
X-Google-Smtp-Source: AGHT+IGYiaW2TNvfPRe1lCeGg51g38Vwx2MwekE6ExyMeiFb7GB6hnlqxRDoGzQKKTAAll+RXubLTQ==
X-Received: by 2002:a2e:87c7:0:b0:2e9:794c:19ae with SMTP id 38308e7fff4ca-2e9794c1b09mr11532141fa.23.1716804236189;
        Mon, 27 May 2024 03:03:56 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4bdfsm18616651fa.63.2024.05.27.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 May 2024 13:03:51 +0300
Subject: [PATCH v3 6/6] arm64: dts: qcom: c630: Add Embedded Controller
 node
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-yoga-ec-driver-v3-6-327a9851dad5@linaro.org>
References: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
In-Reply-To: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=YLVMl0P34IY99ph1CvUkOzuJ/s5orG53vowWD8rL0Ds=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1pIVNvKRwkBM9WvbTntr8P4TFebN+nsx/mOewXZtpSsE
 dh+XW9DJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmsk+L/b934JLwV5p9IeUO
 V0Ped3HMC9vCpuwmFOr2sufbLemZj36bW+q2hXp/fVupcLPNXeKeY+C6xj0c+tllYrFXOe3z/Jj
 LGadysFSqT/0Sk5SQL3dJ9V/ZotBDW4x8r5nYb0+ZX+PRteNmf2BrXGOjjbR1uKZBeUXN7ve/r1
 4S9IjdIuXhKOqck/Hg4dSeirwZDzdd9sz7IP9D3WRv3f+Gi88F/76K1hKqK486acVWqbT5QFFd0
 pSV7HIrxX/dKos/sscmpFrh+6EzJY6FLq/EtXja2OZJyr5af/WhXKp37X71K+8qVN2ME57t+R8/
 0SmLme/Jer44r3orgzNT698lz25bnjFhZUfj2rsyFzcBAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Bjorn Andersson <andersson@kernel.org>

The Embedded Controller in the Lenovo Yoga C630 is accessible on &i2c1
and provides battery and adapter status, as well as altmode
notifications for the second USB Type-C port.

Add a definition for the EC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 47dc42f6e936..d975f78eb3ab 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -370,6 +370,66 @@ zap-shader {
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
+
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-c630-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ec_int_state>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "host";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ucsi0_sbu: endpoint {
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "host";
+
+			/*
+			 * connected to the onboard USB hub, orientation is
+			 * handled by the controller
+			 */
+		};
+	};
 };
 
 &i2c3 {
@@ -694,6 +754,14 @@ mode_pin_active: mode-pin-state {
 
 		bias-disable;
 	};
+
+	ec_int_state: ec-int-state {
+		pins = "gpio20";
+		function = "gpio";
+
+		input-enable;
+		bias-disable;
+	};
 };
 
 &uart6 {
@@ -741,6 +809,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi0_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -761,6 +833,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vdda_usb1_ss_core>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&ucsi0_ss_in>;
+};
+
 &usb_2 {
 	status = "okay";
 };

-- 
2.39.2


