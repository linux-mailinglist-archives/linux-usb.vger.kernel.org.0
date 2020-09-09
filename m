Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF4E262D90
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 13:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgIILCV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 07:02:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:27332 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728643AbgIILBl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:01:41 -0400
IronPort-SDR: xy25l7ObTajBDh26apkYzG3jz6KycZeYMJlLnx1DgUK7r01CgdzM7PG/pkDs93zkQARBnPQCmG
 Jfaep8sh6M9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="137823854"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="137823854"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:00:05 -0700
IronPort-SDR: bySKIxxeQF1PRiSYrHIQFaB87/4EpQarsDFMBG49fr8df0qq4mQFIwkJbHZmaRN9QViCjG5WPK
 mQy2Iw/B608Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="286187763"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2020 04:00:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 22FF5398; Wed,  9 Sep 2020 14:00:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/7] thunderbolt: Handle ERR_LOCK notification
Date:   Wed,  9 Sep 2020 13:59:58 +0300
Message-Id: <20200909110001.71603-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
References: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the USB4 router downstream port is locked, sending configuration
packet to a router below it causes ERR_LOCK to be sent. Instead of warn
splat about unknown error we log the error (just warning level) and
return -EACCESS instead. The idea is that we may want to do something
when such error code is received, like perform unlock.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c     | 7 +++++++
 drivers/thunderbolt/tb_msgs.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 2364efa23991..88b40b3b3ad7 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -282,6 +282,10 @@ static void tb_cfg_print_error(struct tb_ctl *ctl,
 		tb_ctl_WARN(ctl, "CFG_ERROR(%llx:%x): Route contains a loop\n",
 			res->response_route, res->response_port);
 		return;
+	case TB_CFG_ERROR_LOCK:
+		tb_ctl_warn(ctl, "%llx:%x: downstream port is locked\n",
+			    res->response_route, res->response_port);
+		return;
 	default:
 		/* 5,6,7,9 and 11 are also valid error codes */
 		tb_ctl_WARN(ctl, "CFG_ERROR(%llx:%x): Unknown error\n",
@@ -950,6 +954,9 @@ static int tb_cfg_get_error(struct tb_ctl *ctl, enum tb_cfg_space space,
 		return -ENODEV;
 
 	tb_cfg_print_error(ctl, res);
+
+	if (res->tb_error == TB_CFG_ERROR_LOCK)
+		return -EACCES;
 	return -EIO;
 }
 
diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
index fc208c567953..0e01dbc63e72 100644
--- a/drivers/thunderbolt/tb_msgs.h
+++ b/drivers/thunderbolt/tb_msgs.h
@@ -28,6 +28,7 @@ enum tb_cfg_error {
 	TB_CFG_ERROR_LOOP = 8,
 	TB_CFG_ERROR_HEC_ERROR_DETECTED = 12,
 	TB_CFG_ERROR_FLOW_CONTROL_ERROR = 13,
+	TB_CFG_ERROR_LOCK = 15,
 };
 
 /* common header */
-- 
2.28.0

