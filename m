Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA464F7C9D
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 12:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243724AbiDGKXY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 06:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240485AbiDGKXW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 06:23:22 -0400
Received: from fx305.security-mail.net (smtpout30.security-mail.net [85.31.212.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DA827FD9
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 03:21:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx305.security-mail.net (Postfix) with ESMTP id 8164030FDEA
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 12:21:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1649326880;
        bh=2leB9N9MVO1isCk23h+tI5TUBCZFTqNDEKraPyTS3tI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WiRpawPxoFGAm+vM5jCu3MRtsmlDtvcjqyH52aRHONEi4EIUmvBOYJy3ruGD+AtdV
         LsQVBS+ElIyEsXAs2lugHscP+vGFwv8PBVqPzfsZ5ExFioqicVuinxj4t35v7HcTn+
         uenUPLLFzJxofdag4XAtBMjIlemC22VQekUnI6nc=
Received: from fx305 (localhost [127.0.0.1])
        by fx305.security-mail.net (Postfix) with ESMTP id 247D730FD36;
        Thu,  7 Apr 2022 12:21:19 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <13a18.624ebb1c.cdc68.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx305.security-mail.net (Postfix) with ESMTPS id 8314D30FD53;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 9DCF927E044F;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 87EE727E044D;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 87EE727E044D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1649326876;
        bh=9IM9Pd49M0jFhF7iENBzRLSpXjLX1rGW2MgcQSst3IU=;
        h=From:To:Date:Message-Id;
        b=IdX8uYYwjaFAjT0p0mKvde9rm56N1wrTLce4TQ7+tgGjKbuT7lmWHuc1FjKk+2tiR
         zwHrHN1iU5vKialopUMwQoR5K02MOSkH6OkHyQMLq+qaTU0XnoHGg23u7s+LAOXcJg
         B0L8L4oECeLV78az/wtpUvIeRNI26g2iuRVVQ8nU=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Bg-8kJbaERwh; Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 6AB8C27E0443;
        Thu,  7 Apr 2022 12:21:16 +0200 (CEST)
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
Subject: [PATCH RESEND v3 3/3] phy: core: Warn when phy_power_on is called before phy_init
Date:   Thu,  7 Apr 2022 12:21:08 +0200
Message-Id: <20220407102108.24211-4-jmaselbas@kalray.eu>
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

A warning when the order of phy operation is mixed up by drivers,
this is an atempt to make the phy usage more uniform across (usb)
drivers.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index d11b517e283a..90f589563a60 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -253,6 +253,9 @@ int phy_init(struct phy *phy)
 	ret = 0; /* Override possible ret == -ENOTSUPP */
 
 	mutex_lock(&phy->mutex);
+	if (phy->power_count > phy->init_count)
+		dev_warn(&phy->dev, "phy_power_on was called before phy_init\n");
+
 	if (phy->init_count == 0 && phy->ops->init) {
 		ret = phy->ops->init(phy);
 		if (ret < 0) {
-- 
2.17.1

