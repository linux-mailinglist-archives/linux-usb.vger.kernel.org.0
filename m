Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209A71B5C68
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgDWNVI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:21:08 -0400
Received: from mga07.intel.com ([134.134.136.100]:16372 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728367AbgDWNVI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:21:08 -0400
IronPort-SDR: MxYnLxjTo7QI3HZpLW7aWwhxtJ6vz2k3tdixot8SiAQsK3C7ZjTjP5SL9NNWVXeXQmAEJClbR1
 Vf4rRVXZ6QGQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 06:21:07 -0700
IronPort-SDR: IFD5K60FNvydQX6sLWtq/zsY10Gr3Vv0O1dB7JRI/6S7/TDxZ2YVTCCNaZ6gK2lYYtH3aIrEVw
 boojj/oib4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="366001019"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Apr 2020 06:21:06 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, "K V, Abhilash" <abhilash.k.v@intel.com>
Subject: [PATCH 3/6] usb: typec: ucsi: replace magic numbers
Date:   Thu, 23 Apr 2020 16:20:55 +0300
Message-Id: <20200423132058.6972-4-heikki.krogerus@linux.intel.com>
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

Replace magic numbers with macros in trace.h.

Signed-off-by: K V, Abhilash <abhilash.k.v@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/trace.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/trace.c b/drivers/usb/typec/ucsi/trace.c
index 48ad1dc1b1b2..cb62ad835761 100644
--- a/drivers/usb/typec/ucsi/trace.c
+++ b/drivers/usb/typec/ucsi/trace.c
@@ -35,16 +35,16 @@ const char *ucsi_cmd_str(u64 raw_cmd)
 
 const char *ucsi_cci_str(u32 cci)
 {
-	if (cci & GENMASK(7, 0)) {
-		if (cci & BIT(29))
+	if (UCSI_CCI_CONNECTOR(cci)) {
+		if (cci & UCSI_CCI_ACK_COMPLETE)
 			return "Event pending (ACK completed)";
-		if (cci & BIT(31))
+		if (cci & UCSI_CCI_COMMAND_COMPLETE)
 			return "Event pending (command completed)";
 		return "Connector Change";
 	}
-	if (cci & BIT(29))
+	if (cci & UCSI_CCI_ACK_COMPLETE)
 		return "ACK completed";
-	if (cci & BIT(31))
+	if (cci & UCSI_CCI_COMMAND_COMPLETE)
 		return "Command completed";
 
 	return "";
-- 
2.26.1

