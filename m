Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1D23302B6
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 16:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhCGPl5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 10:41:57 -0500
Received: from mout.web.de ([212.227.15.14]:59509 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230359AbhCGPl5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Mar 2021 10:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1615131714;
        bh=dloEGoGmXzeFZ6HFojLIS5o3RnPRwpwmO1tVbWPhIIw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=fVajkv1r37S3mQ7+D5kjT27WQd+bYoygQm57XWYOrpR/rAwCCnBnAldoaLLnhiDAJ
         Pa4vEZbAcDwA40UymmwSH4GM3pDxJbg9pldZjN1cFNU2bFO8RkVtk8bvEcahJy0pjZ
         Xq08ACl8QPGgCcmejghegWNunD4sEnJWRVbWX9m8=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from ubuntu.fritz.box ([188.210.62.102]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M4sbr-1lIeQQ14zv-001qU3; Sun, 07
 Mar 2021 16:41:53 +0100
From:   Aaron Dewes <aaron.dewes@web.de>
To:     hdegoede@redhat.com
Cc:     linux-usb@vger.kernel.org, Aaron Dewes <aaron.dewes@web.de>
Subject: [PATCH v2] Add unusal uas devices reported by Umbrel users
Date:   Sun,  7 Mar 2021 16:41:24 +0100
Message-Id: <20210307154124.41651-1-aaron.dewes@web.de>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zKWosNcbERGQWAka2qJ6hMTnX2ULkY//F6SqmVpLmcUZpWApeTu
 ODqllsOgY32P/rTyjBmArFjOPUE+GSzBK6CrWgw4Q5JdNhmrqVgtmHDIPHLCtxsdYJv0rPe
 20caqroW4R+8QfpBMZ/N2dBHFTRDsK91JB1Y3MN9r6iYxiibO1XniVqYtqwDeEQ4+85fhvq
 YhHH0FB7usmK1t2dRWblA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jsWO+tf9qUw=:i367gYFUSIrMRh33PUT1G4
 4Enqugg02X/hBB7iRBlSiK2arAHJjLVWxMFW3nfVwcnK59nZvSb8CBrV77YyRu63qyils5wkO
 BNeXoxkd9dEpMh8nrOrOENmGoPMMuQ0YzgxbBT07jUNi34l1un8fPHGpdJ5apMqcD3YbQj3Z8
 HTnXGCT2ZWX2MiT4UXG/sU3I1/srWqdpaoULFdpP/ETq4fLbL51wiektwnUpx74hGCxZ5TStS
 9skDdYjGEbqkS15N88C8uA3KGaqYHmT9WsXRdEKxQI2oAZZV2BjROkPVhLzmp3oktnGhxrtr7
 bGnt4uM8YLRsI8OmGYL/ZLz0n0P9S3d7hKZ3uUABHIvvTrHSGU0dimlOJ/PRECgRtmD+QbE7X
 /nCOcTRY3MMRaoLwfiWPbWG1A2fqi1JQL1v4UHsVDGOSpPENoheLCCSnZQy3K2NR4QB6YLRUw
 F//VYKhQiplA5mYdykUq5PqBFAlkuPaGbV1chbeOO1CbIeeILYid1+hsa5mC2dUXTXCXmWNMi
 IP/rIsZS0rv7qttnXRS2/CNmtoDFOBva8Yhj0ggp042NiaQxnprX1eSgZSBgGppirsn/VFCXt
 6bWL4klC9XOemMH9PO4O3SIW84XLwdVa3alu3AmmTfUaOwcpT8BBoeMTg8H+RvpMdQDBJ+skp
 sjxp3gpIi21sAtDLOARVdOeWJvIqkyf8zRQ8fPXlLIvR6sPxb6DiBnxmV4FtiVczMQeE4NSn+
 +NKmcBVq4pmTx5ctak7VIoHV+jMByWPMCxFzmtXIGM4O5t/B3ESKbTGpHZLNR/pEVSbeHvuF+
 5FAeclphfer1B8XXiULmMqJYTVldKOS6KDgXwIppaURMlwVkM8yypt/THLYTh5yiU2w13vKe1
 9DSdwldBv0oEzWokkbqw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds more unusual UAS devices.
All these devices were reported by users of Umbrel,
and applying this patch fixed the issues.

Signed-off-by: Aaron Dewes <aaron.dewes@web.de>
=2D--
 drivers/usb/storage/unusual_uas.h | 70 +++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusu=
al_uas.h
index f9677a5ec31b..a67ed2b527fa 100644
=2D-- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -28,6 +28,27 @@
  * and don't forget to CC: the USB development list <linux-usb@vger.kerne=
l.org>
  */

+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x04e8, 0x4001, 0x0000, 0x9999,
+		"Samsung",
+		"SSD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x04e8, 0x61b6, 0x0000, 0x9999,
+		"Samsung",
+		"M3 Portable Hard Drive",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x04e8, 0x61f5, 0x0000, 0x9999,
+		"Samsung",
+		"Portable SSD T5",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
 /* Reported-by: Till D=C3=B6rges <doerges@pre-sense.de> */
 UNUSUAL_DEV(0x054c, 0x087d, 0x0000, 0x9999,
 		"Sony",
@@ -62,6 +83,20 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_LUNS),

+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x1058, 0x082a, 0x0000, 0x9999,
+		"Western Digital",
+		"SSD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x125f, 0xa76a, 0x0000, 0x9999,
+		"ADATA",
+		"ED600 enclosure",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
 UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
 		"Initio Corporation",
@@ -76,6 +111,13 @@ UNUSUAL_DEV(0x152d, 0x0539, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_OPCODES),

+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x152d, 0x0562, 0x0000, 0x9999,
+		"JMicron",
+		"JMS567",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
 /* Reported-by: Claudio Bizzarri <claudio.bizzarri@gmail.com> */
 UNUSUAL_DEV(0x152d, 0x0567, 0x0000, 0x9999,
 		"JMicron",
@@ -90,6 +132,20 @@ UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_BROKEN_FUA),

+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
+		"JMicron",
+		"JMS561U",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x152d, 0x1561, 0x0000, 0x9999,
+		"JMicron",
+		"External Disk connector",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
 /* Reported-by: Thinh Nguyen <thinhn@synopsys.com> */
 UNUSUAL_DEV(0x154b, 0xf00b, 0x0000, 0x9999,
 		"PNY",
@@ -104,6 +160,13 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_ATA_1X),

+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x174c, 0x55aa, 0x0000, 0x9999,
+		"ASMedia",
+		"ASM1051E and ASM1053E",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
+
 /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
 UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
 		"VIA",
@@ -150,3 +213,10 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
 		"External HDD",
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_ALWAYS_SYNC),
+
+/* Reported-by: Aaron Dewes <aaron.dewes@web.de */
+UNUSUAL_DEV(0x7825, 0xa2a4, 0x0000, 0x9999,
+		"Other World Computing",
+		"PA023U3",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
=2D-
2.30.1

