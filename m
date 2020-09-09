Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614AA2632DE
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 18:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730748AbgIIQwj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 12:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730704AbgIIQFE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Sep 2020 12:05:04 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45D22C06179A
        for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2020 09:04:20 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z9so2937419wmk.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2020 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h1AWnbsFuPZ6MacypHQ8HsT3a6NqF6t9qfTWoa+8SvY=;
        b=CBEtX+eetvQyYOJlhFNdL2Py9mlE1aqXsNu2yLaDW0ofpA3brnezX+6b7BJvAYKLuT
         V68bQ27V+dOY0t21Y4cMcopxcuHJl9KObw5od6vAqTGIiccB8nljhohkaX6b988Fh2dk
         +WW6yD629U3/2fVJqNwKLxqout6WmwgAJehP3FyS2yuM8GQiUC90ENf1p4GYBpYQ1Iie
         Wpy0Soe3C+7W3P8HjatHnNJQkG2CkCbnx8oIy57b/J9dP5ITDpA9dh0MNYzSsk8BdLcY
         BApABE2lixWzfO/MPhOK6ycI/B2lwLg0mofAc4MAh5J3fNsWtMENu062OPINiimT08Cd
         6Edg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h1AWnbsFuPZ6MacypHQ8HsT3a6NqF6t9qfTWoa+8SvY=;
        b=boGK6PUAFirltk1oJcULiCuU9+c9wAnK2M7JzP0Ub7pYAY4lZsJ8RnecqlITmL5JAy
         w7QW3WpwlTv3SXY1tIIfaLPi9UICHEBuOqSp81W77SrDTGeNBPCWCjTLtKWQVBQdj/kW
         sPOplpvrVyyrQzsAMAcxhyE/vZYpPybwRk7wsF0FK3DHo6MuZFbPONz/uByXjRXkgCWk
         j+kEIirSApmAz7Yk4jyknB1gjzqc9ZNYQD4KvPq1c5dsWEkU2lbUkh0sZBGDQwCv5gPc
         9onjvX4WYnFWdYhvwrRL8NSuQ8q4I3WaL0djjN7FWahFuDVa1pXBNpf1nfH/YADgazP7
         z+/w==
X-Gm-Message-State: AOAM5335//kKlEMwaQ8kY6T6AYGPgx859pjjimGiYY5IINsdzIaplhJ/
        r7sMi2IP9P4gBkL4z7iFIK4qFg==
X-Google-Smtp-Source: ABdhPJxj7lBo+0hk4DkP0KoDHzMJtbj02HX+VSFjyvK7FqFw6/ssYu+ZmXW2UR8kbhGhvelekB8u/w==
X-Received: by 2002:a7b:c5d0:: with SMTP id n16mr4098812wmk.7.1599667458702;
        Wed, 09 Sep 2020 09:04:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
        by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 09:04:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG Families USB Glue Bindings
Date:   Wed,  9 Sep 2020 18:04:06 +0200
Message-Id: <20200909160409.8678-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Amlogic AXG is close from the GXL Glue but with a single OTG PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index 5b04a7dfa018..c0058332b967 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -25,13 +25,14 @@ description: |
   The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
   host-only mode.
 
-  The Amlogic GXL & GXM SoCs doesn't embed an USB3 PHY.
+  The Amlogic GXL, GXM & AXG SoCs doesn't embed an USB3 PHY.
 
 properties:
   compatible:
     enum:
       - amlogic,meson-gxl-usb-ctrl
       - amlogic,meson-gxm-usb-ctrl
+      - amlogic,meson-axg-usb-ctrl
       - amlogic,meson-g12a-usb-ctrl
       - amlogic,meson-a1-usb-ctrl
 
@@ -151,6 +152,25 @@ allOf:
 
       required:
         - clock-names
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-usb-ctrl
+
+    then:
+      properties:
+        phy-names:
+          items:
+            - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: usb_ctrl
+            - const: ddr
+      required:
+        - clock-names
   - if:
       properties:
         compatible:
-- 
2.22.0

