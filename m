Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA3913C132
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 13:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgAOMlD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 07:41:03 -0500
Received: from aer-iport-2.cisco.com ([173.38.203.52]:44286 "EHLO
        aer-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgAOMlD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 07:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1547; q=dns/txt; s=iport;
  t=1579092062; x=1580301662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CMGeFI10SCO4txSLVhLua/jUV9cB9Rr/f8iwv0XLNnQ=;
  b=hRtWYbe2s8kDgJqw6z5DIjY4F6hXWMyL2+r9EFdDX65VFoYlcI1m+BEi
   FK1rhIZDoXC8ouk6pEGbiC2zH4/949pLgu5rylBbwAZRVcxBGRb4LWZMJ
   vFFTri9ssaQneK4GrhWPa3rYey80SXwRnn1ulb9hSB/RMj1DH4dOtGirK
   U=;
X-IronPort-AV: E=Sophos;i="5.70,322,1574121600"; 
   d="scan'208";a="21832071"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com) ([173.38.203.22])
  by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jan 2020 12:33:52 +0000
Received: from localhost.rd.cisco.com ([10.47.76.148])
        by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 00FCXoHe008119;
        Wed, 15 Jan 2020 12:33:52 GMT
From:   Johan Korsnes <jkorsnes@cisco.com>
To:     linux-usb@vger.kernel.org
Cc:     Johan Korsnes <jkorsnes@cisco.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Armando Visconti <armando.visconti@st.com>,
        Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH 2/2] HID: core: increase HID report buffer size to 8KiB
Date:   Wed, 15 Jan 2020 13:33:44 +0100
Message-Id: <20200115123344.4650-2-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115123344.4650-1-jkorsnes@cisco.com>
References: <20200115123344.4650-1-jkorsnes@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.76.148, [10.47.76.148]
X-Outbound-Node: aer-core-4.cisco.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have a touch device that reports its opens and shorts test results
in HID buffers of size 8184 bytes. With this patch we're able to
successfully obtain these reports.

Alan Stern: Your commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds
read in hid_field_extract") states:

"This patch fixes the problem by rejecting any report whose total
length exceeds the HID_MAX_BUFFER_SIZE limit (minus one byte to allow
for a possible report index). In theory a device could have a report
longer than that, but if there was such a thing we wouldn't handle it
correctly anyway."

Is this something we have to worry about when increasing the buffer
size? Or are you referring to the fact that we previously truncated
the reports if they exceeded max buffer size?

Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Armando Visconti <armando.visconti@st.com>
Cc: Jiri Kosina <jkosina@suse.cz>
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

