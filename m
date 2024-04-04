Return-Path: <linux-usb+bounces-8939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E5898C65
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 18:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 423951C2172E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 16:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3219D1CA8B;
	Thu,  4 Apr 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iggpkPB0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C681C6AF;
	Thu,  4 Apr 2024 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712248908; cv=none; b=FyDK5T+96Jc6RcupcZ/RAEdg+YPevI6IYjzCbC80fPlszF8XrJug/774lEjLemUHaPNPx7SGJS1DBL6VKYNeYgQaEx4/m53X5VYNkZZrjdqZxuEppVaDaxZTWVsCYV1e/sA6Nn1OucalMialRL3VWHsY9z9lmzq8zHG6WgLawws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712248908; c=relaxed/simple;
	bh=xkAVjtlxvl6Lk9vMGY3Al4wPhonWzXqqcR3D/GDcytM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dTHjq8LBccmFfDelglyhdXMgyKhkOvyrx1Ed/KX2Ks9+RGkUC2VnngCkO3VlxeXsNPjdaIm4dCu8VUXDjm+B6BM+a8u8EBEcjs5vwuYfWRwVkISgNaBpyLmXms898xjUmMyD6heqZbGVvjpE/XwtnFMkrDOwPpF2UNcrLEteRZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iggpkPB0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e0e89faf47so3035315ad.1;
        Thu, 04 Apr 2024 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712248906; x=1712853706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BRydtaGCEtU6C2jPZzNOrIpYyTJCBJSa2+2D+RooaRU=;
        b=iggpkPB0NgSGsgoNRjFam3VMcVx0g6PBD+yDVtfFWVwgCc9aumoR1Ch5CcOpG86Dma
         0Ud8FasKKnyan+xawJRvRt0SBkUvnZDjJXV6DSlQpo5TlHXc4txfLzsdCRPO5diUaZWQ
         ro/pXLqX5JvKuNXQ7aRXxfCQO9EBUnebNVfYuHh7A8dLWzrK4vqInmdUcuPzDPSH/Bhr
         e+LT5sIbyX7yz1FQSu2VE0nArOrIVjJ+MLHSYn7SN/7DrOfxqjNpBdlAYV2kgapcXDeL
         zKos2dxfb8aPzUuRcZ4z1J3C5wB6ToYApWl9E7oxC4/jWuqiykNI2wo690VQNxWDAGdF
         MDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712248906; x=1712853706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BRydtaGCEtU6C2jPZzNOrIpYyTJCBJSa2+2D+RooaRU=;
        b=KjAJRaQie0k+Qw/oZzj2TzvwySPQmeQfYN1aliPIplYay9/shv+0V3u7kjakqmbDEd
         e8qhJAlGrOijGQ3FxPt4m/00Ya8x1lNf8QRuSaBoPEf3T++atUzQrfBkXX3k8bAsXw/7
         KCOE4Ae2CRjDPjQN7MkO96Wjk4mV1rpMnymxPk4sS4pxC/P7LO7i0RPaYxpplSCTVLjn
         /5jgwneiQIhODWCdbdDX5qBvGO1N5GjrbNEyu/n+Bg90Nvepuec9090zMh5aMn5+2a+D
         deJM9x6qqUg0AtHJLQhsqv7yt2ivSnMJ8e2/r13OGJ+VJVSFNnS0sMe1S8iTziKPqDcL
         0MaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMblP1xetwJLs+69qLlI7XVOWB0QbOu/LMm1qubHZiSYSLEPZiUKn/kWsIpWuUK08FC9d2QueUbwpobTCmeV8/PHQdzhiZ8xEPMNNeKfNmR8Cx6o+Vsnm1+Gwso0GoNvsl9WCj+w==
X-Gm-Message-State: AOJu0YzxRrn+Da7T27G0dY/VDolvUQGzqiIsgX26Ed6M9wwKWZGxo164
	X/bouDGYCsx3lMvVgFIcatbMgnma/6qv+mpQGPdJNfzFQMNG8o0tifJluHZm
X-Google-Smtp-Source: AGHT+IE0D+ZL45vK9ZgNxgLa4HEyfm7+JD7z3l7MVdPH2KTrX7mAS2dq1j01RCxtWoCjmoQo4SgUaw==
X-Received: by 2002:a17:903:1c5:b0:1dd:5a49:7a98 with SMTP id e5-20020a17090301c500b001dd5a497a98mr3031863plh.3.1712248906266;
        Thu, 04 Apr 2024 09:41:46 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9c:998:79c7:d666])
        by smtp.gmail.com with ESMTPSA id h21-20020a170902f7d500b001e2814e08b9sm5495480plw.32.2024.04.04.09.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 09:41:45 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: usb: Document the Microchip USB2514 hub
Date: Thu,  4 Apr 2024 13:41:40 -0300
Message-Id: <20240404164140.662361-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Document the Microchip USB2514, USB2412, and USB2417 USB hubs.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../bindings/usb/microchip,usb2514.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,usb2514.yaml

diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
new file mode 100644
index 000000000000..8df7a5adfbe8
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/microchip,usb2514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip USB2514 Hub Controller
+
+maintainers:
+  - Fabio Estevam <festevam@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - usb424,2412
+      - usb424,2514
+      - usb424,2417
+
+  reg: true
+
+  reset-gpios:
+    description: GPIO connected to the RESET_N pin.
+
+  vdd-supply:
+    description: 3.3V power supply.
+
+  clocks:
+    description: External 24MHz clock connected to the CLKIN pin.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        dr_mode = "host";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hub@1 {
+          compatible = "usb424,2514";
+          reg = <1>;
+          clocks = <&clks IMX6QDL_CLK_CKO>;
+          reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+          vdd-supply = <&reg_3v3_hub>;
+        };
+    };
-- 
2.34.1


