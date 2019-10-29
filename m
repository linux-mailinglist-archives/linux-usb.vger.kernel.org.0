Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAD95E862C
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 11:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbfJ2K52 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 06:57:28 -0400
Received: from mga18.intel.com ([134.134.136.126]:25719 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726175AbfJ2K52 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Oct 2019 06:57:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Oct 2019 03:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; 
   d="scan'208";a="205436911"
Received: from pipin.fi.intel.com ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 03:57:26 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: [PATCH] usb: dwc3: of-simple: add a shutdown
Date:   Tue, 29 Oct 2019 12:57:24 +0200
Message-Id: <20191029105724.1344227-1-felipe.balbi@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case we're loading a new kernel via kexec, let's make sure to
cleanup the dwc3 address space correctly. This means that we should
run the same steps from driver remove, so just extract a reusable
function for both cases.

Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index bdac3e7d7b18..e64754be47b4 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -110,12 +110,9 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int dwc3_of_simple_remove(struct platform_device *pdev)
+static void __dwc3_of_simple_teardown(struct dwc3_of_simple *simple)
 {
-	struct dwc3_of_simple	*simple = platform_get_drvdata(pdev);
-	struct device		*dev = &pdev->dev;
-
-	of_platform_depopulate(dev);
+	of_platform_depopulate(simple->dev);
 
 	clk_bulk_disable_unprepare(simple->num_clocks, simple->clks);
 	clk_bulk_put_all(simple->num_clocks, simple->clks);
@@ -126,13 +123,27 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 
 	reset_control_put(simple->resets);
 
-	pm_runtime_disable(dev);
-	pm_runtime_put_noidle(dev);
-	pm_runtime_set_suspended(dev);
+	pm_runtime_disable(simple->dev);
+	pm_runtime_put_noidle(simple->dev);
+	pm_runtime_set_suspended(simple->dev);
+}
+
+static int dwc3_of_simple_remove(struct platform_device *pdev)
+{
+	struct dwc3_of_simple	*simple = platform_get_drvdata(pdev);
+
+	__dwc3_of_simple_teardown(simple);
 
 	return 0;
 }
 
+static void dwc3_of_simple_shutdown(struct platform_device *pdev)
+{
+	struct dwc3_of_simple	*simple = platform_get_drvdata(pdev);
+
+	__dwc3_of_simple_teardown(simple);
+}
+
 static int __maybe_unused dwc3_of_simple_runtime_suspend(struct device *dev)
 {
 	struct dwc3_of_simple	*simple = dev_get_drvdata(dev);
@@ -190,6 +201,7 @@ MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
 static struct platform_driver dwc3_of_simple_driver = {
 	.probe		= dwc3_of_simple_probe,
 	.remove		= dwc3_of_simple_remove,
+	.shutdown	= dwc3_of_simple_shutdown,
 	.driver		= {
 		.name	= "dwc3-of-simple",
 		.of_match_table = of_dwc3_simple_match,
-- 
2.23.0

