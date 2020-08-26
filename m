Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE18E252C30
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbgHZLHy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:54 -0400
Received: from mga17.intel.com ([192.55.52.151]:18814 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728780AbgHZLHp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:45 -0400
IronPort-SDR: rUUNXdzaZGXR6Up+7PdjDHxAqmEBzKIESVBA9xJ7iEbqQz5G5ukJcyQry7Jx09UHeM23xuEvPe
 f/0Cd0orp93A==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="136333411"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="136333411"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:43 -0700
IronPort-SDR: ekVDYnzRXltaxESqffKFrEaxmz6mqePRSC8hemB1mwXw715v6ds0eLrlunbwD3x+n8EGp2X9uN
 0zLMwRXcfKGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="339123473"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 26 Aug 2020 04:07:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id F1A92467; Wed, 26 Aug 2020 14:07:36 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5/9] thunderbolt: Check for Intel vendor ID when identifying controller
Date:   Wed, 26 Aug 2020 14:07:32 +0300
Message-Id: <20200826110736.55186-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With USB4 there will be other vendors so make sure the current checks
for different Intel controllers will not accidentally match those.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 64 ++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6aee18b4f53d..664a861e8e9f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -697,59 +697,65 @@ static inline struct tb_switch *tb_switch_parent(struct tb_switch *sw)
 
 static inline bool tb_switch_is_light_ridge(const struct tb_switch *sw)
 {
-	return sw->config.device_id == PCI_DEVICE_ID_INTEL_LIGHT_RIDGE;
+	return sw->config.vendor_id == PCI_VENDOR_ID_INTEL &&
+	       sw->config.device_id == PCI_DEVICE_ID_INTEL_LIGHT_RIDGE;
 }
 
 static inline bool tb_switch_is_eagle_ridge(const struct tb_switch *sw)
 {
-	return sw->config.device_id == PCI_DEVICE_ID_INTEL_EAGLE_RIDGE;
+	return sw->config.vendor_id == PCI_VENDOR_ID_INTEL &&
+	       sw->config.device_id == PCI_DEVICE_ID_INTEL_EAGLE_RIDGE;
 }
 
 static inline bool tb_switch_is_cactus_ridge(const struct tb_switch *sw)
 {
-	switch (sw->config.device_id) {
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-		return true;
-	default:
-		return false;
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_2C:
+		case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+			return true;
+		}
 	}
+	return false;
 }
 
 static inline bool tb_switch_is_falcon_ridge(const struct tb_switch *sw)
 {
-	switch (sw->config.device_id) {
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_BRIDGE:
-		return true;
-	default:
-		return false;
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_BRIDGE:
+			return true;
+		}
 	}
+	return false;
 }
 
 static inline bool tb_switch_is_alpine_ridge(const struct tb_switch *sw)
 {
-	switch (sw->config.device_id) {
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_BRIDGE:
-		return true;
-	default:
-		return false;
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_BRIDGE:
+			return true;
+		}
 	}
+	return false;
 }
 
 static inline bool tb_switch_is_titan_ridge(const struct tb_switch *sw)
 {
-	switch (sw->config.device_id) {
-	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_BRIDGE:
-	case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE:
-		return true;
-	default:
-		return false;
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_4C_BRIDGE:
+		case PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE:
+			return true;
+		}
 	}
+	return false;
 }
 
 /**
-- 
2.28.0

