Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9680E1E5C
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 16:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404999AbfJWOj5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 10:39:57 -0400
Received: from mga12.intel.com ([192.55.52.136]:39183 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404965AbfJWOj5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 10:39:57 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 07:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="209934370"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2019 07:39:55 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 09/18] usb: typec: Remove unused members from struct typec_capability
Date:   Wed, 23 Oct 2019 17:39:30 +0300
Message-Id: <20191023143939.39668-10-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
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

