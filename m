Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D158113C131
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 13:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgAOMlA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 07:41:00 -0500
Received: from aer-iport-1.cisco.com ([173.38.203.51]:21314 "EHLO
        aer-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgAOMlA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 07:41:00 -0500
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jan 2020 07:40:59 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1610; q=dns/txt; s=iport;
  t=1579092059; x=1580301659;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aRG6Mvhhkx841M802BVUu4RpDXt3XjDAd9oCXEtLuRs=;
  b=dWPel/yW6ZtONj+9hFzUduNLcfq5M0K/gMjasxdirc68ljIJSL+8cuFJ
   i2phMyEjp2gEm8myisfLFbD7V75edpskNEFXFLzL6lRc7SUHA0osdNB1r
   ebYkiYE8WmCQZ/+udm4d731Z2WXssTK60tfWjGMmfB7EtqLLVmWRsTxyC
   4=;
X-IronPort-AV: E=Sophos;i="5.70,322,1574121600"; 
   d="scan'208";a="21831667"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jan 2020 12:33:51 +0000
Received: from localhost.rd.cisco.com ([10.47.76.148])
        by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 00FCXoHd008119;
        Wed, 15 Jan 2020 12:33:51 GMT
From:   Johan Korsnes <jkorsnes@cisco.com>
To:     linux-usb@vger.kernel.org
Cc:     Johan Korsnes <jkorsnes@cisco.com>,
        Armando Visconti <armando.visconti@st.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 1/2] HID: core: fix off-by-one memset in hid_report_raw_event()
Date:   Wed, 15 Jan 2020 13:33:43 +0100
Message-Id: <20200115123344.4650-1-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.76.148, [10.47.76.148]
X-Outbound-Node: aer-core-4.cisco.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a report is greater than HID_MAX_BUFFER_SIZE it is truncated,
but the report-number byte is not correctly handled. This results in a
off-by-one in the following memset, causing a kernel Oops and ensuing
system crash.

Note: With commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds read in
hid_field_extract") I no longer hit the kernel Oops as we instead fail
"controlled" at probe if there is a report too long in the HID
report descriptor. I still believe this is worth fixing though, as
hid_report_raw_event() should have its logic correct. But if we fail at
probe for too large reports, a better solution might be to remove this
truncation logic entirely.

Fixes: 966922f26c7f ("HID: fix a crash in hid_report_raw_event()
                     function.")
Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
Cc: Armando Visconti <armando.visconti@st.com>
Cc: Jiri Kosina <jkosina@suse.cz>
Cc: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/hid/hid-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 851fe54ea59e..359616e3efbb 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1741,7 +1741,9 @@ int hid_report_raw_event(struct hid_device *hid, int type, u8 *data, u32 size,
 
 	rsize = ((report->size - 1) >> 3) + 1;
 
-	if (rsize > HID_MAX_BUFFER_SIZE)
+	if (report_enum->numbered && rsize >= HID_MAX_BUFFER_SIZE)
+		rsize = HID_MAX_BUFFER_SIZE - 1;
+	else if (rsize > HID_MAX_BUFFER_SIZE)
 		rsize = HID_MAX_BUFFER_SIZE;
 
 	if (csize < rsize) {
-- 
2.24.1

