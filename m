Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D48A273348
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 21:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgIUT42 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 15:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgIUT4Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 15:56:25 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36058C0613D0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 12:56:25 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id t201so9492111pfc.13
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=AWunavfjR2h7DGqJnJiiTrYCviYOJo4UjdEoDLbILJA=;
        b=t+GNICctCeMjWN/pUlO1D6VvqfujACAsEcklfpybyR5nZwW6Sdy0QnYyrhBPaIC5t6
         H14TSCQ9hvaKthS+0J7iv7W3S124LYUJjIn8tSybY1iBuhwhcstsGAGXxx+MKSl2D5rV
         x1qT8rzCzrzUfHdbRpVEMzO2Qsz4WKJ9sZmwktYdUXjte3x4jHDV1Q0DmCa6LCZP+WRU
         R7RJapDAJZCi5xkL+gOGg/vHjK0TzMA/4Ts41bi+x6kJuPbS8cgPiaZYtFuBwKSTQME5
         AJaWthUeIzVlaBTWgTi0277fp+iOysN3yPiFmUvkI2KLp+ByLyegHYOBacsvUPov1VNU
         vNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=AWunavfjR2h7DGqJnJiiTrYCviYOJo4UjdEoDLbILJA=;
        b=EDGTKI+a6aX7DwXKCN7lWQbyfpe/4S+BDPSg6pDdcd9piJfiEfBw5FwigjpH8g6QBT
         JvA7VNH+mRAjmiR4ndYQzzFoOEeItUmFyx7bt2L8MHCipth8uyM7YWlsOXr5PKLwdNst
         9xjCbb/QqWRMt6QsK/pX65YnODXruDBgltssMvJcYpXpft+G6/dFyFa1wagrL6SYORWC
         n0SgCfgbCfbCF2IfGfO8uCDo3/ij3VogCZeWYt02G1AMf93VnQDhVMBldaL3ArEfqCyy
         apGCNt0VdWVTQh3g50q8AJFzw8W01Wp+pGQ+0sWTFVtXbTMT8vDeZm6RA1Ls/qwWF5BB
         hugw==
X-Gm-Message-State: AOAM533aykjpWz6b1NF/+GW5NWwypVmNqumwvQ3Dm0BId+y4ESUdaIsI
        l0NJfES3agYdQCVL5da1lWH6Dn68KkE=
X-Google-Smtp-Source: ABdhPJw68r3Flh7t8b0dWbxHTV0lK3ldYw/oSD30QlZuU6Hf9NnbdqD72KDkJsC1TlfmPRXRzX3WdKSiQew=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:902:d68c:b029:d2:23a6:f6d7 with SMTP id
 v12-20020a170902d68cb02900d223a6f6d7mr1462202ply.45.1600718184724; Mon, 21
 Sep 2020 12:56:24 -0700 (PDT)
Date:   Mon, 21 Sep 2020 12:55:55 -0700
In-Reply-To: <20200921195555.1050731-1-badhri@google.com>
Message-Id: <20200921195555.1050731-11-badhri@google.com>
Mime-Version: 1.0
References: <20200921195555.1050731-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v8 11/11] usb: typec: tcpci_maxim: Implemnent set_auto_vbus_discharge_threshold
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Changes since v6:
- Rebase on usb-next.

Changes since v7:
- Heikki's suggestion:
Moved the actual write of TCPC_VBUS_SINK_DISCONNECT_THRES
register to tcpci code.
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 723d7dd38f75..329138622cc9 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -137,6 +137,37 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 		return;
 }
 
+u32 max_tcpci_get_auto_vbus_discharge_threshold(struct tcpci *tcpci, struct tcpci_data *data,
+						enum typec_role port_role,
+						enum typec_pwr_opmode mode, bool pps_active,
+						u32 requested_vbus_voltage_mv)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(data);
+	u32 threshold = 0;
+	u8 pwr_ctrl;
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
+	return threshold;
+}
+
 static void process_rx(struct max_tcpci_chip *chip, u16 status)
 {
 	struct pd_message msg;
@@ -441,6 +472,8 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
 	chip->data.start_drp_toggling = max_tcpci_start_toggling;
 	chip->data.TX_BUF_BYTE_x_hidden = true;
 	chip->data.init = tcpci_init;
+	chip->data.get_auto_vbus_discharge_threshold = max_tcpci_get_auto_vbus_discharge_threshold;
+	chip->data.auto_discharge_disconnect = true;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
-- 
2.28.0.681.g6f77f65b4e-goog

