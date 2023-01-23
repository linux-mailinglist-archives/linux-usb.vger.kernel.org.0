Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91C9A6775A7
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 08:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbjAWHfa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 02:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjAWHfa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 02:35:30 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F10218B25
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:27 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id qx13so28004197ejb.13
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGaRgrBkYYiew71gsUhPMY+/P7zU/wdoAAyhj9g55V0=;
        b=SHDwh2JMBmJnf5ZU5Bj7bgrdyIOxPjTnNkbJo9j/MnlfYW3/O2akY+b0l5N/YGqB5O
         y+DnEx7/7XF1dHHCtDng9hwdp0W9pABtu/a4ckeP0iTnqHrTLmJbbMtR7gmaPgLY6NUn
         JAXxTJ2ITht2UF0nIsFL2XnKu226TSmNap2tmdk3w9XG2JS221KBdNj+xAl05BLNPUdl
         X2hE/Wr27zTiiSNYjPOu8nwiL8ZC0d5XUqc/0bbihor5+XLgewGv5lz7WWi9x5N6FLLN
         a+D7oz/gCPOm7/A1miw+RQ/IL1UMlnlNoF+oGytAZhV9mHco6j4CeV2NFCBFDdIHlWqo
         j4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGaRgrBkYYiew71gsUhPMY+/P7zU/wdoAAyhj9g55V0=;
        b=7mtYat9U8e/nLyj2kQ5hhFKALZGUZ/4E+GWiV+UrmjCzPBSI0salF6Sc03PPpnOaQu
         YnOIU1MnOfRrCmkJ1Wu7+NeUXTX7ymXN0oDq847U+Nz8++Hn/FEvJ3O4ezQHvNHJ88Nu
         f7YXf2kUrrO8xZmDgN0QrdA+dMILfy3ApW4eA7GCBz02WcA7uzBB+GEU/TAaby2Yjpli
         Cd9P+93GH5Fv34kXTVYIQ4TTgsYJx4KbwMptfMgysICJNhIuFwY0jV+L4cWcui1+6b2F
         y4eUg0k2hc05VeA+0gcNOqnYZrgeHIMN17+iKSQCg387GQRYELGVzCkNtVqEtEnMPiNi
         2VFQ==
X-Gm-Message-State: AFqh2krwIPHQML6Gc1hisbHK9MajXE3Avnq6MdsI1zz5YJdQDLzfSMMY
        j5Qy/ie5+8Pw5BYuSIsWrckF/w==
X-Google-Smtp-Source: AMrXdXt8OhZECd1Y/QTKexvQwGye7abBGB/E5qoB0z210/qXCCaJMsQvOze0opmMV93UIV74ozDKlg==
X-Received: by 2002:a17:907:8b97:b0:84d:39ba:368b with SMTP id tb23-20020a1709078b9700b0084d39ba368bmr27241209ejc.75.1674459326075;
        Sun, 22 Jan 2023 23:35:26 -0800 (PST)
Received: from localhost.localdomain (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906155700b0084c7f96d023sm22104821ejd.147.2023.01.22.23.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:35:25 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] fotg210-udc: Introduce and use a fotg210_ack_int function
Date:   Mon, 23 Jan 2023 08:35:07 +0100
Message-Id: <20230123073508.2350402-3-linus.walleij@linaro.org>
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

This is in preparation of support for devices where interrupts are acked
differently.

Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 54 +++++++++++--------------------
 1 file changed, 18 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 029b31c3107b..00c4c17a6919 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -28,6 +28,14 @@ static const char udc_name[] = "fotg210_udc";
 static const char * const fotg210_ep_name[] = {
 	"ep0", "ep1", "ep2", "ep3", "ep4"};
 
+static void fotg210_ack_int(struct fotg210_udc *fotg210, u32 offset, u32 mask)
+{
+	u32 value = ioread32(fotg210->reg + offset);
+
+	value &= ~mask;
+	iowrite32(value, fotg210->reg + offset);
+}
+
 static void fotg210_disable_fifo_int(struct fotg210_ep *ep)
 {
 	u32 value = ioread32(ep->fotg210->reg + FOTG210_DMISGR1);
@@ -303,8 +311,7 @@ static void fotg210_wait_dma_done(struct fotg210_ep *ep)
 			goto dma_reset;
 	} while (!(value & DISGR2_DMA_CMPLT));
 
-	value &= ~DISGR2_DMA_CMPLT;
-	iowrite32(value, ep->fotg210->reg + FOTG210_DISGR2);
+	fotg210_ack_int(ep->fotg210, FOTG210_DISGR2, DISGR2_DMA_CMPLT);
 	return;
 
 dma_reset:
@@ -844,14 +851,6 @@ static void fotg210_ep0in(struct fotg210_udc *fotg210)
 	}
 }
 
-static void fotg210_clear_comabt_int(struct fotg210_udc *fotg210)
-{
-	u32 value = ioread32(fotg210->reg + FOTG210_DISGR0);
-
-	value &= ~DISGR0_CX_COMABT_INT;
-	iowrite32(value, fotg210->reg + FOTG210_DISGR0);
-}
-
 static void fotg210_in_fifo_handler(struct fotg210_ep *ep)
 {
 	struct fotg210_request *req = list_entry(ep->queue.next,
@@ -893,60 +892,43 @@ static irqreturn_t fotg210_irq(int irq, void *_fotg210)
 		void __iomem *reg = fotg210->reg + FOTG210_DISGR2;
 		u32 int_grp2 = ioread32(reg);
 		u32 int_msk2 = ioread32(fotg210->reg + FOTG210_DMISGR2);
-		u32 value;
 
 		int_grp2 &= ~int_msk2;
 
 		if (int_grp2 & DISGR2_USBRST_INT) {
 			usb_gadget_udc_reset(&fotg210->gadget,
 					     fotg210->driver);
-			value = ioread32(reg);
-			value &= ~DISGR2_USBRST_INT;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_USBRST_INT);
 			pr_info("fotg210 udc reset\n");
 		}
 		if (int_grp2 & DISGR2_SUSP_INT) {
-			value = ioread32(reg);
-			value &= ~DISGR2_SUSP_INT;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_SUSP_INT);
 			pr_info("fotg210 udc suspend\n");
 		}
 		if (int_grp2 & DISGR2_RESM_INT) {
-			value = ioread32(reg);
-			value &= ~DISGR2_RESM_INT;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_RESM_INT);
 			pr_info("fotg210 udc resume\n");
 		}
 		if (int_grp2 & DISGR2_ISO_SEQ_ERR_INT) {
-			value = ioread32(reg);
-			value &= ~DISGR2_ISO_SEQ_ERR_INT;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_ISO_SEQ_ERR_INT);
 			pr_info("fotg210 iso sequence error\n");
 		}
 		if (int_grp2 & DISGR2_ISO_SEQ_ABORT_INT) {
-			value = ioread32(reg);
-			value &= ~DISGR2_ISO_SEQ_ABORT_INT;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_ISO_SEQ_ABORT_INT);
 			pr_info("fotg210 iso sequence abort\n");
 		}
 		if (int_grp2 & DISGR2_TX0BYTE_INT) {
 			fotg210_clear_tx0byte(fotg210);
-			value = ioread32(reg);
-			value &= ~DISGR2_TX0BYTE_INT;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_TX0BYTE_INT);
 			pr_info("fotg210 transferred 0 byte\n");
 		}
 		if (int_grp2 & DISGR2_RX0BYTE_INT) {
 			fotg210_clear_rx0byte(fotg210);
-			value = ioread32(reg);
-			value &= ~DISGR2_RX0BYTE_INT;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_RX0BYTE_INT);
 			pr_info("fotg210 received 0 byte\n");
 		}
 		if (int_grp2 & DISGR2_DMA_ERROR) {
-			value = ioread32(reg);
-			value &= ~DISGR2_DMA_ERROR;
-			iowrite32(value, reg);
+			fotg210_ack_int(fotg210, FOTG210_DISGR2, DISGR2_DMA_ERROR);
 		}
 	}
 
@@ -960,7 +942,7 @@ static irqreturn_t fotg210_irq(int irq, void *_fotg210)
 
 		/* the highest priority in this source register */
 		if (int_grp0 & DISGR0_CX_COMABT_INT) {
-			fotg210_clear_comabt_int(fotg210);
+			fotg210_ack_int(fotg210, FOTG210_DISGR0, DISGR0_CX_COMABT_INT);
 			pr_info("fotg210 CX command abort\n");
 		}
 
-- 
2.39.0

