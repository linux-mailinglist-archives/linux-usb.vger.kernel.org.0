Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280C21B5C66
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgDWNVG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:21:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:16372 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726753AbgDWNVF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:21:05 -0400
IronPort-SDR: wbNwn4+NxFf/q4Jlcu/2rNctBsvIiggkUTMDpBJ4rbn04J+7FQi0V7/g5AsG3gu2lgBk2EFQqa
 aIrpnRpOT7JQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 06:21:04 -0700
IronPort-SDR: Yyi1QSm4rSCWOF9thmWOVSkQMCtMLQbd3i7l8OMEPofFkEmSyQgTPEkePispkWB4oNDIuqt2N4
 pS+mzMzJx54Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="366001010"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2020 06:21:03 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        "K V, Abhilash" <abhilash.k.v@intel.com>,
        Mayank Rana <mrana@codeaurora.org>
Subject: [PATCH 1/6] usb: typec: ucsi: set USB data role when partner type is power cable/ufp
Date:   Thu, 23 Apr 2020 16:20:53 +0300
Message-Id: <20200423132058.6972-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
References: <20200423132058.6972-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mayank Rana <mrana@codeaurora.org>

Currently UCSI framework doesn't update USB data role when partner type
is reported as power cable or power cable with ufp connected. This
results into no USB host mode functionality. This is valid usecase where
user wants to use legacy type c power cable with type a female connector
to attach different USB devices like mouse, thumb drive etc. Hence update
USB data role as host when partner type is reported as power cable or
power cable with ufp connected.

Signed-off-by: Mayank Rana <mrana@codeaurora.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ddf2ad3752de..e9baa9a749e5 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -566,6 +566,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
 	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
@@ -627,6 +629,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 			typec_set_data_role(con->port, TYPEC_HOST);
 			break;
 		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
@@ -927,6 +931,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
 	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
-- 
2.26.1

