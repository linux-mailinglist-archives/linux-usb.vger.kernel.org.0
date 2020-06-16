Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386941FB2F0
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 15:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729081AbgFPN4W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 09:56:22 -0400
Received: from mga03.intel.com ([134.134.136.65]:26083 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729067AbgFPN4W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 09:56:22 -0400
IronPort-SDR: U3/rBKXfMQ2tUGt+mJ7hc+AocJz2c9DihSjswzXD+m0rpwUeZj0afLVHNljcpN+/+3KqJPuCG7
 u5ZZMUlt0J5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 06:56:21 -0700
IronPort-SDR: w/XUM3NmMQ/R1JG02Nrj1guZmLUb8bvfr4/NKACmCqQ4dykgUUXmCpqCXypNET3sYOS+wsuxZv
 47+GDb0hbjKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="309115288"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2020 06:56:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3D364795; Tue, 16 Jun 2020 16:56:18 +0300 (EEST)
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
Subject: [PATCH 4/6] thunderbolt: Retry USB4 block read operation
Date:   Tue, 16 Jun 2020 16:56:15 +0300
Message-Id: <20200616135617.85752-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
References: <20200616135617.85752-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Especially when accessing retimers over USB4 sideband operations the
possibility to get read errors seems to be higher so make the
usb4_do_read_data() retry a couple of times if it sees any other error
than -ENODEV (device is gone). We can only do this for read side because
it carries the offset as part of metadata (as opposed to writes).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 8a83857573df..142c7244bdb1 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -115,11 +115,8 @@ static int usb4_do_read_data(u16 address, void *buf, size_t size,
 
 		ret = read_block(read_block_data, dwaddress, data, dwords);
 		if (ret) {
-			if (ret == -ETIMEDOUT) {
-				if (retries--)
-					continue;
-				ret = -EIO;
-			}
+			if (ret != -ENODEV && retries--)
+				continue;
 			return ret;
 		}
 
-- 
2.27.0.rc2

