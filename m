Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E5F1FB2F1
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 15:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgFPN4X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 09:56:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:57244 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726306AbgFPN4W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 09:56:22 -0400
IronPort-SDR: oamvqpVwpyGvSOStPFH9PPXp61WTiDmrbUH6QzGqMhvtKd5EBonfJgNxdhNDi0LouHtDdz533o
 zE0FFGmGfDmA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:56:21 -0700
IronPort-SDR: sFqJpY9s+DUo6ssg/PTDljlaXoJpeZDEiPGlvfb47WNEU3QZ6+sd8i0JnFXpR4mzMzkQktPMtS
 KzNGrmaFcmcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="298915034"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 16 Jun 2020 06:56:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1D898109; Tue, 16 Jun 2020 16:56:18 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 1/6] thunderbolt: Add Intel USB-IF ID to the NVM upgrade supported list
Date:   Tue, 16 Jun 2020 16:56:12 +0300
Message-Id: <20200616135617.85752-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
References: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With USB4 Intel is also using its USB-IF ID (0x8087) with the new
devices. The NVM format is the same. Add this to the driver so NVM
upgrade is possible with these devices as well.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index c01176429d5f..6659b2b0663d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -423,7 +423,8 @@ static int tb_switch_nvm_add(struct tb_switch *sw)
 	 * currently restrict NVM upgrade for Intel hardware. We may
 	 * relax this in the future when we learn other NVM formats.
 	 */
-	if (sw->config.vendor_id != PCI_VENDOR_ID_INTEL) {
+	if (sw->config.vendor_id != PCI_VENDOR_ID_INTEL &&
+	    sw->config.vendor_id != 0x8087) {
 		dev_info(&sw->dev,
 			 "NVM format of vendor %#x is not known, disabling NVM upgrade\n",
 			 sw->config.vendor_id);
-- 
2.27.0.rc2

