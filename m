Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB445190A92
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbgCXKUm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:20:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36181 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727150AbgCXKUl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:20:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id 31so14662774wrs.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PTVvCh6PCJj9CPS0mPmEeRILoyiEMTqk2ooxm8xZf1k=;
        b=EEH56wJBqun7EBSVO4LMn6fqPoTs4At2LM/YVV2dtVHxxbpJuN3szu7uSpe+kSmvi3
         TxCvqdQJquFANwLgUK+fQPNkG608Rkh94NOPfDs6MMjSiiREA3uudX/TedyWtWiTnyFY
         EzgQ7NpsLtbO6g1gyMPfdcBV89d97RTuF0W5cg9SUKkAESJgkdtJwZFxU9O7uIHugZ1d
         1k70pLR86Lf9DQ8w5F2ZadKf4edU3JPtuEtGh9Tjwic7MHmGL00zd9Tm258pm+VsMltS
         M6U0YI2KMrVMVjygtAnys1cOp4ZMzHXENKLwlLxS9LbdPwxWGI4lw14Z07p1aSdaH1Gj
         hCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PTVvCh6PCJj9CPS0mPmEeRILoyiEMTqk2ooxm8xZf1k=;
        b=CtmnyZcYm8PUC0X6bpZysi7uldQdCb0Kr6NOfItXoa+yutJ8hdx3VeQOy4zbaP9Bl4
         nxty57sJN+LygJnjRHFoWfBJ8+XSR7vsQjUycujMSQ6PaQpfNu100+5zkuBtEHWqzdls
         YDEBPcjcz6wIwLgrfSn+HdOmsUzrLaqfEb0U8tuvhlEcPhRNRXfTHuNlIwX45Xdqx61r
         +8pKX9hr2hsYkhZXMv+w8tWPLBujvHpekphc97u0SniagXo1IHcO6gSf+XecJCKNL6LY
         hFs0NEbXd4bQG0jCJQY62L5jpU/CvOU8YMoiRpnz/VPfVWVxTY4ACvHw8ixdBKzbN3Wz
         ZH1g==
X-Gm-Message-State: ANhLgQ1bMuqfypOF24OFJyoUXkxokmKFp+Tnb6VyNwm1zTKtWWS3ichm
        3pdqN9wnhQE6nzl47cb3qxsRGw==
X-Google-Smtp-Source: ADFU+vv0Pm5TZxBHMF9uclt+1rsV0UT+7tGkBMqmqLouYZCDr6eH28qreQbJ7FmeuNB4K4N4oYjX8A==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr9469000wro.245.1585045239496;
        Tue, 24 Mar 2020 03:20:39 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:20:39 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic GXL and GXM Families USB Glue Bindings
Date:   Tue, 24 Mar 2020 11:20:18 +0100
Message-Id: <20200324102030.31000-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Amlogic GXL and GXM is slightly different from the Amlogic G12A Glue.

The GXL SoCs only embeds 2 USB2 PHYs and no USB3 PHYs, and the GXM SoCs
embeds 3 USB2 PHYs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index b0e5e0fe9386..e9afedbe8424 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -25,9 +25,13 @@ description: |
   The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
   host-only mode.
 
+  The Amlogic GXL & GXM SoCs doesn't embed an USB3 PHY.
+
 properties:
   compatible:
     enum:
+      - amlogic,meson-gxl-usb-ctrl
+      - amlogic,meson-gxm-usb-ctrl
       - amlogic,meson-g12a-usb-ctrl
       - amlogic,meson-a1-usb-ctrl
 
@@ -89,6 +93,23 @@ required:
   - dr_mode
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gxl-usb-ctrl
+            - amlogic,meson-gxm-usb-ctrl
+
+    then:
+      properties:
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

