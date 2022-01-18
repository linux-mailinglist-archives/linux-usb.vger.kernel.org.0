Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44327491952
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 03:53:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346792AbiARCxk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 21:53:40 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:60933 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347626AbiARCmW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jan 2022 21:42:22 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 344FB6093C;
        Tue, 18 Jan 2022 02:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A69C36AF9;
        Tue, 18 Jan 2022 02:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642473740;
        bh=ogkFxolfQWRQxJZn/Tdu72Ih6tdiWRo2xRIJQtxu78g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ejuvokdzxhUr4oAhO/E81ppb1RIOr0VAaFpGjKNR2OO7nR3C9NNeirB8u5qrdT/2y
         uu6wyuFtJoY+NwH1UHQq/7JMZ5sEnph/gdJBhLvfV0998W477Ms0D3PHq8etDUeAH1
         jTLS8SRKUwohMGTgp7WRVBaVYQtbnbJ1GuCc65VClNMkp8BOvHi1nvhhaRHDgQPka3
         uAi1e+f3tiuQXRVy4fJPcEY4/VTZI5UcxfBTppeScfJ3sgdepPJzU9VzB2HMvMnNes
         FltzYecZgOcY2retY42cEZrlhXT3soO8eOtgiP1aoPeBuIdsWwereCPr4rSd68HacR
         GYa/Q0IWu+xqw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Sasha Levin <sashal@kernel.org>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 049/116] thunderbolt: Runtime PM activate both ends of the device link
Date:   Mon, 17 Jan 2022 21:39:00 -0500
Message-Id: <20220118024007.1950576-49-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118024007.1950576-1-sashal@kernel.org>
References: <20220118024007.1950576-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

[ Upstream commit f3380cac0c0b3a6f49ab161e2a057c363962f48d ]

If protocol tunnels are already up when the driver is loaded, for
instance if the boot firmware implements connection manager of its own,
runtime PM reference count of the consumer devices behind the tunnel
might have been increased already before the device link is created but
the supplier device runtime PM reference count is not. This leads to a
situation where the supplier (the Thunderbolt driver) can runtime
suspend even if it should not because the corresponding protocol tunnel
needs to be up causing the devices to be removed from the corresponding
native bus.

Prevent this from happening by making both sides of the link runtime PM
active briefly. The pm_runtime_put() for the consumer (PCIe
root/downstream port, xHCI) then allows it to runtime suspend again but
keeps the supplier runtime resumed the whole time it is runtime active.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/thunderbolt/acpi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index b5442f979b4d0..6355fdf7d71a3 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/pm_runtime.h>
 
 #include "tb.h"
 
@@ -74,8 +75,18 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 		 pci_pcie_type(pdev) == PCI_EXP_TYPE_DOWNSTREAM))) {
 		const struct device_link *link;
 
+		/*
+		 * Make them both active first to make sure the NHI does
+		 * not runtime suspend before the consumer. The
+		 * pm_runtime_put() below then allows the consumer to
+		 * runtime suspend again (which then allows NHI runtime
+		 * suspend too now that the device link is established).
+		 */
+		pm_runtime_get_sync(&pdev->dev);
+
 		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
 				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_RPM_ACTIVE |
 				       DL_FLAG_PM_RUNTIME);
 		if (link) {
 			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
@@ -84,6 +95,8 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
 				 dev_name(&pdev->dev));
 		}
+
+		pm_runtime_put(&pdev->dev);
 	}
 
 out_put:
-- 
2.34.1

