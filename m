Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1934E1B5C6A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgDWNVM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:21:12 -0400
Received: from mga07.intel.com ([134.134.136.100]:16372 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbgDWNVL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:21:11 -0400
IronPort-SDR: ym0Rd/9cqKpXCvFPb12WmSgkMdoDi68INWSDNpI7sqUPNTI8UUK9oBltNmWZ2Ipg9nGggnADs2
 /Ryh/4Jpis6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 06:21:10 -0700
IronPort-SDR: YO1fB/Y8scBTqAFUiHpW7WA78eSdm7xZHWVKgb+vvyBJjobn1WaII8TXxs3Y8uIrCKHNp+R3XS
 M5ouLS8MCmCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="366001033"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2020 06:21:09 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "K V, Abhilash" <abhilash.k.v@intel.com>
Subject: [PATCH 5/6] usb: typec: ucsi: save power data objects in PD mode
Date:   Thu, 23 Apr 2020 16:20:57 +0300
Message-Id: <20200423132058.6972-6-heikki.krogerus@linux.intel.com>
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

When connected to a PD-capable power-source, read & save all partner
power data objects (PDOs) by using GET_PDOS UCSI command.
Also, save the current power contract in request data object (RDO)
for that connector.

Signed-off-by: K V, Abhilash <abhilash.k.v@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  9 +++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0c7c3f9b1b50..ffea795da815 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -492,19 +492,45 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
 	}
 }
 
+static void ucsi_get_pdos(struct ucsi_connector *con, int is_partner)
+{
+	struct ucsi *ucsi = con->ucsi;
+	u64 command;
+	int ret;
+
+	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
+	command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
+	command |= UCSI_GET_PDOS_NUM_PDOS(UCSI_MAX_PDOS - 1);
+	command |= UCSI_GET_PDOS_SRC_PDOS;
+	ret = ucsi_run_command(ucsi, command, con->src_pdos,
+			       sizeof(con->src_pdos));
+	if (ret < 0) {
+		dev_err(ucsi->dev, "UCSI_GET_PDOS failed (%d)\n", ret);
+		return;
+	}
+	con->num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
+	if (ret == 0)
+		dev_warn(ucsi->dev, "UCSI_GET_PDOS returned 0 bytes\n");
+}
+
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
 	switch (UCSI_CONSTAT_PWR_OPMODE(con->status.flags)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
+		con->rdo = con->status.request_data_obj;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_PD);
+		ucsi_get_pdos(con, 1);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
+		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_1_5A);
 		break;
 	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
+		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_3_0A);
 		break;
 	default:
+		con->rdo = 0;
 		typec_set_pwr_opmode(con->port, TYPEC_PWR_MODE_USB);
 		break;
 	}
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index f068356cc325..28e21a1e6b61 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -130,6 +130,11 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_ALTMODE_OFFSET(_r_)		((u64)(_r_) << 32)
 #define UCSI_GET_ALTMODE_NUM_ALTMODES(_r_)	((u64)(_r_) << 40)
 
+/* GET_PDOS command bits */
+#define UCSI_GET_PDOS_PARTNER_PDO(_r_)		((u64)(_r_) << 23)
+#define UCSI_GET_PDOS_NUM_PDOS(_r_)		((u64)(_r_) << 32)
+#define UCSI_GET_PDOS_SRC_PDOS			((u64)1 << 34)
+
 /* -------------------------------------------------------------------------- */
 
 /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
@@ -294,6 +299,7 @@ struct ucsi {
 
 #define UCSI_MAX_SVID		5
 #define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
+#define UCSI_MAX_PDOS		(4)
 
 struct ucsi_connector {
 	int num;
@@ -313,6 +319,9 @@ struct ucsi_connector {
 
 	struct ucsi_connector_status status;
 	struct ucsi_connector_capability cap;
+	u32 rdo;
+	u32 src_pdos[UCSI_MAX_PDOS];
+	int num_pdos;
 };
 
 int ucsi_send_command(struct ucsi *ucsi, u64 command,
-- 
2.26.1

