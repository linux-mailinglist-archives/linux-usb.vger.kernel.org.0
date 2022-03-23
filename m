Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481854E5103
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 12:07:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbiCWLJM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 07:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbiCWLJL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 07:09:11 -0400
Received: from fx308.security-mail.net (smtpout30.security-mail.net [85.31.212.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C203278057
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 04:07:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx308.security-mail.net (Postfix) with ESMTP id BD11581C481
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 12:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1648033660;
        bh=v9g7DsSlFogJyv3ZLABnERl4LylzS13BZ7QkOZDwmL8=;
        h=From:To:Cc:Subject:Date;
        b=US4JTqihEgeufVQs0aDOwjRhcRDOloqrOJZFpWTvLfJvWUkU2m/ufisErb+/yBK5y
         RjowHUDpHS3tmZyDOFicZARf/K4gpm1Yz8ilw997mwQjRyTZOKaLwUbrd4pRaHZwKW
         //wrm6SIEspB4lS1peE54/0+gYk3UlKA/ZXqqne0=
Received: from fx308 (localhost [127.0.0.1])
        by fx308.security-mail.net (Postfix) with ESMTP id 54C2B81C406;
        Wed, 23 Mar 2022 12:07:39 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <9bf1.623aff68.52346.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx308.security-mail.net (Postfix) with ESMTPS id 52DE381C3C6;
        Wed, 23 Mar 2022 12:07:20 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 35E4F27E0425;
        Wed, 23 Mar 2022 12:07:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1AF2827E0443;
        Wed, 23 Mar 2022 12:07:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 1AF2827E0443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1648033640;
        bh=O83eUvONSacsYz8f+A0wiZQO9msOmZgqo3/7OCab0aA=;
        h=From:To:Date:Message-Id;
        b=emEtCNXJjYmRbbSVSa1jzKO/xPOcQWCNcNu6j5sE0Lc83MhcjRzVIaD7D1MlPs7uM
         5RdlHkAEaQ+YJJGSKvzV8QoIH9d1oDkkXYdc6L1CnCYFzd1ePSGuDe2iDOwinKkmXp
         pO4JJCPxTsKye79GbpNad2MNJcR4MkXnsJcaUjXA=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id mxBrwjpK59jW; Wed, 23 Mar 2022 12:07:20 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 00DC627E0425;
        Wed, 23 Mar 2022 12:07:19 +0100 (CET)
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
Subject: [PATCH v2 0/3] Cleanup the call ordering of phy_init and phy_power_on
Date:   Wed, 23 Mar 2022 12:07:05 +0100
Message-Id: <20220323110708.8254-1-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
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

Hi,

Last year Ahmad asked what is the correct order when calling phy_init
and phy_power_on. Since then, I didn't see the situation improve much
and I am once again toying around with usb phy driver.

The following two patches were in my tree for a year... Last year i
previously tried to change the call order in the dwc2 driver but this
requires the relevent phy to be also compatible with the "new" ordering.
The stm32-usbphyc driver wasn't compatible, I am not sure if that is
still is the case.

For now simply add documentation, hopefully correct, but I am not an
expert on actual phy sementics or usage in the kernel. And add warning
when the order is not what's expected.

Best,

---
changes in v2:
  - Update the documentation syntax for returned value

Jules Maselbas (3):
  phy: core: Add documentation of phy operation order
  phy: core: Update documentation syntax
  phy: core: Warn when phy_power_on is called before phy_init

 drivers/phy/phy-core.c | 44 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

-- 
2.17.1

