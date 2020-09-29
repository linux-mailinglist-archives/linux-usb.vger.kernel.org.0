Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609E127BAEF
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbgI2Ck3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbgI2Ck2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:28 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F116BC0613D8
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:24 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id c26so1977699pgl.9
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=x75HFZapwymuUzmD7TSk+DIPW4mnSh+u9U5hvOiIQ9E=;
        b=V2HGIAtrM4/NiDd7cJAJDQWJfnMFj+h/XnxOrAkJeKV3ATi42p07OXaZKcR2UB81GC
         2iM1rR/kf6fSEWdrIzTHLvrKEcucX/Nr3u71MNgzTbmR0DMf4F4GjM0nsYi9zfQU7Do5
         uKDHitwlbeJWEYu+BPTg70TNx3EjZLcV1dZ8zmxIOSnWB3O73LlGHYKoVrPsyTESXIGr
         0k/nXFCSYXT4TDEnNG61zxQ66YV9RZgqLwpqzSKvUSg0ohTbPmvxKeJS8tYjeWDXAqmq
         32LeIqU3FMyKWK/4X+FSm5kkMitBdwk4BhcBjiIcYewHw6zQV4NvyB7b5kGWTvyTXkQS
         rl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=x75HFZapwymuUzmD7TSk+DIPW4mnSh+u9U5hvOiIQ9E=;
        b=knSKl+Epln/BJuTJ4ZQsymYA3YQ4u4nxyzRtbD9GWXjQub1sg9VhXc1aoG2oMH/P5s
         16xHPi8kBEqoxtalF2kvRpcQ937b1bbmGACeJcp9vYgenCji5M17a1Xj0AoNkuya6wfQ
         MO7faHEdNXDlyc1eX5moE8xkUYm0DT4jw6Nuq6yAESTYUC8SnjcEA+CS+8/2D2pL6oBp
         WS975LOmGYl6N1TBYyoyRQfrqeRouZUGqD5e6ZxcZrv5pPe1zWXAdNui4MyJ2jFg29iO
         HleASAGZoyJ75RdF1jqq7CJKnoRYDixNAVSOzF3QZQhYv8PqFuYr/qkWgza0ID/GxD1D
         3jrA==
X-Gm-Message-State: AOAM530xx4K6eHmr9CX2mpfdHtLnP6jDcIujz3pml1Ke8PwwXhT92tfb
        P9NBUd1qtZf/a5PxZ526/SovZu5KQNQ=
X-Google-Smtp-Source: ABdhPJx2Frl4PW5qns9bDls5tNgyMVgp3BzkB/qYlLCNxpnAaIG5fk3ikqHr6IJEQ6Ri8WZSrZ2Wu+HbQxI=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:aa7:8612:0:b029:142:2501:3967 with SMTP id
 p18-20020aa786120000b029014225013967mr2139357pfn.44.1601347224432; Mon, 28
 Sep 2020 19:40:24 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:39:56 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-8-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 07/15] usb: typec: tcpci: Implement callbacks for FRS
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

Implement tcpc.enable_frs to enable TCPC to receive
Fast role swap signal.

Additionally set the sink disconnect threshold to 4v
to prevent disconnect during Fast Role swap.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- Rebase on usb-next.
- Fixed formatting error.
- Added Reviewed-by: Heikki.

Changes since v7:
- Rebase on usb-next.

Changes since v8:
- None.
---
 drivers/usb/typec/tcpm/tcpci.c | 17 +++++++++++++++++
 drivers/usb/typec/tcpm/tcpci.h |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index d6a6fac82d48..f9f0af64da5f 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -268,6 +268,22 @@ static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
 }
 
+static int tcpci_enable_frs(struct tcpc_dev *dev, bool enable)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(dev);
+	int ret;
+
+	/* To prevent disconnect during FRS, set disconnect threshold to 3.5V */
+	ret = tcpci_write16(tcpci, TCPC_VBUS_SINK_DISCONNECT_THRESH, enable ? 0 : 0x8c);
+	if (ret < 0)
+		return ret;
+
+	ret = regmap_update_bits(tcpci->regmap, TCPC_POWER_CTRL, TCPC_FAST_ROLE_SWAP_EN, enable ?
+				 TCPC_FAST_ROLE_SWAP_EN : 0);
+
+	return ret;
+}
+
 static int tcpci_set_bist_data(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -611,6 +627,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_roles = tcpci_set_roles;
 	tcpci->tcpc.pd_transmit = tcpci_pd_transmit;
 	tcpci->tcpc.set_bist_data = tcpci_set_bist_data;
+	tcpci->tcpc.enable_frs = tcpci_enable_frs;
 
 	err = tcpci_parse_config(tcpci);
 	if (err < 0)
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 82f021a82456..5ef07a56d67a 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -16,6 +16,7 @@
 #define TCPC_PD_INT_REV			0xa
 
 #define TCPC_ALERT			0x10
+#define TCPC_ALERT_EXTND		BIT(14)
 #define TCPC_ALERT_EXTENDED_STATUS	BIT(13)
 #define TCPC_ALERT_VBUS_DISCNCT		BIT(11)
 #define TCPC_ALERT_RX_BUF_OVF		BIT(10)
@@ -37,6 +38,9 @@
 #define TCPC_EXTENDED_STATUS_MASK		0x16
 #define TCPC_EXTENDED_STATUS_MASK_VSAFE0V	BIT(0)
 
+#define TCPC_ALERT_EXTENDED_MASK	0x17
+#define TCPC_SINK_FAST_ROLE_SWAP	BIT(0)
+
 #define TCPC_CONFIG_STD_OUTPUT		0x18
 
 #define TCPC_TCPC_CTRL			0x19
@@ -63,6 +67,7 @@
 
 #define TCPC_POWER_CTRL			0x1c
 #define TCPC_POWER_CTRL_VCONN_ENABLE	BIT(0)
+#define TCPC_FAST_ROLE_SWAP_EN		BIT(7)
 
 #define TCPC_CC_STATUS			0x1d
 #define TCPC_CC_STATUS_TOGGLING		BIT(5)
@@ -74,11 +79,14 @@
 
 #define TCPC_POWER_STATUS		0x1e
 #define TCPC_POWER_STATUS_UNINIT	BIT(6)
+#define TCPC_POWER_STATUS_SOURCING_VBUS	BIT(4)
 #define TCPC_POWER_STATUS_VBUS_DET	BIT(3)
 #define TCPC_POWER_STATUS_VBUS_PRES	BIT(2)
 
 #define TCPC_FAULT_STATUS		0x1f
 
+#define TCPC_ALERT_EXTENDED		0x21
+
 #define TCPC_COMMAND			0x23
 #define TCPC_CMD_WAKE_I2C		0x11
 #define TCPC_CMD_DISABLE_VBUS_DETECT	0x22
-- 
2.28.0.709.gb0816b6eb0-goog

