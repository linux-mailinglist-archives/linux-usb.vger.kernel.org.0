Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F12241C35D5
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 11:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgEDJdz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 05:33:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:57966 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726625AbgEDJdz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 May 2020 05:33:55 -0400
IronPort-SDR: VWIKzGN8Kkq/iia6QUR0Pzix3/Jh4WGvRp2aqXtDxZLssCGZFh1bsTSOo7PbSRImIRTR8/TlbF
 +BNb1OYIwk3A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 02:33:55 -0700
IronPort-SDR: QSJuzcglUB8dnNG9yfVAFaOYY5bpi0oek4qg95jwBlrswJmAt/NBlxSqk1W3aC1kmYKz+glhwP
 XP3AZVYiHUBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,351,1583222400"; 
   d="scan'208";a="262768787"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 04 May 2020 02:33:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CB941E1; Mon,  4 May 2020 12:33:52 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: dwc3: pci: Enable extcon driver for Intel Merrifield
Date:   Mon,  4 May 2020 12:33:52 +0300
Message-Id: <20200504093352.7981-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Intel Merrifield provides a DR support via PMIC which has its own
extcon driver.

Add a property string to link to that driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 7051611229c983..b67372737dc9b2 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -114,6 +114,7 @@ static const struct property_entry dwc3_pci_intel_properties[] = {
 
 static const struct property_entry dwc3_pci_mrfld_properties[] = {
 	PROPERTY_ENTRY_STRING("dr_mode", "otg"),
+	PROPERTY_ENTRY_STRING("linux,extcon-name", "mrfld_bcove_pwrsrc"),
 	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
 	{}
 };
-- 
2.26.2

