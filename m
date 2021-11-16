Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5258452F3B
	for <lists+linux-usb@lfdr.de>; Tue, 16 Nov 2021 11:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbhKPKjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Nov 2021 05:39:40 -0500
Received: from mga01.intel.com ([192.55.52.88]:12304 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234234AbhKPKjj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Nov 2021 05:39:39 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="257422233"
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; 
   d="scan'208";a="257422233"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 02:36:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,238,1631602800"; 
   d="scan'208";a="548556866"
Received: from saranya-nuc10i7fnh.iind.intel.com ([10.223.216.72])
  by fmsmga008.fm.intel.com with ESMTP; 16 Nov 2021 02:36:40 -0800
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
        Saranya Gopal <saranya.gopal@intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: [PATCH] usb: typec: ucsi: Expose number of alternate modes in partner
Date:   Tue, 16 Nov 2021 16:06:13 +0530
Message-Id: <20211116103613.31349-1-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Type-c class provides an option to expose the number of alternate
modes in the port partner as a sysfs interface. Use that to
expose the number of alternate modes in the port partner from
the ucsi driver.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 6aa28384f77f..9d6b7e02d6ef 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -303,6 +303,17 @@ static int ucsi_next_altmode(struct typec_altmode **alt)
 	return -ENOENT;
 }
 
+static int ucsi_get_num_altmode(struct typec_altmode **alt)
+{
+	int i;
+
+	for (i = 0; i < UCSI_MAX_ALTMODES; i++)
+		if (!alt[i])
+			break;
+
+	return i;
+}
+
 static int ucsi_register_altmode(struct ucsi_connector *con,
 				 struct typec_altmode_desc *desc,
 				 u8 recipient)
@@ -607,7 +618,7 @@ static int ucsi_get_src_pdos(struct ucsi_connector *con)
 
 static int ucsi_check_altmodes(struct ucsi_connector *con)
 {
-	int ret;
+	int ret, num_partner_am;
 
 	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
 	if (ret && ret != -ETIMEDOUT)
@@ -617,6 +628,9 @@ static int ucsi_check_altmodes(struct ucsi_connector *con)
 
 	/* Ignoring the errors in this case. */
 	if (con->partner_altmode[0]) {
+		num_partner_am = ucsi_get_num_altmode(con->partner_altmode);
+		if (num_partner_am > 0)
+			typec_partner_set_num_altmodes(con->partner, num_partner_am);
 		ucsi_altmode_update_active(con);
 		return 0;
 	}
-- 
2.17.1

