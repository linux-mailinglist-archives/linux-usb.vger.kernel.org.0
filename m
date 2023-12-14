Return-Path: <linux-usb+bounces-4161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC181335B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 15:40:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25859B21A56
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 14:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA285ABAE;
	Thu, 14 Dec 2023 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="iCZlTLNd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2232310E
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702564814; x=1734100814;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9LwmDPqdDijEZ2+AelTJlCFk2PRiw+1/dXNkfDNIJxk=;
  b=iCZlTLNd2O6NOukDVHRJ/nJVQ4qzEHMfdfurirHzIkyAeNDTuRWWgLiK
   IAHlxgOKlxg1fcm6r7vBCa+EGdHva+ruAZSTjI9691TU/uSw9s9aAXEVh
   dtpjVeyIkcyr5z9+MaAlv3fBvftoECY+rKhpme8wIbVCdcFcZMGcuQzzP
   ypgZGAcP4EyGLOXTx7BJY6XLzlXwClimI/3vHy0JEkRkg7YbtH1FjMhtr
   S3I5NHEVCjELiEMgkQ/xw2m70OpM1XUh/M3MO16sDRry61nzCViO+gtTv
   px/Ev7IGBVE0wHr6g9CAD/5ukECThBQwlPf/FEcP45LrNGVmc/pjfsFEK
   A==;
X-IronPort-AV: E=Sophos;i="6.04,275,1695679200"; 
   d="scan'208";a="34512780"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Dec 2023 15:40:12 +0100
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4159A280075;
	Thu, 14 Dec 2023 15:40:12 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/1] usb: cdns3: Use dev_err_probe
Date: Thu, 14 Dec 2023 15:40:11 +0100
Message-Id: <20231214144011.1987586-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create an error message or upon deferral add a description for sysfs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This actually helped me finding out that the usb3-phy driver was not
enabled.

 drivers/usb/cdns3/cdns3-plat.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 2c1aca84f2264..3ef8e3c872a37 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -87,16 +87,20 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 	cdns->dev_irq = platform_get_irq_byname(pdev, "peripheral");
 
 	if (cdns->dev_irq < 0)
-		return cdns->dev_irq;
+		return dev_err_probe(dev, cdns->dev_irq,
+				     "Failed to get peripheral IRQ\n");
 
 	regs = devm_platform_ioremap_resource_byname(pdev, "dev");
 	if (IS_ERR(regs))
-		return PTR_ERR(regs);
+		return dev_err_probe(dev, PTR_ERR(regs),
+				     "Failed to get dev base\n");
+
 	cdns->dev_regs	= regs;
 
 	cdns->otg_irq = platform_get_irq_byname(pdev, "otg");
 	if (cdns->otg_irq < 0)
-		return cdns->otg_irq;
+		return dev_err_probe(dev, cdns->otg_irq,
+				     "Failed to get otg IRQ\n");
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
 	if (!res) {
@@ -119,7 +123,8 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	cdns->usb2_phy = devm_phy_optional_get(dev, "cdns3,usb2-phy");
 	if (IS_ERR(cdns->usb2_phy))
-		return PTR_ERR(cdns->usb2_phy);
+		return dev_err_probe(dev, PTR_ERR(cdns->usb2_phy),
+				     "Failed to get cdn3,usb2-phy\n");
 
 	ret = phy_init(cdns->usb2_phy);
 	if (ret)
@@ -127,7 +132,8 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	cdns->usb3_phy = devm_phy_optional_get(dev, "cdns3,usb3-phy");
 	if (IS_ERR(cdns->usb3_phy))
-		return PTR_ERR(cdns->usb3_phy);
+		return dev_err_probe(dev, PTR_ERR(cdns->usb3_phy),
+				     "Failed to get cdn3,usb3-phy\n");
 
 	ret = phy_init(cdns->usb3_phy);
 	if (ret)
-- 
2.34.1


