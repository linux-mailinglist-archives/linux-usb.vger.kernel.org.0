Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0ECE1BD9B2
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 12:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgD2KfQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 06:35:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:47662 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726516AbgD2KfQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 06:35:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 7AEF9ABAD;
        Wed, 29 Apr 2020 10:35:14 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2] UAS: add quirk for LaCie 2Big Quadra
Date:   Wed, 29 Apr 2020 12:34:41 +0200
Message-Id: <20200429103441.20107-1-oneukum@suse.com>
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

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: Julian Groß <julian.g@posteo.de>
---
 drivers/usb/storage/unusual_uas.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index cfdec74e0f4a..22aeb6a45e57 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -45,6 +45,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_LUNS),
 
+/* Reported-by: Julian Groß <julian.g@posteo.de> */
+UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
+		"LaCie",
+		"2Big Quadra USB3",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_NO_REPORT_OPCODES),
+
 /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
 UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
 		"Initio Corporation",
-- 
2.16.4

