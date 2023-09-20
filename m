Return-Path: <linux-usb+bounces-398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8EA7A7092
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 04:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E922F2816E6
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 02:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AB31FB6;
	Wed, 20 Sep 2023 02:33:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7815CC
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 02:33:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D337AC5;
	Tue, 19 Sep 2023 19:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695177194; x=1726713194;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qSgOml8+mAGDS0SeTXHCad8N7lFMDhEC/4mLkDq9nzg=;
  b=mPYBCFD8LXgpBUuAgtZVedL0KzpCFXZP87ZqKk6CjH+IyTauWM66CAdx
   bv11Kpltqj3XZez4FqlkzhX8CLZP3qBz2O4al9tj2skgrDOgipX4bQ3pt
   kQaKY/VY24Y2HafLx9deUkTl2KYA12l14VyUijLcYt7a+S1+zNR3zEVJR
   XwUs0IC8envwKgwrqUZjkv8KAMYewK/AthzuWyHP63M2xZvYdyTWtf26w
   qrlC03KZct8YS2dGWMPKXyVqVQIAPSvskj2galsMquBH7DfhE7dustxop
   /tnrIkb9cPS/Tln+Kqf7V3yk6SzHyXx948tjBRahmKE6BFL4EV+1tFJ7a
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466422447"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="466422447"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 19:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816690720"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="816690720"
Received: from uhpatel-desk4.jf.intel.com ([10.23.15.215])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 19:33:12 -0700
From: Utkarsh Patel <utkarsh.h.patel@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: heikki.krogerus@linux.intel.com,
	pmalani@chromium.org,
	chrome-platform@lists.linux.dev,
	andriy.shevchenko@linux.intel.com,
	bleung@chromium.org,
	Utkarsh Patel <utkarsh.h.patel@intel.com>
Subject: [PATCH v4 1/5] usb: typec: Add Displayport Alternate Mode 2.1 Support
Date: Tue, 19 Sep 2023 19:32:39 -0700
Message-Id: <20230920023243.2494410-2-utkarsh.h.patel@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Displayport Alternate mode 2.1 requires configuration for additional
cable details such as signalling for cable, UHBR13.5 Support, Cable type
and DPAM version.
These details can be used with mux drivers to configure SOP DP
configuration for Displayport Alternate mode 2.1.
This change also includes pertinent cable signalling support in displayport
alternate mode.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
---
Changes in v4:
- No change

Changes in v3:
- No change.

Changes in v2:
- No change.

 drivers/usb/typec/altmodes/displayport.c |  5 ++++-
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c        |  4 ++--
 include/linux/usb/typec_dp.h             | 28 ++++++++++++++++++++----
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 426c88a516e5..f503cb4cd721 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -86,8 +86,11 @@ static int dp_altmode_notify(struct dp_altmode *dp)
 
 static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
 {
-	u32 conf = DP_CONF_SIGNALING_DP; /* Only DP signaling supported */
 	u8 pin_assign = 0;
+	u32 conf;
+
+	/* DP Signalling */
+	conf = (dp->data.conf & DP_CONF_SIGNALLING_MASK) >> DP_CONF_SIGNALLING_SHIFT;
 
 	switch (con) {
 	case DP_STATUS_CON_DISABLED:
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 73cd5bf35047..d9d3c91125ca 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -315,7 +315,7 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
 	struct ucsi_dp *dp;
 
 	/* We can't rely on the firmware with the capabilities. */
-	desc->vdo |= DP_CAP_DP_SIGNALING | DP_CAP_RECEPTACLE;
+	desc->vdo |= DP_CAP_DP_SIGNALLING(0) | DP_CAP_RECEPTACLE;
 
 	/* Claiming that we support all pin assignments */
 	desc->vdo |= all_assignments << 8;
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 607061a37eca..449c125f6f87 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -501,8 +501,8 @@ static void ucsi_ccg_nvidia_altmode(struct ucsi_ccg *uc,
 	case NVIDIA_FTB_DP_OFFSET:
 		if (alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
 			alt[0].mid = USB_TYPEC_NVIDIA_VLINK_DP_VDO |
-				DP_CAP_DP_SIGNALING | DP_CAP_USB |
-				DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_E));
+				     DP_CAP_DP_SIGNALLING(0) | DP_CAP_USB |
+				     DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_E));
 		break;
 	case NVIDIA_FTB_DBG_OFFSET:
 		if (alt[0].mid == USB_TYPEC_NVIDIA_VLINK_DP_VDO)
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index 8d09c2f0a9b8..1f358098522d 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -67,8 +67,10 @@ enum {
 #define   DP_CAP_UFP_D			1
 #define   DP_CAP_DFP_D			2
 #define   DP_CAP_DFP_D_AND_UFP_D	3
-#define DP_CAP_DP_SIGNALING		BIT(2) /* Always set */
-#define DP_CAP_GEN2			BIT(3) /* Reserved after v1.0b */
+#define DP_CAP_DP_SIGNALLING(_cap_)	(((_cap_) & GENMASK(5, 2)) >> 2)
+#define   DP_CAP_SIGNALLING_HBR3	1
+#define   DP_CAP_SIGNALLING_UHBR10	2
+#define   DP_CAP_SIGNALLING_UHBR20	3
 #define DP_CAP_RECEPTACLE		BIT(6)
 #define DP_CAP_USB			BIT(7)
 #define DP_CAP_DFP_D_PIN_ASSIGN(_cap_)	(((_cap_) & GENMASK(15, 8)) >> 8)
@@ -78,6 +80,13 @@ enum {
 			DP_CAP_UFP_D_PIN_ASSIGN(_cap_) : DP_CAP_DFP_D_PIN_ASSIGN(_cap_))
 #define DP_CAP_PIN_ASSIGN_DFP_D(_cap_) ((_cap_ & DP_CAP_RECEPTACLE) ? \
 			DP_CAP_DFP_D_PIN_ASSIGN(_cap_) : DP_CAP_UFP_D_PIN_ASSIGN(_cap_))
+#define DP_CAP_UHBR_13_5_SUPPORT	BIT(26)
+#define DP_CAP_CABLE_TYPE(_cap_)	(((_cap_) & GENMASK(29, 28)) >> 28)
+#define   DP_CAP_CABLE_TYPE_PASSIVE	0
+#define   DP_CAP_CABLE_TYPE_RE_TIMER	1
+#define   DP_CAP_CABLE_TYPE_RE_DRIVER	2
+#define   DP_CAP_CABLE_TYPE_OPTICAL	3
+#define DP_CAP_DPAM_VERSION		BIT(30)
 
 /* DisplayPort Status Update VDO bits */
 #define DP_STATUS_CONNECTION(_status_)	((_status_) & 3)
@@ -97,13 +106,24 @@ enum {
 #define DP_CONF_CURRENTLY(_conf_)	((_conf_) & 3)
 #define DP_CONF_UFP_U_AS_DFP_D		BIT(0)
 #define DP_CONF_UFP_U_AS_UFP_D		BIT(1)
-#define DP_CONF_SIGNALING_DP		BIT(2)
-#define DP_CONF_SIGNALING_GEN_2		BIT(3) /* Reserved after v1.0b */
+#define DP_CONF_SIGNALLING_MASK		GENMASK(5, 2)
+#define DP_CONF_SIGNALLING_SHIFT	2
+#define   DP_CONF_SIGNALLING_HBR3	1
+#define   DP_CONF_SIGNALLING_UHBR10	2
+#define   DP_CONF_SIGNALLING_UHBR20	3
 #define DP_CONF_PIN_ASSIGNEMENT_SHIFT	8
 #define DP_CONF_PIN_ASSIGNEMENT_MASK	GENMASK(15, 8)
 
 /* Helper for setting/getting the pin assignment value to the configuration */
 #define DP_CONF_SET_PIN_ASSIGN(_a_)	((_a_) << 8)
 #define DP_CONF_GET_PIN_ASSIGN(_conf_)	(((_conf_) & GENMASK(15, 8)) >> 8)
+#define DP_CONF_UHBR13_5_SUPPORT	BIT(26)
+#define DP_CONF_CABLE_TYPE_MASK		GENMASK(29, 28)
+#define DP_CONF_CABLE_TYPE_SHIFT	28
+#define   DP_CONF_CABLE_TYPE_PASSIVE	0
+#define   DP_CONF_CABLE_TYPE_RE_TIMER	1
+#define   DP_CONF_CABLE_TYPE_RE_DRIVER	2
+#define   DP_CONF_CABLE_TYPE_OPTICAL	3
+#define DP_CONF_DPAM_VERSION		BIT(30)
 
 #endif /* __USB_TYPEC_DP_H */
-- 
2.25.1


