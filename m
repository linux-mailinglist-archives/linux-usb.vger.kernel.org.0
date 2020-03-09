Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAE417EA56
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 21:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgCIUn5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 16:43:57 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:39855 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbgCIUn4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 16:43:56 -0400
Received: by mail-yw1-f65.google.com with SMTP id x184so11546567ywd.6;
        Mon, 09 Mar 2020 13:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iGljD+kg3lGUw+qrriqk7js900WesZXIV0yY3y9iUng=;
        b=oLqluHNh4+6n9kKsC2hAemjPAfYf8GecnPNKqtg2cHPvO1ag6rCQ/rLYFqGfowP3xs
         a90ST9g+ke71LyAxndarZf4y3KAtCSA/HRQj+9XqD/yd6U0hZcm/fhnvk7z/Q4U4lG7p
         V/wCYngYuZpfReh3Aesrvx5ilXZ0w/15/RCPhvfEx8AU8WrxVPSo1pmeKJWdfpi2Zkle
         vY5lo1oe+Qj1fBrq9EgtLRuMLG52d52FuL9VL+5dyz4PHw+Cp9VtwDnLYA4VfDM4l8K8
         rPa9CCVxnO/YrWsr+3tRS7iaJUJkAQ4vmG+g7sbbwBkmBhgz9K56fevxcu/BCRdLuoVZ
         fjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iGljD+kg3lGUw+qrriqk7js900WesZXIV0yY3y9iUng=;
        b=DV6KNZI10DT5AsAEyNSsbhzaUAJGWmp6F62KfbOMQJCbK/3H8PJLg5M7zT/+xFdbhN
         7I7jA1FGhjkbFQ4kcv9Pfii73HxFFjHRWLSKm7L4BWS2Vogme4XbyDmtv7E4osNlTffm
         Vn8oaXTLHWkjvuhIFguAxtLY+4X1v0wKmn3JNtEP2cqg9J2NRyxBQH3zYoq/iUmJNxpJ
         gaFjq+j96YJbdJxknbmQ4Pc1K6ySRIrRZu/SuGMLZfvhj/7l6FhW6OewtsZai0vWp3dP
         S1BeNA1o5FCG6G6J2WB0V1rvYb7MM5wbpLQd+NxfLxTawK1PTZTk2dqAVeLT2jwKDPvW
         OQAw==
X-Gm-Message-State: ANhLgQ3L2WoSCRd90UyZczjWmm5Wbql+otlCPecetg3UC3T/znVqhyRX
        bLUCKR/uSse2RbFosoZjclU=
X-Google-Smtp-Source: ADFU+vv2TDpq/h3wCCDcv+Fxr03qtR+cFf0cB8hfeitM6IhCuRwdjMGDeysfv6bHfb80p/bSuDF1ww==
X-Received: by 2002:a0d:c406:: with SMTP id g6mr18270497ywd.267.1583786635406;
        Mon, 09 Mar 2020 13:43:55 -0700 (PDT)
Received: from farregard-ubuntu.kopismobile.org (c-73-177-17-21.hsd1.ms.comcast.net. [73.177.17.21])
        by smtp.gmail.com with ESMTPSA id s63sm17998768ywd.82.2020.03.09.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 13:43:54 -0700 (PDT)
From:   George Hilliard <thirtythreeforty@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     George Hilliard <thirtythreeforty@gmail.com>,
        Icenowy Zheng <icenowy@aosc.io>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 1/5] dt-bindings: Add new F1C100s compatible strings for USB
Date:   Mon,  9 Mar 2020 15:43:22 -0500
Message-Id: <20200309204326.27403-2-thirtythreeforty@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200309204326.27403-1-thirtythreeforty@gmail.com>
References: <20200309204326.27403-1-thirtythreeforty@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This chip contains variants of the already-supported peripherals present
on other Allwinner parts.  Add a new compatible line for them.

Signed-off-by: George Hilliard <thirtythreeforty@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml     | 1 +
 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml
index 020ef9e4c411..1762a302c594 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun4i-a10-usb-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - allwinner,sun4i-a10-usb-phy
       - allwinner,sun7i-a20-usb-phy
+      - allwinner,suniv-f1c100s-usb-phy
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index d9207bf9d894..d2eea0003b99 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -17,6 +17,7 @@ properties:
       - const: allwinner,sun6i-a31-musb
       - const: allwinner,sun8i-a33-musb
       - const: allwinner,sun8i-h3-musb
+      - const: allwinner,suniv-f1c100s-musb
       - items:
           - enum:
               - allwinner,sun8i-a83t-musb
-- 
2.25.0

