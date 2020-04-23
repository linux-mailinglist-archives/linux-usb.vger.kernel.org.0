Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB951B5C67
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgDWNVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:21:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:16372 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726753AbgDWNVG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:21:06 -0400
IronPort-SDR: EanpjvNyjjo/aGxi7E05OQcVe+ytmZoUJwZEvCn7U6iPiF5uygrk0dte0t2oTvpHmiTwm1oOE6
 V322gs44d21A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 06:21:06 -0700
IronPort-SDR: I5vWWZrq746FAM6pYRJkVjxu3E+673kU6t9/wNDyPTkoOAkIvdjmrl6pK9nwgW6xdYwKrI0eJv
 DtmbgCeNYk9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="366001015"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2020 06:21:04 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "K V, Abhilash" <abhilash.k.v@intel.com>
Subject: [PATCH 2/6] usb: typec: ucsi: Workaround for missed op_mode change
Date:   Thu, 23 Apr 2020 16:20:54 +0300
Message-Id: <20200423132058.6972-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
References: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: "K V, Abhilash" <abhilash.k.v@intel.com>

EC firmware on Dell XPS & Latitude series does not set "Power Operation
Mode Change" bit in "Connector Status change" field of MESSAGE IN Data
while transitioning from type-C current to PD mode.

Instead the "Negotiated Power Level Change" bit is set when the "Power
Operation Mode" field shows the correct mode (i.e. PD).

This patch adds a check for this bit also, to trigger an update of
power operation mode in class driver, while handling GET_CONNECTOR_STATUS
command.

Signed-off-by: K V, Abhilash <abhilash.k.v@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index e9baa9a749e5..0c7c3f9b1b50 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -613,7 +613,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	role = !!(con->status.flags & UCSI_CONSTAT_PWR_DIR);
 
-	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE)
+	if (con->status.change & UCSI_CONSTAT_POWER_OPMODE_CHANGE ||
+	    con->status.change & UCSI_CONSTAT_POWER_LEVEL_CHANGE)
 		ucsi_pwr_opmode_change(con);
 
 	if (con->status.change & UCSI_CONSTAT_POWER_DIR_CHANGE) {
-- 
2.26.1

