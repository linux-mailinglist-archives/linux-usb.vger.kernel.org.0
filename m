Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D56F262D98
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 13:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729275AbgIILDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 07:03:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:31555 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729663AbgIILAX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 07:00:23 -0400
IronPort-SDR: BPWHf7CIPfYFtwZ+217HMDlSy6V8LIyoCqqwETTv50AWc+OgA6Mi6vrtWbY6F+ZQOUx/39LqEU
 b9FgrGDcEalQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222511344"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="222511344"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 04:00:07 -0700
IronPort-SDR: g8FmHGL+QYn0eiZzQqUqhPEGdS51TpaJPyIm3xfXetFIaViOe9INSbOW2hCADn4jzpD21Z558R
 wqHmzhsWDcjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="377826748"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 09 Sep 2020 04:00:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 2AFDC3C7; Wed,  9 Sep 2020 14:00:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/7] thunderbolt: Log correct zeroX entries in decode_error()
Date:   Wed,  9 Sep 2020 13:59:59 +0300
Message-Id: <20200909110001.71603-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
References: <20200909110001.71603-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There was copy & paste error so it always printed value of pkg->zero1.
Also use tb_ctl_warn() here, no need to print backtrace.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 88b40b3b3ad7..9894b8f63064 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -219,6 +219,7 @@ static int check_config_address(struct tb_cfg_address addr,
 static struct tb_cfg_result decode_error(const struct ctl_pkg *response)
 {
 	struct cfg_error_pkg *pkg = response->buffer;
+	struct tb_ctl *ctl = response->ctl;
 	struct tb_cfg_result res = { 0 };
 	res.response_route = tb_cfg_get_route(&pkg->header);
 	res.response_port = 0;
@@ -227,9 +228,13 @@ static struct tb_cfg_result decode_error(const struct ctl_pkg *response)
 	if (res.err)
 		return res;
 
-	WARN(pkg->zero1, "pkg->zero1 is %#x\n", pkg->zero1);
-	WARN(pkg->zero2, "pkg->zero1 is %#x\n", pkg->zero1);
-	WARN(pkg->zero3, "pkg->zero1 is %#x\n", pkg->zero1);
+	if (pkg->zero1)
+		tb_ctl_warn(ctl, "pkg->zero1 is %#x\n", pkg->zero1);
+	if (pkg->zero2)
+		tb_ctl_warn(ctl, "pkg->zero2 is %#x\n", pkg->zero2);
+	if (pkg->zero3)
+		tb_ctl_warn(ctl, "pkg->zero3 is %#x\n", pkg->zero3);
+
 	res.err = 1;
 	res.tb_error = pkg->error;
 	res.response_port = pkg->port;
-- 
2.28.0

