Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46B42F366E
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 18:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391641AbhALRCh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 12:02:37 -0500
Received: from mib.mailinblack.com ([137.74.84.110]:53096 "EHLO
        mib.mailinblack.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391294AbhALRCh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jan 2021 12:02:37 -0500
Received: from localhost (localhost [127.0.0.1])
        by mib.mailinblack.com (Postfix) with ESMTP id 5C8031A4CEF
        for <linux-usb@vger.kernel.org>; Tue, 12 Jan 2021 17:01:55 +0000 (UTC)
Received: from mib.mailinblack.com (localhost [127.0.0.1])
        by mib.mailinblack.com
        with SMTP (Mib Daemon ) id KJU8SV4P;
        Tue, 12 Jan 2021 17:01:55 +0000 (UTC)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [92.103.151.219])
        by mib.mailinblack.com (Postfix) with ESMTPS id 277E01A4CEA;
        Tue, 12 Jan 2021 17:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E481727E0817;
        Tue, 12 Jan 2021 18:01:54 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id HUd8rNszTY1p; Tue, 12 Jan 2021 18:01:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 653A327E0396;
        Tue, 12 Jan 2021 18:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 653A327E0396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1610470914;
        bh=zS6xjDjrYwkL4cf7O3meH7U1T/R/ZaJSWbU+Y/u5Xlk=;
        h=From:To:Date:Message-Id;
        b=kRGe3o+Hy+moORBHVflO4a7KG4zvC903Bif+FhnUPvVDtQoNWIKHalGfuul8iVF2C
         qU3ZkDcxJ8ib+ULKhWrrj6Qob8LvQ585cVQaCf2kUJ1HnpRG0acGOrSwdAs6qVUjhO
         87lRjWW6kWCPGrDv/ByTAyuVDkbwl2aFHR/ECO/Y=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0g4n1OTNPFhb; Tue, 12 Jan 2021 18:01:54 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 4567F27E01FC;
        Tue, 12 Jan 2021 18:01:54 +0100 (CET)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jules Maselbas <jmaselbas@kalray.eu>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH] usb: dwc2: Change ordering of phy_init and phy_power_on
Date:   Tue, 12 Jan 2021 18:01:24 +0100
Message-Id: <20210112170124.14148-1-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de>
References: <6cd01e79-fdc0-3bd4-32b5-a85142533f8a@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Call phy_init before phy_power_on as this is the intended way of using
the generic phy api.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>

---

I have quickly looked at usb-phy if this change could break something or
not. The following cmd list the compatible strings for usb-phy used by dwc2:

git grep 'snps,dwc2' -- arch/ | sed 's/:.*$//' | { while read file; do \
        phyname=$(git grep -A10 'snps,dwc2' -- "$file" | \
                sed -n '/phys/{s/.*<&\([^ >]*\).*/\1/p}'); \
        [ "$phyname" ] && { \
	        git grep -A10 "${phyname}: " -- "$file" | \
                grep -m1 'compatible'; \
        }; done };

From this output I took a look at:
 - brcm,kona-usb2-phy
 - samsung,exynos3250-usb2-phy
 - rockchip,rk3288-usb
 - amlogic,meson-gxbb-usb2-phy
 - amlogic,meson-gxl-usb2-phy
 - img,pistachio-usb-phy

Most of these phys only defines .power_on and .power_off;
brcm,kona-usb2-phy also defines .init; and amlogic,meson-gxl-usb2-phy defines
.init .exit and .reset

From what I've seen it seems to be OK for these two phy to call
init/exit first and then power_on/power_off.
---
 drivers/usb/dwc2/platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index b58ce996add7..a07dff088a26 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -142,9 +142,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
 	} else if (hsotg->plat && hsotg->plat->phy_init) {
 		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
 	} else {
-		ret = phy_power_on(hsotg->phy);
+		ret = phy_init(hsotg->phy);
 		if (ret == 0)
-			ret = phy_init(hsotg->phy);
+			ret = phy_power_on(hsotg->phy);
 	}
 
 	return ret;
@@ -176,9 +176,9 @@ static int __dwc2_lowlevel_hw_disable(struct dwc2_hsotg *hsotg)
 	} else if (hsotg->plat && hsotg->plat->phy_exit) {
 		ret = hsotg->plat->phy_exit(pdev, hsotg->plat->phy_type);
 	} else {
-		ret = phy_exit(hsotg->phy);
+		ret = phy_power_off(hsotg->phy);
 		if (ret == 0)
-			ret = phy_power_off(hsotg->phy);
+			ret = phy_exit(hsotg->phy);
 	}
 	if (ret)
 		return ret;
-- 
2.17.1


