Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15DBE14097C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 13:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgAQMIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 07:08:41 -0500
Received: from aer-iport-1.cisco.com ([173.38.203.51]:36416 "EHLO
        aer-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgAQMIk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jan 2020 07:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1567; q=dns/txt; s=iport;
  t=1579262920; x=1580472520;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zlQBFIc9S6kZTsHEQTM7RGQDsvJHeiO3cabTgGOBT6Y=;
  b=JGslkMtFyHfZwFsIZi9AZHuXyzAJjDNqx/GqljqtKV2eymZyUsxKHrHi
   UVLtUg+rrtHPf9OQ5450lKUmmar9KsoprXIm2vSKLeWjRLFDDMdBC5Xh9
   +F5pa3AR5g8Jzcy2+sU9jXLypY+Io3o6m8oamVoocorzh2xMdRvg+af6U
   c=;
X-IronPort-AV: E=Sophos;i="5.70,330,1574121600"; 
   d="scan'208";a="21935992"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com) ([173.38.203.22])
  by aer-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 17 Jan 2020 12:08:39 +0000
Received: from localhost.localdomain.rd.cisco.com ([10.47.76.148])
        by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 00HC8cRt022797;
        Fri, 17 Jan 2020 12:08:38 GMT
From:   Johan Korsnes <jkorsnes@cisco.com>
To:     linux-usb@vger.kernel.org
Cc:     Johan Korsnes <jkorsnes@cisco.com>,
        Armando Visconti <armando.visconti@st.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v2 1/2] HID: core: fix off-by-one memset in hid_report_raw_event()
Date:   Fri, 17 Jan 2020 13:08:35 +0100
Message-Id: <20200117120836.2354966-1-jkorsnes@cisco.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.47.76.148, [10.47.76.148]
X-Outbound-Node: aer-core-4.cisco.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case a report is greater than HID_MAX_BUFFER_SIZE, it is truncated,
but the report-number byte is not correctly handled. This results in a
off-by-one in the following memset, causing a kernel Oops and ensuing
system crash.

Note: With commit 8ec321e96e05 ("HID: Fix slab-out-of-bounds read in
hid_field_extract") I no longer hit the kernel Oops as we instead fail
"controlled" at probe if there is a report too long in the HID
report-descriptor. hid_report_raw_event() is an exported symbol, so
presumabely we cannot always rely on this being the case.

Fixes: 966922f26c7f ("HID: fix a crash in hid_report_raw_event()
                     function.")
Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
Cc: Armando Visconti <armando.visconti@st.com>
Cc: Jiri Kosina <jkosina@suse.cz>
Cc: Alan Stern <stern@rowland.harvard.edu>

---
v1 -> v2:
 * Clean-up of patch description (commit message)
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

