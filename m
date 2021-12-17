Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD71F478CFE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 15:03:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233556AbhLQODV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 09:03:21 -0500
Received: from mga11.intel.com ([192.55.52.93]:35425 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231337AbhLQODV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Dec 2021 09:03:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="237298559"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="237298559"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 06:03:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="662851196"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2021 06:03:20 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Only check the contract if there is a connection
Date:   Fri, 17 Dec 2021 17:03:27 +0300
Message-Id: <20211217140327.31921-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver must make sure there is an actual connection
before checking details about the USB Power Delivery
contract. Those details are not valid unless there is a
connection.

This fixes NULL pointer dereference that is caused by an
attempt to register bogus partner alternate mode that the
firmware on some platform may report before the actual
connection.

Fixes: 6cbe4b2d5a3f ("usb: typec: ucsi: Check the partner alt modes always if there is PD contract")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215117
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9d6b7e02d6efb..f0c2fa19f3e0f 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1164,7 +1164,9 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		ret = 0;
 	}
 
-	if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) == UCSI_CONSTAT_PWR_OPMODE_PD) {
+	if (con->partner &&
+	    UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
+	    UCSI_CONSTAT_PWR_OPMODE_PD) {
 		ucsi_get_src_pdos(con);
 		ucsi_check_altmodes(con);
 	}
-- 
2.34.1

