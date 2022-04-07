Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5504F7C9C
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 12:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237407AbiDGKXV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 06:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240485AbiDGKXS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 06:23:18 -0400
Received: from fx302.security-mail.net (mxout.security-mail.net [85.31.212.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571D99682C
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 03:21:19 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx302.security-mail.net (Postfix) with ESMTP id B33743D3B0EA
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 12:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1649326877;
        bh=qeM5UihRfAhfzoiHR44SgCP5YCYY5Yg5beDIiKFiYjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LtyALYjAXI/mUdztS+25BH4MmjY5W/DP94PzFoImKkkIF59sbofl8HhhE2nwEJaDe
         qP4UCO08rOjDuzNF3lTJ9wOY9+qOQUTfIQfievpFpXWTrlxZZ627SSSOfu56PqkFg0
         MKtWEaRDj34L2eoaWcnjvH4uAS+hhQNO19RqqmXg=
Received: from fx302 (localhost [127.0.0.1])
        by fx302.security-mail.net (Postfix) with ESMTP id C93023D3B0DE;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <180ad.624ebb1c.47d3a.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx302.security-mail.net (Postfix) with ESMTPS id 483AF3D3B0DC;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 2C76E27E044F;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 166DD27E044D;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 166DD27E044D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1649326876;
        bh=pJLQoI+CUXSinQ8V+o6Uj41mhRgAL58tDZolAf6mrKg=;
        h=From:To:Date:Message-Id;
        b=dfbp2qAuqyS0GKJyBZfP1lSX0m7X0mTNlZ+QI6JQXPy8oCARSj40bGNPnFcSYPZbm
         QZYQr5WHbJIoqdN8SVUBHsDG3nPrxBKZEPzQiDbkb/IiDJzSE8pHkW0ZsyV1YHzW+G
         Y99eAYZNvbUyWzhke45/2kARChcW1R5SHq6IY8s0=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SJnR7KfZKuqP; Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id EF3B127E0443;
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
Subject: [PATCH RESEND v3 2/3] phy: core: Update documentation syntax
Date:   Thu,  7 Apr 2022 12:21:07 +0200
Message-Id: <20220407102108.24211-3-jmaselbas@kalray.eu>
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

Update the syntax used by the documentation of phy operation functions.
This is to unify the syntax with the newly added documentation.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
v2: new patch
v3: no change

 drivers/phy/phy-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index d1817a0f2d09..d11b517e283a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -467,7 +467,7 @@ EXPORT_SYMBOL_GPL(phy_reset);
  * runtime, which are otherwise lost after host controller reset and cannot
  * be applied in phy_init() or phy_power_on().
  *
- * Returns: 0 if successful, an negative error code otherwise
+ * Return: %0 if successful, a negative error code otherwise
  */
 int phy_calibrate(struct phy *phy)
 {
@@ -493,7 +493,7 @@ EXPORT_SYMBOL_GPL(phy_calibrate);
  * on the phy. The configuration will be applied on the current phy
  * mode, that can be changed using phy_set_mode().
  *
- * Returns: 0 if successful, an negative error code otherwise
+ * Return: %0 if successful, a negative error code otherwise
  */
 int phy_configure(struct phy *phy, union phy_configure_opts *opts)
 {
@@ -527,7 +527,7 @@ EXPORT_SYMBOL_GPL(phy_configure);
  * PHY, so calling it as many times as deemed fit will have no side
  * effect.
  *
- * Returns: 0 if successful, an negative error code otherwise
+ * Return: %0 if successful, a negative error code otherwise
  */
 int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
 		 union phy_configure_opts *opts)
-- 
2.17.1

