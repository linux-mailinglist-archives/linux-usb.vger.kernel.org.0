Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9042C338529
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 06:25:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCLFYw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 00:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhCLFYu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Mar 2021 00:24:50 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A310C061761
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 21:24:50 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id l10so28621849ybt.6
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 21:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2S11qT9RIwmKtMbHj/SRU+W48erwYAwCbBW3iK4A8WQ=;
        b=aj4UIbgmGvYsEQWbjl9Vsd2HPvBeEwmASkBiqHcWT/rT89Zr6eUN1EjPTx0NtfJSli
         zdgzENaiEQFVSHCRacIuwKDofT7lP3lPXTekCmhXsVhDAx0ieW3vWZuXFqu7tDELu+3V
         2clHbPNLSJSJupHclZIQr3MhGiAWomG/1N3N872h5XutJC7Ed6AfoCOfjVtsNcsknwZ1
         2iLE2vrB3oCcFv7tVt/bmliGt6pnE1FUBX9cfW55MbOMWvpoeGjz4XaXgvGYTVPx3T6V
         aBxC9h9K+nskhpWdZHjiiAATgSuxdxQJHLygQYpsG1tNjuU6t+vnI7orOvn8hreCbBGA
         5Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2S11qT9RIwmKtMbHj/SRU+W48erwYAwCbBW3iK4A8WQ=;
        b=b6N25FV1xqIutgXTOxUljYu5+YZ1fNvbxQcw5rM1nPiv3UiCfUBVbhl8bK6Sl3Qj4Y
         VcBtKBOtnrrhNSps+9s/g6VbmBRtcfBhNuh/DoD9gJVXWqRzpoFFcxdZszmNJtd2GA+N
         f+bFG+B7OxO96R9WYxYw0E6ZkOhe3NjKDdm9GsAP5i7P/pwQfQQfH4Cs3j7P9rokFgjF
         GVyXYbYS3I/yImbiW6vvyvJZROh7vg67P4PSbi8TwgGMHz305HufLq62dJVik3kjMhpb
         MFGb0BdYaO1cM6ga2Dv8feCX4EbqXqYP/janbOXJALx3jQXMwC7vRuSZEejBKwmunJeL
         zjeg==
X-Gm-Message-State: AOAM533IyGzIuka6i4Izvf+aL8ZUw5fHM7WCEavwCM2h6EedZu1zYb1+
        5t1qAZdIUs05N6e+BLZe5lztUdvEHh0=
X-Google-Smtp-Source: ABdhPJxWpuxqeI1jL5K9FwPmRrhsrAxOTQFEjo47De27XUVhg780+oU6yuN8CevAgt0j1+UM5fe8nws51yY=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:39e6:8b30:8665:4bec])
 (user=badhri job=sendgmr) by 2002:a25:d3ca:: with SMTP id e193mr16651418ybf.379.1615526689690;
 Thu, 11 Mar 2021 21:24:49 -0800 (PST)
Date:   Thu, 11 Mar 2021 21:24:43 -0800
In-Reply-To: <20210312052443.3797674-1-badhri@google.com>
Message-Id: <20210312052443.3797674-2-badhri@google.com>
Mime-Version: 1.0
References: <20210312052443.3797674-1-badhri@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2 2/2] usb: typec: tcpci_maxim: configure charging & data paths
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The change exposes the data_role and the orientation as a extcon
interface for configuring the USB data controller.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since V1:
- Dropped changes related to get_/set_current_limit and pd_capable
  callback. Will send them in as separate patches.
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 56 ++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 041a1c393594..1210445713ee 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -7,6 +7,8 @@
 
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/extcon.h>
+#include <linux/extcon-provider.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
@@ -46,6 +48,8 @@ struct max_tcpci_chip {
 	struct device *dev;
 	struct i2c_client *client;
 	struct tcpm_port *port;
+	bool attached;
+	struct extcon_dev *extcon;
 };
 
 static const struct regmap_range max_tcpci_tcpci_range[] = {
@@ -439,6 +443,39 @@ static int tcpci_init(struct tcpci *tcpci, struct tcpci_data *data)
 	return -1;
 }
 
+static void max_tcpci_set_roles(struct tcpci *tcpci, struct tcpci_data *data, bool attached,
+				enum typec_role role, enum typec_data_role data_role)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(data);
+
+	chip->attached = attached;
+
+	if (!attached) {
+		extcon_set_state_sync(chip->extcon, EXTCON_USB_HOST, 0);
+		extcon_set_state_sync(chip->extcon, EXTCON_USB, 0);
+		return;
+	}
+
+	extcon_set_state_sync(chip->extcon, data_role == TYPEC_HOST ? EXTCON_USB_HOST : EXTCON_USB,
+			      1);
+}
+
+static void max_tcpci_set_cc_polarity(struct tcpci *tcpci, struct tcpci_data *data,
+				      enum typec_cc_polarity polarity)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(data);
+
+	extcon_set_property(chip->extcon, EXTCON_USB, EXTCON_PROP_USB_TYPEC_POLARITY,
+			    (union extcon_property_value)(int)polarity);
+	extcon_set_property(chip->extcon, EXTCON_USB_HOST, EXTCON_PROP_USB_TYPEC_POLARITY,
+			    (union extcon_property_value)(int)polarity);
+}
+
+static const unsigned int usbpd_extcon[] = {
+	EXTCON_USB,
+	EXTCON_USB_HOST,
+};
+
 static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id *i2c_id)
 {
 	int ret;
@@ -472,6 +509,8 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
 	chip->data.auto_discharge_disconnect = true;
 	chip->data.vbus_vsafe0v = true;
 	chip->data.set_partner_usb_comm_capable = max_tcpci_set_partner_usb_comm_capable;
+	chip->data.set_roles = max_tcpci_set_roles;
+	chip->data.set_cc_polarity = max_tcpci_set_cc_polarity;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
@@ -484,6 +523,23 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
 	if (ret < 0)
 		goto unreg_port;
 
+	chip->extcon = devm_extcon_dev_allocate(&client->dev, usbpd_extcon);
+	if (IS_ERR(chip->extcon)) {
+		dev_err(&client->dev, "Error allocating extcon: %ld\n", PTR_ERR(chip->extcon));
+		ret = PTR_ERR(chip->extcon);
+		goto unreg_port;
+	}
+
+	ret = devm_extcon_dev_register(&client->dev, chip->extcon);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to register extcon device");
+		goto unreg_port;
+	}
+
+	extcon_set_property_capability(chip->extcon, EXTCON_USB, EXTCON_PROP_USB_TYPEC_POLARITY);
+	extcon_set_property_capability(chip->extcon, EXTCON_USB_HOST,
+				       EXTCON_PROP_USB_TYPEC_POLARITY);
+
 	device_init_wakeup(chip->dev, true);
 	return 0;
 
-- 
2.31.0.rc2.261.g7f71774620-goog

