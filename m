Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14F0E262D99
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 13:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbgIILDO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 07:03:14 -0400
Received: from mga12.intel.com ([192.55.52.136]:27169 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729622AbgIILAX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:00:23 -0400
IronPort-SDR: W2N2lz3Q+Ped+zCvQaWbQefp6DjwLIpq3U/wcGT5du7rX/5ct1J3VEmG+CJrFlLdMQTHqB2Si4
 Cf7mtPhzjMNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="137823860"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="137823860"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:00:07 -0700
IronPort-SDR: 7Wgw1HllePHPv1hkpDEkBozMd05umPLO1WdBOR2X6jsWwpeXCfbBZA+7ElHd2VT/2rK4gRWvaC
 nQtQPiVNwaMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="286187788"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2020 04:00:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3A164411; Wed,  9 Sep 2020 14:00:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 7/7] thunderbolt: Capitalize comment on top of QUIRK_FORCE_POWER_LINK_CONTROLLER
Date:   Wed,  9 Sep 2020 14:00:01 +0300
Message-Id: <20200909110001.71603-8-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
References: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To keep it consistent with the other single line comments in the driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 5687bcf38a9e..7754b0b2ea66 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1007,7 +1007,7 @@ int usb4_usb3_port_allocate_bandwidth(struct tb_port *port, int *upstream_bw,
 int usb4_usb3_port_release_bandwidth(struct tb_port *port, int *upstream_bw,
 				     int *downstream_bw);
 
-/* keep link controller awake during update */
+/* Keep link controller awake during update */
 #define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
 
 void tb_check_quirks(struct tb_switch *sw);
-- 
2.28.0

