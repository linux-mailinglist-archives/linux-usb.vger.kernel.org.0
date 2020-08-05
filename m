Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D2A23CF2D
	for <lists+linux-usb@lfdr.de>; Wed,  5 Aug 2020 21:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgHETQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Aug 2020 15:16:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39370 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729149AbgHESBF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 14:01:05 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1k3JFy-0007PA-SX; Wed, 05 Aug 2020 13:14:58 +0000
From:   Colin King <colin.king@canonical.com>
To:     Li Yang <leoyang.li@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: fix spelling mistake "Dectected" -> "Detected"
Date:   Wed,  5 Aug 2020 14:14:58 +0100
Message-Id: <20200805131458.21289-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index b2638e83bb49..c79407f2d577 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2061,7 +2061,7 @@ static int fsl_proc_read(struct seq_file *m, void *v)
 			"Sleep Enable: %d SOF Received Enable: %d "
 			"Reset Enable: %d\n"
 			"System Error Enable: %d "
-			"Port Change Dectected Enable: %d\n"
+			"Port Change Detected Enable: %d\n"
 			"USB Error Intr Enable: %d USB Intr Enable: %d\n\n",
 			(tmp_reg & USB_INTR_DEVICE_SUSPEND) ? 1 : 0,
 			(tmp_reg & USB_INTR_SOF_EN) ? 1 : 0,
-- 
2.27.0

