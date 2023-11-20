Return-Path: <linux-usb+bounces-3055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057417F20B1
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 23:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29A0F1C2168F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 22:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DA23AC02;
	Mon, 20 Nov 2023 22:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4w6FHVX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE721D9
	for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 14:49:25 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50aab0ca90aso2541700e87.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Nov 2023 14:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520564; x=1701125364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7w3IPGNvRYti0737C04DV640y8lLrN0zZWGxZvPfBuQ=;
        b=M4w6FHVX3LRUMRClON2OC7B5vpY/nKiTmNJrkxPFvvIBoz89qgubpOUxrk0oJgvSLu
         VyJr2k/b7HlVaSOYMFwtGuwK1wLYbl7K3AsOXkAMeblID7QfTA/2QBCoxh8ABE0k22TS
         MMYIaKOw1EsXEZZrM8YOwGzI2HyVk3qOxS5AtHZZcA1QssoJLboXBsxe9crtZWhD37UD
         GUSDO4QJXumQWyv1bueA3fwR9lyOjamhjK8xFynenM+WUpuP2DsHICtExWD0l9JLoDGv
         q+b3rJZihnY7M5Jbrk//Fj6bI1B+I4qQbc09ju7hzSH6ErMc6P0rkp9zdv3pP0l+lm9E
         OZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520564; x=1701125364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7w3IPGNvRYti0737C04DV640y8lLrN0zZWGxZvPfBuQ=;
        b=nSqRNB2eLGoZbbUwgaMnFDZTaHFAWnjp4n67ADcjlhxAifJkH4nOlHh2KNs16pqnHG
         RlnBEvsH5N2Te4rHZUZCrcm07QhEsuvmGZy4buJhchirBWAZBmzeb3fEVQEPSzp4WDSp
         /AGATrKypr0j1PGnnC+7BgBvgTSx71YLIpXM2rU3ZkwVuacm214r20Fyx8XFb9StCn8b
         WsycxEokBLAZkGwszZZmvkLOIXeueJXO3UfcWc+/buV66uSXUGVQTHjdxSBzzY5sWmkr
         9L+D8VUS8ncnZjCvOEgg6CL6ydbEWgeVOlu02aQ/0+d/LDaJ0N/rL7bteS33O6dz1Npj
         OObQ==
X-Gm-Message-State: AOJu0Ywhfl4nBX5wQo5/7pfh8bU5qgIgS/SVjUW8cvJ2Yw0Vv1wVXprl
	xbdFXHvRmoLb4ddzIxnjhWboEg==
X-Google-Smtp-Source: AGHT+IFD8UwHvlZIXLl531QOdo6XgS1ewvLFiSPtvmWi8CMmPCZ9J2HRygNxOeDgJlm3R/0ER3Qymw==
X-Received: by 2002:ac2:549c:0:b0:509:46ff:6e57 with SMTP id t28-20020ac2549c000000b0050946ff6e57mr6342427lfk.8.1700520564046;
        Mon, 20 Nov 2023 14:49:24 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b00503189d8b8csm1297756lfc.198.2023.11.20.14.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:49:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
Date: Tue, 21 Nov 2023 00:00:20 +0200
Message-ID: <20231120224919.2293730-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
References: <20231120224919.2293730-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the bindings and use 16-bit value for AltMode SVID instead of
using the full u32.

Fixes: b3dea914127e ("arm64: dts: qcom: qrb5165-rb5: enable DP altmode")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index c8cd40a462a3..88b37ceb13ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1425,7 +1425,7 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = <0xff01>;
+				svid = /bits/ 16 <0xff01>;
 				vdo = <0x00001c46>;
 			};
 		};
-- 
2.42.0


