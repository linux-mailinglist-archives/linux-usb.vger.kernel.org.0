Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63C8916A5D4
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2020 13:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgBXMO0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 07:14:26 -0500
Received: from mga03.intel.com ([134.134.136.65]:3630 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727670AbgBXMOZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Feb 2020 07:14:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 04:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="349909452"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2020 04:14:22 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH v2 7/9] device property: Export fwnode_get_name()
Date:   Mon, 24 Feb 2020 15:14:04 +0300
Message-Id: <20200224121406.2419-8-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224121406.2419-1-heikki.krogerus@linux.intel.com>
References: <20200224121406.2419-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This makes it possible to take advantage of the function in
the device drivers.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/base/property.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 511f6d7acdfe..5f35c0ccf5e0 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -566,6 +566,7 @@ const char *fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	return fwnode_call_ptr_op(fwnode, get_name);
 }
+EXPORT_SYMBOL_GPL(fwnode_get_name);
 
 /**
  * fwnode_get_name_prefix - Return the prefix of node for printing purposes
-- 
2.25.0

