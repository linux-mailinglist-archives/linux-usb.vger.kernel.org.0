Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09AFF4116CA
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 16:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbhITOZp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 10:25:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:20391 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhITOZp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 10:25:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="286817097"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="286817097"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2021 07:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
   d="scan'208";a="612525272"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 07:24:16 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Ulrich Huber <ulrich@huberulrich.de>, linux-usb@vger.kernel.org
Subject: [PATCH 1/7] usb: typec: ucsi: Always cancel the command if PPM reports BUSY condition
Date:   Mon, 20 Sep 2021 17:24:13 +0300
Message-Id: <20210920142419.54493-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
References: <20210920142419.54493-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes it possible to execute next command immediately
after the busy condition.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5ef5bd0e87cf2..ffb5be51daf85 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -128,8 +128,10 @@ static int ucsi_exec_command(struct ucsi *ucsi, u64 cmd)
 	if (ret)
 		return ret;
 
-	if (cci & UCSI_CCI_BUSY)
+	if (cci & UCSI_CCI_BUSY) {
+		ucsi->ops->async_write(ucsi, UCSI_CANCEL, NULL, 0);
 		return -EBUSY;
+	}
 
 	if (!(cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
-- 
2.33.0

