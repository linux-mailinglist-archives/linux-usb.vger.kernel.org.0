Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62DE2D4464
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 17:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbfJKPck (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 11:32:40 -0400
Received: from mga09.intel.com ([134.134.136.24]:33473 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbfJKPcj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 11:32:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 08:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="207450476"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2019 08:32:32 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v4 9/9] usb: typec: Remove unused members from struct typec_capability
Date:   Fri, 11 Oct 2019 18:32:19 +0300
Message-Id: <20191011153219.35701-10-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
References: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The members for the muxes are not used, so dropping them.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 include/linux/usb/typec.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 894798084319..0f52723a11bd 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -209,8 +209,6 @@ struct typec_capability {
 	int			prefer_role;
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 
-	struct typec_switch	*sw;
-	struct typec_mux	*mux;
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
 
-- 
2.23.0

