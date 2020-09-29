Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA8227BB12
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgI2ClT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbgI2CkV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:21 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D44C0613D3
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:20 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id 205so1839791qkd.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=r+Pbf/cPZ7cM9vwnFe3kTShrMnYH0vwdWwOs0RKMZNQ=;
        b=vtjBgMuX7xiPCpWbXdmwxxQ6PxN1gXVmpMz7HmqDvLwohheM9u0S8IqH6Gak02QVWF
         g+PgvNwbFQuAimZWth1cKoDK59Z4yH0qL+x0WR6SdWHp067kzQfa/3ZNmvU+7abcwPNF
         ZEL3j9LaPmOgJow5JU8Y6vo8AX74So3gVdAUAsUzug1AIAMllf7iUh2ph9cAe//CPYiR
         +iSSkL/h7srD2KkL1JFz9ku4dcl6IxHAkW6s4wJ30iFok9VmpKv5UxPJVkZ6HQVNZQ9k
         H8EUjF/KheWwRTVact71sAS2vZun0mLh9TXjIDasvkEaeLaP0Yp8V8D87Hk4gFhgXknb
         eCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=r+Pbf/cPZ7cM9vwnFe3kTShrMnYH0vwdWwOs0RKMZNQ=;
        b=qQq3+y+73Dh5eL2S7T6vJrBAY1lJGJ5CUZ/gytmF+X/VDZic9gFyLyo/hCRqAgkZP+
         7mXEsNh7jBiiSxWlIlAmKEoQEZcIuidSmdhnKpwYKR0H8ePuJcbJ+G3Xkm7S+CfiO6ji
         l+vnOxcMNwsMtsAzer0BLf4ZR//2pUNA8RxochvKJusyl5YohzEJmsuwyPey/5C8+0Xs
         3IPzURlRxCkusBHTly7snS/5k+LqVaun76QRdajBYjcvp1XuuJwOZL/8V4NB4EyTsVe4
         PKAG6sKStL2ybiLuVFkXuusPka7ZWg4/TWNciM1+Vd/dOrX1GUKpIz68tm/VqJ2J8Ri7
         tuoQ==
X-Gm-Message-State: AOAM531EbNXm+yHCnhu1JgiZ7nTzd2HqWyb2mvf5OMq0nd2a7FwtvPnM
        iDnkX8I4v3EtD4M2Xr756svmgbxtqIM=
X-Google-Smtp-Source: ABdhPJxGadWG2iknOO76CE0S4YRDwzAChTLOy2tm7i6eLksygnI+LoOFiR1U//vaDHQGGPLdj5Q5qW2codQ=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a0c:e904:: with SMTP id a4mr2626617qvo.24.1601347219881;
 Mon, 28 Sep 2020 19:40:19 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:39:54 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-6-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 05/15] dt-bindings: connector: Add property to set initial
 current cap for FRS
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change adds frs-typec-current which allows setting the initial current
capability of the new source when vSafe5V is applied during PD3.0
sink Fast Role Swap.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- Removed the redundant usb-connector.txt that I created by mistake.
- Moved to yaml.

Changes since v7:
- Rebase 

Changes since v8:
- Redefine new-source-frs-typec-current as string enums to address
  Rob Herring's comment.
---
 .../bindings/connector/usb-connector.yaml     | 26 +++++++++++++++++++
 include/dt-bindings/usb/pd.h                  | 10 +++++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 9bd52e63c935..0b8cd08a8678 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -142,6 +142,32 @@ properties:
     required:
       - port@0
 
+  new-source-frs-typec-current:
+    description: Initial current capability of the new source when vSafe5V
+      is applied during PD3.0 Fast Role Swap. "Table 6-14 Fixed Supply PDO - Sink"
+      of "USB Power Delivery Specification Revision 3.0, Version 1.2" provides the
+      different power levels and "6.4.1.3.1.6 Fast Role Swap USB Type-C Current"
+      provides a detailed description of the field. The sink PDO from current source
+      reflects the current source's(i.e. transmitter of the FRS signal) power
+      requirement during fr swap. The current sink (i.e. receiver of the FRS signal),
+      a.k.a new source, should check if it will be able to satisfy the current source's,
+      new sink's, requirement during frswap before enabling the frs signal reception.
+      This property refers to maximum current capability that the current sink can
+      satisfy. During FRS, VBUS voltage is at 5V, as the partners are in implicit
+      contract, hence, the power level is only a function of the current capability.
+      "not-supported" implies sink to source fast role swap not supported.
+      "default" refers to default USB power level as described by
+      "Table 6-14 Fixed Supply PDO - Sink".
+      "1.5A" refers to 1.5A@5V.
+      "3.0A" refers to 3.0A@5V.
+
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - not-supported
+      - default
+      - 1.5A
+      - 3.0A
+
 required:
   - compatible
 
diff --git a/include/dt-bindings/usb/pd.h b/include/dt-bindings/usb/pd.h
index 985f2bbd4d24..db1ad4532197 100644
--- a/include/dt-bindings/usb/pd.h
+++ b/include/dt-bindings/usb/pd.h
@@ -35,6 +35,16 @@
 
 #define VSAFE5V 5000 /* mv units */
 
+/*
+ * Based on "Table 6-14 Fixed Supply PDO - Sink" of "USB Power Delivery Specification Revision 3.0,
+ * Version 1.2"
+ * Initial current capability of the new source when vSafe5V is applied.
+ */
+#define FRS_NOT_SUPPORTED	0
+#define FRS_DEFAULT_POWER	1
+#define FRS_5V_1P5A		2
+#define FRS_5V_3A		3
+
 #define PDO_BATT_MAX_VOLT_SHIFT	20	/* 50mV units */
 #define PDO_BATT_MIN_VOLT_SHIFT	10	/* 50mV units */
 #define PDO_BATT_MAX_PWR_SHIFT	0	/* 250mW units */
-- 
2.28.0.709.gb0816b6eb0-goog

