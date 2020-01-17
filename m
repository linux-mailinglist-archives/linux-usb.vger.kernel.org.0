Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFC914097D
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 13:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgAQMIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 07:08:41 -0500
Received: from aer-iport-2.cisco.com ([173.38.203.52]:17802 "EHLO
        aer-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgAQMIl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 07:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1206; q=dns/txt; s=iport;
  t=1579262921; x=1580472521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d5/oXDVcg4bryjdrFC16BMlX8zqtMdV75Zl3G4h88wU=;
  b=SeWgYZQoY1DeYWB/w4yLQJ32GfPGTJ/mRLnydmXbja9qz0DHo3Ur4aYv
   e93LPIRzRx/acoDVZnNVOooKC+crKctXoxhDMqRhe0XLW5Ap+BC1vUSUF
   QGyKJd2fKdWCcqJKtZcwVIYhbIf+SmOuNyWk5sFdxpD1pmJ/Neh1izI7f
   4=;
X-IronPort-AV: E=Sophos;i="5.70,330,1574121600"; 
   d="scan'208";a="21936448"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 17 Jan 2020 12:08:40 +0000
Received: from localhost.localdomain.rd.cisco.com ([10.47.76.148])
        by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 00HC8cRu022797;
        Fri, 17 Jan 2020 12:08:40 GMT
From:   Johan Korsnes <jkorsnes@cisco.com>
To:     linux-usb@vger.kernel.org
Cc:     Johan Korsnes <jkorsnes@cisco.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Armando Visconti <armando.visconti@st.com>,
        Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH v2 2/2] HID: core: increase HID report buffer size to 8KiB
Date:   Fri, 17 Jan 2020 13:08:36 +0100
Message-Id: <20200117120836.2354966-2-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117120836.2354966-1-jkorsnes@cisco.com>
References: <20200117120836.2354966-1-jkorsnes@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.76.148, [10.47.76.148]
X-Outbound-Node: aer-core-4.cisco.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have a HID touch device that reports its opens and shorts test
results in HID buffers of size 8184 bytes. The maximum size of the HID
buffer is currently set to 4096 bytes, causing probe of this device to
fail. With this patch we increase the maximum size of the HID buffer to
8192 bytes, making device probe and acquisition of said buffers succeed.

Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Armando Visconti <armando.visconti@st.com>
Cc: Jiri Kosina <jkosina@suse.cz>

---
v1 -> v2:
 * Clean-up of patch description (commit message)
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index cd41f209043f..875f71132b14 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -492,7 +492,7 @@ struct hid_report_enum {
 };
 
 #define HID_MIN_BUFFER_SIZE	64		/* make sure there is at least a packet size of space */
-#define HID_MAX_BUFFER_SIZE	4096		/* 4kb */
+#define HID_MAX_BUFFER_SIZE	8192		/* 8kb */
 #define HID_CONTROL_FIFO_SIZE	256		/* to init devices with >100 reports */
 #define HID_OUTPUT_FIFO_SIZE	64
 
-- 
2.24.1

