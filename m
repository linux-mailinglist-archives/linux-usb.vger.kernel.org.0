Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A74C158D84
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 12:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgBKLZg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 06:25:36 -0500
Received: from mga17.intel.com ([192.55.52.151]:1071 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727639AbgBKLZg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 06:25:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Feb 2020 03:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="347261821"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2020 03:25:34 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 2/6] usb: typec: Hide the port_type attribute when it's not supported
Date:   Tue, 11 Feb 2020 14:25:27 +0300
Message-Id: <20200211112531.86510-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
References: <20200211112531.86510-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The port_type attribute is special. It is meant to allow
changing the capability of the port in runtime. It is purely
Linux kernel specific feature, i.e. the feature is not
described in any of the USB specifications.

Because of the special nature of this attribute, handling it
differently compared to the other writable attributes, and
hiding it when the underlying port interface (or just the
driver) does not support the feature.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index a451ae181fe9..7fed6855ad59 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1350,8 +1350,9 @@ static umode_t typec_attr_is_visible(struct kobject *kobj,
 		    !port->ops || !port->ops->try_role)
 			return 0444;
 	} else if (attr == &dev_attr_port_type.attr) {
-		if (port->cap->type != TYPEC_PORT_DRP ||
-		    !port->ops || !port->ops->port_type_set)
+		if (!port->ops || !port->ops->port_type_set)
+			return 0;
+		if (port->cap->type != TYPEC_PORT_DRP)
 			return 0444;
 	}
 
-- 
2.25.0

