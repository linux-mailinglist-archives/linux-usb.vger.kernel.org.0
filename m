Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF746193D27
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 11:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgCZKnm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 06:43:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727841AbgCZKnm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Mar 2020 06:43:42 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3CDEF20748;
        Thu, 26 Mar 2020 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585219421;
        bh=Vx58WJqq6eBV9PhOoButEhE8nnenlrmHCrgCNuY+Lbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vLPmb3lKFIQXtY7uNLuPFl7pROheH74MDwMIhm15uK7sLQVHSGEWO/uFMhQg+Ap0l
         wqISuoNoUbplKo3VpUEIhYeDQdv9ziUyIMeFPAxiXqb6LXzCmykpyZpmCkCbB7kOiS
         L6hR89F56V6fZoNZwQjeqzV0tuAl71N5pDcVxjwM=
From:   Peter Chen <peter.chen@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-imx@nxp.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/3] usb: chipidea: core: refine the description for this driver
Date:   Thu, 26 Mar 2020 18:43:24 +0800
Message-Id: <20200326104325.5628-2-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326104325.5628-1-peter.chen@kernel.org>
References: <20200326104325.5628-1-peter.chen@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Some descriptions are outdated, update them.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/core.c | 40 +++++++------------------------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index ae0bdc036464..12971c96c19e 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -3,42 +3,16 @@
  * core.c - ChipIdea USB IP core family device controller
  *
  * Copyright (C) 2008 Chipidea - MIPS Technologies, Inc. All rights reserved.
+ * Copyright (C) 2020 NXP
  *
  * Author: David Lopo
- */
-
-/*
- * Description: ChipIdea USB IP core family device controller
- *
- * This driver is composed of several blocks:
- * - HW:     hardware interface
- * - DBG:    debug facilities (optional)
- * - UTIL:   utilities
- * - ISR:    interrupts handling
- * - ENDPT:  endpoint operations (Gadget API)
- * - GADGET: gadget operations (Gadget API)
- * - BUS:    bus glue code, bus abstraction layer
- *
- * Compile Options
- * - STALL_IN:  non-empty bulk-in pipes cannot be halted
- *              if defined mass storage compliance succeeds but with warnings
- *              => case 4: Hi >  Dn
- *              => case 5: Hi >  Di
- *              => case 8: Hi <> Do
- *              if undefined usbtest 13 fails
- * - TRACE:     enable function tracing (depends on DEBUG)
- *
- * Main Features
- * - Chapter 9 & Mass Storage Compliance with Gadget File Storage
- * - Chapter 9 Compliance with Gadget Zero (STALL_IN undefined)
- * - Normal & LPM support
- *
- * USBTEST Report
- * - OK: 0-12, 13 (STALL_IN defined) & 14
- * - Not Supported: 15 & 16 (ISO)
+ *	   Peter Chen <peter.chen@nxp.com>
  *
- * TODO List
- * - Suspend & Remote Wakeup
+ * Main Features:
+ * - Four transfers are supported, usbtest is passed
+ * - USB Certification for gadget: CH9 and Mass Storage are passed
+ * - Low power mode
+ * - USB wakeup
  */
 #include <linux/delay.h>
 #include <linux/device.h>
-- 
2.17.1

