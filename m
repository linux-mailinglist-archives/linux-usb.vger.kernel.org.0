Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 137F3198EA8
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730070AbgCaIhf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:37:35 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45173 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730053AbgCaIhe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 04:37:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id t7so24763998wrw.12
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2020 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bw9s/mMNE/c7asckCQOQ8iAFN4jSk9KCdHX9uwgrhEw=;
        b=XTvtKtJFWmp2Zmc3VHP/lvfCJ1inAsyaqylWIh4Ss2EKA+1ovJ1tZmg5c1aXZ3q1zH
         goXa/80FrVAlCdEsamIa0Jor0NdqbZbeODuoBI4nBsVZjN54/VQXvZWNDd3Yt5c8Zzog
         y+6S1xkEXg9k9OHLfXBnbyNzBRQEEvi1RUL7KPol2Ldpc6jaI+0wWqYOUDr5VxOjlLOG
         Thgq/dr9FhALeoYg9RGCzIZhLz0emEdHlnoFSv3kct7Gz3xgQ4um7eDgk/DyxIVFTAyN
         KGD7UbQHUcme5r1KIMbkd1YQI/FYPlMhhp4FeOk12xCgoCxR9ciQpHntE1wf1+flNhUK
         5k/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bw9s/mMNE/c7asckCQOQ8iAFN4jSk9KCdHX9uwgrhEw=;
        b=U/DtY9KO8PLCTMnikIaaxo1dmGkweglcjnTeccRWPXEFNx+I3PvHucLOqhKoavY4X3
         BOi+r7x7lDBQaVdKFQaqzAXfMCc4zZHKeDwGPCZ0AikYT9HwlwrlMVnVAc65OrzbR/vW
         YQVvSEo6NEpt1iswbeZ9a5ACEgBX7NFQ50bttyFQ75sNB1OvHlo/iiaBC9vU8ktkVC6q
         NLHmh4YN8wksspkn7S7tZs4NQwEsFiYG9TfSmZ/GoyfnZauSfUuU3q8oHU900WH8YuPP
         MatG69Y/JkF7IBPkNZIVCl8RitpA+5pbQYKOMXyxPryaH9Vw9k4kWjnbu1KfvXp3ok26
         7qHg==
X-Gm-Message-State: ANhLgQ3s9yE/NDWUeOT8Z3bAQn+XWy9hQCIUHKSg0f4LI0ZhbD4E4/nV
        VwZbhUTsJlt7ikEdbTERk9CKcw==
X-Google-Smtp-Source: ADFU+vvfGC1b/+1ygxgUrGk28VZ+Ia8a+bilQBp6RcBH82KuSbgACrUme3dO63WJl/H4m1H7wNagzQ==
X-Received: by 2002:adf:b307:: with SMTP id j7mr20134382wrd.128.1585643852432;
        Tue, 31 Mar 2020 01:37:32 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
        by smtp.gmail.com with ESMTPSA id j188sm2955870wmj.36.2020.03.31.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 01:37:31 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     devicetree@vger.kernel.org
Cc:     benjamin.gaignard@st.com, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2] dt-bindings: usb: dwc2: fix bindings for amlogic,meson-gxbb-usb
Date:   Tue, 31 Mar 2020 10:37:29 +0200
Message-Id: <20200331083729.24906-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The amlogic,meson-gxbb-usb compatible needs snps,dwc2 aswell like other
Amlogic SoC.

Fixes: f3ca745d8a0e ("dt-bindings: usb: Convert DWC2 bindings to json-schema")
Reviewed-by: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 71cf7ba32237..b5303d918e70 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -44,14 +44,11 @@ properties:
       - const: lantiq,arx100-usb
       - const: lantiq,xrx200-usb
       - items:
-          - const: amlogic,meson8-usb
-          - const: snps,dwc2
-      - items:
-          - const: amlogic,meson8b-usb
-          - const: snps,dwc2
-      - const: amlogic,meson-gxbb-usb
-      - items:
-          - const: amlogic,meson-g12a-usb
+          - enum:
+            - amlogic,meson8-usb
+            - amlogic,meson8b-usb
+            - amlogic,meson-gxbb-usb
+            - amlogic,meson-g12a-usb
           - const: snps,dwc2
       - const: amcc,dwc-otg
       - const: snps,dwc2
-- 
2.22.0

