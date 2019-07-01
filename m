Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21FF33565A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 07:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfFEFs0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 01:48:26 -0400
Received: from inva020.nxp.com ([92.121.34.13]:56558 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726568AbfFEFsQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 01:48:16 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1B1381A07AF;
        Wed,  5 Jun 2019 07:48:15 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2EBB51A07AC;
        Wed,  5 Jun 2019 07:48:10 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D165E402BF;
        Wed,  5 Jun 2019 13:48:03 +0800 (SGT)
From:   Yinbo Zhu <yinbo.zhu@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     yinbo.zhu@nxp.com, xiaobo.xie@nxp.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        Nikhil Badola <nikhil.badola@freescale.com>,
        Ran Wang <ran.wang_1@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, jiafei.pan@nxp.com
Subject: [PATCH v6 5/5] usb :fsl: Change string format for errata property
Date:   Wed,  5 Jun 2019 13:49:52 +0800
Message-Id: <20190605054952.34687-5-yinbo.zhu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605054952.34687-1-yinbo.zhu@nxp.com>
References: <20190605054952.34687-1-yinbo.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Nikhil Badola <nikhil.badola@freescale.com>

Remove USB errata checking code from driver. Applicability of erratum
is retrieved by reading corresponding property in device tree.
This property is written during device tree fixup.

Signed-off-by: Ramneek Mehresh <ramneek.mehresh@freescale.com>
Signed-off-by: Nikhil Badola <nikhil.badola@freescale.com>
Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
---
 drivers/usb/host/fsl-mph-dr-of.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 762b97600ab0..ae8f60f6e6a5 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -226,11 +226,8 @@ static int fsl_usb2_mph_dr_of_probe(struct platform_device *ofdev)
 		of_property_read_bool(np, "fsl,usb_erratum-a005697");
 	pdata->has_fsl_erratum_a006918 =
 		of_property_read_bool(np, "fsl,usb_erratum-a006918");
-
-	if (of_get_property(np, "fsl,usb_erratum_14", NULL))
-		pdata->has_fsl_erratum_14 = 1;
-	else
-		pdata->has_fsl_erratum_14 = 0;
+	pdata->has_fsl_erratum_14 =
+		of_property_read_bool(np, "fsl,usb_erratum-14");
 
 	/*
 	 * Determine whether phy_clk_valid needs to be checked
-- 
2.17.1

