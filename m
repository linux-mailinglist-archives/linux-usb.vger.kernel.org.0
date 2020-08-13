Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0D3243404
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgHMGZw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbgHMGZu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:50 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A64B320716;
        Thu, 13 Aug 2020 06:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299950;
        bh=PUZCkfKqM56/EMsMa6LaRKqzxfbN7vt7o481UC1U8V4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sqAiN2dQOO0dBbfnl2VxcQjxHbkqwef9eW/WnQDlVMQjHUe42wjb87PI1VX0WpT+d
         7MhOab7+V0I7QP05FnNvDESY+OUEHnsddpAQxI5iKALamOwuZGPH9PCutYyJ8NzLbi
         SJNDzMV4LrhjJKiTLJi9LRmiSrNA2+7r5P8jAueQ=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 10/11] dwc3: qcom: fix checkpatch warnings
Date:   Thu, 13 Aug 2020 09:25:31 +0300
Message-Id: <20200813062532.829720-10-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

no functional changes

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index fcf7f79fb983..c703d552bbcf 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -444,7 +444,9 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
 {
 	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
 	const struct dwc3_acpi_pdata *pdata = qcom->acpi_pdata;
-	int irq, ret;
+	int irq;
+	int ret;
+
 	irq = dwc3_qcom_get_irq(pdev, "hs_phy_irq",
 				pdata ? pdata->hs_phy_irq_index : -1);
 	if (irq > 0) {
@@ -563,7 +565,7 @@ static const struct property_entry dwc3_qcom_acpi_properties[] = {
 
 static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 {
-	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
+	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device		*dev = &pdev->dev;
 	struct resource		*res, *child_res = NULL;
 	int			irq;
@@ -623,7 +625,7 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 
 static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 {
-	struct dwc3_qcom 	*qcom = platform_get_drvdata(pdev);
+	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
 	int			ret;
-- 
2.28.0

