Return-Path: <linux-usb+bounces-17904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31919DA670
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 12:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CED81630F1
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2024 11:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0B31F1302;
	Wed, 27 Nov 2024 11:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1Z0kSbo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3081EE00F
	for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705307; cv=none; b=bapZ2bwO/WdgxLaj8gNg6Ubzq/SW70L8N9ZTq2cucT/pHC4+0Tmnk+O+c5pwWBz3qyCiSgxWtRXEdoAqhueqH+xfOjAXCbGDtsdls6u/VcJ0zo9shlDgILWGdUzcZpeYEYZFrcFYy8z4ia4pi3YX6ayrw2XyiwGgP3B/2b1cRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705307; c=relaxed/simple;
	bh=Fx6JxYmZAWNFmGBaodns3MA1Cp/zInnAqGQR08vTJZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DL5gqO1s9nXp3ZnzbJZGrfqqP5Q28LSNWVNozq3Mw62KLQwnYS2euxyiXjuLr10YrV6oKzaGRjLiJf2mWCVPw7rR7pu34I0vpq8enVexGGR6aVHpfGrMIq6Fmm72nwVuGybC4CKx71Mz9nThY0X66JV+YCUQjIEq+23wY3d/Z/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1Z0kSbo; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cfcb7183deso1197895a12.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Nov 2024 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705303; x=1733310103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOjDTz5quesA/57iR2U9/Cgnc4v0qy5hefL79EGSNfA=;
        b=P1Z0kSbo2mZaFm+sR7yUylpf7IO3m/SFtHR3GgHKgAZ5df+7O1HsypqJ6Jq6hVc6e+
         ixwJbebmPt4arP9UlrvR4wfFEucyB3LZji58ZDMeZ5OZ8/qjiRrYFooQLaSgS4N5BzaE
         N2LfQaTRfeDHoru099SXdt9d8nRmwLXFy/9kctIJwGcys5QQdKH7lhHYQG12WJveEpdu
         rvmC07krAEOpp/CjiF3z9mEA1Y8DP/+vtHfKujoTDhxKM22RSv8THMLeJA35YCWc+fG2
         lHd7mKImA6tzGGeSGez10MJl3Si27rKZFoAeOGCV4YThNKjosIui6+/9Wvkvk3lmrCgb
         LJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705303; x=1733310103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOjDTz5quesA/57iR2U9/Cgnc4v0qy5hefL79EGSNfA=;
        b=Y9Rg8FydbMn27AW9P9lxF3qWvIDgs5rhjfCvdsmS6mj9ark34IYn68EkxHxoZQW49z
         u39HqyNA+JtDwmNtnyq5GYC8eERqIY/+yCor1zOOPbqdQ+JhP5p4cLO3h5e+Df5qKfpk
         EBmJIWcRJiua6JmDeqOptkAc/cTwbS0SBZAe2pZURnPptFu6wxjdDCTx+jFgSVA9V6Ut
         WpnoqxwuuJOP02LrWcx9wcvQQiTSAfnbEa6zcFBgIUVAMAaL93w7DOub5xxTkh8aFZ4d
         P678jVLDr3DKYe0FPQkQ+BfQuDI5UOWTd1UqxaN/yUwQRsEzl5JmWyTQqVn8qJO24fdx
         CnVA==
X-Forwarded-Encrypted: i=1; AJvYcCUWX2qfuYOTN7UbvEm0sCI8irvKSDCaE2xNHOvJbNcxFeha7Vg++jsrMa7c/cc/WN6T3aSiz2gMRwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRry6Iai784t/AK0sp4K7B4hGLeX4FtszHE+TxZ2yxcFLxsPI9
	iR2egMrZDhTCkMKopmuvelqHBpEqUJ7GwJB5OBTObGM+qoEfQREp25UqX55IwTg=
X-Gm-Gg: ASbGncusH4X4vxOSCvDHVKSehA8WbU4PuSMVw05ou3+uq/w4XMJ2cg7pV5MiOB2L86g
	RgfX4FHiVp6pR/1mBRZMsrafaJWAiWluKtdTwjscZwin+EaDc0edHkju/G1aysqNmtLQpq7dsSL
	25SmGDiGgPmQskmoYR05n36/GbsnmEcQtAY5/CeJ10qY3at1XrZOLkiWT+6y7vBbohTuzwBi3tE
	fP0CU/Dd33mez3ZYE5kmzmVh7hjh9hi63ONUMeTWnDjJBJ82qVjudYi07ve3eyVm6/VM6SsB5m8
	ZdtKjmTSbRtf9j3SLxZh7lDGIXP3+PpfrA==
X-Google-Smtp-Source: AGHT+IHB5KUzcTjH16njBBTQ0xCVSadda6wBBW1QR/hMzlosFVnEKcI8ZmV5cmxHoXIIbnCGjXeWgg==
X-Received: by 2002:a17:906:318b:b0:aa5:1cdf:7bfd with SMTP id a640c23a62f3a-aa57fa99a0fmr256898166b.7.1732705302951;
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:42 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:42 +0000
Subject: [PATCH 4/6] arm64: dts: exynos: gs101: enable
 snps,dis_rxdet_inp3_quirk for DWC3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-4-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

This is required for the DWC3 core to reliably detect the connected
phy's Vbus state.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 18d4e7852a1a..ab016fe9b99a 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1302,6 +1302,7 @@ usbdrd31_dwc3: usb@0 {
 				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
 				phys = <&usbdrd31_phy 0>, <&usbdrd31_phy 1>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis_rxdet_inp3_quirk;
 				status = "disabled";
 			};
 		};

-- 
2.47.0.338.g60cca15819-goog


