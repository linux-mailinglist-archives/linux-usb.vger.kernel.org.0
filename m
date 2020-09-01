Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A3B2585E0
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 05:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgIADAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 23:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbgIAC77 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:59 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68006C061379
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:59 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id j13so6791494qvi.17
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=sMKBHNl6/ZnX2Z7G/QMZIJh0U7nsb/eDujVhyPbAMgY=;
        b=Lc0M0pPOpGtw5J3TQd8lyCy3Vy2eRpkR3i1FvyU1XsWERPNIY++z4CT8QBIMsB/8Cb
         xZTaMSUWuZ/oIo1JjxIxAObRSMKumnb332gMI6CgV+vb6H5EM/7V3Pg9jHvLu0N7OiAW
         yaKWqli2Wq0ucXV1+dok9mLui7mzVhxFRy6WbI3kyfZOjE21mAdD+g6GMsuDI0YZTohO
         6gWQJLS529qCyFXAU2sanYmLF167T+TQDs/d7yfXlYRaiIhS7YJv2mkWrPK6fqJlj11O
         9P6wpZBRf+XrUYPIXa5NpM7DGh2jY/bD+jjUKNzrZ2mMOxG9CKessA8YgNj+dwTkzkih
         iDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sMKBHNl6/ZnX2Z7G/QMZIJh0U7nsb/eDujVhyPbAMgY=;
        b=UDY0CaER6hZvMqNc5A/qnFpfIq5yHWA2SPz9jCTXrOa/DiyAnVdvtD6s3q+2eHk5SJ
         iY3V1dc/5K4uwj3HW9OnlFJWwvEEQoWmMkKPmgRffKSmY7Hm4awL+PnJ3HwXbM9trGCK
         ASyCStO2M41KNdO4IbJj5MKveBRpAS922XsJTBOPnYJWWH/pTRH18oRkvlJ7hdvLS67y
         RoHpqxI62o4eR7PZPkpfSRNYBTWQ7lqzuRZR6lrS03MtsUbVy+rv1CqnG9TbxMLAuL1X
         JpbXG66FNzKLBwTNib1vZwTSR3ywkq4YHfrbmOrePnHXLezkpA/KaXaUtTr2S5f8PDQ8
         Ds+w==
X-Gm-Message-State: AOAM532ZCUUgnDG3P9RZVAgfrw1q8ZGfd6azKAqizA6zq0zxB/e72XhT
        +aaZC+B5cH/hN0dbBPWhsgvdg6HzWME=
X-Google-Smtp-Source: ABdhPJxx6aqt4vm8qU+0zPtj+sU1OUbh+tp3Mzgs8W9KTWNhYpiHiqDxFx4G/vul6U6GyHMLj/PsrZcf93E=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a05:6214:2a:: with SMTP id
 b10mr314451qvr.0.1598929198619; Mon, 31 Aug 2020 19:59:58 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:27 -0700
In-Reply-To: <20200901025927.3596190-1-badhri@google.com>
Message-Id: <20200901025927.3596190-15-badhri@google.com>
Mime-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 14/14] usb: typec: tcpci_maxim: Implemnent set_auto_vbus_discharge_threshold
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Programs VBUS_SINK_DISCONNECT_THRESHOLD based on the power_role,
voltage requested as sink, mode of operation.

The programmed threshold is based on vSinkDisconnect and
vSinkDisconnectPD values.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 6ba808ad901a..e35bd995c037 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -137,6 +137,52 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 		return;
 }
 
+static int max_tcpci_set_auto_vbus_discharge_threshold(struct tcpci *tcpci, struct tcpci_data *data,
+						       enum typec_role port_role,
+						       enum typec_pwr_opmode mode, bool pps_active,
+						       u32 requested_vbus_voltage_mv)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(data);
+	u32 threshold = 0;
+	u8 pwr_ctrl;
+
+	/*
+	 * Indicates that vbus is going to go away due PR_SWAP, hard reset etc.
+	 * Do not discharge vbus here.
+	 */
+	if (requested_vbus_voltage_mv == 0)
+		goto write_thresh;
+
+	if (port_role == TYPEC_SINK) {
+		max_tcpci_read8(chip, TCPC_POWER_CTRL, &pwr_ctrl);
+		if (pwr_ctrl & TCPC_FAST_ROLE_SWAP_EN) {
+			/* To prevent disconnect when the source is fast role swap is capable. */
+			threshold = 3500;
+		} else if (mode == TYPEC_PWR_MODE_PD) {
+			if (pps_active)
+				threshold = (95 * requested_vbus_voltage_mv / 100) - 850;
+			else
+				threshold = (95 * requested_vbus_voltage_mv / 100) - 1250;
+		} else {
+			/* 3.5V for non-pd sink */
+			threshold = 3500;
+		}
+	} else {
+		/* 4V for source */
+		threshold = 4000;
+	}
+
+	threshold = threshold / TCPC_VBUS_SINK_DISCONNECT_THRESH_LSB;
+
+	if (threshold > TCPC_VBUS_SINK_DISCONNECT_THRESH_MAX) {
+		dev_err(chip->dev, "VBUS_SINK_DISCONNECT_THRESH out of range");
+		return -EINVAL;
+	}
+
+write_thresh:
+	return max_tcpci_write16(chip, TCPC_VBUS_SINK_DISCONNECT_THRESH, threshold);
+}
+
 static void process_rx(struct max_tcpci_chip *chip, u16 status)
 {
 	struct pd_message msg;
@@ -454,6 +500,8 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
 	chip->data.start_drp_toggling = max_tcpci_start_toggling;
 	chip->data.TX_BUF_BYTE_x_hidden = true;
 	chip->data.init = tcpci_init;
+	chip->data.set_auto_vbus_discharge_threshold = max_tcpci_set_auto_vbus_discharge_threshold;
+	chip->data.auto_discharge_disconnect = true;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
-- 
2.28.0.402.g5ffc5be6b7-goog

