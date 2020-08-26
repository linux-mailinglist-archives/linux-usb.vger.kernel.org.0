Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61496252C2E
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgHZLHw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:52 -0400
Received: from mga17.intel.com ([192.55.52.151]:18812 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728754AbgHZLHp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:45 -0400
IronPort-SDR: ngLGT6XCnHbbYL3wIVpAyf81HjWMrYITclY+s1XqbGlWkpp0O/dwZ0jFVJSdIIU5lXHrqJgHSt
 2E3B1ZFMBT/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="136333410"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="136333410"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:42 -0700
IronPort-SDR: Afq9QzGNkMsSI5eAV9SRirA+PyzLYvIaiLO2Dm6Yjc5n3kclDQjsv/r9HFx8b8uN4wU2A0ojEt
 iKgtSfffZ53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="474728811"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 26 Aug 2020 04:07:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 048E54B3; Wed, 26 Aug 2020 14:07:37 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 6/9] thunderbolt: Introduce tb_switch_is_ice_lake()
Date:   Wed, 26 Aug 2020 14:07:33 +0300
Message-Id: <20200826110736.55186-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is needed to differentiate Ice Lake from other controllers.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 664a861e8e9f..1d5ee4c0de1c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -758,6 +758,18 @@ static inline bool tb_switch_is_titan_ridge(const struct tb_switch *sw)
 	return false;
 }
 
+static inline bool tb_switch_is_ice_lake(const struct tb_switch *sw)
+{
+	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
+		switch (sw->config.device_id) {
+		case PCI_DEVICE_ID_INTEL_ICL_NHI0:
+		case PCI_DEVICE_ID_INTEL_ICL_NHI1:
+			return true;
+		}
+	}
+	return false;
+}
+
 /**
  * tb_switch_is_usb4() - Is the switch USB4 compliant
  * @sw: Switch to check
-- 
2.28.0

