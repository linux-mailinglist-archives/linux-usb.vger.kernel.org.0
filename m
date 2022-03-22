Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9D84E416F
	for <lists+linux-usb@lfdr.de>; Tue, 22 Mar 2022 15:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237654AbiCVOhF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Mar 2022 10:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237676AbiCVOhE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 10:37:04 -0400
Received: from fx303.security-mail.net (mxout.security-mail.net [85.31.212.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E896AA4E
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 07:35:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx303.security-mail.net (Postfix) with ESMTP id B426F323703
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 15:30:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1647959425;
        bh=elxJrAz+Zk/meRRiCxSQeQbcoeyWOdWNvzT+OrowOPg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=KOvQSpDHBbLa2PZQAGHl4jHrXX+SsDHuPnElpZ9aBwjFsGC17EkOi19u6NFt6qvqx
         qLx74WDmYw4+PRm6sJf+MrmX7SjFEwDEW9JGN4qAJoc1ZOswnz4rlSbgijt4Jij3yi
         4yf2iRLbGnQ+1i0g39WBY4R7DJ3TH1cGchu2eteA=
Received: from fx303 (localhost [127.0.0.1])
        by fx303.security-mail.net (Postfix) with ESMTP id EF60D3236AF;
        Tue, 22 Mar 2022 15:30:23 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <6fc4.6239dd7b.28d08.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx303.security-mail.net (Postfix) with ESMTPS id 29C093238FA;
        Tue, 22 Mar 2022 15:30:19 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 0C96027E043B;
        Tue, 22 Mar 2022 15:30:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id EB2C527E0439;
        Tue, 22 Mar 2022 15:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu EB2C527E0439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1647959419;
        bh=Z0l2T9tngUqyX7eAMN75gwor/BZgu23DPHC25lj9eso=;
        h=From:To:Date:Message-Id;
        b=kdkN/Xm1knBIz/xaOmBYo2NRQtXGt+iItwnRs0u4oeNyzlzNlMRUeXfrlpWfEJfwS
         LZPLywvCnOTFggt2Qmw1S38m1lgqqXw/O9S0SFTFSDkLBQf16nRTFt6YJMb7p1WWCr
         OM0ahab8ZIN+f2vaSuM826k+VGSq06ahN/rP8NZg=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id QDtnADSIWBG4; Tue, 22 Mar 2022 15:30:18 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id D15F027E0436;
        Tue, 22 Mar 2022 15:30:18 +0100 (CET)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     linux-usb@vger.kernel.org
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH 1/2] phy: core: Add documentation of phy operation order
Date:   Tue, 22 Mar 2022 15:30:10 +0100
Message-Id: <20220322143011.16580-2-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322143011.16580-1-jmaselbas@kalray.eu>
References: <20220322143011.16580-1-jmaselbas@kalray.eu>
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

Add documentation on phy function usage: init function must be
called before power_on; power_off must be called before exit.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
CC: Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
---
 drivers/phy/phy-core.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 91e28d6ce450..ed10cbb24b08 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -229,6 +229,17 @@ void phy_pm_runtime_forbid(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_pm_runtime_forbid);
 
+/**
+ * phy_init - phy internal initialization before phy operation
+ * @phy: the phy returned by phy_get()
+ *
+ * Used to allow phy's driver to perform phy internal initialization,
+ * such as PLL block powering, clock initialization or anything that's
+ * is required by the phy to perform the start of operation.
+ * Must be called before phy_power_on().
+ *
+ * Returns: 0 if successful, an negative error code otherwise
+ */
 int phy_init(struct phy *phy)
 {
 	int ret;
@@ -258,6 +269,14 @@ int phy_init(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_init);
 
+/**
+ * phy_exit - Phy internal un-initialization
+ * @phy: the phy returned by phy_get()
+ *
+ * Must be called after phy_power_off().
+ *
+ * Returns: 0 if successful, an negative error code otherwise
+ */
 int phy_exit(struct phy *phy)
 {
 	int ret;
@@ -287,6 +306,14 @@ int phy_exit(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_exit);
 
+/**
+ * phy_power_on - Enable the phy and enter proper operation
+ * @phy: the phy returned by phy_get()
+ *
+ * Must be called after phy_init().
+ *
+ * Returns: 0 if successful, an negative error code otherwise
+ */
 int phy_power_on(struct phy *phy)
 {
 	int ret = 0;
@@ -329,6 +356,14 @@ int phy_power_on(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_power_on);
 
+/**
+ * phy_power_off - Disable the phy.
+ * @phy: the phy returned by phy_get()
+ *
+ * Must be called before phy_exit().
+ *
+ * Returns: 0 if successful, an negative error code otherwise
+ */
 int phy_power_off(struct phy *phy)
 {
 	int ret;
-- 
2.17.1

