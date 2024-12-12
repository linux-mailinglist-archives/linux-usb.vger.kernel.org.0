Return-Path: <linux-usb+bounces-18442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 917889EFE9B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 22:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A95D216C78A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 21:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9EB1DB922;
	Thu, 12 Dec 2024 21:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VkQlO6tm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A326513BC26
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734039891; cv=none; b=mXts090A25pkSGSTXOMet74N5hw32yOox+ESv/Cw1mTjm3zsEHEw9Wo5loGbjzBDN7BZbpVDZKhKcX1hLyvur7D+v12WnSv6OBiPN2VaNNScA3smAyQaxaR4zk9MwdSU+hYxwyuxIky5880ss2veXITvUdIeIY/00o3xpcjUzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734039891; c=relaxed/simple;
	bh=UlHzjt5XqlnLG109qvAxfN/sqPZY9O/xBm8dalBOFes=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AnIc6BC472oJ2RwbOW3D3381v8vbRky9qi7TxN6/VGTZ48EDu3e3pJxjymBmuZqjt0oWUCCzAmTt/iYqOsamlTcKQI54nxkUOOLaXMpKj+7I4Y1lZR8q7HXCOculR3bXDE9flGZcCa9xZgYaw52cRlgFo37R2S2W7QHLCg2VzwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VkQlO6tm; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6f0afda3fso112317585a.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 13:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734039887; x=1734644687; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nUbD1JwsRkblN7Almh3bMISRay2N2f9G2ZCbjGzrs4=;
        b=VkQlO6tmwHzmDGyIL58zxAAkwqunBApkd8+iiqf8uhJj2hm08/0d8uFkTL6eb7STDb
         2dAJOTgW2gbWx2UAFhitP7hWXYHP7r7AColY5UMyKf6m73NwsLoou7od9TULAs3zGGcy
         aUIrkm84NLAs8ufNybRDUjx8a2NoDijSil8Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734039887; x=1734644687;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nUbD1JwsRkblN7Almh3bMISRay2N2f9G2ZCbjGzrs4=;
        b=TKsUoZHpANSyI9mol7bu8oMDW0ybzQkPpXXiCl++/rhbsoSGweJutRII9hBYwy+uOn
         dnHPKZvfLLA4ClzhiUSJvAxqonyN88yQA5xukdzCz0aOGegf/TUwOyPXbjj6PiFdSntN
         2TXkuMaj5d0MTU8qUfdplOyLoiF55i3BjcjUKhL9tnAV+6tUWPz7pZHqTXrRj7juHqFM
         KRac6vPsaBKMdxvNLkFuD6ZdM66o9iHSYxQIAWG0DwxqWRnbV9ZEV+jaf3fUIIS7ligM
         NAp0KAwfXlUfiOYsbndwVkRjUyVFZEnU5hz2lm8YMVonlsuT0fRnaA11yAMXb9G20NdR
         3F/Q==
X-Gm-Message-State: AOJu0YyU8eOTd+5TXro/PZSLyU2IfkflLUlsy6ac/sJ/M3yxpHOB7jCH
	HYOBhge+m5pZmx6yIIY+F3rMdLVtyeyuUwDph6IMzpQbtmWW/rZhu9xTytPluA==
X-Gm-Gg: ASbGncuWR33O8Gip7IDbQQTTpm+H2F2dm/vrvbMcZsmXMgpTK5c9AVzSBbrpVZHu/2Q
	b+jEb2qVmpRe1f0e2JrDAXowH/MXUykX9bjqhPyct2ndEtujpl8eKYna3Rz70hvU3FlPM0UJm4Q
	daBShzP9Qn5mvd7n8udEDD9CaMCYNtjl9o4i0dyzBBFw//hITMPcdS5DCrb+xXGicA6403oiRac
	rUNmaBtfbSaRV7JX6ADpZdzddUZu3e0hu1PrPM7ACIdsOhKeve//iza1p6MimfZv6rnv3+CrDnP
	/GzAHSTmrdkj+y/mhoFyPbgmlFy+4v8=
X-Google-Smtp-Source: AGHT+IHvdlp9WmWec4jyjGHYEjbhEJReTIiwO+D5oPna4oGbIvZB1nRqpaRHFzTit+pQlCj49roNUg==
X-Received: by 2002:a05:620a:1925:b0:7b6:d5cb:43b0 with SMTP id af79cd13be357-7b6fbf3b8bdmr7344785a.39.1734039887616;
        Thu, 12 Dec 2024 13:44:47 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6f4f7b34dsm83368485a.1.2024.12.12.13.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 13:44:46 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 12 Dec 2024 21:44:37 +0000
Subject: [PATCH] dt-bindings: usb: usb-device: Add panel-location
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
X-B4-Tracking: v=1; b=H4sIAERZW2cC/x2MQQqAIBAAvyJ7TtAtMPpKdNDaai8WWhGIf2/pO
 DAzBTIlpgyDKpDo4cxHFLCNgnn3cSPNizCgwc6iRX3noA9J4uUvcXVPrbOOQjDoQaoz0crvfxy
 nWj9HmCL8YQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

For some devices like cameras the system needs to know where they are
mounted.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar property for video-interface-devices called
orientation, but it is limited to the requirements of video devices:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add a new property for usb-devices that matches the behavior of
ACPI's _PLD.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index da890ee60ce6..1ce79c1c3b31 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -42,6 +42,20 @@ properties:
       port to which this device is attached. The range is 1-255.
     maxItems: 1
 
+  panel-location:
+    description: Describes which panel surface of the system's housing the USB
+      device resides on. It has the same meaning as the `ACPI`'s `_PLD` Panel
+      object.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Top.
+      - 1 # Bottom.
+      - 2 # Left.
+      - 3 # Right.
+      - 4 # Front (aka as User Facing).
+      - 5 # Back (aka as World Facing).
+      - 6 # Unknown.
+
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
       should be 2 for device nodes with interface nodes.

---
base-commit: eefa7a9c069908412f8f5d15833901d1b46ae1b2
change-id: 20241212-usb-orientation-8e3717ebb02a

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


