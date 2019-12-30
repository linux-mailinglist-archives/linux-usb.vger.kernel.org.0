Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C088C12D094
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727519AbfL3O0P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:15 -0500
Received: from mga06.intel.com ([134.134.136.31]:56429 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3O0P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:15 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233454"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:13 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 01/15] usb: typec: Block mode entry if the port has the mode disabled
Date:   Mon, 30 Dec 2019 17:25:57 +0300
Message-Id: <20191230142611.24921-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Originally the port drivers were expected to check does the
connector have the mode enabled or disabled when the alt
mode drivers attempted to enter the mode, but since
typec_altmode_enter() puts the connector into USB Safe
State before calling the port driver, it really has to do
the check on its own, and before changing the state.
Otherwise the connector may be left in USB Safe State if the
port driver does not move it back to normal USB operation
when the mode is disabled.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index 74cb3c2ecb34..4116379fbd68 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -101,6 +101,9 @@ int typec_altmode_enter(struct typec_altmode *adev)
 	if (!pdev->ops || !pdev->ops->enter)
 		return -EOPNOTSUPP;
 
+	if (is_typec_port(pdev->dev.parent) && !pdev->active)
+		return -EPERM;
+
 	/* Moving to USB Safe State */
 	ret = typec_altmode_set_state(adev, TYPEC_STATE_SAFE);
 	if (ret)
-- 
2.24.1

