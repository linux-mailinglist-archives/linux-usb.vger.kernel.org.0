Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 435ED7699F7
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 16:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbjGaOpA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 10:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233003AbjGaOop (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 10:44:45 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1440910EB;
        Mon, 31 Jul 2023 07:44:38 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6bca018afe8so213874a34.0;
        Mon, 31 Jul 2023 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690814677; x=1691419477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ePPa+IMosJbGz9DlPxTeDa00vTKu1/AT7FBwSGiTBk=;
        b=eb7x1cBmHdaK/OUE0lzoHoC1UTCIO+0bpNyYJzbAUNF1Qpoas2J4X+PfAMioaSEmbJ
         MF8tN5y6DrS3ImYEFgvC6xwQmalGXuDsXG1WvZl1VA8uVWef2XaIy4mBJ9+aZAAb8m8T
         kxO9SD8WH5ej2fbJnuQ1jnog5A9iXhlyiO93UFZWKA8iSng43jU/ulbXLquZhdS5aTcS
         81ci3C33BjmOtZeoOSjekXvp489IWNHV7wbsPfYMaXvtNxdbs0nlHGurDAqu6qxXezjd
         dToVGr8UrKyolEjEsEi3bQTpyUq4Xn+P00Gedt8q4Bf/D0wq2pnM7iN8BYgcpue7b8AZ
         +Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690814677; x=1691419477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ePPa+IMosJbGz9DlPxTeDa00vTKu1/AT7FBwSGiTBk=;
        b=MVT6Tfk1iLdjOJPgdYjj6Y3/pYynf5j6AlAyLfa+44Aeesf2z1kWB4Pz5l/wfxM0Ga
         0i1zHgogjFFvtSZo2HwohPyZeJiRygA7YonkGLhKcNzw35eXSrJ/VQxLKzhrfiMHZ9G8
         ZX30ii/GuE9aPLrV8+Fe67kp/pKFJoJ12PdV1moZJOt8LLhGD397MSqBaXuAY1F9WMkJ
         jSBSWs7K6cL8IoENinNa6M/hJjGt5FKqzQAwXJA3h+U7CRinD1i1JAbQNGI00QZjehX4
         2iKOww6ntc1mtUHoto9twrOu/lSxw1tR7GwD0bP3wftEdbTCYJ2pBvzhlXHeC4zYx62g
         lLNw==
X-Gm-Message-State: ABy/qLY97HKZ2IiWrDzmQbWKami7747c9d/QI4W6HpUtLvW4zC3Jhmp9
        chMsv+2PRP+9acLc8ShZZkt9lGubo2M=
X-Google-Smtp-Source: APBJJlFObnpZxymWJzWvdscqEhaCkSLsHzUed1GmeZg0oubHvbxc7CBm6klJi/wqcq+M04AEDRRXWQ==
X-Received: by 2002:a05:6870:d107:b0:1bb:724f:2bca with SMTP id e7-20020a056870d10700b001bb724f2bcamr6757750oac.1.1690814677195;
        Mon, 31 Jul 2023 07:44:37 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fb3f:fd5:45fe:5e7a])
        by smtp.gmail.com with ESMTPSA id d44-20020a056870d2ac00b001beeaa10924sm822252oae.0.2023.07.31.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:44:36 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] dt-bindings: usb: ci-hdrc-usb2: Fix clocks/clock-names maxItems
Date:   Mon, 31 Jul 2023 11:44:22 -0300
Message-Id: <20230731144422.1532498-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731144422.1532498-1-festevam@gmail.com>
References: <20230731144422.1532498-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabio Estevam  <festevam@denx.de>

imx35.dtsi has three USB clocks. Adjust the maxItems to fix the following
schema warnings:

imx35-eukrea-mbimxsd35-baseboard.dtb: usb@53ff4400: clock-names: ['ipg', 'ahb', 'per'] is too long

Signed-off-by: Fabio Estevam  <festevam@denx.de>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 85016dd2e187..d2303f9a638c 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -77,11 +77,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   dr_mode: true
 
-- 
2.34.1

