Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBB316150E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 15:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbgBQOtU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 09:49:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:14573 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728841AbgBQOtU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 09:49:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Feb 2020 06:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,453,1574150400"; 
   d="scan'208";a="348510138"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2020 06:49:18 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/3] usb: ucsi: ccg: disable runtime pm during fw flashing
Date:   Mon, 17 Feb 2020 17:49:12 +0300
Message-Id: <20200217144913.55330-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
References: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ajay Gupta <ajayg@nvidia.com>

Ucsi ppm is unregistered during fw flashing so disable
runtime pm also and reenable after fw flashing is completed
and ppm is re-registered.

Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index a5b8530490db..2658cda5da11 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1219,6 +1219,7 @@ static int ccg_restart(struct ucsi_ccg *uc)
 		return status;
 	}
 
+	pm_runtime_enable(uc->dev);
 	return 0;
 }
 
@@ -1234,6 +1235,7 @@ static void ccg_update_firmware(struct work_struct *work)
 
 	if (flash_mode != FLASH_NOT_NEEDED) {
 		ucsi_unregister(uc->ucsi);
+		pm_runtime_disable(uc->dev);
 		free_irq(uc->irq, uc);
 
 		ccg_fw_update(uc, flash_mode);
-- 
2.25.0

