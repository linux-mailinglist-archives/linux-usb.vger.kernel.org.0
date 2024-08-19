Return-Path: <linux-usb+bounces-13690-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A56489577DD
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 00:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27C731F23006
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2024 22:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F92205E0B;
	Mon, 19 Aug 2024 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hnsZ6E9I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2A20012C
	for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 22:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724107148; cv=none; b=YjU01PKtYfaRfamn3o4tjV5WPLnsyg7YVUvr0T0n5/6T+Ss2z3etiY8CacZH4YfxhWIP7FEfJKrFPr55jVxOV61Di3bamD/lWhWU/tP0U9sBmnu6itRLjkZnwLfm0eiM+pTqn/rwT3cJak0X2ISpI0nLTsdIrfXZ+lX4EyKRl2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724107148; c=relaxed/simple;
	bh=Ti4xspzmJb0dyaL6KteaBPQDBI0NpBagPW8WNKTO9c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLrUdJPuLPHIXYFfDAtmWkVoHnM5z9E5X1vxl3CL2q9UCcCwhWt3fTaBzj70QcBA4+E9N3L2YMEQJL4sKfokEl+xbbz1mkOZFR/MqQqb0bVLcuyqAPts83AhN3WX7rGxnc78Lh0lRDgI89m0tp0b7ycWNH0yXYR1m07mBd3mrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hnsZ6E9I; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso3999572b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 15:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724107145; x=1724711945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T31q96nI7HTHANhAbPDLeTjBqmklGP7ssi3aURXB78Y=;
        b=hnsZ6E9IBkGhSKmLHnPwTg9oSL9wZUydHI7JGaa7mXKpzyOpwINYhxstOPNI+NZYHf
         eNxR3aXYJHJvm7ORjktVfmfGeLvZrYJKzfGWUE9kvhxU7BMtzFzko9FFvNWI3zkU8uLZ
         N0cm7UVBklMh3fsMCpL3g8iFgVfChj/2MzLRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724107145; x=1724711945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T31q96nI7HTHANhAbPDLeTjBqmklGP7ssi3aURXB78Y=;
        b=eps97/vLRBbdq1v8IYosnjSIom7OLg7NojTuxG9uxkvbF5oTUEekO9aVqJYLJ//I5K
         hNlZWOPI5peshgjuJEO6ivthPd05bxmuMAaHSLHG8uCB8t8XZxS4xkdTEov+3orOl3Mn
         9N/pPpyxsTBE6Z0rCVrW/eK1K7IGubCewgpVErZ+KzeYd2R2F2CYs+cCiYTzc12tZJ1f
         QMCZseouvDQULBfYTyyCG2mWVsVb5X5zQC97IxMM+76Fep/UxKsCSxZA9hLHNk3HJq6v
         JK2ZTuCtJa4I/tF3bDZrJWtKO62YtjbeqQnIPZ1l5gCQL7sn7fp2mS1R3IFlATc97Zvt
         mmew==
X-Forwarded-Encrypted: i=1; AJvYcCWV47D+BP1R8+yFxRIhSj8IWvPlDZ6vASwc/1+34/hkEDjogY+NjZ0s7eLVN/Qz/USmMfHfIIXiTxHXWuFP23ch2MEppX6voWbh
X-Gm-Message-State: AOJu0YwDb+JHjM+K5B63NWHvXKDPHguXNk5qAHAEBebyXCyNQfvizF7g
	nrHzdsWmtspfWyeEt0zJA2dcmTU7de9tEAy/oKhP7lyQylgJ7KA1MvGPEBT9kw==
X-Google-Smtp-Source: AGHT+IGkbe8vELlVZVdfm7iYACRe3TPZ4k2lnZ7T8LU4DsUAYy70X4jlTSj4PuE13uFvl6Gg6qUx3g==
X-Received: by 2002:a05:6a00:6f68:b0:70d:2556:2b1 with SMTP id d2e1a72fcca58-713c4e73cccmr14140075b3a.13.1724107145269;
        Mon, 19 Aug 2024 15:39:05 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7127add7660sm7040208b3a.38.2024.08.19.15.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 15:39:04 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 13/17] dt-bindings: Move google,cros-ec-typec binding to usb
Date: Mon, 19 Aug 2024 15:38:27 -0700
Message-ID: <20240819223834.2049862-14-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819223834.2049862-1-swboyd@chromium.org>
References: <20240819223834.2049862-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This binding is about USB type-c control. Move the binding to the usb
directory as it's a better home than chrome.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Prashant Malani <pmalani@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml     | 2 +-
 .../bindings/{chrome => usb}/google,cros-ec-typec.yaml        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/{chrome => usb}/google,cros-ec-typec.yaml (90%)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..c991626dc22b 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -99,7 +99,7 @@ properties:
   gpio-controller: true
 
   typec:
-    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+    $ref: /schemas/usb/google,cros-ec-typec.yaml#
 
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
rename to Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
index 9f9816fbecbc..5ec4a9777ea1 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
+$id: http://devicetree.org/schemas/usb/google,cros-ec-typec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Chrome OS EC(Embedded Controller) Type C port driver.
+title: Google Chrome OS Embedded Controller (EC) USB type-c port driver
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
-- 
https://chromeos.dev


