Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67BA6175C64
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 14:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgCBNyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 08:54:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:22884 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727083AbgCBNx6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Mar 2020 08:53:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 05:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; 
   d="scan'208";a="351544502"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2020 05:53:56 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Benson Leung <bleung@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 1/9] usb: typec: mux: Allow the muxes to be named
Date:   Mon,  2 Mar 2020 16:53:45 +0300
Message-Id: <20200302135353.56659-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302135353.56659-1-heikki.krogerus@linux.intel.com>
References: <20200302135353.56659-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The mux devices have been named by using the name of the
parent device as base until now, but if for example the
parent device has multiple muxes that will not work. This
makes it possible to supply the name for a mux during
registration.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux.c       | 6 ++++--
 include/linux/usb/typec_mux.h | 2 ++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 5baf0f416c73..3a9970d1d1c0 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -137,7 +137,8 @@ typec_switch_register(struct device *parent,
 	sw->dev.class = &typec_mux_class;
 	sw->dev.type = &typec_switch_dev_type;
 	sw->dev.driver_data = desc->drvdata;
-	dev_set_name(&sw->dev, "%s-switch", dev_name(parent));
+	dev_set_name(&sw->dev, "%s-switch",
+		     desc->name ? desc->name : dev_name(parent));
 
 	ret = device_add(&sw->dev);
 	if (ret) {
@@ -326,7 +327,8 @@ typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
 	mux->dev.class = &typec_mux_class;
 	mux->dev.type = &typec_mux_dev_type;
 	mux->dev.driver_data = desc->drvdata;
-	dev_set_name(&mux->dev, "%s-mux", dev_name(parent));
+	dev_set_name(&mux->dev, "%s-mux",
+		     desc->name ? desc->name : dev_name(parent));
 
 	ret = device_add(&mux->dev);
 	if (ret) {
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index be7292c0be5e..47ab5a828b07 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -17,6 +17,7 @@ typedef int (*typec_switch_set_fn_t)(struct typec_switch *sw,
 struct typec_switch_desc {
 	struct fwnode_handle *fwnode;
 	typec_switch_set_fn_t set;
+	const char *name;
 	void *drvdata;
 };
 
@@ -42,6 +43,7 @@ typedef int (*typec_mux_set_fn_t)(struct typec_mux *mux,
 struct typec_mux_desc {
 	struct fwnode_handle *fwnode;
 	typec_mux_set_fn_t set;
+	const char *name;
 	void *drvdata;
 };
 
-- 
2.25.0

