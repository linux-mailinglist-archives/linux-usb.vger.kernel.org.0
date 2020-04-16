Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06A251AC09F
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 14:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634562AbgDPMCJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 08:02:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:51243 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2634110AbgDPMBw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Apr 2020 08:01:52 -0400
IronPort-SDR: DIhSlo4a6wbU+WhFFgYnTDG3pT1ZMsndd1TriCUaQFXU0yqdFQn1Wlq8+6uTa4nBAGklEqeCdU
 pyz4xKObmhSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 05:01:51 -0700
IronPort-SDR: QJyA/EKCi9XB0nfVYwjaMeU5FjaxSLBe4hhdl7vxA8GY05FsGK2b7OijbOhQwGYvAPu3m1NPhF
 GxIAM6O9NioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="277968613"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 16 Apr 2020 05:01:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C93A319C; Thu, 16 Apr 2020 15:01:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH] thunderbolt: Check return value of tb_sw_read() in usb4_switch_op()
Date:   Thu, 16 Apr 2020 15:01:46 +0300
Message-Id: <20200416120146.54791-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The function misses checking return value of tb_sw_read() before it
accesses the value that was read. Fix this by checking the return value
first.

Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 3d084cec136f..50c7534ba31e 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -182,6 +182,9 @@ static int usb4_switch_op(struct tb_switch *sw, u16 opcode, u8 *status)
 		return ret;
 
 	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_26, 1);
+	if (ret)
+		return ret;
+
 	if (val & ROUTER_CS_26_ONS)
 		return -EOPNOTSUPP;
 
-- 
2.25.1

