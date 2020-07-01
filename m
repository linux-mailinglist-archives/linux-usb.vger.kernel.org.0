Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C115210A98
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 13:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbgGAL41 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 07:56:27 -0400
Received: from mga07.intel.com ([134.134.136.100]:8600 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730374AbgGAL41 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 07:56:27 -0400
IronPort-SDR: TsH7U2DsB6PHjptrADE0jVlreOfQrxuHhG9BDjxZk4qZY27yRrw8LvnYZxeFNJz/nGeNiO0/W9
 ODbZeToRUyfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="211608003"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="211608003"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 04:56:26 -0700
IronPort-SDR: JjHjqzbsM7MYVbyzPJNKopWJ1QUruFtrL5pU/xuB59NIjy//TCpJcxK+hRCiFQ4dC/WWPD+ER/
 HR1/HrNWBUqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="386988145"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2020 04:56:25 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 3/4] usb: typec: intel_pmc_mux: Definitions for response status bits
Date:   Wed,  1 Jul 2020 14:56:17 +0300
Message-Id: <20200701115618.22482-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
References: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding definitions for the two status bits that we have in
the command response data structure.

Also, from now on only considering the second status bit,
which tells was the failure fatal or not, if the first bit
is set. If the first bit is not set, then the command was
successful, and we need to ignore the second bit.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 70ddc9d6d49e4..31fa62f968fb2 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -19,6 +19,10 @@
 
 #define PMC_USBC_CMD		0xa7
 
+/* Response status bits */
+#define PMC_USB_RESP_STATUS_FAILURE	BIT(0)
+#define PMC_USB_RESP_STATUS_FATAL	BIT(1)
+
 /* "Usage" OOB Message field values */
 enum {
 	PMC_USB_CONNECT,
@@ -130,8 +134,8 @@ static int pmc_usb_command(struct pmc_usb_port *port, u8 *msg, u32 len)
 	 */
 	intel_scu_ipc_dev_command(port->pmc->ipc, PMC_USBC_CMD, 0, msg, len,
 				  response, sizeof(response));
-	if (response[2]) {
-		if (response[2] & BIT(1))
+	if (response[2] & PMC_USB_RESP_STATUS_FAILURE) {
+		if (response[2] & PMC_USB_RESP_STATUS_FATAL)
 			return -EIO;
 		return -EBUSY;
 	}
-- 
2.27.0

