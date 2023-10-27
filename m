Return-Path: <linux-usb+bounces-2272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15197D983C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 14:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E2671C21090
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 12:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696AE335D7;
	Fri, 27 Oct 2023 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C42F51D
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 12:30:12 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92FA128
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 05:30:10 -0700 (PDT)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A27522077F;
	Fri, 27 Oct 2023 14:30:00 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] usb: phy: generic: add suspend support for regulator
Date: Fri, 27 Oct 2023 14:29:55 +0200
Message-Id: <20231027122955.22123-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Disable the vcc regulator on suspend and enable it on resume.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/usb/phy/phy-generic.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 770081b828a4..9ab50f26db60 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -46,15 +46,21 @@ EXPORT_SYMBOL_GPL(usb_phy_generic_unregister);
 static int nop_set_suspend(struct usb_phy *x, int suspend)
 {
 	struct usb_phy_generic *nop = dev_get_drvdata(x->dev);
+	int ret = 0;
 
-	if (!IS_ERR(nop->clk)) {
-		if (suspend)
+	if (suspend) {
+		if (!IS_ERR(nop->clk))
 			clk_disable_unprepare(nop->clk);
-		else
+		if (!IS_ERR(nop->vcc) && !device_may_wakeup(x->dev))
+			ret = regulator_disable(nop->vcc);
+	} else {
+		if (!IS_ERR(nop->vcc) && !device_may_wakeup(x->dev))
+			ret = regulator_enable(nop->vcc);
+		if (!IS_ERR(nop->clk))
 			clk_prepare_enable(nop->clk);
 	}
 
-	return 0;
+	return ret;
 }
 
 static void nop_reset(struct usb_phy_generic *nop)
-- 
2.25.1


