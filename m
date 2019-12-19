Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7755125DD4
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 10:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLSJkJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 04:40:09 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55204 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfLSJkJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Dec 2019 04:40:09 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so2244539pjb.4
        for <linux-usb@vger.kernel.org>; Thu, 19 Dec 2019 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UaU6i9zWU3yr9QJvcRz0VGGzrcUKaBIv86YipeMOKo8=;
        b=LyDg1/LfFyRwWJTxBF/LnsfrTJSpgla5kvA98Hg+eeijCP9Q4VYEvCBGyN5xVxKn7p
         eEsQscd3wujq8XMHgepAaRQXBH0E1PQZo9FaDL3lWv8qT+wBABdwjQ6wBRbPQczrwZhV
         xi1HLrIQxvVPsnnXebX2B39JQ8NlNTXox5+ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UaU6i9zWU3yr9QJvcRz0VGGzrcUKaBIv86YipeMOKo8=;
        b=mp1ljvwIzoxyc6Bt+jDZZRFMFislXkqTJM5Co+GKhuiXkNQ2k6ryQ0roJhDbcSKwPZ
         akSC33sld2s+aigxRk+n/iSC/ia7ej5d9jSAOZkBLVbJIriHpl7PW3cPIIVX0XLy+gzu
         ggVQ71zla4u7ApbV5ehm8MDCI/8dWGgVUAbf5niDQJLJTIRbeFY+GDu+I9Pk0cu7jh+J
         Cl1Ug6CqlYDIT8oXAAsjJfije4f7RG1YXdYdGk+4JlJByjoInTxanXrKrr6LutLDBmPo
         9dsfMjm/Ec1r20Eaa9zkBYydGMEOz06uQB/MKOC4fxB4PpG9H2qLbZ1oDMhxur1kAcZW
         bUNw==
X-Gm-Message-State: APjAAAW6RR8n+akBTE0Z7mZP5hHvkVhK9gmcxQuwd2T44RPXN5Qj6/OB
        XRPOi4wMWyJul8xYnhOMPnlzeGeoRwqghA==
X-Google-Smtp-Source: APXvYqzL4Uv3f/vYWiTWGoQqppzSjCV/VAXe3mUM5lmKJDJ2u9Tql+pWQk6EMSv57P1oNg9ofZmndA==
X-Received: by 2002:a17:902:8bc5:: with SMTP id r5mr8257114plo.189.1576748408099;
        Thu, 19 Dec 2019 01:40:08 -0800 (PST)
Received: from tfiga.tok.corp.google.com ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
        by smtp.gmail.com with ESMTPSA id d22sm7057694pfo.187.2019.12.19.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:40:07 -0800 (PST)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-usb@vger.kernel.org
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Changqi Hu <Changqi.Hu@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Shik Chen <shik@chromium.org>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] usb: mtk-xhci: Do not explicitly set the DMA mask
Date:   Thu, 19 Dec 2019 18:39:54 +0900
Message-Id: <20191219093954.163417-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The mtk-xhci platform glue sets the DMA mask to 32 bits on its own,
which was needed before commit fda182d80a0b ("usb: xhci: configure
32-bit DMA if the controller does not support 64-bit DMA"), but now it
has no effect, because xhci_gen_setup() sets it up for us according to
hardware capabilities. Remove the useless code.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/usb/host/xhci-mtk.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index b18a6baef204a..bfbdb3ceed291 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -488,11 +488,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
-	if (ret)
-		goto disable_clk;
-
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
 		ret = -ENOMEM;
-- 
2.24.1.735.g03f4e72817-goog

