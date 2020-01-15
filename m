Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA3713BC88
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729441AbgAOJiH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:38:07 -0500
Received: from inva020.nxp.com ([92.121.34.13]:41016 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729396AbgAOJiH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 04:38:07 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D96101A05B2;
        Wed, 15 Jan 2020 10:38:05 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CCF181A088B;
        Wed, 15 Jan 2020 10:38:03 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EF94A402BB;
        Wed, 15 Jan 2020 17:38:00 +0800 (SGT)
From:   Peter Chen <peter.chen@nxp.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, Jun Li <jun.li@nxp.com>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: chipidea: add inline for ci_hdrc_host_driver_init if host is not defined
Date:   Wed, 15 Jan 2020 17:34:00 +0800
Message-Id: <1579080840-5344-1-git-send-email-peter.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jun Li <jun.li@nxp.com>

Otherwise, there is a build warning if this header file is included
by non host source file, eg, otg.c.

Signed-off-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/host.h b/drivers/usb/chipidea/host.h
index 70112cf0f195..2625aa01a911 100644
--- a/drivers/usb/chipidea/host.h
+++ b/drivers/usb/chipidea/host.h
@@ -20,7 +20,7 @@ static inline void ci_hdrc_host_destroy(struct ci_hdrc *ci)
 
 }
 
-static void ci_hdrc_host_driver_init(void)
+static inline void ci_hdrc_host_driver_init(void)
 {
 
 }
-- 
2.17.1

