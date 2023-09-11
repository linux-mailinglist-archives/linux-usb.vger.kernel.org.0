Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57C5579AFFF
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 01:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240108AbjIKVj3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236255AbjIKKE5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 06:04:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52E1E69
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694426691; x=1725962691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4pjfi5MxWXlTNHcTaKun5GOmbkqddnHY3t8pWX99838=;
  b=XCFzjG/fG5H3Z99aIdMuWkxGRO9PhBRaP0A2fhMg5bIFaHyYblzG3Cm5
   kku7wzvxGwsUZXSRs4Ymo02lKIAp08E+uo/FuYYdTdjVJmNY0iKRMu70D
   GjSvPN7m6vPv59p/lZu13cdeesp7g2MyoAAbCjJeuCNVepEQXuSA2eeWV
   umL5894n/QfgQHLyZZvo9mNiyE0IHqbpkDddTnLZ/qUc8JhudVXLDi2sF
   5n6/nVzwmC8wyFV1+Vy4KnR4cOjgUdHfH/JJH5frFCRcfuJQz+8ou5Gte
   ECn3GHRydeL60yhopHjK9lgwUsnKSRXgw/oNoSibFoBE7GXhq9+qL/tht
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="442037115"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="442037115"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 03:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="858263759"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; 
   d="scan'208";a="858263759"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2023 03:04:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B75E86A6; Mon, 11 Sep 2023 13:04:45 +0300 (EEST)
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
Subject: [PATCH 1/5] thunderbolt: Workaround an IOMMU fault on certain systems with Intel Maple Ridge
Date:   Mon, 11 Sep 2023 13:04:41 +0300
Message-Id: <20230911100445.3612655-2-mika.westerberg@linux.intel.com>
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

On some systems the IOMMU blocks the first couple of driver ready
messages to the connection manager firmware as can be seen in below
excerpts:

  thunderbolt 0000:06:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0010 address=0xbb0e3400 flags=0x0020]

or

  DMAR: DRHD: handling fault status reg 2
  DMAR: [DMA Write] Request device [04:00.0] PASID ffffffff fault addr 69974000 [fault reason 05] PTE Write access is not set

The reason is unknown and hard to debug because we were not able to
reproduce this locally. This only happens on certain systems with Intel
Maple Ridge Thunderbolt controller. If there is a device connected when
the driver is loaded the issue does not happen either. Only when there
is nothing connected (so typically when the system is booted up).

We can work this around by sending the driver ready several times. After
a couple of retries the message goes through and the controller works
just fine. For this reason make the number of retries a parameter for
icm_request() and then for Maple Ridge (and Titan Ridge as they us the
same function but this should not matter) increase number of retries
while shortening the timeout accordingly.

Reported-by: Werner Sembach <wse@tuxedocomputers.com>
Reported-by: Konrad J Hambrick <kjhambrick@gmail.com>
Reported-by: Calvin Walton <calvin.walton@kepstin.ca>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=214259
Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index dbdcad8d73bf..d8b9c734abd3 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -41,6 +41,7 @@
 #define PHY_PORT_CS1_LINK_STATE_SHIFT	26
 
 #define ICM_TIMEOUT			5000	/* ms */
+#define ICM_RETRIES			3
 #define ICM_APPROVE_TIMEOUT		10000	/* ms */
 #define ICM_MAX_LINK			4
 
@@ -296,10 +297,9 @@ static bool icm_copy(struct tb_cfg_request *req, const struct ctl_pkg *pkg)
 
 static int icm_request(struct tb *tb, const void *request, size_t request_size,
 		       void *response, size_t response_size, size_t npackets,
-		       unsigned int timeout_msec)
+		       int retries, unsigned int timeout_msec)
 {
 	struct icm *icm = tb_priv(tb);
-	int retries = 3;
 
 	do {
 		struct tb_cfg_request *req;
@@ -410,7 +410,7 @@ static int icm_fr_get_route(struct tb *tb, u8 link, u8 depth, u64 *route)
 		return -ENOMEM;
 
 	ret = icm_request(tb, &request, sizeof(request), switches,
-			  sizeof(*switches), npackets, ICM_TIMEOUT);
+			  sizeof(*switches), npackets, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		goto err_free;
 
@@ -463,7 +463,7 @@ icm_fr_driver_ready(struct tb *tb, enum tb_security_level *security_level,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -488,7 +488,7 @@ static int icm_fr_approve_switch(struct tb *tb, struct tb_switch *sw)
 	memset(&reply, 0, sizeof(reply));
 	/* Use larger timeout as establishing tunnels can take some time */
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_APPROVE_TIMEOUT);
+			  1, ICM_RETRIES, ICM_APPROVE_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -515,7 +515,7 @@ static int icm_fr_add_switch_key(struct tb *tb, struct tb_switch *sw)
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -543,7 +543,7 @@ static int icm_fr_challenge_switch_key(struct tb *tb, struct tb_switch *sw,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -577,7 +577,7 @@ static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1020,7 +1020,7 @@ icm_tr_driver_ready(struct tb *tb, enum tb_security_level *security_level,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, 20000);
+			  1, 10, 2000);
 	if (ret)
 		return ret;
 
@@ -1053,7 +1053,7 @@ static int icm_tr_approve_switch(struct tb *tb, struct tb_switch *sw)
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_APPROVE_TIMEOUT);
+			  1, ICM_RETRIES, ICM_APPROVE_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1081,7 +1081,7 @@ static int icm_tr_add_switch_key(struct tb *tb, struct tb_switch *sw)
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1110,7 +1110,7 @@ static int icm_tr_challenge_switch_key(struct tb *tb, struct tb_switch *sw,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1144,7 +1144,7 @@ static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1170,7 +1170,7 @@ static int icm_tr_xdomain_tear_down(struct tb *tb, struct tb_xdomain *xd,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1496,7 +1496,7 @@ icm_ar_driver_ready(struct tb *tb, enum tb_security_level *security_level,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1522,7 +1522,7 @@ static int icm_ar_get_route(struct tb *tb, u8 link, u8 depth, u64 *route)
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1543,7 +1543,7 @@ static int icm_ar_get_boot_acl(struct tb *tb, uuid_t *uuids, size_t nuuids)
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1604,7 +1604,7 @@ static int icm_ar_set_boot_acl(struct tb *tb, const uuid_t *uuids,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
@@ -1626,7 +1626,7 @@ icm_icl_driver_ready(struct tb *tb, enum tb_security_level *security_level,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, 20000);
+			  1, ICM_RETRIES, 20000);
 	if (ret)
 		return ret;
 
@@ -2298,7 +2298,7 @@ static int icm_usb4_switch_op(struct tb_switch *sw, u16 opcode, u32 *metadata,
 
 	memset(&reply, 0, sizeof(reply));
 	ret = icm_request(tb, &request, sizeof(request), &reply, sizeof(reply),
-			  1, ICM_TIMEOUT);
+			  1, ICM_RETRIES, ICM_TIMEOUT);
 	if (ret)
 		return ret;
 
-- 
2.40.1

