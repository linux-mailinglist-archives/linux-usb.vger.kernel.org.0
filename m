Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220206719FC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 12:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjARLJP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 06:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjARLIq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 06:08:46 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40899519D
        for <linux-usb@vger.kernel.org>; Wed, 18 Jan 2023 02:15:45 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:4745:2e6d:e3a6:3327])
        by michel.telenet-ops.be with bizsmtp
        id AAFN2900B2zf9gW06AFNzY; Wed, 18 Jan 2023 11:15:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pI5TQ-005aId-Oc;
        Wed, 18 Jan 2023 11:15:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pI5TW-001JVz-2p;
        Wed, 18 Jan 2023 11:15:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Madalin Bucur <madalin.bucur@nxp.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     netdev@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/7] PCI: tegra: Convert to devm_of_phy_optional_get()
Date:   Wed, 18 Jan 2023 11:15:18 +0100
Message-Id: <e9e0aa207d531ccea00e8947678a4f6ce1c625ac.1674036164.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674036164.git.geert+renesas@glider.be>
References: <cover.1674036164.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use the new devm_of_phy_optional_get() helper instead of open-coding the
same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pci/controller/pci-tegra.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 929f9363e94bec71..5b8907c663e516ad 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1330,12 +1330,9 @@ static struct phy *devm_of_phy_optional_get_index(struct device *dev,
 	if (!name)
 		return ERR_PTR(-ENOMEM);
 
-	phy = devm_of_phy_get(dev, np, name);
+	phy = devm_of_phy_optional_get(dev, np, name);
 	kfree(name);
 
-	if (PTR_ERR(phy) == -ENODEV)
-		phy = NULL;
-
 	return phy;
 }
 
-- 
2.34.1

