Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9306C27AF1F
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 15:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgI1Ndb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 09:33:31 -0400
Received: from mga18.intel.com ([134.134.136.126]:7903 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgI1Nd1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 09:33:27 -0400
IronPort-SDR: wklwNqkPQhBzfdBSZ1b/B4AUSx4GxSZ7yTvBohsayi7nMp2sKN0eGwYYsjguXr2RxCywb+iETf
 57+0XvgF9DVg==
X-IronPort-AV: E=McAfee;i="6000,8403,9757"; a="149767075"
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="149767075"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 06:33:26 -0700
IronPort-SDR: beOKXL9Zo9VHdL8M1x+kOn1HeQcixi75QsKxhgegYPXJ0uML6CzSHf95TtpcOysVcSC2KoKlcZ
 zXacfUGVk+vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,313,1596524400"; 
   d="scan'208";a="414980703"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2020 06:33:25 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: displayport: Reduce noise from the driver
Date:   Mon, 28 Sep 2020 16:33:24 +0300
Message-Id: <20200928133324.48841-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's not an error if the mode can't be entered because
another mode is already active, so no longer printing an
error message if that happens.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/displayport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 7b20073d7fc0a..e62e5e3da01e4 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -190,7 +190,7 @@ static void dp_altmode_work(struct work_struct *work)
 	switch (dp->state) {
 	case DP_STATE_ENTER:
 		ret = typec_altmode_enter(dp->alt, NULL);
-		if (ret)
+		if (ret && ret != -EBUSY)
 			dev_err(&dp->alt->dev, "failed to enter mode\n");
 		break;
 	case DP_STATE_UPDATE:
-- 
2.28.0

