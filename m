Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06B8502F9
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 09:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbfFXHUb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 03:20:31 -0400
Received: from inva021.nxp.com ([92.121.34.21]:44596 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727754AbfFXHUb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jun 2019 03:20:31 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 49A3D2000C9;
        Mon, 24 Jun 2019 09:20:29 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0533820009D;
        Mon, 24 Jun 2019 09:20:24 +0200 (CEST)
Received: from mega.ap.freescale.net (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 453694030D;
        Mon, 24 Jun 2019 15:20:17 +0800 (SGT)
From:   Yinbo Zhu <yinbo.zhu@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     yinbo.zhu@nxp.com, xiaobo.xie@nxp.com, jiafei.pan@nxp.com,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        Nikhil Badola <nikhil.badola@freescale.com>,
        Ran Wang <ran.wang_1@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/5] usb: linux/fsl_device: Add platform member has_fsl_erratum_a006918
Date:   Mon, 24 Jun 2019 15:22:17 +0800
Message-Id: <20190624072219.15258-3-yinbo.zhu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624072219.15258-1-yinbo.zhu@nxp.com>
References: <20190624072219.15258-1-yinbo.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch is to add member has_fsl_erratum_a006918 in platform data

Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
---
 include/linux/fsl_devices.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fsl_devices.h b/include/linux/fsl_devices.h
index cb2b46f57af3..5d231ce8709b 100644
--- a/include/linux/fsl_devices.h
+++ b/include/linux/fsl_devices.h
@@ -98,6 +98,7 @@ struct fsl_usb2_platform_data {
 	unsigned	has_fsl_erratum_14:1;
 	unsigned	has_fsl_erratum_a005275:1;
 	unsigned	has_fsl_erratum_a005697:1;
+	unsigned        has_fsl_erratum_a006918:1;
 	unsigned	check_phy_clk_valid:1;
 
 	/* register save area for suspend/resume */
-- 
2.17.1

