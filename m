Return-Path: <linux-usb+bounces-1006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27B7B6562
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id D43672816F8
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 09:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40842DF5E;
	Tue,  3 Oct 2023 09:23:11 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D47DF4B
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 09:23:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B296AB8
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 02:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696324986; x=1727860986;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xVcfHM9GwUaRvyMEnJryUiD3y3DEg3jcPsshYzLvFpc=;
  b=hsyEXb/ntGSpMJJ4+PSSstyA+KE6qGizddTpXXoBDO1AW5ZwBHpmsnzh
   CHrGRoZrsUKjBn0Dnxk5bit0qlRtPaKRizZRwn6uI5iBrLPB4QOHCeQ52
   mz3rjM2a8UXjlaEhMYR88nYvrecwpuk6KITmc7MLXiG8gduU7Onk17o9C
   E2HkB/cv3uz8VtNF9WJ+N7q/+PstdYBxMoYr22g7KhJrfQHwrWOcBwL5X
   OZBgqjqDzxesFlaQpWblfRSlMV19PQpyxSr6Tk8AooMWG108xee/k93Mi
   I1OefD3CTfwvlW5h7Ep3O4r4TmH6tH7zCE6mB6HUkKP9V6OJbahv39olY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="373173554"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="373173554"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 02:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="841276952"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="841276952"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Oct 2023 02:23:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8F2EA18A0; Tue,  3 Oct 2023 12:23:02 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Call tb_switch_put() once DisplayPort bandwidth request is finished
Date: Tue,  3 Oct 2023 12:23:02 +0300
Message-Id: <20231003092302.2672156-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Gil Fine <gil.fine@linux.intel.com>

When handling DisplayPort bandwidth request tb_switch_find_by_route() is
called and it returns a router structure with reference count increased.
In order to avoid resource leak call tb_switch_put() when finished.

Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
Cc: stable@vger.kernel.org
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index dd0a1ef8cf12..27bd6ca6f99e 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1907,14 +1907,14 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 	in = &sw->ports[ev->port];
 	if (!tb_port_is_dpin(in)) {
 		tb_port_warn(in, "bandwidth request to non-DP IN adapter\n");
-		goto unlock;
+		goto put_sw;
 	}
 
 	tb_port_dbg(in, "handling bandwidth allocation request\n");
 
 	if (!usb4_dp_port_bandwidth_mode_enabled(in)) {
 		tb_port_warn(in, "bandwidth allocation mode not enabled\n");
-		goto unlock;
+		goto put_sw;
 	}
 
 	ret = usb4_dp_port_requested_bandwidth(in);
@@ -1923,7 +1923,7 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 			tb_port_dbg(in, "no bandwidth request active\n");
 		else
 			tb_port_warn(in, "failed to read requested bandwidth\n");
-		goto unlock;
+		goto put_sw;
 	}
 	requested_bw = ret;
 
@@ -1932,7 +1932,7 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 	tunnel = tb_find_tunnel(tb, TB_TUNNEL_DP, in, NULL);
 	if (!tunnel) {
 		tb_port_warn(in, "failed to find tunnel\n");
-		goto unlock;
+		goto put_sw;
 	}
 
 	out = tunnel->dst_port;
@@ -1959,6 +1959,8 @@ static void tb_handle_dp_bandwidth_request(struct work_struct *work)
 		tb_recalc_estimated_bandwidth(tb);
 	}
 
+put_sw:
+	tb_switch_put(sw);
 unlock:
 	mutex_unlock(&tb->lock);
 
-- 
2.40.1


