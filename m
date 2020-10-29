Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299ED29E7B3
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 10:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgJ2Jql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 05:46:41 -0400
Received: from mga03.intel.com ([134.134.136.65]:31459 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbgJ2Jqk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 05:46:40 -0400
IronPort-SDR: GfHhA9aMgTAhK7o0n5n0ysqHSghWv1SAL+aE/mHkKuZ3qQ6xxufhP+iZKScWK64qs3E2u7zRTL
 KiA/tZirbA/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="168504716"
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="168504716"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 02:46:39 -0700
IronPort-SDR: g4UWBVGymIV1Dp7vaU6CpHWwt+BemayeO81G9PnDYOgChymKs5jnnGaom2IcKOafFus/SfxEnN
 5+VsrsMdVMVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,429,1596524400"; 
   d="scan'208";a="350907877"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 29 Oct 2020 02:46:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 186EB453; Thu, 29 Oct 2020 11:46:37 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Casey Bowman <casey.g.bowman@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/3] thunderbolt: Add uaccess dependency to debugfs interface
Date:   Thu, 29 Oct 2020 12:46:35 +0300
Message-Id: <20201029094636.51818-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029094636.51818-1-mika.westerberg@linux.intel.com>
References: <20201029094636.51818-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Casey Bowman <casey.g.bowman@intel.com>

Some calls in the debugfs interface are made to the linux/uaccess.h header,
but the header is not referenced. So, for x86_64 architectures, this
dependency seems to be pulled in elsewhere, which leads to a successful
compilation. However, on arm/arm64 architectures, it was found to error out
on implicit declarations.

This change fixes the implicit declaration error by adding the
linux/uaccess.h header.

Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
Signed-off-by: Casey Bowman <casey.g.bowman@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 3680b2784ea1..ed65d2b13964 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -9,6 +9,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/pm_runtime.h>
+#include <linux/uaccess.h>
 
 #include "tb.h"
 
-- 
2.28.0

