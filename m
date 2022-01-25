Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FCC49B884
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 17:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiAYQXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 11:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1583467AbiAYQSi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 11:18:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196F9C061747;
        Tue, 25 Jan 2022 08:18:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BE891B81745;
        Tue, 25 Jan 2022 16:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BAEC340E6;
        Tue, 25 Jan 2022 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643127511;
        bh=KPhS8G2JErUeZZWslcOjR2HLQZQslkcvwy9PWOhcCdw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ixx61h0LRzALsiO0OESBkCkry6HzzEBq6auEBXRj8s7n91qzMj2SL23YaaYNnw2ZK
         rdV2rA1JlUueFtWRVqmtiFxvPrhzNR+3mY/VOrwppJTdkf9joWe10etxXxWzWG01md
         pBAyvHMOMQ1mKVR5Nt3yNgzFmyd1BXgNNc8Lpy5Mz/IfIpTJH6WHEqKVmgquzOTYM0
         UpxgvyDgQH8qpqA3UUs8gtllNBb2ZgPuNO7axVPhuhqt72FEOk3q2/32d3cTu4J9OU
         PjZmNwauXZmua9AlLdkFOvEMQhBEoSCfoIPv+W6oIcv4W4x6+DOKBLJiDvxLRgz3Bx
         X7QLUkRQ1i1AA==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     hminas@synopsys.com
Cc:     dinguyen@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] usb: dwc2: Add platform specific data for Intel's Agilex
Date:   Tue, 25 Jan 2022 10:18:20 -0600
Message-Id: <20220125161821.1951906-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125161821.1951906-1-dinguyen@kernel.org>
References: <20220125161821.1951906-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The DWC2 IP on the Agilex platform does not support clock-gating.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/usb/dwc2/params.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index d300ae3d9274..1306f4ec788d 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -82,6 +82,14 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
 	p->phy_utmi_width = 8;
 }
 
+static void dwc2_set_socfpga_agilex_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
+	p->no_clock_gating = true;
+}
+
 static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -239,6 +247,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_stm32mp15_fsotg_params },
 	{ .compatible = "st,stm32mp15-hsotg",
 	  .data = dwc2_set_stm32mp15_hsotg_params },
+	{ .compatible = "intel,socfpga-agilex-hsotg",
+	  .data = dwc2_set_socfpga_agilex_params },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dwc2_of_match_table);
-- 
2.25.1

