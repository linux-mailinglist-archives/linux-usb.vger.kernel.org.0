Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 242534F7C9A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 12:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241463AbiDGKXS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 06:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232261AbiDGKXR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 06:23:17 -0400
Received: from fx403.security-mail.net (smtpout140.security-mail.net [85.31.212.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6187CDF5
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 03:21:16 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx403.security-mail.net (Postfix) with ESMTP id A5F2E4605AD
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 12:21:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1649326874;
        bh=+o2CkbeGPFlQUU4RWdS7adwPvE25/1YzhKrWYcylJfQ=;
        h=From:To:Cc:Subject:Date;
        b=BvTRgyDHkKcmxOOQrDHfT6scTp1WR0O4D36NoAv7vpfTwflNcUx9iptZNpC3vR+j/
         vNgcLQ1fVSfAUre+Nm+F2nLd1zP0Yrx33duQDdk7lvAIl+acysn4zmXDYAMpn/aQ4O
         kGLslDceay7Jq1rsotJcIBXP9hm3GhxJ5+D+Ybt4=
Received: from fx403 (localhost [127.0.0.1])
        by fx403.security-mail.net (Postfix) with ESMTP id 419B5460591;
        Thu,  7 Apr 2022 12:21:13 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <887d.624ebb18.67a00.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx403.security-mail.net (Postfix) with ESMTPS id 6903E460585;
        Thu,  7 Apr 2022 12:21:12 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 4562827E0443;
        Thu,  7 Apr 2022 12:21:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 2BC5127E044D;
        Thu,  7 Apr 2022 12:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 2BC5127E044D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1649326872;
        bh=NQEYgCh4LErSGu4roSimJUphphp5nSmB7EWB2qyF0c0=;
        h=From:To:Date:Message-Id;
        b=JZTElO5jtTFb0Pgc4m5lTihCbNJJ5bov9qkJH3UBB3B1bzwKyYDw8BkM+DH2cTj9C
         ZGslkcc/vWpx5WhjJllBXbFH/E7oVU52vJi35Ha9u8cTFGxj2u14ZqFLD93tbZp2fO
         G8UE6vFHpqA8YFfG91VTYSKEFy/ZXFZ8rLNRajZ8=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id ySbfysDni7aL; Thu,  7 Apr 2022 12:21:12 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 0946227E0443;
        Thu,  7 Apr 2022 12:21:12 +0200 (CEST)
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
Subject: [PATCH RESEND v3 0/3] Cleanup the call ordering of phy_init and phy_power_on
Date:   Thu,  7 Apr 2022 12:21:05 +0200
Message-Id: <20220407102108.24211-1-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
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
v2: Updated the documentation syntax for returned value
v3: Put the warning msg inside the locked section as suggested by Ahmad

Jules Maselbas (3):
  phy: core: Add documentation of phy operation order
  phy: core: Update documentation syntax
  phy: core: Warn when phy_power_on is called before phy_init

 drivers/phy/phy-core.c | 44 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

-- 
2.17.1

