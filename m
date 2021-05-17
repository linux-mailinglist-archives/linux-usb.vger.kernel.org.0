Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CCD382BA0
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 13:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbhEQMAG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 08:00:06 -0400
Received: from mga02.intel.com ([134.134.136.20]:47948 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236866AbhEQMAE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 08:00:04 -0400
IronPort-SDR: cOVUxS+T11GfOVcRpTUlKvrjOhUNjcgTsbQgnRc1iVqClzoD09c9UETG0FN10Gp+qpGsSo2GM3
 tLVCgIY3uf5g==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="187568069"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="187568069"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:58:48 -0700
IronPort-SDR: QCrjwCxw8KrarigGQCP1MFBm+C/G058AvAjqMXjjG9thwmxr0W59b7ht6AGaEJOo/3t0vfD4Jt
 UEjNUMp8Um/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="393487065"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 17 May 2021 04:58:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 6C7FB50E; Mon, 17 May 2021 14:59:07 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/4] thunderbolt: usb4: Fix NVM read buffer bounds and offset issue
Date:   Mon, 17 May 2021 14:59:05 +0300
Message-Id: <20210517115907.52503-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
References: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Up to 64 bytes of data can be read from NVM in one go.
Read address must be dword aligned. Data is read into a local buffer.

If caller asks to read data starting at an unaligned address then full
dword is anyway read from NVM into a local buffer. Data is then copied
from the local buffer starting at the unaligned offset to the caller
buffer.

In cases where asked data length + unaligned offset is over 64 bytes
we need to make sure we don't read past the 64 bytes in the local
buffer when copying to caller buffer, and make sure that we don't
skip copying unaligned offset bytes from local buffer anymore after
the first round of 64 byte NVM data read.

Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
Cc: stable@vger.kernel.org
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 680bc738dd66..671d72af8ba1 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -68,15 +68,15 @@ static int usb4_do_read_data(u16 address, void *buf, size_t size,
 	unsigned int retries = USB4_DATA_RETRIES;
 	unsigned int offset;
 
-	offset = address & 3;
-	address = address & ~3;
-
 	do {
-		size_t nbytes = min_t(size_t, size, USB4_DATA_DWORDS * 4);
 		unsigned int dwaddress, dwords;
 		u8 data[USB4_DATA_DWORDS * 4];
+		size_t nbytes;
 		int ret;
 
+		offset = address & 3;
+		nbytes = min_t(size_t, size + offset, USB4_DATA_DWORDS * 4);
+
 		dwaddress = address / 4;
 		dwords = ALIGN(nbytes, 4) / 4;
 
@@ -87,6 +87,7 @@ static int usb4_do_read_data(u16 address, void *buf, size_t size,
 			return ret;
 		}
 
+		nbytes -= offset;
 		memcpy(buf, data + offset, nbytes);
 
 		size -= nbytes;
-- 
2.30.2

