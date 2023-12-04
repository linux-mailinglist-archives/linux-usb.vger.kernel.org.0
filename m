Return-Path: <linux-usb+bounces-3650-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6280308F
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 11:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58F88280F61
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 10:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDAD22EE7;
	Mon,  4 Dec 2023 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVQMUATK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCD985
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 02:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701686315; x=1733222315;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=We+repeTYELCMPXneaTei3I37pzCdeg2zhJuDb/i/us=;
  b=XVQMUATKalfN+hfDTwq0eIyW1RYnnYt24i+s7Mpr3L+T+ftAeC6Yjb0n
   fibpLUw3f9QjzoQoghtdWIs54GZOBUfwKjjCc4wESA+FU44uwHgrk+pk8
   HxHBZaLmI0jx+1JCrRLc5Yv16o6Xlh4eCjF73+JGzD5j5Ym9xGNNapUgi
   U8K13FYf5HlxQ7/31BKm2iBSziJk74RiEcXpwUrvZ3FIlqVbsXco7xfhM
   ByX84p8DPmRNiFxcE0IUNVQk7PQNYPVp+MtLeGPQPszz42CvZKXKchUUV
   scCTMXpIRGA1QZVoLktXUe3bYPh4rUGsndP6w3jqMaQA2Yfe1lmXQKlLg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="424880774"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="424880774"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 02:38:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763904024"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="763904024"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 02:38:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A35CDA94; Mon,  4 Dec 2023 12:38:28 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Gil Fine <gil.fine@linux.intel.com>,
	Pengfei Xu <pengfei.xu@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/11] thunderbolt: Use tb_dp_read_cap() to read DP_COMMON_CAP as well
Date: Mon,  4 Dec 2023 12:38:24 +0200
Message-ID: <20231204103828.1635531-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
References: <20231204103828.1635531-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no point doing this separately as the register layout is the
same. For this reason rename tb_dp_read_dprx() to tb_dp_wait_dprx() and
call tb_dp_read_cap() instead.

While there add debug log if the DPRX capability read times out.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 7534cd3a81f4..a46ae3f598c5 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1067,8 +1067,7 @@ static int tb_dp_alloc_bandwidth(struct tb_tunnel *tunnel, int *alloc_up,
 	return 0;
 }
 
-static int tb_dp_read_dprx(struct tb_tunnel *tunnel, u32 *rate, u32 *lanes,
-			   int timeout_msec)
+static int tb_dp_wait_dprx(struct tb_tunnel *tunnel, int timeout_msec)
 {
 	ktime_t timeout = ktime_add_ms(ktime_get(), timeout_msec);
 	struct tb_port *in = tunnel->src_port;
@@ -1087,15 +1086,13 @@ static int tb_dp_read_dprx(struct tb_tunnel *tunnel, u32 *rate, u32 *lanes,
 			return ret;
 
 		if (val & DP_COMMON_CAP_DPRX_DONE) {
-			*rate = tb_dp_cap_get_rate(val);
-			*lanes = tb_dp_cap_get_lanes(val);
-
 			tb_tunnel_dbg(tunnel, "DPRX read done\n");
 			return 0;
 		}
 		usleep_range(100, 150);
 	} while (ktime_before(ktime_get(), timeout));
 
+	tb_tunnel_dbg(tunnel, "DPRX read timeout\n");
 	return -ETIMEDOUT;
 }
 
@@ -1110,6 +1107,7 @@ static int tb_dp_read_cap(struct tb_tunnel *tunnel, unsigned int cap, u32 *rate,
 	switch (cap) {
 	case DP_LOCAL_CAP:
 	case DP_REMOTE_CAP:
+	case DP_COMMON_CAP:
 		break;
 
 	default:
@@ -1182,7 +1180,7 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 		 * reduced one). Otherwise return the remote (possibly
 		 * reduced) caps.
 		 */
-		ret = tb_dp_read_dprx(tunnel, &rate, &lanes, 150);
+		ret = tb_dp_wait_dprx(tunnel, 150);
 		if (ret) {
 			if (ret == -ETIMEDOUT)
 				ret = tb_dp_read_cap(tunnel, DP_REMOTE_CAP,
@@ -1190,6 +1188,9 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 			if (ret)
 				return ret;
 		}
+		ret = tb_dp_read_cap(tunnel, DP_COMMON_CAP, &rate, &lanes);
+		if (ret)
+			return ret;
 	} else if (sw->generation >= 2) {
 		ret = tb_dp_read_cap(tunnel, DP_REMOTE_CAP, &rate, &lanes);
 		if (ret)
-- 
2.42.0


