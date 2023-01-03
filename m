Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9A2D65CA66
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 00:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238269AbjACXfe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 18:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238221AbjACXf3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 18:35:29 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515911659E
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 15:35:28 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bf43so47969911lfb.6
        for <linux-usb@vger.kernel.org>; Tue, 03 Jan 2023 15:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfqK6qBFH8YFyjUi0V5Pk9BV6gkDIZNht4kUj3nmxsk=;
        b=GsOXISdSRV97jTW19WaKqVcsFh59IOOCGNy41YNbhGo+zogwzgVgxTn2XYIFP5fy51
         7OGzxjkJcgZ0iX9B24HlxuWH3BcnSk+RNZ7ss9XGYeF5GDkR0BxZaJcXAQ1Ty495VdZJ
         nawju/K7S1pBGKMb472tZDFEUxVwuHZsypI24Fw+hvhNo18BYfgLC/861nJOupbDHt19
         yHoOh9qBUeiEelUa00crBmI9VpIr2nlgE45Kr/mKET81/5Z5k3oyki3Gor2O8eZmQKWK
         oAYvROqewlZPvxv02HMLdsLUp5p5zYIhbGt1dEVWoQ9ld7LmRFuKlka4IdT+QAFXchkR
         JLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfqK6qBFH8YFyjUi0V5Pk9BV6gkDIZNht4kUj3nmxsk=;
        b=jLNDPpTGK7NqUdM0vu3ZVBr1xf1akNaB1F/iN77NHJmTk2OyYO4c+dDe9JBxAsnrYi
         vED7R4I8oJaNTh96MRisq5nbR6yWDfXlCXcRLU7Av5/j0HSq2WNyQk2enhGXmb1OL3+F
         guNC9jpeR1ehSehx/tu/pgC32DfV+GEA4o7pJunm/+9dSSPrNI/fKqi0BlbOPE0iWEXI
         PRnjKoefRmOSQOYBaa5Xhvzv7z/Y27+kK/FhnmtiWBti/txdHNWH/XzXxHP4onRIyUKO
         zEM7pN0Gv3S4pFGJN5ssT2FqxI3lRt/A5Xcx40Plu6gIhD3Gihg1E86OUk27lPDnCxmE
         dy2w==
X-Gm-Message-State: AFqh2kpEF1acIEDz895PQjEKCjBd3U3vxe2x9pDU+IoUki06o1m1EDiG
        MCKmQeI4eaLy/UQowfcxWpIb/Q==
X-Google-Smtp-Source: AMrXdXvGQS/bswxpe0igHUGcViNfV0w61Poc5iqZnUfTxEjT7Iz2j6FvCTfduAeRyTbqU3inECNbNw==
X-Received: by 2002:ac2:4bd3:0:b0:4b4:a460:c995 with SMTP id o19-20020ac24bd3000000b004b4a460c995mr18141753lfq.5.1672788927892;
        Tue, 03 Jan 2023 15:35:27 -0800 (PST)
Received: from Fecusia.local (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id b11-20020a056512070b00b004a45edc1de2sm4939801lfs.239.2023.01.03.15.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 15:35:27 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 04 Jan 2023 00:35:21 +0100
Subject: [PATCH 5/7] usb: fotg210: Check role register in core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-gemini-fotg210-usb-v1-5-f2670cb4a492@linaro.org>
References: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
In-Reply-To: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Read the role register and check that we are in host/peripheral
mode and issue warnings if we're not in the right role when
probing respective driver.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-core.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-core.c b/drivers/usb/fotg210/fotg210-core.c
index 58d84747fb30..013a1d0112fc 100644
--- a/drivers/usb/fotg210/fotg210-core.c
+++ b/drivers/usb/fotg210/fotg210-core.c
@@ -18,6 +18,11 @@
 
 #include "fotg210.h"
 
+/* Role Register 0x80 */
+#define FOTG210_RR			0x80
+#define FOTG210_RR_ID			BIT(21) /* 1 = B-device, 0 = A-device */
+#define FOTG210_RR_CROLE		BIT(20) /* 1 = device, 0 = host */
+
 /*
  * Gemini-specific initialization function, only executed on the
  * Gemini SoC using the global misc control register.
@@ -95,6 +100,7 @@ static int fotg210_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	enum usb_dr_mode mode;
 	struct fotg210 *fotg;
+	u32 val;
 	int ret;
 
 	fotg = devm_kzalloc(dev, sizeof(*fotg), GFP_KERNEL);
@@ -122,10 +128,16 @@ static int fotg210_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	if (mode == USB_DR_MODE_PERIPHERAL)
+	val = readl(fotg->base + FOTG210_RR);
+	if (mode == USB_DR_MODE_PERIPHERAL) {
+		if (!(val & FOTG210_RR_CROLE))
+			dev_err(dev, "block not in device role\n");
 		ret = fotg210_udc_probe(pdev, fotg);
-	else
+	} else {
+		if (val & FOTG210_RR_CROLE)
+			dev_err(dev, "block not in host role\n");
 		ret = fotg210_hcd_probe(pdev, fotg);
+	}
 
 	return ret;
 }

-- 
2.38.1
