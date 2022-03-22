Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C40C4E416B
	for <lists+linux-usb@lfdr.de>; Tue, 22 Mar 2022 15:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbiCVOgn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Mar 2022 10:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237585AbiCVOgm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 10:36:42 -0400
X-Greylist: delayed 288 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Mar 2022 07:35:10 PDT
Received: from fx403.security-mail.net (smtpout140.security-mail.net [85.31.212.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C4E6A060
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 07:35:10 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx403.security-mail.net (Postfix) with ESMTP id 93BF74FE6F9
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 15:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1647959423;
        bh=6/vdjKdj3TBAacD39r/JYj7DZ/ZJcRrY8/Jra+61PTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=u3yHab9b++YiVwoxxmMfdFIC9f97gIF1w3yAg91I5af363HCUGoQ3Rgl2TfgTyNbg
         /T4tS6eNVxlNRL1Yx7MLyi4dd9SYwKOCy8tjQWnoSYVT/L5KscEDpXK1RfeimCQph3
         PjiVBirtK9C8tUu13lhgZwIpv30lpLTBHmxFHapY=
Received: from fx403 (localhost [127.0.0.1])
        by fx403.security-mail.net (Postfix) with ESMTP id 383E14FE695;
        Tue, 22 Mar 2022 15:30:22 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <90bf.6239dd7c.7b214.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx403.security-mail.net (Postfix) with ESMTPS id 2DD554FE638;
        Tue, 22 Mar 2022 15:30:20 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 448AE27E043B;
        Tue, 22 Mar 2022 15:30:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 2EAC627E0439;
        Tue, 22 Mar 2022 15:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2EAC627E0439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1647959420;
        bh=xBNbec84HSSpoeLNL9eQD9nc7AhHGc6JxV8Ln5sjJUk=;
        h=From:To:Date:Message-Id;
        b=R6qfCWaaFuZ2xQAGLUKK8VyELAKqUdtu8vp062E3Dch26xKFFpLwkQxPV215/jj7Y
         BD+mkHpO4EC6wibc2uq8o69mQ0dxRf5WY197QgndP1X4rqpTt7QQwA97nvbXolMxtp
         hWUPexmmvwq6RjkbbpZlFWajVxLDzRV2VEUXpO00=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id LkN_4kkowPbE; Tue, 22 Mar 2022 15:30:20 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 1D70827E0436;
        Tue, 22 Mar 2022 15:30:20 +0100 (CET)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     linux-usb@vger.kernel.org
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH 2/2] phy: core: Warn when phy_power_on is called before phy_init
Date:   Tue, 22 Mar 2022 15:30:11 +0100
Message-Id: <20220322143011.16580-3-jmaselbas@kalray.eu>
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

A warning when the order of phy operation is mixed up by drivers,
this is an atempt to make the phy usage more uniform across (usb)
drivers.

CC: Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index ed10cbb24b08..2c2c0f073080 100644
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

