Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1739E2F3440
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 16:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729960AbhALPgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 10:36:11 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:38726 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389869AbhALPgK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jan 2021 10:36:10 -0500
Received: by mail-oi1-f169.google.com with SMTP id x13so2726219oic.5;
        Tue, 12 Jan 2021 07:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rwndpzB2NMxD4+GOuIBXubpnWUZBzuaIoFb33FQ113Y=;
        b=SiALvPp6Vdu3gFgx//b/GmdJ8EVCIivkbs3AAZVIVvFoeg4eJkJlxGyTeezVUNPBt/
         rxnjpgIfj+UJmujEyJUQKHEpozqVNvgPLa4zAMD+AZwZqMUDLFSKjaks0kkIoyhOnakA
         Ar0f+UK2/iWwlOIAHem8NjTos6mmDEplaTgUcz33Os7g8KYUNmeWrB3eGkGfKDxngyOW
         Hf06NczkYlGxn3+9lK/As9/1g6RL51n5jVGP6aTISeWONk9G8d+130gRwozbAc+wU7rv
         XXi7G8MD8JqB6nttTrwSr0PK21cDj9GGlH5bKj4LTNqUCaihXjowa7mPCiPpHuIWz6fa
         K6gw==
X-Gm-Message-State: AOAM532FKif/xtHFqhfJlOYB3YjWniVSYfYZ/6xfgEp33/Og+RB/GlEd
        zbxhABDy5CPzzR4ot76jOJsdrfKIVg==
X-Google-Smtp-Source: ABdhPJypxGLxfXjDkpFHCGBfMBtLwUu1uYus11CwgPlFBBa0poSrwGenkMIILzHt8XBb6MrqLhHaNA==
X-Received: by 2002:a54:4694:: with SMTP id k20mr2695873oic.64.1610465729069;
        Tue, 12 Jan 2021 07:35:29 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id i1sm708075otr.81.2021.01.12.07.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 07:35:28 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: Use OF graph schema
Date:   Tue, 12 Jan 2021 09:35:27 -0600
Message-Id: <20210112153527.391232-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that we have a graph schema, rework the USB related schemas to use
it. Mostly this is adding a reference to graph.yaml and dropping duplicate
parts from schemas.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/usb/renesas,usb3-peri.yaml        | 7 ++++---
 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml   | 8 ++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index 929a3f413b44..9fcf54b10b07 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -54,18 +54,19 @@ properties:
     description: phandle of a companion.
 
   ports:
+    $ref: /schemas/graph.yaml#/properties/ports
     description: |
       any connector to the data bus of this controller should be modelled
       using the OF graph bindings specified, if the "usb-role-switch"
       property is used.
-    type: object
+
     properties:
       port@0:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description: High Speed (HS) data bus.
 
       port@1:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) data bus.
 
     required:
diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index 52ceb07294a3..b86bf6bc9cd6 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -26,17 +26,17 @@ properties:
     maxItems: 1
 
   ports:
+    $ref: /schemas/graph.yaml#/properties/ports
     description: OF graph bindings (specified in bindings/graph.txt) that model
       SS data bus to the SS capable connector.
-    type: object
+
     properties:
       port@0:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS) MUX inputs connected to SS capable connector.
-        $ref: /connector/usb-connector.yaml#/properties/ports/properties/port@1
 
       port@1:
-        type: object
+        $ref: /schemas/graph.yaml#/properties/port
         description: Output of 2:1 MUX connected to Super Speed (SS) data bus.
 
     required:
-- 
2.27.0

