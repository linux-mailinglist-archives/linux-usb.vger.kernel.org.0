Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4649679BA1A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350524AbjIKVi5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236267AbjIKKE7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 06:04:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC04DE68
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 03:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694426694; x=1725962694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=olqd5D6SDR+8ZXuR/27r/+Aj51VW9eFTcGWbtc9x7sw=;
  b=afKllJ9Z4tLXkGc4O5uiBZwP7M5aXsavs8pAmYvibsutSBlMLODUe0vJ
   Fw7N3RVFyorVu52FSy8W6ZNYxy60/5sO4hZ7kWbLy3E5By5jpp8R2jH6r
   Gn18WKJAWwUMVNNVWdYVCYckdyoULd/jOJTGOkNRSMSpkTMNmBOKMJDIs
   peAAdS2JJ0VwbleLHxfiP0YJs8QDlEszgpn5W/oEpniHM+0A0V29zdLdT
   CB+QeKXEQvQg4dpgBZ97woiA8xZL3ojRIi5MW0gfmLqOI1AKskN4VNcck
   aCAQrpyDphi04LmPeH72P4sAqihyuUxjnrzlS71ZjuhEJubllf9GMdeWu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="376956532"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="376956532"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 03:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="916964203"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="916964203"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Sep 2023 03:04:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EE7DDB84; Mon, 11 Sep 2023 13:04:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Konrad J Hambrick <kjhambrick@gmail.com>,
        Calvin Walton <calvin.walton@kepstin.ca>,
        =?UTF-8?q?Marek=20=C5=A0anta?= <teslan223@gmail.com>,
        David Binderman <dcb314@hotmail.com>,
        Alex Balcanquall <alex@alexbal.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/5] thunderbolt: Restart XDomain discovery handshake after failure
Date:   Mon, 11 Sep 2023 13:04:45 +0300
Message-Id: <20230911100445.3612655-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
References: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alex reported that after rebooting the other host the peer-to-peer link
does not come up anymore. The reason for this is that the host that was
not rebooted tries to send the UUID request only 10 times according to
the USB4 Inter-Domain spec and gives up if it does not get reply. Then
when the other side is actually ready it cannot get the link established
anymore. The USB4 Inter-Domain spec requires that the discovery protocol
is restarted in that case so implement this now.

Reported-by: Alex Balcanquall <alex@alexbal.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 58 +++++++++++++++++++++++++----------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 5b5566862318..9803f0bbf20d 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -703,6 +703,27 @@ static void update_property_block(struct tb_xdomain *xd)
 	mutex_unlock(&xdomain_lock);
 }
 
+static void start_handshake(struct tb_xdomain *xd)
+{
+	xd->state = XDOMAIN_STATE_INIT;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
+}
+
+/* Can be called from state_work */
+static void __stop_handshake(struct tb_xdomain *xd)
+{
+	cancel_delayed_work_sync(&xd->properties_changed_work);
+	xd->properties_changed_retries = 0;
+	xd->state_retries = 0;
+}
+
+static void stop_handshake(struct tb_xdomain *xd)
+{
+	cancel_delayed_work_sync(&xd->state_work);
+	__stop_handshake(xd);
+}
+
 static void tb_xdp_handle_request(struct work_struct *work)
 {
 	struct xdomain_request_work *xw = container_of(work, typeof(*xw), work);
@@ -765,6 +786,15 @@ static void tb_xdp_handle_request(struct work_struct *work)
 	case UUID_REQUEST:
 		tb_dbg(tb, "%llx: received XDomain UUID request\n", route);
 		ret = tb_xdp_uuid_response(ctl, route, sequence, uuid);
+		/*
+		 * If we've stopped the discovery with an error such as
+		 * timing out, we will restart the handshake now that we
+		 * received UUID request from the remote host.
+		 */
+		if (!ret && xd && xd->state == XDOMAIN_STATE_ERROR) {
+			dev_dbg(&xd->dev, "restarting handshake\n");
+			start_handshake(xd);
+		}
 		break;
 
 	case LINK_STATE_STATUS_REQUEST:
@@ -1521,6 +1551,13 @@ static void tb_xdomain_queue_properties_changed(struct tb_xdomain *xd)
 			   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
 }
 
+static void tb_xdomain_failed(struct tb_xdomain *xd)
+{
+	xd->state = XDOMAIN_STATE_ERROR;
+	queue_delayed_work(xd->tb->wq, &xd->state_work,
+			   msecs_to_jiffies(XDOMAIN_DEFAULT_TIMEOUT));
+}
+
 static void tb_xdomain_state_work(struct work_struct *work)
 {
 	struct tb_xdomain *xd = container_of(work, typeof(*xd), state_work.work);
@@ -1547,7 +1584,7 @@ static void tb_xdomain_state_work(struct work_struct *work)
 		if (ret) {
 			if (ret == -EAGAIN)
 				goto retry_state;
-			xd->state = XDOMAIN_STATE_ERROR;
+			tb_xdomain_failed(xd);
 		} else {
 			tb_xdomain_queue_properties_changed(xd);
 			if (xd->bonding_possible)
@@ -1612,7 +1649,7 @@ static void tb_xdomain_state_work(struct work_struct *work)
 		if (ret) {
 			if (ret == -EAGAIN)
 				goto retry_state;
-			xd->state = XDOMAIN_STATE_ERROR;
+			tb_xdomain_failed(xd);
 		} else {
 			xd->state = XDOMAIN_STATE_ENUMERATED;
 		}
@@ -1623,6 +1660,8 @@ static void tb_xdomain_state_work(struct work_struct *work)
 		break;
 
 	case XDOMAIN_STATE_ERROR:
+		dev_dbg(&xd->dev, "discovery failed, stopping handshake\n");
+		__stop_handshake(xd);
 		break;
 
 	default:
@@ -1833,21 +1872,6 @@ static void tb_xdomain_release(struct device *dev)
 	kfree(xd);
 }
 
-static void start_handshake(struct tb_xdomain *xd)
-{
-	xd->state = XDOMAIN_STATE_INIT;
-	queue_delayed_work(xd->tb->wq, &xd->state_work,
-			   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
-}
-
-static void stop_handshake(struct tb_xdomain *xd)
-{
-	cancel_delayed_work_sync(&xd->properties_changed_work);
-	cancel_delayed_work_sync(&xd->state_work);
-	xd->properties_changed_retries = 0;
-	xd->state_retries = 0;
-}
-
 static int __maybe_unused tb_xdomain_suspend(struct device *dev)
 {
 	stop_handshake(tb_to_xdomain(dev));
-- 
2.40.1

