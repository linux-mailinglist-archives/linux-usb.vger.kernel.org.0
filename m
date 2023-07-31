Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C467699F5
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 16:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbjGaOos (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 10:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbjGaOoi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 10:44:38 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4876A10C1;
        Mon, 31 Jul 2023 07:44:35 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1bb6d6b09d6so1134972fac.1;
        Mon, 31 Jul 2023 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690814674; x=1691419474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7d7INobfDxOpMkWypEdSgvYnpooGOM0WqSpMzmhXiUI=;
        b=RWyDNaj9dwuh4PAHVBTYSK7cHJu1luoWPGw8/3icsLK6L51wAXv1xZuXJLa4aEQXwZ
         9t/moS05lrmtVddD/d8lcm8HhIE2rkcHJrNw0uaNMjQJDZj9SS5oSX9MzF/eA4WWPh+C
         NCRpUZi9Rt9GyJJMeLu4QkljvRnLx2U89D+fQgVeBXhttQe5ATbyLpliClSXWGcTnzRS
         twVB5eM5FW8tziDFeNEDwjTNhnZYgPUiaQWgc3v5+BgYQmOMDYRnuUEN4BZQM+1YRT7/
         fxPYXH83cpyP4RuZWMlXazDn3uH3rQVc1SCQShNZfr8AvQqmtMjdW2Ry1pSxEF/cLEsF
         u52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690814674; x=1691419474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7d7INobfDxOpMkWypEdSgvYnpooGOM0WqSpMzmhXiUI=;
        b=haFH6hQeFVW8U+Tb/NUTx3u1TkCgOLsFA456XDEKiVl/rXJTmaoH/bGNQvLdDwCbG+
         iEGUmmoAFOKxqCxhf2mwhO1MriWrZ1BZk520Zl+bE7KtyLePJbRRXEb4ywttUiB37+SG
         rhNfTeq2mA94w15uKYqG0WDBuBN10LOO03/EQvS0e2OKfGb/a5IKFaF2RGXXWs9rj8AA
         zxkW9l3KjZohI55uDTPEuVbpUesOSLUItSJmdU1gwSQyPuH24KNUBXs6yNgsLrlqGMgV
         RWuBrkqvw3nZZHP8cDmylomEXGWEgDcxCO6/3ZJB3ungmExQfEj9Xqy2ymAfDlZ4ZlD9
         VQcg==
X-Gm-Message-State: ABy/qLbp7wkurFLsQz7lP7hMfKBD62LZBW9qovou8FkOXraPDFxXcA3p
        9mtPm2qOdhWeLeSqKPr2Ic0=
X-Google-Smtp-Source: APBJJlHxY2k1D0wgwy7gUVa5i1WhwWpD5KzAezCsAE6x33l8cqqx4NOGpD+vlYOBYXAqnlbsBHnzhQ==
X-Received: by 2002:a05:6870:4728:b0:1bb:a037:321e with SMTP id b40-20020a056870472800b001bba037321emr7220825oaq.1.1690814674461;
        Mon, 31 Jul 2023 07:44:34 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fb3f:fd5:45fe:5e7a])
        by smtp.gmail.com with ESMTPSA id d44-20020a056870d2ac00b001beeaa10924sm822252oae.0.2023.07.31.07.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 07:44:33 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] dt-bindings: usb: ci-hdrc-usb2: Add the "fsl,imx35-usb" entry
Date:   Mon, 31 Jul 2023 11:44:21 -0300
Message-Id: <20230731144422.1532498-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Fabio Estevam <festevam@denx.de>

The "fsl,imx35-usb" entry is missing in the supported compatible
string list.

Add it to the list.

Signed-off-by: Fabio Estevam  <festevam@denx.de>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 532d6464c8b3..85016dd2e187 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -34,6 +34,7 @@ properties:
               - fsl,imx23-usb
               - fsl,imx25-usb
               - fsl,imx28-usb
+              - fsl,imx35-usb
               - fsl,imx50-usb
               - fsl,imx51-usb
               - fsl,imx53-usb
-- 
2.34.1

