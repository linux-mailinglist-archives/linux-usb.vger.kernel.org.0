Return-Path: <linux-usb+bounces-28707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD805BA3D14
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 15:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE36A561B7E
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 13:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F01A2F9D8F;
	Fri, 26 Sep 2025 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BmGX5Z0P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6540C2F7AC1
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892305; cv=none; b=BebuuVFqqUEVFv0ynX3ZCbmSGpA8HnoOqZ+nKRn0kbzhptY2HyCSZD8fkeal+/SyvmYOGI7yGdq7kKs5otlhM7dy+khW8LZAyfQIx/4fBhMxHnno3QnN+7yAk7RPuGp2v7sX9YiWVippgnBoFiw1ukjSjVYXYg+PIc47lcGJu1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892305; c=relaxed/simple;
	bh=7+uj94r/7LeT/xAkBfTGJ8aSRCSPNzAL0fCA+D8DD2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c9QPMSm6K4HYl/t8Mysb0tioJKNn/nOOL7wVaOGVu1Cx5iU+O4X+nBnjwCDOqa3X7LnYMH5HPuqNlZkNkwcXdik0hW9Lo23I0n+X093OGlPytSnRDsEUxKVcY84bRmRqYG9DkIJr2TS9sQoJ4/3vXOLREy6tq7nl9InRXFvcwfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BmGX5Z0P; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2297508e87.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892294; x=1759497094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCy6Bk8e0KycgUL3e8TXrZ2btc+fiyl+rPdd78IS8Is=;
        b=BmGX5Z0PvX78ztmXsmk/MgO7YHO5kshdUTFo6L3WtxQhR3b37olVG9YSfVpI3QmYAI
         EhK0fDcsUSUO3HgE8vLcFK4A664M8X+Bzz0LHtyT64tXMPIS3PsEW6oAJDGLJiSNZl7E
         dXCAQzyq95/E8D537XqgOO3WqhOEOUoH1rkh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892294; x=1759497094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aCy6Bk8e0KycgUL3e8TXrZ2btc+fiyl+rPdd78IS8Is=;
        b=P6EucRT2rgbYd3UHV8CydsMlS0upAU+7b+q7Amb6Hst9zSQyN7dliDkVM/Y51rp71Z
         +DuhCx+DCbzgQN8bfc2whvnXv4SOcKML1rFNFiaxiarv7Qwfyb5yJPFVrgRP4M9UWwqj
         vc40OUsYeHd5lIyqHgGFuT/BgQHrgLE1RKl83ZPtGlAIaJIeO8gm1GoItzsyTB7ZPaXd
         rcDGkOGZ/Kz+l52wrrcZRy4Pa/ymvI0OvpWBLPM2ZW5/m3eoRg/4zAzfRJClPUT59cci
         O7NQ8gqJ3bOgv5CfkCOjxZ8luPPkuvieHY2DYjfOXLMD/NxOLU62KTGI/tMsRcezDOiT
         njEg==
X-Forwarded-Encrypted: i=1; AJvYcCUfRv/0wfnpOuPQimK8d/R3BvN/NjSdw9vhBr4fuJTzqKsgJeb3FKsSbwlgA10R7FIopWxKKrdLAKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNxlwtYfGlhE9NAS3ugTjbg9MZw/X66TgkQPqX5dSEjriuqYP9
	j34St/3iIbVK8ZCkgh1LqGrQ73AfkPfTAPbZKy4/GnTPFYJTbhwjVNESmu9bm4INgg==
X-Gm-Gg: ASbGncsrllCglsbGiVrhBRgJHdJbHAPzEMypnMLeI0raMsfMsyFvLFK9iB9U6kKXTXk
	phzvQi/NyN3J0o7va20hojamTwS/TH9Zm/JChX2mZj8s3GLrzYTRAOfoQEjUEJMDNWT9jgLJ16M
	0pGfW6Ay+eVclJPXWJ+mcvQVCpjQtcQ546nk5Spl9gkJ8xSe3md5rFKpPqSRP80Rl2wbWODAp1n
	FiIgs3Q7xSiHyjt4Q52/xssYpWbf8/U0nbkVTrTlsLHtDzfTFJ3sGqF3hF1dD3vlxCtsELQ3y94
	S0LaMO/gaHreEWkEhJYlcdj3Po4PIrGNqlrH30EPbT+f06uXj9248iRUotniAuBaxjRKtPV6eRl
	ciMa6X9mU0x8lhz1gL61D+f48iv/bW6eyzE8ZkfUBOTV4dwmq16GUfzgiWDRKa6CzgaQf6ukOsP
	sxpQ==
X-Google-Smtp-Source: AGHT+IFSULi7NpOrywI1NGNOQUbBJbkaKZRrtRNyEnHKO4o1kB5FT5TGBNkhNPYRfI8ePxwjL+x0fg==
X-Received: by 2002:a05:6512:15a9:b0:57a:2be1:d773 with SMTP id 2adb3069b0e04-582d406b8a4mr1982976e87.53.1758892293940;
        Fri, 26 Sep 2025 06:11:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:31 +0000
Subject: [PATCH v3 07/12] dt-bindings: media: Add usb-camera-module
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-7-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

For fixed cameras modules the OS needs to know where they are mounted.
This information is used to determine if images need to be rotated or
not.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar properties for video-interface-devices called
orientation and rotation:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add a new schema that combines usb/usb-device.yaml and
media/video-interface-devices.yaml

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .../bindings/media/usb-camera-module.yaml          | 46 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/usb-camera-module.yaml b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e4ad6f557b9151751522e49b72ae6584deb0c7ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/usb-camera-module.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/usb-camera-module.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB Camera Module
+
+maintainers:
+  - Ricardo Ribalda <ribalda@chromium.org>
+
+description: |
+  This schema allows for annotating auxiliary information for fixed camera
+  modules. This information enables the system to determine if incoming frames
+  require rotation, mirroring, or other transformations. It also describes the
+  module's relationship with other hardware elements, such as flash LEDs or
+  Voice Coil Motors (VCMs).
+
+allOf:
+  - $ref: /schemas/usb/usb-device.yaml#
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  reg:
+    maxItems: 1
+
+required:
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    usb@11270000 {
+        reg = <0x11270000 0x1000>;
+        interrupts = <0x0 0x4e 0x0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        device@1 {
+            compatible = "usb123,4567";
+            reg = <2>;
+            orientation = <0>;
+            rotation = <90>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ee8cb2db483f6a5e96b62b6f2edd05b1427b69f5..1503502a3aed2625e8ff488456ccd7305cc74ba7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26258,6 +26258,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 W:	http://www.ideasonboard.org/uvc/
 T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/usb-camera-module.yaml
 F:	Documentation/userspace-api/media/drivers/uvcvideo.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc-msxu-1-5.rst
 F:	Documentation/userspace-api/media/v4l/metafmt-uvc.rst

-- 
2.51.0.536.g15c5d4f767-goog


