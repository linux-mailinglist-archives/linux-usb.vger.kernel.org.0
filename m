Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAA06993FB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Feb 2023 13:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjBPMMc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Feb 2023 07:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjBPMMb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Feb 2023 07:12:31 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF24564AA
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 04:12:26 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b3so2531157lfv.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Feb 2023 04:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5xa1EgxIuknODW/uxmcnzw4VoWb0VoixqD9F/6r/2kI=;
        b=mXTOhX8NwTDA23CAvJrkwEBGQd0MTwe9gvMrXRGiDSG/+UmqpW9kQ2WNH2pHckZ6bZ
         iRfRvrbTih4mtqGcHEOrAcvpBJaECdgRC94rvROmmsMFZ0Xs1/X48yh6U7Wn1CgN6g/u
         vqvjDE0AtOteACicAJnOEUmVwuaUNfff69Z0QH2NcMv5V/U+BJem3VB8mkb8VzFKSVFq
         luGLNCl4UODo7yHQWGUDwLWCET5elF7YzuqtbCKREVWAbwhm9KyxnAdXsWd5bSCZkA3X
         sYT6kyfYozkTg8MJs32xmJh6GRPNhpsAHayh/AJeDFsPMAUGNGOZtw2KlHND3VI0MrMW
         hKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xa1EgxIuknODW/uxmcnzw4VoWb0VoixqD9F/6r/2kI=;
        b=bHyZga78WdQ5DJHNbl4/NSsy2mQJSykkCBDFUJXrKbqXD22LIc6WBI9loX1f6pLxMB
         JPlrQWD4Wo9X+mJMzIfjr6K/blN5QKVbwsFU7CI2xY0HhTp2xLOSXBGd1x+dInZ/LXdg
         /MyztbXU4eCEq2F8ty9/lAsIXznp9yfi2d9medL8+DRTib7IXc6nYyi+BZQpm9w2JVQs
         mwIsquIBttCguKc53oMxDDjPJxInObES8JQRsDSuyiGTk2LsLVHvzeo9p61QTnQbMcBA
         eceng5qU5wnReijVVTDe2Ju/24LoJ9PeGxu/beVgMgMluVM2R9CTv0xJbUWrg0t+AZmg
         bxyQ==
X-Gm-Message-State: AO0yUKWylwyqAtSlH3Tx5b1f4ju3C8s3VopcEb+T+P3epB11274VCKPF
        qoQULi/JSVcQL6rc/5ak1C4k9A==
X-Google-Smtp-Source: AK7set8gHz2zlSC0sGqYDh4zrURadOgNH0ueAYynB3wPhj/9oVZ9hQQtl4FxuuyOcRQ7u6nY9dkDMA==
X-Received: by 2002:ac2:4908:0:b0:4cc:7a44:f05f with SMTP id n8-20020ac24908000000b004cc7a44f05fmr1523734lfi.31.1676549545029;
        Thu, 16 Feb 2023 04:12:25 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id l2-20020ac24302000000b004dc4b00a1f3sm278509lfh.253.2023.02.16.04.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:12:24 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Gene Chen <gene_chen@richtek.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings usb: typec: rt1711h: Use a generic node name
Date:   Thu, 16 Feb 2023 13:12:10 +0100
Message-Id: <20230216121211.3964433-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Node names should be generic. Use typec-portc@ instead of rt1711h@.

Fixes: a72095ed8e65 ("dt-bindings usb: typec: rt1711h: Add binding for Richtek RT1711H")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 1999f614c89b..7431c25d82ce 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -17,6 +17,9 @@ description: |
   support for alternative interfaces of the Type-C specification.
 
 properties:
+  $nodename:
+    pattern: "^typec-portc@[0-9a-f]+$"
+
   compatible:
     enum:
       - richtek,rt1711h
@@ -55,7 +58,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      rt1711h@4e {
+      typec-portc@4e {
         compatible = "richtek,rt1711h";
         reg = <0x4e>;
         interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
-- 
2.39.1

