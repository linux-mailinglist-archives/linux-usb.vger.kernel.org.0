Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD1B4E416C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Mar 2022 15:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbiCVOgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Mar 2022 10:36:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237624AbiCVOgn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 10:36:43 -0400
Received: from fx601.security-mail.net (smtpout140.security-mail.net [85.31.212.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293106CA7F
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 07:35:16 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id A09113ACE72
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 15:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1647959420;
        bh=ID+rhrPxmBOnR/DsPrgnRbmHuKTUDSQKp8CO9zKwB5Y=;
        h=From:To:Cc:Subject:Date;
        b=49RcSSZPSJVo0WnfjeMBmLS+Hb54JZm6E+JbXDxwui5+I8qV7+kOrkW6AJG0bNrrd
         IZZNvIuqR/Ey1bWJ+SyN+jTQ1CDntplCbCIM0rrBTLfclnSEMFA3rB/wRyg/o3yRTt
         7D95Jg5qbbNcE04h1Rj5HPvTKyuCrO+R9qghExUA=
Received: from fx601 (localhost [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id B36613ACE13;
        Tue, 22 Mar 2022 15:30:19 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <2afd.6239dd7a.3a643.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx601.security-mail.net (Postfix) with ESMTPS id 3BD5F3ACF84;
        Tue, 22 Mar 2022 15:30:18 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 0B8C927E0436;
        Tue, 22 Mar 2022 15:30:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E720027E0439;
        Tue, 22 Mar 2022 15:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E720027E0439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1647959417;
        bh=sKOhVxVXHFYb0NoCRyEAuWsgaox+Ac24an8wlVobJqk=;
        h=From:To:Date:Message-Id;
        b=nw/Q5jo47XtenSX6thxLE2spiqlzjuOoycG5ymmkbTWzRR0M/p6Sr0Qs2HRHsyBFo
         wxiViXRKkCWQl0FZzC9rn8FdFjlPiqA4pVqWT2mhqZ6JfwNNDYaEANGcXFZE90mLcq
         YORCFFl5foMYA96C/YI1xWux+5RvKeo+wJjaoXLg=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5rbrrZwhCmxL; Tue, 22 Mar 2022 15:30:17 +0100 (CET)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id D061427E0436;
        Tue, 22 Mar 2022 15:30:17 +0100 (CET)
From:   Jules Maselbas <jmaselbas@kalray.eu>
To:     linux-usb@vger.kernel.org
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Jules Maselbas <jmaselbas@kalray.eu>
Subject: [PATCH 0/2] Cleanup the call ordering of phy_init and phy_power_on
Date:   Tue, 22 Mar 2022 15:30:09 +0100
Message-Id: <20220322143011.16580-1-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
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

Jules Maselbas (2):
  phy: core: Add documentation of phy operation order
  phy: core: Warn when phy_power_on is called before phy_init

 drivers/phy/phy-core.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

-- 
2.17.1

