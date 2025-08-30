Return-Path: <linux-usb+bounces-27396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A96B1B3CB06
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 15:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 45D284E17A9
	for <lists+linux-usb@lfdr.de>; Sat, 30 Aug 2025 13:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A95327A916;
	Sat, 30 Aug 2025 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dt+a9jDv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6F122173D
	for <linux-usb@vger.kernel.org>; Sat, 30 Aug 2025 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756558871; cv=none; b=P/gako4JS1ltRkliVPkN1GW+3SQKDnRH9vsG3fvlJZQ/M3EzLWbKGG97jbylpgAfI+/BmW/7g6w8YLde/7TqT+1xS9FrtUCL7qQujb5WVa9VjjwIyoHew/4jYwJtVJ5rJj1WmNTS2UnEjnwBxd0oJQ1THdcnWNPwO9fseKmlXkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756558871; c=relaxed/simple;
	bh=x5aMDALxgOI1H+xD/vQpZoAkDT2ZtplDl945kHfXUoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bg/ozPW1jPC5nSbOP2NJBugH1j1kZUN+khGNDCoLGNiyLwO9hWCxOqJhMf8x+Ezp4PUkBPFOlwEIxLdrCjEk6gif0OHOvOggaIZm1+n/gY+t9te1NYbqXljByW+kz68vMFWzjh7ytODfsu+CX1qY3NnRAMKweD6Ar9d8JNxpi0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dt+a9jDv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3cc8efd207cso74941f8f.2
        for <linux-usb@vger.kernel.org>; Sat, 30 Aug 2025 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756558868; x=1757163668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lgnqVvxFY08GIwRgazphEg7+3QXDYUBxtqlK2TdQQ8=;
        b=Dt+a9jDvc5RYmhTWbtplZ69oP/3j1oExmNtnga6zSo9ohIJc5+8Pq19tqnQIEllw7I
         cdMPuqSKTNh+FPNPHpaPBIPuauyS0zo2n0wYmIMqUTHtNe7IEzKMwhUIsPJwhkm9ovcd
         AUyxaFj/DZvgFScICqjorXPjo1lsAUvU6H6hqlkfIyq/v3OOtOwDjFr4krUVso9qoZTK
         +UJFxNcHCJ+zFNkL0YwhyduLG+fB+umjOu/m8ftdXUqJ+T51vo6nFEUi7vALpruVnvrN
         IaMJdiPbc9rSRmEULiPLGyNEfRJ7HMiyiyZwAuaOS+Lg/S/hYkOrFLyvcrgUmeLMhf/3
         yCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756558868; x=1757163668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lgnqVvxFY08GIwRgazphEg7+3QXDYUBxtqlK2TdQQ8=;
        b=mV90SpSLXkm4CUjlomVQ98vezvJk5thvYbhQMhuI3nxULRkkKbo8Crd2AAd/NmoV++
         slBkajZVcumE6cAs9HBgkm3reSZYhNtJmKGp45yEGxka5VFoKphnfjFpnM64fFyX6jdD
         5b3lDTx470+FelytUwRqLTyLHIBepB5evnFp4uvGmYbvz/rb0OeBCFSrAxSMAplRZpa9
         EGgO9GzdQWieL8nvkZKP5v6U3IA7nvUdbcVSYI1YkNWlN4AJaamPpyV/3XdhopigXTAx
         z2/5K0tBkgGOJO1Hifdj6ay7/pMgP4bdXGeoH6THFd6Vm3HPbnpEa1pEatQvwNUuN8Sw
         Rtfw==
X-Forwarded-Encrypted: i=1; AJvYcCW+XcjF6f/dbDPImsmgpHOD035/MXVJS23Asouj1wHJNoNH9z+sWvLCGxzQnA4uvh0H8gJPMR2bmMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMcQmAwuj76gTD3DULx7VBI++chtDYck3eBpPc7Ea/5VBiEhT
	tEwNKv8i3ANPUATRIndSsnyqD7qNsPFRzmEIbPCi20qwXFtv+qxI0zoup+IjxfvIeSM=
X-Gm-Gg: ASbGncusZjCYXR++J/AcSj0TsO6IcxGmrmtpIzgmcEHGgd/eC7Vdc/gAj/yijyPP+Uc
	zbtSrFstzmFC7lxHDCnRnj8I6VJRNFKkZX8gR2dOm/qsZex9eTugiayoPLyr86DB/U36n7vCFYP
	/KDzolpvID2TBDH6tQe5+DXluFfS9RVeXoFxJ9FdY21PY4yJUTwRiSDokr/sffz/d/RjVRSwP8M
	26E3VfIeNkjFLbj4yO03YDO1PSOsVr4p/R5VeXWvgtJTJGqL4f+D0UeurGo+jwT1CpfwZIGGLc+
	o0ybp61mJTguamAMn+sSlGmCZLghidOBWf1eF5RTmPLqOTJ7T15Kl06jC4fIHYfHdTHpXyAonMD
	tGvlj6lf+S4RyPrzPD87tCOmyEOtLOOyS5CS07Je3WiYB
X-Google-Smtp-Source: AGHT+IHQ4DW0XyUDaB3fbWwROqp7gBrugB5J2s56UPJs5B0GsbXF2q2Or8Czb0QcdVqITphsFKBwug==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr20236775e9.0.1756558868189;
        Sat, 30 Aug 2025 06:01:08 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm80211125e9.0.2025.08.30.06.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:01:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: usb: s3c2410-usb: Drop entirely S3C2410
Date: Sat, 30 Aug 2025 15:01:03 +0200
Message-ID: <20250830130101.142934-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
References: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=x5aMDALxgOI1H+xD/vQpZoAkDT2ZtplDl945kHfXUoA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvYOCRo3slczvzWNNs3J9n9kGWOjXZfTcdttO
 hFhXAnXOzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL2DgAKCRDBN2bmhouD
 19gOD/99eTNOuqRJwZe9iS6GIhCcEqgdSGbZS3U64+s0yQv5H2LUP2ITmr75wgmS7TNSn9C2Yul
 OzJyYDvmx7TJlABGo2Xtt5zFPvji0hNI6uY+E8EEpjiSuRzI6XpYkggkPMAF9ROCu2tpwFI5jeJ
 4bCG6RFu0wz18mYfYEQsGs4W4bulmhXNxcXT6YDqTL21AJcGsdAYZEyRu7TrX06bOeoros78mN4
 TsRc0FcJUlfvCVJO9IhPd0VxKyBP02Q/H3fC0ttURdcTo62IPTuoR+tnYNqUN8HzuvNeYbRCjuL
 bcbKCpGjDSRE5Bji4rSE/HqdR3CaE98Yr8h7d6o5lQ9GrVicM3u/7J7UbColzvKVYfuC5zdZtE5
 eajbzgJXg7dcW2WazI85qy77ajmeY/lzZHHbo73LqcvyRW0DRSfrgpdztEB0+OTyv3NiG4sx6zk
 DdkRridi38Nwv8Nl5LVkXTvRvND7COC5cyEDsSKfaGMAapS+zUjVzbYNDbuQjNkBfVeFkDddoGV
 vG9nvK+fPFWHLNhI0DVtvrm97bSCMHw4gUZ9+xVAF2/4ZGOzXVD9cMMvrGbLX9A8To3Fd6YyRRV
 nnLkgr2mgS2ouRXSSH9dBfUpfUrZ35RIrSjCYNWU0Nb3lY1t6cEN1fN8w2NeLo6tyOtQpcGeWq1 ZZt+hW4MoUpIPVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/s3c2410-usb.txt   | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
deleted file mode 100644
index 26c85afd0b53..000000000000
--- a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Samsung S3C2410 and compatible SoC USB controller
-
-OHCI
-
-Required properties:
- - compatible: should be "samsung,s3c2410-ohci" for USB host controller
- - reg: address and length of the controller memory mapped region
- - interrupts: interrupt number for the USB OHCI controller
- - clocks: Should reference the bus and host clocks
- - clock-names: Should contain two strings
-		"usb-bus-host" for the USB bus clock
-		"usb-host" for the USB host clock
-
-Example:
-
-usb0: ohci@49000000 {
-	compatible = "samsung,s3c2410-ohci";
-	reg = <0x49000000 0x100>;
-	interrupts = <0 0 26 3>;
-	clocks = <&clocks UCLK>, <&clocks HCLK_USBH>;
-	clock-names = "usb-bus-host", "usb-host";
-};
-- 
2.48.1


