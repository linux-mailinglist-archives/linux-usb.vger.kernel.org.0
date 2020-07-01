Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4494B210A97
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 13:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbgGAL40 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 07:56:26 -0400
Received: from mga07.intel.com ([134.134.136.100]:8600 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730374AbgGAL4Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 07:56:25 -0400
IronPort-SDR: wkXz5vjwdkLXJFIjwHExOJeFw0shjmwOWIgbXDPCyeavJlkSt3HoEoIHFg8psBG1ze3eVJNrNg
 uz9Nzwtbm25A==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="211607999"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="211607999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 04:56:25 -0700
IronPort-SDR: JsV+IhZWWLUZfS6q1QQrH8hBZ/lK0aLhht2418DhVEEw8ipUKPfFiaOv4mTmYIMpe+xvImwSY4
 /YqOXV5xqiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="386988139"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2020 04:56:23 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/4] usb: typec: Add data structure for Enter_USB message
Date:   Wed,  1 Jul 2020 14:56:16 +0300
Message-Id: <20200701115618.22482-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
References: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This data structure can be delivered to the mux drivers when
Enter_USB Message is used exactly the same way as the
Alternate Mode specific data structures are delivered to the
mux drivers when Enter Mode Messages are used.

The Enter_USB data structure shall have all details related
to the Enter_USB Message, most importantly the Enter_USB
Date Object that was used.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/typec.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 5daa1c49761c3..9cb1bec94b710 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -72,6 +72,20 @@ enum typec_orientation {
 	TYPEC_ORIENTATION_REVERSE,
 };
 
+/*
+ * struct enter_usb_data - Enter_USB Message details
+ * @eudo: Enter_USB Data Object
+ * @active_link_training: Active Cable Plug Link Training
+ *
+ * @active_link_training is a flag that should be set with uni-directional SBRX
+ * communication, and left 0 with passive cables and with bi-directional SBRX
+ * communication.
+ */
+struct enter_usb_data {
+	u32			eudo;
+	unsigned char		active_link_training:1;
+};
+
 /*
  * struct usb_pd_identity - USB Power Delivery identity data
  * @id_header: ID Header VDO
-- 
2.27.0

