Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D89848065D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Dec 2021 06:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234943AbhL1FUe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Dec 2021 00:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbhL1FUS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Dec 2021 00:20:18 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41ABC061757
        for <linux-usb@vger.kernel.org>; Mon, 27 Dec 2021 21:20:17 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id be32so28344131oib.11
        for <linux-usb@vger.kernel.org>; Mon, 27 Dec 2021 21:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ByvL2Uf/cXpEPeJ2AJET+qvtgysLCEvhZPeq63DSw38=;
        b=B4zhlUAr32kY5oZ8N53jC4N8hPIY76Y5v1jPJEOJ/8WQ/GGjZEEkjMyc62nzUR9fA+
         iwn7SXOmsb3AMDCG7G2wARbdPuxKskTye7cWKkq7ezq1aFwZdRFDIvbp4aaDMdgev2mh
         n7F1qLKmmQwyw5aKDR116G9iStrWa+eiY2wPMCHmXks6ElcXzV7rettiqdDEZ6+MqD6w
         KQ75+fbrRwUTxPrV4tFrmnTSLRGx9+/YVu2ldIlYlJP93Pwva0AUASZGtPKEAvjFEI7U
         0ljq2DhdsSpe3aUhVeYZoitZRvGXgDpIhWniyagk5LDACXH8GsQwmtBukZ0YqCumW61E
         qzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ByvL2Uf/cXpEPeJ2AJET+qvtgysLCEvhZPeq63DSw38=;
        b=z9zmqkrsg1rvkszcm1wgAOSUotvkqYLnmfq9Lh2GIQDBAragHL/7KVYQHNaj6RTau9
         5SHpPRfAPv5xItuDhJpMW8e4NzDuhmE7JutrmAkK6OzLKWdftgInDqdHqh/vuR8UthJE
         grPUhpesCCdTA65cPEPpbOF4E7NcDR6vqOMWsAkFvpHI/J87Y+7WlVb3S3/95T5tiqa+
         YAnkklHzJeD0J28PmkzDlUUnBO6nPBFcNWUVTnA2wuXjWQsNhWELA7vj99/slI25qNHt
         hPvl6WE+ZXF+alwkvuRLHA8UlDOteLRMOoGd9PG+zpdY/YS4QBBUZ5mUpObmJWEkvtKd
         5X0w==
X-Gm-Message-State: AOAM531hUm2BWR6JYX59WuaHik+X0p3LykkU5gH8S36BHn58/lBcT66h
        NQAnjZfM7rlNeio0KmWZAmAGJw==
X-Google-Smtp-Source: ABdhPJxct+CkbSvI41JFvkdLrfCsI0wdjHkYbiI93M8uVvOhwpL8J0QsaQ7QXmKuxWERI3iK92ZM+w==
X-Received: by 2002:a05:6808:1408:: with SMTP id w8mr15463765oiv.54.1640668817343;
        Mon, 27 Dec 2021 21:20:17 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j5sm3002277oou.23.2021.12.27.21.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 21:20:17 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: phy: qcom,qmp-usb3-dp: Add altmode/switch properties
Date:   Mon, 27 Dec 2021 21:21:09 -0800
Message-Id: <20211228052116.1748443-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228052116.1748443-1-bjorn.andersson@linaro.org>
References: <20211228052116.1748443-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The QMP block deals with orientation switching and altmode switching
between USB and DisplayPort. Add the necessary properties to the binding
to allow it to be connected to a TypeC controller and trigger these
operations.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
index 60dc27834e1d..f8a745ec479c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qmp-usb3-dp-phy.yaml
@@ -77,6 +77,20 @@ properties:
     description:
       Phandle to a regulator supply to any specific refclk pll block.
 
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the QMP to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+  mode-switch:
+    description: Flag the port as possible handle of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
 #Required nodes:
 patternProperties:
   "^usb3-phy@[0-9a-f]+$":
-- 
2.33.1

