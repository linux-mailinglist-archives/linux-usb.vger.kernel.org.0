Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA5E330289
	for <lists+linux-usb@lfdr.de>; Sun,  7 Mar 2021 16:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhCGPTC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Mar 2021 10:19:02 -0500
Received: from mout.web.de ([212.227.15.4]:60197 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232007AbhCGPS4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Mar 2021 10:18:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1615130331;
        bh=auDo2jwixgl09mJ1c+oQFVMkL4nunSN/7AzuRmqtFJE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=kPrUPvXklKLJLLWXLksTELm3Ei5EbrUVXFm600u2hwnnpg6ml9bpD43Zr8oSA550C
         SKcTONUTVF0eRDmJQ1+Q5mZGO6lST34uGQucrLEN/zFG/5TFfcPfs9o1TMl5RN1x8K
         oG6SgqB8kaLC22u4Fb+xjnh29wiyq758ejnWjbn0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from ubuntu.fritz.box ([188.210.62.102]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MN43c-1lPWsc1htY-006iSD; Sun, 07
 Mar 2021 16:18:50 +0100
From:   Aaron Dewes <aaron.dewes@web.de>
To:     hdegoede@redhat.com
Cc:     linux-usb@vger.kernel.org, Aaron Dewes <aaron.dewes@web.de>
Subject: [PATCH] Add unusal uas devices reported by Umbrel users
Date:   Sun,  7 Mar 2021 16:18:30 +0100
Message-Id: <20210307151830.38070-1-aaron.dewes@web.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <aaron.dewes@web.de>
References: <aaron.dewes@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ui/ELSV5Nlv1O7Ro+reCFSbSXW1jZd/HC62m75wLNR/6c7I7PWj
 P/tn+LW7WkFSnqpUZUsyxdkx+OxSZluKi/RicTkhstzeZhaGsXcRvM+RcKzHr/KNNn5P6+t
 PNbfVJ0GHYypR7H1sax+H6QakutP1143gqwj5jqvyN/0X2PzmLIlqNbfhBTGvr07YaYRrtH
 1+J4BeMq/tk42mLI+vO+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Awgo5CaMfHU=:HwWZUP1bzbm6DmZg1lF6Nd
 IaSBtS+s0t5aeP+S6mCWUvbpHdiytkMLRmmBru43UqGazxpwVNYvcg4RDD7zqPedvs0PArfns
 7xcfVaJ9V0ZkFWjf4iGDMh/+y+eb7w0aCS4cLnJnH49SOxVJp/ruGd/ANPEIXHYcYqDQ/Uj5u
 W7O2uG6TpRv6vqJPuZWRicza28+GwIFLdxmD3Eqtx8GclY6XN6MaOLwgkfOPjBVwMiXAT4wbv
 K5e8rCidTJQKg8tpNlqZrp0wEnn8gvdzXH6pTxS95P5LYe0TVhkKx2yaMWOQCpLIqIoRvtxkO
 qVsjHxHaox9N0O1qAT/IM0d//DsWZKsTIviVriq0yMyUNqmSFyE9Aq1pp011PDBx73m8H/h7D
 2NRltIMX+lJ2SnzgnKXOeBA1x/4+Q5J+A3hwqbhdJejoARQ+2KXonMUEk1/TnNKz3FGxdcDvH
 DjwFJhCHqfoUPrgUG9jhP1UEZFLsRplxmEIs9WLW5z8+o0JUoCXIqHty39QJ380zPaP9yNy2T
 BlLu7VR7/zmiMrrkpcveIlej2UGvf3IqQxIZwKaFDifJE1i0c2pQdbK7PCxP3CXme9hJ/tKvF
 xBX+eu5YFwcZkPMj95/Ixu/j4Q2EyFP3gQ8zww/oMpkmjTnUUoRNg2hH1jkxWEe00OVDahBXv
 NPCYCh8RKiQLG2mZ4oHsoNcjQQe8284cfjaPfA/koAtWnJPjDirjamhAmuRZAutlZxjDxNEbi
 GXbYa1IQ6zEbe1xb+EIliAgw4X2662HtBcfGNTZ3yRcsnz0AR2pBnxMsxRh57WvOWcdZrbFPU
 sZvqzgCSVwIlL2seiEPh3d/sIpZN1lWnA6UQbTU83fPn6/IPjc6h72iV3Udei0U080D+eTPhY
 j/ytWlAMqkaD80+sbgOQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

