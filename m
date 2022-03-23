Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 772814E5101
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 12:07:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239575AbiCWLI5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 07:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbiCWLI5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 07:08:57 -0400
Received: from fx601.security-mail.net (smtpout140.security-mail.net [85.31.212.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0351B4ECF8
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 04:07:26 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id F239C3AD034
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 12:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1648033645;
        bh=dWN29bOnngar+VcnGORe9zqqjPYqTG5gblvp5Er3NTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=huH1RWAY9DlB7aFtlkkvie9NccxkTmxPXip8mgH8Cu5gEZ/XRpCc17u6CZ8Gm6/tJ
         JEGgO4pGwHJ5SfKxmq2QkLAaTrEuYUmGgPhiD98sVK9TBbKjLNjSql1efrUOc4bUdl
         tkKdabi+cKs8cauESPoAhhgJ2RBAsjxAO2x595Q4=
Received: from fx601 (localhost [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id AB5A13AD065;
        Wed, 23 Mar 2022 12:07:23 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <9bf5.623aff69.40ab5.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx601.security-mail.net (Postfix) with ESMTPS id 41ACC3ACF3A;
        Wed, 23 Mar 2022 12:07:21 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 2361227E0444;
        Wed, 23 Mar 2022 12:07:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 0DA1D27E0443;
        Wed, 23 Mar 2022 12:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 0DA1D27E0443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1648033641;
        bh=z97YwJXvaXhCXAar/RqNTITcuyij3jb/j46q/moCS3k=;
        h=From:To:Date:Message-Id;
        b=TEmvokObvEaG/TlBajRbY+oPdViklWhkBcUCcIpNvIDTIDxDXpUdePDKHq1WNYBMx
         yvd+q00QPr7yp1y8Y7FVIWQRlkDJ2IMWF4tty2qlpDkPSvLGBpxB/58OWhRP4/J6sF
         NXJLG41F0Ogg4+J338vqIDcv+hpEM9qSvwfKu6rs=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id VLfzh0c1vaHz; Wed, 23 Mar 2022 12:07:21 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id E729427E0425;
        Wed, 23 Mar 2022 12:07:20 +0100 (CET)
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
Subject: [PATCH v2 1/3] phy: core: Add documentation of phy operation order
Date:   Wed, 23 Mar 2022 12:07:06 +0100
Message-Id: <20220323110708.8254-2-jmaselbas@kalray.eu>
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

Add documentation on phy function usage: init function must be
called before power_on; power_off must be called before exit.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
---
change in v2:
  - Update the documentation syntax for returned value

 drivers/phy/phy-core.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 91e28d6ce450..2f32f999445f 100644
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
+ * Return: %0 if successful, a negative error code otherwise
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
+ * Return: %0 if successful, a negative error code otherwise
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
+ * Return: %0 if successful, a negative error code otherwise
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
+ * Return: %0 if successful, a negative error code otherwise
+ */
 int phy_power_off(struct phy *phy)
 {
 	int ret;
-- 
2.17.1

