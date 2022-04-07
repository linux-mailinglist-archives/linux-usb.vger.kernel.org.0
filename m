Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFA74F7C9B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 12:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237395AbiDGKXT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 06:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237328AbiDGKXS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 06:23:18 -0400
Received: from fx301.security-mail.net (smtpout30.security-mail.net [85.31.212.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E11427FD9
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 03:21:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx301.security-mail.net (Postfix) with ESMTP id 38BF324BD0CA
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 12:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1649326877;
        bh=yqZkgoLIliahw54bhuOwqAtHS1QM7mDnzTPGUCJAZLA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Key5QeUk52dfAehA2AQqxDDwuibIZ63CLDp3ki7bhXyFKcZD31AlFuzK9bx4CRTu4
         fVSxcNrV3RDDa66Un79suZiEGZyoVh3xRmdssrxfoNaGHTksdSgpIkx0KaBhOgJXVt
         vVXWUqKsSZMG/NJEY+/ho+w+RDb4sxK+EOY1gBbs=
Received: from fx301 (localhost [127.0.0.1])
        by fx301.security-mail.net (Postfix) with ESMTP id 46AD224BD08B;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <8e12.624ebb1b.b522d.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx301.security-mail.net (Postfix) with ESMTPS id B58F924BD080;
        Thu,  7 Apr 2022 12:21:15 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 96E9E27E044F;
        Thu,  7 Apr 2022 12:21:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 7FE9927E044D;
        Thu,  7 Apr 2022 12:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 7FE9927E044D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1649326875;
        bh=tYjU0VyJFwe7OSSRp1Yty55z6lsZNfkFYLTMM5Cxjhw=;
        h=From:To:Date:Message-Id;
        b=PNEiforYv9jEllNVZmAfsgS2+X24vZqP7StpA3ypfvqIEvd+OtmMTfg/4y8+amzkF
         oNizW+CrkIKrAHSqbiVsmVdFOsyNdyHZSo5qHhF/rHbEHXumNIVq9tjYIekXopMdti
         QkSL2maoAGZVifE+Los+38D+VqQjY/2cGfFwa1II=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id U4URVFnSMH9N; Thu,  7 Apr 2022 12:21:15 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 6CED527E0443;
        Thu,  7 Apr 2022 12:21:15 +0200 (CEST)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     linux-phy@lists.infradead.org
Cc:     linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH RESEND v3 1/3] phy: core: Add documentation of phy operation order
Date:   Thu,  7 Apr 2022 12:21:06 +0200
Message-Id: <20220407102108.24211-2-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220407102108.24211-1-jmaselbas@kalray.eu>
References: <20220407102108.24211-1-jmaselbas@kalray.eu>
X-Virus-Scanned: by Secumail
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
v2: Update the documentation syntax for returned value

 drivers/phy/phy-core.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index b3f45dbdc681..d1817a0f2d09 100644
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

