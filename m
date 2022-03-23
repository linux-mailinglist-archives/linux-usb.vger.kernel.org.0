Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 513EB4E5104
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 12:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242752AbiCWLJN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 07:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbiCWLJN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 07:09:13 -0400
Received: from fx308.security-mail.net (smtpout30.security-mail.net [85.31.212.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951337806E
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 04:07:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx308.security-mail.net (Postfix) with ESMTP id 44AD181C50B
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 12:07:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1648033662;
        bh=cmxsWVENngI8AG3RFKrkxT2nJQtlNf9zKwwrZjY0kJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=5qhrcwRy+h/VlRLPoYo84MqbdKEesTXR8NX7AdE+9bTT1jYRqhZNi7cp9rhYBsH/Y
         enj0iVgZMgVR2yt9W0r4r3ammeRS+d9qyptXDPaFrYudoD9yoR/VvccJu3RJqN3ss/
         spKFma+ylcm7eKwL1A1t2SeEi3YqvLKeOejPGZ3U=
Received: from fx308 (localhost [127.0.0.1])
        by fx308.security-mail.net (Postfix) with ESMTP id 1A66681C443;
        Wed, 23 Mar 2022 12:07:40 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <cf64.623aff69.e5980.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx308.security-mail.net (Postfix) with ESMTPS id E762281C3CF;
        Wed, 23 Mar 2022 12:07:21 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id CB14F27E0444;
        Wed, 23 Mar 2022 12:07:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id B554127E0443;
        Wed, 23 Mar 2022 12:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu B554127E0443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1648033641;
        bh=Is5Op+yf2jLp8LVzNyoyPvTTzZW0Vq4RhBV0HSyWYtg=;
        h=From:To:Date:Message-Id;
        b=Ph8yGGqbCORv4YWj0pOXU6ZeEy6TuDIBlzBQeHeQOSjqGfNx7bz1vi0mKx8/uejPy
         UefEYzlKyYgteYfOft3iPWIqhGgo2IpgzH9pMSbVOUPzw23fgSml7C/uh7ZeZbxLbR
         BrqnpOJ06Hp3hjf4ca4xx7SwP3RQOY146WXkJ4Fw=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id utvgyQvDC_cS; Wed, 23 Mar 2022 12:07:21 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id A304F27E0425;
        Wed, 23 Mar 2022 12:07:21 +0100 (CET)
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
Subject: [PATCH v2 2/3] phy: core: Update documentation syntax
Date:   Wed, 23 Mar 2022 12:07:07 +0100
Message-Id: <20220323110708.8254-3-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323110708.8254-1-jmaselbas@kalray.eu>
References: <20220323110708.8254-1-jmaselbas@kalray.eu>
X-Virus-Scanned: by Secumail
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Update the syntax used by the documentation of phy operation functions.
This is to unify the syntax with the newly added documentation.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
change in v2:
  - New patch

 drivers/phy/phy-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 2f32f999445f..cbdad65d2caa 100644
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

