Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADEA4D05C3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 05:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730271AbfJIDDP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 23:03:15 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58790 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726109AbfJIDDP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 23:03:15 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E70BF200081;
        Wed,  9 Oct 2019 05:03:13 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B8958200363;
        Wed,  9 Oct 2019 05:03:10 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7A20B40299;
        Wed,  9 Oct 2019 11:03:06 +0800 (SGT)
From:   jun.li@nxp.com
To:     peter.chen@nxp.com
Cc:     gregkh@linuxfoundation.org, jun.li@nxp.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, dan.carpenter@oracle.com
Subject: [PATCH] usb: chipidea: imx: check data->usbmisc_data against NULL before access
Date:   Wed,  9 Oct 2019 10:52:28 +0800
Message-Id: <20191009025228.16595-1-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

As usbmisc_data is optional, so add the check before access its member,
this fix below static checker warning:
drivers/usb/chipidea/ci_hdrc_imx.c:438 ci_hdrc_imx_probe()
warn: 'data->usbmisc_data' can also be NULL
which is introduced by Patch 15b80f7c3a7f:
"usb: chipidea: imx: enable vbus and id wakeup only for OTG events"

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index b11d70f..0498210 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -433,13 +433,15 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	if (!IS_ERR(pdata.id_extcon.edev) ||
-	    of_property_read_bool(np, "usb-role-switch"))
-		data->usbmisc_data->ext_id = 1;
-
-	if (!IS_ERR(pdata.vbus_extcon.edev) ||
-	    of_property_read_bool(np, "usb-role-switch"))
-		data->usbmisc_data->ext_vbus = 1;
+	if (data->usbmisc_data) {
+		if (!IS_ERR(pdata.id_extcon.edev) ||
+		    of_property_read_bool(np, "usb-role-switch"))
+			data->usbmisc_data->ext_id = 1;
+
+		if (!IS_ERR(pdata.vbus_extcon.edev) ||
+		    of_property_read_bool(np, "usb-role-switch"))
+			data->usbmisc_data->ext_vbus = 1;
+	}
 
 	ret = imx_usbmisc_init_post(data->usbmisc_data);
 	if (ret) {
-- 
2.7.4

