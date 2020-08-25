Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773ED250FDC
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 05:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgHYDQ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 23:16:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:36556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726532AbgHYDQZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 23:16:25 -0400
Received: from localhost.localdomain (unknown [218.82.62.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53CC4207D3;
        Tue, 25 Aug 2020 03:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598325385;
        bh=DtQj9kdtOD4t59l5DbVwKW+XpQEkbImky5P2NaWq8qY=;
        h=From:To:Cc:Subject:Date:From;
        b=YpiA6EWy5QfkooNoWw6qrzOqoZwFmJXInJElmaZDMlFYilRXTnE7DcIb34CJmachr
         DZYXhu+IxoH6m+vfAcvAjURVLjEHWsSeo7bh62I1owz6ZpatyfCF+rlWZqkJsBvpMF
         5qWdcvJic+WSYvHBPAEGVeq9elpn2nqfU5LYp/YA=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: ci_hdrc_imx: restore pinctrl
Date:   Tue, 25 Aug 2020 11:16:11 +0800
Message-Id: <20200825031611.15677-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

The pinctrl setting may lost during the system suspend
(eg, imx7ulp), it needs to restore them after system resume.
Meanwhile, some platforms may need to set special pinctrl
for power comsumption.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index d6085f46772f..25c65accf089 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -614,7 +614,12 @@ static int __maybe_unused ci_hdrc_imx_suspend(struct device *dev)
 		}
 	}
 
-	return imx_controller_suspend(dev);
+	ret = imx_controller_suspend(dev);
+	if (ret)
+		return ret;
+
+	pinctrl_pm_select_sleep_state(dev);
+	return ret;
 }
 
 static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
@@ -622,6 +627,7 @@ static int __maybe_unused ci_hdrc_imx_resume(struct device *dev)
 	struct ci_hdrc_imx_data *data = dev_get_drvdata(dev);
 	int ret;
 
+	pinctrl_pm_select_default_state(dev);
 	ret = imx_controller_resume(dev);
 	if (!ret && data->supports_runtime_pm) {
 		pm_runtime_disable(dev);
-- 
2.17.1

