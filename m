Return-Path: <linux-usb+bounces-8703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB195894B52
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 08:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95772283A37
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 06:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AAE20DE7;
	Tue,  2 Apr 2024 06:23:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57918E29
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 06:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712039028; cv=none; b=dOWH8sX+1XHp2mZw5znrrubz9T4rmkV+0jbts0KBiRdRunE4gFBoiO6sd24o4X7OARmWBMRmaFJkTevZoBofUEimoriHT5uOGCx8Z3DzxamdKZR52pRlkStVxtjps++0D5Lhn2K1MiFDG8m4/Wdb8aGfExv7MnI2WYuTvByQ+R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712039028; c=relaxed/simple;
	bh=PPPuY5Hg0Y0DNWRkltz48L7HE6kprcKtqSFqK38Z/U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LQ8dq42GTu2QcF4W/W+pPQ2WbsHWcGsF1if7vYq+P0rYRBcMQHI+OlmP1Mo2I3TvNJ9P8XFy4aNtVDOOa3u+FGkvpEqADYRT8R8fElZjILnMj8NHCRb7OmFXdQ6ShG+s8LrRolpB4S0XcHL+9rmAAYOcwXJlvYoAiItgqM/ptxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1rrXYe-0004sT-20; Tue, 02 Apr 2024 08:23:44 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1rrXYd-009vdf-Fz; Tue, 02 Apr 2024 08:23:43 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1rrXYd-00EkSU-1P;
	Tue, 02 Apr 2024 08:23:43 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Tue, 02 Apr 2024 08:23:43 +0200
Subject: [PATCH] usb: chipidea: move ci_ulpi_init after the phy
 initialization
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-chipidea-phy-misc-v1-1-907d9de5d4df@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAG6kC2YC/x2N0QqDMAwAf0XyvIDWwsp+RXxoY1wDrisNE4f47
 wt7vIPjTlBuwgqP7oTGu6i8i8Fw64ByLE9GWYzB9c73owtIWaosHLHmL75ECdO4ukRh8Pfgwbo
 UlTG1WChbWT7bZrI2XuX4j6b5un6FV/z7eAAAAA==
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=PPPuY5Hg0Y0DNWRkltz48L7HE6kprcKtqSFqK38Z/U0=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmC6RvfNzHPWGSTzAesud7hzhjuUOv2iCGDHlgz
 +WMmsbz4gqJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZgukbwAKCRC/aVhE+XH0
 q7+YEACkOuX13NKcmJGgkose0F3MPD8UJZETRgJUxU+eZEKIenMN4a6uAsKhgOnGDp9rjQ16LWP
 VoeaQwlRLty0VzpPswjJsouoDeMmMZWw1Um+qab6E8yLhGxEvp7PjsED5i0Gq6VyBEBCm1iocOu
 PIDOsmZkP8Wk/aTwTeMZ3UPzDhuzpKZPPpdzN3uvKebh2YaOkFxCv5MiSulqJMC9LJ6Towv4jNM
 nnXZ2p3w4VeMNlm8kS3oIeegL6pkbrix2v14LxhFxZRlP8HtDxBgC6v0HnBFj5IRk8wDwvLUh44
 gwkGsZeEUjNSmvU3VQ07UjL8w21rAOhD+AiUxLIFe9e1kdYX7TYVQlzhsa7VGgga8/9MMuUoXsW
 vVPqvztqt0EgMBU9zm1heazA+inRPSIZxsdoj86cUouRT8H80n48T31p5gwmMaGOPT7V+D/lgaJ
 qj1XkdX3IuYhCSmrR82OV1EzsdU4N334yhb8nZTxkMfy/gValRXfJu+n0enYVFHOLtEalq1vu8P
 xuwghYlomD2ODkNB2NJ/EHehP+ZDpF2+EWmobAdNPpnHv5aabnBQTKnsLyXt1h1dj38owPiG29r
 ETiyyiR2eKEvKCOgWyfxY7K8+W702lBeT1IwRGCM3poAc95f+3gYNb+LvQlY86DX8qmb6FPCWfg
 KvysDv7McMG188A==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The function ci_usb_phy_init is already handling the
hw_phymode_configure path which is also only possible after we have
a valid phy. So we move the ci_ulpi_init after the phy initialization
to be really sure to be able to communicate with the ulpi phy.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/chipidea/core.c | 8 ++++----
 drivers/usb/chipidea/ulpi.c | 5 -----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 835bf2428dc6e..bada13f704b62 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -1084,10 +1084,6 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ret = ci_ulpi_init(ci);
-	if (ret)
-		return ret;
-
 	if (ci->platdata->phy) {
 		ci->phy = ci->platdata->phy;
 	} else if (ci->platdata->usb_phy) {
@@ -1142,6 +1138,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
 		goto ulpi_exit;
 	}
 
+	ret = ci_ulpi_init(ci);
+	if (ret)
+		return ret;
+
 	ci->hw_bank.phys = res->start;
 
 	ci->irq = platform_get_irq(pdev, 0);
diff --git a/drivers/usb/chipidea/ulpi.c b/drivers/usb/chipidea/ulpi.c
index dfec07e8ae1d2..89fb51e2c3ded 100644
--- a/drivers/usb/chipidea/ulpi.c
+++ b/drivers/usb/chipidea/ulpi.c
@@ -68,11 +68,6 @@ int ci_ulpi_init(struct ci_hdrc *ci)
 	if (ci->platdata->phy_mode != USBPHY_INTERFACE_MODE_ULPI)
 		return 0;
 
-	/*
-	 * Set PORTSC correctly so we can read/write ULPI registers for
-	 * identification purposes
-	 */
-	hw_phymode_configure(ci);
 
 	ci->ulpi_ops.read = ci_ulpi_read;
 	ci->ulpi_ops.write = ci_ulpi_write;

---
base-commit: 5bab5dc780c9ed0c69fc2f828015532acf4a7848
change-id: 20240328-chipidea-phy-misc-b3f2bc814784

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>


