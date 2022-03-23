Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34BB4E5102
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 12:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243739AbiCWLI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 07:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235590AbiCWLI5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 07:08:57 -0400
Received: from fx601.security-mail.net (smtpout140.security-mail.net [85.31.212.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7156678077
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 04:07:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id 11AD83AD0F5
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 12:07:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1648033646;
        bh=69zZpxa6rBNXrUgok6kJ+TKqaxhS4oyp57/az67O4W8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=sImvwxBjq6c/FGiAOl4UKHrlZU1jqAkqmVJusn58306XmoqE788E19YFZjYx5HTt0
         UaIlSG9BEyga9fDJXCQ1RhVBlv9C4r2Mxczs3cRSWiehBofRbnwsWY/EjxdtH3cvji
         wVBb8XbhQWrUE7ISwbB0+QZCaZZa1mYXE3PbnLGI=
Received: from fx601 (localhost [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id BA9803AD04C;
        Wed, 23 Mar 2022 12:07:24 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <9ab4.623aff6a.98f3e.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx601.security-mail.net (Postfix) with ESMTPS id 9A2FD3AD034;
        Wed, 23 Mar 2022 12:07:22 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 7C7AD27E0444;
        Wed, 23 Mar 2022 12:07:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 66AF927E0443;
        Wed, 23 Mar 2022 12:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 66AF927E0443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1648033642;
        bh=lkXmp8lv2v2HiLj/LZtFQoiXYObR1expOxg9dvyWFfo=;
        h=From:To:Date:Message-Id;
        b=D3/EWoIWOfLH52PaI873zcLsIBgSg54V93HL1oTICcogFX27728Wp9lYRrBq8KNsR
         r+gvGRGcaa+RlKDCAatR2KHypy/uwJcP2KZylmMliPSL5TR/5QnQ5pqFxHQmBanbEa
         jBn+kZknXQqdeILBmEJBsXc2gxTrvUa55fQxQq80=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id x62y_ZpYuTpT; Wed, 23 Mar 2022 12:07:22 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 5487E27E0425;
        Wed, 23 Mar 2022 12:07:22 +0100 (CET)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     linux-usb@vger.kernel.org
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH v2 3/3] phy: core: Warn when phy_power_on is called before phy_init
Date:   Wed, 23 Mar 2022 12:07:08 +0100
Message-Id: <20220323110708.8254-4-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323110708.8254-1-jmaselbas@kalray.eu>
References: <20220323110708.8254-1-jmaselbas@kalray.eu>
X-Virus-Scanned: by Secumail
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A warning when the order of phy operation is mixed up by drivers,
this is an atempt to make the phy usage more uniform across (usb)
drivers.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
---
change in v2:
  - no changes

 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index cbdad65d2caa..0cb4da62577e 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -252,6 +252,9 @@ int phy_init(struct phy *phy)
 		return ret;
 	ret = 0; /* Override possible ret == -ENOTSUPP */
 
+	if (phy->power_count > phy->init_count)
+		dev_warn(&phy->dev, "phy_power_on was called before phy_init\n");
+
 	mutex_lock(&phy->mutex);
 	if (phy->init_count == 0 && phy->ops->init) {
 		ret = phy->ops->init(phy);
-- 
2.17.1

