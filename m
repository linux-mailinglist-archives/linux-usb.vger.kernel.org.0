Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88451BE324
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 17:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD2Pwt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 11:52:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:58740 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726456AbgD2Pwt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 11:52:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7D61AAC61;
        Wed, 29 Apr 2020 15:52:47 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3] UAS: add quirk for LaCie 2Big Quadra
Date:   Wed, 29 Apr 2020 17:52:18 +0200
Message-Id: <20200429155218.7308-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This device needs US_FL_NO_REPORT_OPCODES to avoid going
through prolonged error handling on enumeration.

v2: correct sorting order
v3: really correct ordering

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: Julian Groß <julian.g@posteo.de>
---
 drivers/usb/storage/unusual_uas.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index cfdec74e0f4a..4f4c134f0ffd 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -32,6 +32,14 @@
  * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
  * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
  */
+
+/* Reported-by: Julian Groß <julian.g@posteo.de> */
+UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
+		"LaCie",
+		"2Big Quadra USB3",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES),
+
 UNUSUAL_DEV(0x0984, 0x0301, 0x0128, 0x0128,
 		"Apricorn",
 		"",
-- 
2.16.4

