Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8BF116150F
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 15:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbgBQOtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 09:49:22 -0500
Received: from mga03.intel.com ([134.134.136.65]:14573 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728841AbgBQOtW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 09:49:22 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Feb 2020 06:49:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,453,1574150400"; 
   d="scan'208";a="348510142"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2020 06:49:20 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 3/3] usb: typec: ucsi: remove redundant assignment to variable num
Date:   Mon, 17 Feb 2020 17:49:13 +0300
Message-Id: <20200217144913.55330-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
References: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable num is being assigned with a value that is never read, it is
assigned a new value later in a for-loop. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index eca9d598a42f..ddf2ad3752de 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -407,7 +407,7 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
 	struct typec_altmode_desc desc;
 	struct ucsi_altmode alt[2];
 	u64 command;
-	int num = 1;
+	int num;
 	int ret;
 	int len;
 	int j;
-- 
2.25.0

