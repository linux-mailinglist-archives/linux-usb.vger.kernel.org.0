Return-Path: <linux-usb+bounces-22033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19152A6DA57
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 13:52:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 761757A738A
	for <lists+linux-usb@lfdr.de>; Mon, 24 Mar 2025 12:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AD225F7BC;
	Mon, 24 Mar 2025 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP+xK7Fw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC0325EF9A
	for <linux-usb@vger.kernel.org>; Mon, 24 Mar 2025 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820709; cv=none; b=RWfYkQS6VCeV1EYFG78UNy+Ezos+poMPPXejx0yCWdA6RAfM+ZpddcbYz0IVRKlrVhPkU356/qiUx6TDcNowFzFedVCjMcMOaGWCymOtQr2oovA/OuSgilOFh3Vr7a4ZKjQNRhZOCSXhTkj5zGhrLpgOVoZk4MvG0pBtPo/81fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820709; c=relaxed/simple;
	bh=5xx5FlSKyFLZJzr6V7Uye9kG+TXRdex/gunTUYdSsNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HwBPu83tMDOsIvu2pOMIsvihmwanWNrxTErRgIg9yJq8qqOjkhpOQg6nCBBSeIVCUC+HxMNTxngQR9SfAGQ4OJh3ijDY1hjOEOKAqiGOY3eLGM9IkgQIdO4p865xkhcyKCesTz2gIYTuXDB1tHtndsg86OyPSdnhY1P9Hme+Wk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NP+xK7Fw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso274213f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Mar 2025 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820706; x=1743425506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUoMpr+FmTJUUYgunEAsWmKDX1DoLLbcuPSMJE5oesQ=;
        b=NP+xK7Fw++10iicRo50MFXoOH+THisvuEjDQ5+muT3sN7nbiMPJCfhnlcZ5RmRw/VU
         xtZIvrHUnglYK8dfRV+Bvk00JyqEEBNaTAYo3Yt7mKXJTWktlQwYzWtkcTCQZPeO5nAs
         5XMj3Kiv1PoTm8BwAJgu2B6sR3b8h0A9ea9nWC7Vog7PGbPbD0jMYgP+Jkm2GWI+56iq
         YKPn0LTQwCx5SOwXl2XGJ7mfT2WEhegQn7cGcfq6BxzNsuSqdX6g7FU3fsJaPFXooCeX
         HrGBKXiNK2Sw1r/Yq87qHqBfIlpv2NFORQwodB8Eh9TxqM3kELn8XwhjA5YuETNcN0vF
         3k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820706; x=1743425506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUoMpr+FmTJUUYgunEAsWmKDX1DoLLbcuPSMJE5oesQ=;
        b=ppy6w32W4VlKLxUknwe6KEd4CNfxCDXcMqWKcqGQR4DPdvyXWBKyYKKuAaiXhVaEKA
         zLD4cPb3R80SG+AA7T88enh7cbIQiTXLnzp6RNVsASn31uT4P6mKPN5xZ8BxJQO9FgFI
         g6JtOOOU5zU9MUCng402KWwgQjENrQ+Oc1tBOhIzos3UWtO5e2FGlU5XSgUDWrafaFau
         lQaa7dZ/9k+QqjOaAA4P59BaI40U8fZcKH/x6Nf53My3qoDIfmJY+N5mjIUry8+kmA1e
         qFfdTTOu+XWC5m5jyM8hhH921RXL1f3mIJJYhcyQfhDvIPsxh1aTg2J6VgtmcshWzXA9
         AePw==
X-Forwarded-Encrypted: i=1; AJvYcCVHDGdN6am3u6sEw8oJes0JtEZbS/UOfpFJnbrS9rlvG7bCGyZrHVqygPbZRvFAne3Qq1hoYWpDKr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgMb/ErCCm+Me1cqKVHnI6tLeZO5AqL+X6sOykH4qcvk9v3uJU
	Hx1190YHXQ2BerIL+J1K3Lgtl6s/awohT40BP8o9nplIT9Z+rXDRuyZVPj3ZSdM=
X-Gm-Gg: ASbGncs2t/wIGayopD222l+xqftJPg74aHmrnxN4vENO+SxdVYhPf6OgCLjjHb+01TQ
	w+sxts+V026j3PkmNJ2jVn4rWPEtP9Jcy5Us7KIvV0E4oH0cs32CN453bE1CjCtQpBGc4Wh5dVg
	6kcsYzlKg6bzRzXW6xSipQ3CkGqk8UnWmGvEdpHAErhK/lXiva6IbiKEIi5c0BlJyym6qRFE5tQ
	5pPIkFE6kCiA7DM9+gcatGaiXZ8EDueqpByVoht6/2OLA1dwFvA5fy4dTDgIfCORkBYBb5hJ6be
	qGfbdTHEDlTlZAvSAoNUT8rV4qjD+T2e77iU/9qNqCqfgLFq5Pu0ADy4jg==
X-Google-Smtp-Source: AGHT+IHWJMXQRiamAeJVWu4eRAJNadDYJhtO38dS8WMcOCTUIapL+/uAak0BnxNe/tjBFhmz9SU7Qg==
X-Received: by 2002:a05:6000:154a:b0:390:d964:d325 with SMTP id ffacd0b85a97d-3997f9406dcmr4123049f8f.8.1742820706146;
        Mon, 24 Mar 2025 05:51:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef063sm10713445f8f.83.2025.03.24.05.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:51:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: usb: smsc,usb3503: Correct indentation and style in DTS example
Date: Mon, 24 Mar 2025 13:51:42 +0100
Message-ID: <20250324125142.81910-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/smsc,usb3503.yaml | 84 +++++++++----------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
index 6156dc26e65c..18e35122dc1f 100644
--- a/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
+++ b/Documentation/devicetree/bindings/usb/smsc,usb3503.yaml
@@ -106,54 +106,54 @@ additionalProperties: false
 
 examples:
   - |
-      i2c {
-          #address-cells = <1>;
-          #size-cells = <0>;
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-          usb-hub@8 {
-              compatible = "smsc,usb3503";
-              reg = <0x08>;
-              connect-gpios = <&gpx3 0 1>;
-              disabled-ports = <2 3>;
-              intn-gpios = <&gpx3 4 1>;
-              reset-gpios = <&gpx3 5 1>;
-              initial-mode = <1>;
-              clocks = <&clks 80>;
-              clock-names = "refclk";
-          };
-      };
+        usb-hub@8 {
+            compatible = "smsc,usb3503";
+            reg = <0x08>;
+            connect-gpios = <&gpx3 0 1>;
+            disabled-ports = <2 3>;
+            intn-gpios = <&gpx3 4 1>;
+            reset-gpios = <&gpx3 5 1>;
+            initial-mode = <1>;
+            clocks = <&clks 80>;
+            clock-names = "refclk";
+        };
+    };
 
   - |
-      i2c {
-          #address-cells = <1>;
-          #size-cells = <0>;
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-          usb-hub@8 {
-              compatible = "smsc,usb3803";
-              reg = <0x08>;
-              connect-gpios = <&gpx3 0 1>;
-              disabled-ports = <2 3>;
-              intn-gpios = <&gpx3 4 1>;
-              reset-gpios = <&gpx3 5 1>;
-              bypass-gpios = <&gpx3 6 1>;
-              initial-mode = <3>;
-              clocks = <&clks 80>;
-              clock-names = "refclk";
-          };
-      };
+        usb-hub@8 {
+            compatible = "smsc,usb3803";
+            reg = <0x08>;
+            connect-gpios = <&gpx3 0 1>;
+            disabled-ports = <2 3>;
+            intn-gpios = <&gpx3 4 1>;
+            reset-gpios = <&gpx3 5 1>;
+            bypass-gpios = <&gpx3 6 1>;
+            initial-mode = <3>;
+            clocks = <&clks 80>;
+            clock-names = "refclk";
+        };
+    };
 
   - |
-      #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/gpio/gpio.h>
 
-      usb-hub {
-          /* I2C is not connected */
-          compatible = "smsc,usb3503";
-          initial-mode = <1>; /* initialize in HUB mode */
-          disabled-ports = <1>;
-          intn-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
-          reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
-          connect-gpios = <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
-          refclk-frequency = <19200000>;
-      };
+    usb-hub {
+        /* I2C is not connected */
+        compatible = "smsc,usb3503";
+        initial-mode = <1>; /* initialize in HUB mode */
+        disabled-ports = <1>;
+        intn-gpios = <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
+        reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
+        connect-gpios = <&pio 4 17 GPIO_ACTIVE_HIGH>; /* PE17 */
+        refclk-frequency = <19200000>;
+    };
 
 ...
-- 
2.43.0


