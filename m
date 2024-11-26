Return-Path: <linux-usb+bounces-17869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C69D9434
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 10:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B097DB29755
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 09:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4AA1B87EF;
	Tue, 26 Nov 2024 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UdSqcXsp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514118E057
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612883; cv=none; b=TDLJlbzr8Lgu8k+4MF2qRY/arK+u0ecPvYalT9gu5RCl/3MwSPEZabsCtgIqT76ikAMc3dTtWbBeRZwTP/PhN8kxKLGU17e5dWbA42fT+IStBA8DUZZYFc6xLBJrVYMnjUqWusiVkThBytVY9ouNw42j6lj2CsbUqXFtUYpN8wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612883; c=relaxed/simple;
	bh=oNWXU+YttETsW6YOLdXCM5FnMtFquAK1N6LvtZPkJkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UuSXsiJRysI7Nd0LrX5edD1wrZ20ecXIy8ok4AkutXcMCsUXnozo/86NGO7YxERUMRV68ASzO4ufA+NlhYJ8oqKB6kpSYLZQ9iRX4EcZNvAEUWStNgaRgCR6cImiLGGN/ZlXJW/KFVXtzpO6pJzjvE8swxnjY/FFtmgmW2tRwnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UdSqcXsp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-382433611d0so4488990f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612879; x=1733217679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jPyHfXjv1sKCq+VDx+r3KGfTA+9eZQsBfgYv3YFZiw=;
        b=UdSqcXspX4GlVVQ9ykeNkVCt1X+Jj/LfbN9xD/pmohjLFZrU8SIiOVFdfAqhU6jGu9
         JZ+GNbfv3X5aPU8YWnehhC0HTItYCE9ZdHtmzNJ3TASEVVg15zM5UfKc+NaGYpgO75ze
         0vEC0f6dcALONwYLOHbUmQl/78LTYeEA6ClBTI8On0/dYUr1gnsrjrj3TNfSc+5Dq5NQ
         e6TUy+XjsODNZ/0g08nZiCmro+mWP9Y7nhf8YjGuL+pp45FCXcAMypVC1GNG5VKCPbWd
         m3UEO4KValOWTdgC/HRl1F2BxIVluJhiJSNXFJdhf7VqtWX3QgqxFT9wB40kffi7dQad
         5+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612879; x=1733217679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jPyHfXjv1sKCq+VDx+r3KGfTA+9eZQsBfgYv3YFZiw=;
        b=Xz5JEC5WMkqXXXFbqw3p3D0v8ZV1ucmrsRVi2vdcZWGLXQPqL7gHqlyO7oirHCLZja
         xjNuYCIkyS4EfwQQoN+QGfhT6c+RDnCuT58W1EA8CEve2LkYa/yCkOi6Emd0JmJb7HMi
         5VSmCRPY/oWW+oRbF2qurgJyN1zZKXQ/OGEGbAGgmFXFpq8o+mzDwBim6KUfdmEfp0CE
         pYClveBrJ+BwHry4aZSZ/cMqZC3AhKWxGnBg2c+J2lwoaKGR/ETADjNsPMMmDm0qilnm
         P/l22Zo7p4DyS4BDu/RXssvSTjtMkyWl7zUT7VkCKsxWM36ct0LoP5NibBLhlRi2SVcl
         /LEA==
X-Forwarded-Encrypted: i=1; AJvYcCUq0uV+0WUv5MCAK3SAELBTVNcsG/4bsQX58c7/KmyRTo0sipVHCzVeT0GZpxyOqkvi7UXQSXTTRW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA7TEYKSq1mNQ+Ul+iV0OfaHDubCGLCbeqE987TCDs/tRSmY5w
	QR9sf0Ba1hhTau/llgmakj6f/3J5Wuc3gLyTmHwdaTKVll3xAzc70q1lkYm+xUk=
X-Gm-Gg: ASbGnctaYOx4sDwr80/KNmBiesHVguNWc6R/gl+Zqr/KpiBZOw7stnSud87+3ORPiUU
	/YwhAVOGa9nzcUMN8pdN5ZiDl8aS8MBofr9Ya6rz9SJGbvLpp4NLeCy+3plvpGMRluMZvWrSxMx
	mFM2ZlkKJlz6vfyHmi68jw/pSeV5b+sXDkzBBs3z6ief/F2RYFQ8ZWNQ3FC51qA6yG0D2rZgRMv
	zCV//hCzh+upO6qDT5D/tGq+LOC6AcJ1zn5otS3ZqqzFz8JX8FE60lUyNvnI6yYpxkQdTYZVIFO
	MOk=
X-Google-Smtp-Source: AGHT+IEp0nHr3rTgVabZUcIb7+yLYE3qyOs/bjCx+FjVzVqxsxe18o0APHGg56PeptK8REX7Zr/0Jw==
X-Received: by 2002:a5d:64a9:0:b0:382:4fa4:e544 with SMTP id ffacd0b85a97d-38260b3caf5mr16113423f8f.6.1732612879055;
        Tue, 26 Nov 2024 01:21:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 08/15] dt-bindings: phy: renesas,usb2-phy: Add renesas,sysc-signal
Date: Tue, 26 Nov 2024 11:20:43 +0200
Message-Id: <20241126092050.1825607-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S SoC, the USB PHY receives a signal from the system
controller that need to be de-asserted/asserted when power is turned
on/off. This signal, called PWRRDY, is controlled through a specific
register in the system controller memory space.

Add the renesas,sysc-signal DT property to describe the relation b/w the
system controller and the USB PHY on the Renesas RZ/G3S. This property
provides a phandle to the system controller, along with the offset within
the system controller memory space that manages the signal and a bitmask
that indicates the specific bits required to control the signal.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new


 .../bindings/phy/renesas,usb2-phy.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2babd200bd98..3b8dcacc3740 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -85,6 +85,16 @@ properties:
 
   dr_mode: true
 
+  renesas,sysc-signal:
+    description: System controller phandle, specifying the register
+      offset and bitmask associated with a specific system controller signal
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: system controller phandle
+          - description: register offset associated with a signal
+          - description: register bitmask associated with a signal
+
 if:
   properties:
     compatible:
@@ -112,6 +122,18 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,usb2-phy-r9a08g045
+    then:
+      required:
+        - renesas,sysc-signal
+    else:
+      properties:
+        renesas,sysc-signal: false
+
 additionalProperties: false
 
 examples:
-- 
2.39.2


