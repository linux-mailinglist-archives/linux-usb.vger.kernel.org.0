Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB6637202C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 21:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730700AbfGWThy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 15:37:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:57075 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbfGWThy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 15:37:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 12:37:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; 
   d="scan'208";a="180842982"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 23 Jul 2019 12:37:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8223281; Tue, 23 Jul 2019 22:37:51 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: typec: tcpm: Switch to use fwnode_property_count_uXX()
Date:   Tue, 23 Jul 2019 22:37:50 +0300
Message-Id: <20190723193750.69038-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use use fwnode_property_count_uXX() directly, that makes code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index fba32d84e578..ec525811a9eb 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4410,8 +4410,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 		goto sink;
 
 	/* Get source pdos */
-	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
-					     NULL, 0);
+	ret = fwnode_property_count_u32(fwnode, "source-pdos");
 	if (ret <= 0)
 		return -EINVAL;
 
@@ -4435,8 +4434,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 		return -EINVAL;
 sink:
 	/* Get sink pdos */
-	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
-					     NULL, 0);
+	ret = fwnode_property_count_u32(fwnode, "sink-pdos");
 	if (ret <= 0)
 		return -EINVAL;
 
-- 
2.20.1

