Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B217161B3
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 12:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfEGKJo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 06:09:44 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:51058 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfEGKJo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 06:09:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id C5B1527E6E30;
        Tue,  7 May 2019 12:09:42 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id bLPix_pd53ih; Tue,  7 May 2019 12:09:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 7A0D227E6E38;
        Tue,  7 May 2019 12:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 7A0D227E6E38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1557223782;
        bh=VJ4IwvMran+hTGWxMCugQ51A/XXJQ/IZxtTsE7dZn18=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=aaObEQjuRJ0qVJ8pRSpX/08huVGEz2PcwptezEmhT72B43xJycseMCkOxloCuhqfr
         EFGUNZkzPXyH45FVYCspRZ+FHtofUMLvmsd2tdim/5PzkpPsaChT2qf3X/O1elwvtz
         ghiwh5UT4AEFFqLYq5apBApFiC+f4GJULKIzFd5o=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id klTlnQP_QZh2; Tue,  7 May 2019 12:09:42 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 5A7A627E6E2D;
        Tue,  7 May 2019 12:09:42 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH] usb: dwc2: Use generic PHY width in params setup
Date:   Tue,  7 May 2019 12:08:52 +0200
Message-Id: <20190507100852.11263-2-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.21.0.196.g041f5ea
In-Reply-To: <20190507100852.11263-1-jmaselbas@kalray.eu>
References: <20190503204958.GA12532@kozik-lap>
 <20190507100852.11263-1-jmaselbas@kalray.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Setting params.phy_utmi_width in dwc2_lowlevel_hw_init() is pointless sin=
ce
it's value will be overwritten by dwc2_init_params().

This change make sure to take in account the generic PHY width informatio=
n
during parmas initialization, done in dwc2_set_param_phy_utmi_width().

By doing so, the phy_utmi_width params can still be overridden by
devicetree specific params and will also be checked against hardware
capabilities.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 drivers/usb/dwc2/params.c   | 9 +++++++++
 drivers/usb/dwc2/platform.c | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 6900eea57526..5949262ff669 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -253,6 +253,15 @@ static void dwc2_set_param_phy_utmi_width(struct dwc=
2_hsotg *hsotg)
 	val =3D (hsotg->hw_params.utmi_phy_data_width =3D=3D
 	       GHWCFG4_UTMI_PHY_DATA_WIDTH_8) ? 8 : 16;
=20
+	if (hsotg->phy) {
+		/*
+		 * If using the generic PHY framework, check if the PHY bus
+		 * width is 8-bit and set the phyif appropriately.
+		 */
+		if (phy_get_bus_width(hsotg->phy) =3D=3D 8)
+			val =3D 8;
+	}
+
 	hsotg->params.phy_utmi_width =3D val;
 }
=20
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index d10a7f8daec3..e98d7812da2d 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -271,15 +271,6 @@ static int dwc2_lowlevel_hw_init(struct dwc2_hsotg *=
hsotg)
=20
 	hsotg->plat =3D dev_get_platdata(hsotg->dev);
=20
-	if (hsotg->phy) {
-		/*
-		 * If using the generic PHY framework, check if the PHY bus
-		 * width is 8-bit and set the phyif appropriately.
-		 */
-		if (phy_get_bus_width(hsotg->phy) =3D=3D 8)
-			hsotg->params.phy_utmi_width =3D 8;
-	}
-
 	/* Clock */
 	hsotg->clk =3D devm_clk_get_optional(hsotg->dev, "otg");
 	if (IS_ERR(hsotg->clk)) {
--=20
2.21.0.196.g041f5ea

