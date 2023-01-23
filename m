Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 540026775A8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 08:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbjAWHfb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 02:35:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbjAWHfa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 02:35:30 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ADFC166DC
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:29 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id v10so13477554edi.8
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmFV92Oe8RI2AuAY/Hs/y359Z5naSXU7oPpOL/UDG5Y=;
        b=kUoFQEi1C+XgSX+/tKSocFFE87EtpfG6uzKer63av9oQ7mQrfkwAN3j9gOGGvU+4ZS
         fj6Mbf6M+LTsBLzyE+FMEov2OkQ6VNXFMZOp7qT+WS0eh03WYjXgcfZvUnY1ttS8P0hA
         FMFM1agqn2Js6/GOXAWtWD1Ef1j//FNsrgTl5W2VrnCoNWNXQEGLI+6S7LoyetBfucxz
         q+3eKqfY9zHpn/xYTMBVMhaxZhXtRlRRhSb7P1n0bXfaQDuT320pxArOT6/082wzD717
         eK5sFFBls+kvAcYd5A5EE055+6EfEDIILiY2CboHq0RrGcxY/TxCQlfOr/RNBZT/Knlo
         6IYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmFV92Oe8RI2AuAY/Hs/y359Z5naSXU7oPpOL/UDG5Y=;
        b=pdtAQ4n9FsJJ7X32PmoeecvwSxhResc7M+dHOBIGO/9hOq8B9/UX14IR9vCAmiqwPw
         p9bmQyKcZGusEEWZJ00mPXuJn4yzWgBHiDH8sacYxvuNqxhlKeAcCwPSkhqLA/9rleeZ
         eYWahdNmzHJg7lnmH0PGMsuxyMCSgYYpcP97cTPobSTbff3r2Dzy/e3Dh9G1Y0qc9/+/
         4cbb23zFmLYSRutnXxvKwRLGUyxd5x0zkQLdqxgMGsXL6yiqKii872ruuLd94sorBuR0
         hEAwn3Z07uNr/1HxBPCbG75McRMB0pTH61a5fjZFRFGBTiEwegM1rg42lg/rWG23nFwe
         NPjw==
X-Gm-Message-State: AFqh2krcb22+3MBPRrFtFF4mNGaJ0I+W1i6FGX3eAls706NdEXOqe6O1
        UooGgnVETFYtl34uqlvyP8vQHZ7ms2xSImgp
X-Google-Smtp-Source: AMrXdXsSv7F0Y80gxNA/95ixTFJqfOxdydWSkVBli/PU0+j5sACL+3mjn5AMqhMp3ehntm0XxSOxDQ==
X-Received: by 2002:aa7:df8d:0:b0:492:bf3d:1a1a with SMTP id b13-20020aa7df8d000000b00492bf3d1a1amr24401419edy.18.1674459327754;
        Sun, 22 Jan 2023 23:35:27 -0800 (PST)
Received: from localhost.localdomain (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906155700b0084c7f96d023sm22104821ejd.147.2023.01.22.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:35:27 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] fotg210-udc: Improve device initialization
Date:   Mon, 23 Jan 2023 08:35:08 +0100
Message-Id: <20230123073508.2350402-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123073508.2350402-1-linus.walleij@linaro.org>
References: <20230123073508.2350402-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabian Vogt <fabian@ritter-vogt.de>

Reset the device explicitly to get into a known state and also set the chip
enable bit. Additionally, mask interrupts which aren't handled.

Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 15 +++++++++++++++
 drivers/usb/fotg210/fotg210-udc.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 00c4c17a6919..9beca4fa66c3 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -7,6 +7,7 @@
  * Author : Yuan-Hsin Chen <yhchen@faraday-tech.com>
  */
 
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -1023,6 +1024,11 @@ static int fotg210_udc_start(struct usb_gadget *g,
 			dev_err(fotg210->dev, "can't bind to phy\n");
 	}
 
+	/* chip enable */
+	value = ioread32(fotg210->reg + FOTG210_DMCR);
+	value |= DMCR_CHIP_EN;
+	iowrite32(value, fotg210->reg + FOTG210_DMCR);
+
 	/* enable device global interrupt */
 	value = ioread32(fotg210->reg + FOTG210_DMCR);
 	value |= DMCR_GLINT_EN;
@@ -1039,6 +1045,15 @@ static void fotg210_init(struct fotg210_udc *fotg210)
 	iowrite32(GMIR_MHC_INT | GMIR_MOTG_INT | GMIR_INT_POLARITY,
 		  fotg210->reg + FOTG210_GMIR);
 
+	/* mask interrupts for groups other than 0-2 */
+	iowrite32(~(DMIGR_MINT_G0 | DMIGR_MINT_G1 | DMIGR_MINT_G2),
+		  fotg210->reg + FOTG210_DMIGR);
+
+	/* udc software reset */
+	iowrite32(DMCR_SFRST, fotg210->reg + FOTG210_DMCR);
+	/* Better wait a bit, but without a datasheet, no idea how long. */
+	usleep_range(100, 200);
+
 	/* disable device global interrupt */
 	value = ioread32(fotg210->reg + FOTG210_DMCR);
 	value &= ~DMCR_GLINT_EN;
diff --git a/drivers/usb/fotg210/fotg210-udc.h b/drivers/usb/fotg210/fotg210-udc.h
index 22b72caf498c..252cb2b8e2fe 100644
--- a/drivers/usb/fotg210/fotg210-udc.h
+++ b/drivers/usb/fotg210/fotg210-udc.h
@@ -58,6 +58,8 @@
 
 /* Device Mask of Interrupt Group Register (0x130) */
 #define FOTG210_DMIGR		0x130
+#define DMIGR_MINT_G2		(1 << 2)
+#define DMIGR_MINT_G1		(1 << 1)
 #define DMIGR_MINT_G0		(1 << 0)
 
 /* Device Mask of Interrupt Source Group 0(0x134) */
-- 
2.39.0

