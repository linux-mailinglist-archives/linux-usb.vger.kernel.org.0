Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7E2194019
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 14:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727929AbgCZNpc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 09:45:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37024 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727912AbgCZNpb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 09:45:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id d1so7061457wmb.2
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=67sFvVtkG1ivlSk+fGwbgHaYe6cmIRn/pWHBZ0lu9g4=;
        b=bLdXR/wJazPg41YLpiPbUokG5vLuO47L/bv5lHhqgJwrXrKPuoF0CfDbTzt/pL6oYN
         AZ9NRRYVws2mK6JuK8ESpJ17a5pZ64yHZJcKdREbVXQqnJ1fXHXuOkYPk0QCqIyv8R1T
         rwXFCFPgXp6K2IOjK5EZ9RuQ7rs90tLFLUbJtLEo5oPez3u9GZzC6jW2sVgDG7uhqc5Z
         YymYWEgfSOFN/aU0Vrgw/HxL+faw5cRtFrKVRbIfu/Sw9MZsx4wbUSomIWMWweLYd9VG
         SPCllFmJWsNce0I9nnmXjneBmPa3dFE1djhJ35yMnqVKWNXI37dnfjvlg3UeJBQgMbc6
         wkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=67sFvVtkG1ivlSk+fGwbgHaYe6cmIRn/pWHBZ0lu9g4=;
        b=bWBA+tOmn078z4ubI46O+lGiRmWbZS4QvGGJTVadVs0bkZB1wYnGImkrcgypIXdRKu
         OVfN+pdjPGm3OEMWZJL7mW29LK3evDZhpdeXyxyXicsQ9jzu+MlH14UARll+eJNz24az
         DWh06rraS8bt4pXRiZhHjKT17MbYe/A/ty6CvdvyMcoEW9tw3kcZKftqNtq6wvqU/g0q
         qz/kbEVlJsW/BQRyP5bKttqasdDljHTHlfbePrGHKNNHymWEZ227T7zDMJfEFVYqRRLv
         EhwseDcwCho+aMorfXQxr/1ggtR8ZxJYX6ii69oRbraC58C9rXwdikdFu6znlv/wMswk
         fhEA==
X-Gm-Message-State: ANhLgQ1AkvYDqfaILwFUrlZLLHjK7DxwYaJSBZZ0/f0BSMswVdw6GbY3
        ylKuE/BX1o5iWJLqNZNnmwEY5w==
X-Google-Smtp-Source: ADFU+vuHF3B+GqiyYh0z892h7eeFlpwGJIfm9AgAVwf3x4ExWuzFRA51gjXfmXCgwh5Dcacvi6Cv/A==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr65827wmi.52.1585230329464;
        Thu, 26 Mar 2020 06:45:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 06:45:29 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 14/14] dt-bindings: usb: dwc3: remove old DWC3 wrapper
Date:   Thu, 26 Mar 2020 14:45:06 +0100
Message-Id: <20200326134507.4808-15-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

There is now an updated bindings for these SoCs making the old
compatible obsolete.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt  | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
deleted file mode 100644
index 9a8b631904fd..000000000000
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Amlogic Meson GX DWC3 USB SoC controller
-
-Required properties:
-- compatible:	depending on the SoC this should contain one of:
-			* amlogic,meson-axg-dwc3
-			* amlogic,meson-gxl-dwc3
-- clocks:	a handle for the "USB general" clock
-- clock-names:	must be "usb_general"
-- resets:	a handle for the shared "USB OTG" reset line
-- reset-names:	must be "usb_otg"
-
-Required child node:
-A child node must exist to represent the core DWC3 IP block. The name of
-the node is not important. The content of the node is defined in dwc3.txt.
-
-PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
-
-Example device nodes:
-		usb0: usb@ff500000 {
-			compatible = "amlogic,meson-axg-dwc3";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			clocks = <&clkc CLKID_USB>;
-			clock-names = "usb_general";
-			resets = <&reset RESET_USB_OTG>;
-			reset-names = "usb_otg";
-
-			dwc3: dwc3@ff500000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0xff500000 0x0 0x100000>;
-				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-				dr_mode = "host";
-				maximum-speed = "high-speed";
-				snps,dis_u2_susphy_quirk;
-				phys = <&usb3_phy>, <&usb2_phy0>;
-				phy-names = "usb2-phy", "usb3-phy";
-			};
-		};
-- 
2.22.0

