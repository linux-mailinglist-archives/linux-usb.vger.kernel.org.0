Return-Path: <linux-usb+bounces-3775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC380681B
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 08:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32A22B21263
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 07:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B613E16404;
	Wed,  6 Dec 2023 07:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="G9hc2pE1"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Dec 2023 23:19:31 PST
Received: from mail-m92232.xmail.ntesmail.com (mail-m92232.xmail.ntesmail.com [103.126.92.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E28B9E;
	Tue,  5 Dec 2023 23:19:30 -0800 (PST)
DKIM-Signature: a=rsa-sha256;
	b=G9hc2pE1Vl1lBDFKkQ5Pc4UHtjbFYBDjCcQbMcmQ6BZIQmID9ySC4ZNy0kRUqZn2hsOo6IYLo/UeS6jcKkEGb3N332vRDlJHsJ4hxA8CNQ2zlEx8AEPu7LlJ0qumeRHwQB5pCVjlVt1claGVSK7fmV1mii/M6ZFWbSnfdOwj4Tk=;
	s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ZGUnqnKqiH3fiQPt2YzpZAzinEzCmAaPqVPFdS5nUos=;
	h=date:mime-version:subject:message-id:from;
Received: from localhost.localdomain (unknown [58.22.7.114])
	by mail-m12786.qiye.163.com (Hmail) with ESMTPA id 64F0A7C01FD;
	Wed,  6 Dec 2023 14:59:40 +0800 (CST)
From: Frank Wang <frank.wang@rock-chips.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	william.wu@rock-chips.com,
	wmc@rock-chips.com,
	Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH] usb: dwc3: set pm runtime active before resume common
Date: Wed,  6 Dec 2023 14:59:39 +0800
Message-Id: <20231206065939.16958-1-frank.wang@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5LS1YaShhCGB5OTBlMTUxVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5JVUpLS1VKQl
	kG
X-HM-Tid: 0a8c3decd5c4b256kuuu64f0a7c01fd
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6Qyo6LDw2MAENVkgaPisC
	QgkKChdVSlVKTEtKQ09OQkNKSUlJVTMWGhIXVR0JGhUQVQwaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQk1LNwY+
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

For device mode, if PM runtime autosuspend feature enabled, the
runtime power status of dwc3 may be suspended when run dwc3_resume(),
and dwc3 gadget would not be configured in dwc3_gadget_run_stop().
It would cause gadget connected failed if USB cable has been plugged
before PM resume. So move forward pm_runtime_set_active() to fix it.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
---
 drivers/usb/dwc3/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index b101dbf8c5dc..d891989e8459 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2340,12 +2340,15 @@ static int dwc3_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
+	pm_runtime_disable(dev);
+	pm_runtime_set_active(dev);
+
 	ret = dwc3_resume_common(dwc, PMSG_RESUME);
-	if (ret)
+	if (ret) {
+		pm_runtime_set_suspended(dev);
 		return ret;
+	}
 
-	pm_runtime_disable(dev);
-	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.17.1


