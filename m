Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C571BA210
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 13:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgD0LMt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 07:12:49 -0400
Received: from mga18.intel.com ([134.134.136.126]:33333 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgD0LMt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 07:12:49 -0400
IronPort-SDR: ajWFZW+rKQNChZE+Mk7/UA+wj09twIqSeqSzRtCoJi5gXh2siZy6B3lFwY1Hpd6pFtNx25mWNM
 C2OFP8GTfEqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 04:12:49 -0700
IronPort-SDR: fG90uco9HGeRw7IPuXvq1dMrXetkMg2X5Q9hMUtUPD+B44q+M/RF0nGk2+MyzewNtCQ9l30cFs
 jaX1R37dFgZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; 
   d="scan'208";a="367131128"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2020 04:12:46 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "K V, Abhilash" <abhilash.k.v@intel.com>,
        kbuild test robot <lkp@intel.com>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Fix the stub for ucsi_register_port_psy()
Date:   Mon, 27 Apr 2020 14:12:46 +0300
Message-Id: <20200427111246.4889-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The stub was ucsi_register_port() when it should have been
ucsi_register_port_psy().

Fixes: 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e52b5540b254..cba6f77bea61 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -341,7 +341,7 @@ int ucsi_resume(struct ucsi *ucsi);
 int ucsi_register_port_psy(struct ucsi_connector *con);
 void ucsi_unregister_port_psy(struct ucsi_connector *con);
 #else
-static inline int ucsi_register_port(struct ucsi_connector *con) { return 0; }
+static inline int ucsi_register_port_psy(struct ucsi_connector *con) { return 0; }
 static inline void ucsi_unregister_port_psy(struct ucsi_connector *con) { }
 #endif /* CONFIG_POWER_SUPPLY */
 
-- 
2.26.2

