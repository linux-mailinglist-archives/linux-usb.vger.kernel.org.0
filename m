Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9D4799B25
	for <lists+linux-usb@lfdr.de>; Sat,  9 Sep 2023 22:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238834AbjIIUa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Sep 2023 16:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjIIUa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Sep 2023 16:30:58 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD6E19E;
        Sat,  9 Sep 2023 13:30:53 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-56e280cc606so625551eaf.1;
        Sat, 09 Sep 2023 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694291452; x=1694896252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z+jFTGPtNIFqEVr30ts3XPd1wAf58v/VZw34R2U5exk=;
        b=P72yPnktDFQdOUh9WL6oN+Im4bX2hqbAvqphKL93qwQpJYRadRP80Eb928n4pVWKiP
         A9WSQE+H6Gl2OSAObnUTy3bAQs3Yuf/aC4GFg4PeDAV/oe1/oWDpazVDX18Z/7aSRt5T
         bQAU3N5NNbsS7TTv1CvoQ1drq2OLdeLfALZM6Ug6F5K4BpkszOP0Uk0iMlymjDxiNaIy
         jEpdqDOh06w+Smy9FR3t3RF4atpDkrz1JZko4sahGDcUtbeOEP3x/vscJevlbmJwPQqh
         wdCEvizPhOb/yqjZR5ZdEvuy54UOPDVAXARr77GGso9BrM1OgdYPM+q4QZY03WeQfooI
         0DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694291452; x=1694896252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+jFTGPtNIFqEVr30ts3XPd1wAf58v/VZw34R2U5exk=;
        b=t9N0p7/DCBwyqInLgjb+c4bZDKzjFQ3+b6NcpJkFF+A4npPnZLaJiT4WBRd82xpLC4
         EDvxpaiTKdzM28iiVwqSvWxE6QZc1++Vn6u5PHJDtKnXZiyNOmhjZldWpamKikpaQeo7
         x3aQQUrtrs6UrIWc3x0FX0AAhOLr8X+UY2fRD7+Qt3bAcJpNFHKmWuMgK7Bq8vOeaBVs
         jBfpbcatH/31p5tkFwlPoZThYPDYmktb+uaGOAAOi3qM3uG4XjBSrV/NR9PnUXiUUk2W
         cwx/eiSb3mQMn/q9vEHy6Sjq+3NF3v2RE81IKbGNrxDcRN6fJC6sXFwB+T1KuVkJpJje
         2DLw==
X-Gm-Message-State: AOJu0Yxr7AP+EzS7kUJc9mYKqIIt3a8Tjx6KIBJJvxEg3DRh36nzuYqc
        tl/xVV4ciP29h7bQ+CDQOSI=
X-Google-Smtp-Source: AGHT+IG0J+QYAA4sjAXeEwhLboerUCGeBoewzbLNw2JJAoNpfRnxMXs4tyCEp49u1rPDauJyh9QpKQ==
X-Received: by 2002:a05:6808:218f:b0:3a1:d457:83b5 with SMTP id be15-20020a056808218f00b003a1d45783b5mr6904452oib.3.1694291452269;
        Sat, 09 Sep 2023 13:30:52 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8ae8:e729:67d1:f8d9])
        by smtp.gmail.com with ESMTPSA id d12-20020a05680813cc00b00396050dca14sm1873509oiw.28.2023.09.09.13.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 13:30:51 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     andersson@kernel.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for CBDTU02043
Date:   Sat,  9 Sep 2023 17:29:55 -0300
Message-Id: <20230909202957.1120153-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

Add a compatible entry for the NXP CBDTU02043 GPIO-based mux hardware
used for connecting, disconnecting and switching orientation of
the SBU lines in USB Type-C applications.

CBTU02043 datasheet: https://www.nxp.com/docs/en/data-sheet/CBTU02043.pdf

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index f196beb826d8..b61dcf8b4aad 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     items:
       - enum:
+          - nxp,cbdtu02043
           - onnn,fsusb43l10x
           - pericom,pi3usb102
       - const: gpio-sbu-mux
-- 
2.34.1

