Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E209F134395
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 14:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgAHNNw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 08:13:52 -0500
Received: from mga07.intel.com ([134.134.136.100]:59114 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727621AbgAHNNw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 08:13:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 05:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="225901613"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2020 05:13:51 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: ucsi: Actually enable all the interface notifications
Date:   Wed,  8 Jan 2020 16:13:47 +0300
Message-Id: <20200108131347.43217-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108131347.43217-1-heikki.krogerus@linux.intel.com>
References: <20200108131347.43217-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The notification mask was not updated properly before all
the notifications were enabled in ucsi_init().

Fixes: 71a1fa0df2a3 ("usb: typec: ucsi: Store the notification mask")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 466bd8afceea..59c8ccdc68ac 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1007,6 +1007,7 @@ int ucsi_init(struct ucsi *ucsi)
 	}
 
 	/* Enable all notifications */
+	ucsi->ntfy = UCSI_ENABLE_NTFY_ALL;
 	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
 	ret = ucsi_run_command(ucsi, command, NULL, 0);
 	if (ret < 0)
-- 
2.24.1

