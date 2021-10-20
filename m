Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C9A4348E9
	for <lists+linux-usb@lfdr.de>; Wed, 20 Oct 2021 12:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbhJTKa0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Oct 2021 06:30:26 -0400
Received: from mga09.intel.com ([134.134.136.24]:6899 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229921AbhJTKaZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Oct 2021 06:30:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228621967"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="228621967"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2021 03:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; 
   d="scan'208";a="575280538"
Received: from saranya-nuc10i7fnh.iind.intel.com ([10.223.216.64])
  by fmsmga002.fm.intel.com with ESMTP; 20 Oct 2021 03:27:56 -0700
From:   Saranya Gopal <saranya.gopal@intel.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        hdegoede@redhat.com
Cc:     heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        rajaram.regupathy@intel.com,
        Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH 1/2] usb: typec: tipd: Enable event interrupts by default
Date:   Wed, 20 Oct 2021 07:56:19 +0530
Message-Id: <20211020022620.21012-2-saranya.gopal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211020022620.21012-1-saranya.gopal@intel.com>
References: <20211020022620.21012-1-saranya.gopal@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TI PD controller comes with notification mechanism to inform
the host on activity in the PD controller. In the current
driver, the required masks are not set. This patch enables
the following events in the interrupt mask register:
PowerStatusUpdate - Set whenever contents of the power status reg changes
DataStatusUpdate - Set whenever contents of the data status reg changes
PlugInsertOrRemoval - Set whenever USB plug status has changed

With this change, the interrupt flooding issue is not seen anymore.

Datasheet: https://www.ti.com/lit/ug/slvuan1a/slvuan1a.pdf
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Suggested-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
---
 drivers/usb/typec/tipd/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 97311a45f666..fb8ef12bbe9c 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -750,6 +750,14 @@ static int tps6598x_probe(struct i2c_client *client)
 			return ret;
 
 		irq_handler = cd321x_interrupt;
+	} else {
+		/* Enable power status, data status and plug event interrupts */
+		ret = tps6598x_write64(tps, TPS_REG_INT_MASK1,
+				       TPS_REG_INT_POWER_STATUS_UPDATE |
+				       TPS_REG_INT_DATA_STATUS_UPDATE |
+				       TPS_REG_INT_PLUG_EVENT);
+		if (ret)
+			return ret;
 	}
 
 	ret = tps6598x_read32(tps, TPS_REG_STATUS, &status);
-- 
2.17.1

