Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64A326B7F7
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 10:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfGQIQD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jul 2019 04:16:03 -0400
Received: from inva021.nxp.com ([92.121.34.21]:59408 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbfGQIQC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Jul 2019 04:16:02 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 46F40200099;
        Wed, 17 Jul 2019 10:16:01 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 341CA2001D1;
        Wed, 17 Jul 2019 10:15:58 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 07650402E3;
        Wed, 17 Jul 2019 16:15:53 +0800 (SGT)
From:   jun.li@nxp.com
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/2] usb: typec: tcpm: remove tcpm dir if no children
Date:   Wed, 17 Jul 2019 16:06:46 +0800
Message-Id: <20190717080646.30421-2-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190717080646.30421-1-jun.li@nxp.com>
References: <20190717080646.30421-1-jun.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

If config tcpm as module, module unload will not remove tcpm dir,
then the next module load will have problem: the rootdir is NULL
but tcpm dir is still there, so tcpm_debugfs_init() will create
tcpm dir again with failure, fix it by remove the tcpm dir if no
children.

Cc: stable@vger.kernel.org # v4.15+
Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1249d8e..86e4552 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -596,6 +596,10 @@ static void tcpm_debugfs_exit(struct tcpm_port *port)
 	mutex_unlock(&port->logbuffer_lock);
 
 	debugfs_remove(port->dentry);
+	if (list_empty(&rootdir->d_subdirs)) {
+		debugfs_remove(rootdir);
+		rootdir = NULL;
+	}
 }
 
 #else
-- 
2.7.4

