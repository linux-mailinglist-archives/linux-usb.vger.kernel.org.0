Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9734A25107D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728758AbgHYEX2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbgHYEWv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:51 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D6AC061797
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:51 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id lx6so890617pjb.9
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=Vf05DHbJOL8YiBgNY4RcEwAfFMau7ErjLwduxlsjLdo=;
        b=YFdvLbfuNEJOET5kjewhbsqwCOZ0iwwmylh9OKTb1DDvbbUo/f5M1W+AAgZCsQpYBQ
         UgQFNEdlEYlNHkXGZP3HWfXHW2CisBYqCknHiJGJpM5Mz0jw/L7IBAc4WcA7DaBJ4IXG
         Sv/6I+1/leX8sBLiINDSEcQkpjnSNS97so1BfkXBe4Q6xivbrd1WB1FpnR14G0rfLc0B
         3NquMc3XPk8BL2pAA8WUoAOAbGfuVxAuzKVSBoOgBWxXeA+Kmp8zOs4lXc/vjvRnhhxG
         56nhUNShRrQErheoGsHJbCM/C5dkWEMQQGOgyEk+n8mTyw/N5PA9qxMOLcAwwZ8mVJAz
         u6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Vf05DHbJOL8YiBgNY4RcEwAfFMau7ErjLwduxlsjLdo=;
        b=puH/8zui/+e/Q2KgPK5MUNgCEYcNTMs+jK1Gclbq6tve2fPNbyClj+ipe99OUbWfv1
         1eryV8W5CPh+QM3Qun5bBLY1ZcPYXY7w40iH9BBoWGjk+bm/mkj3Ni1MAQt8N1+4mb9M
         ef9/i3TFLCS0lVRUIef7dHk3IGc6uZK7x41YR0qZO7Gt2O4MlUOonB0c89zJlrajS7Dx
         83p9oW2g9hsrhTgUMeSKKeBp1OfyYVzeZUPPUFAEOGklS6jELqrY7nvIyl6DNp/g78QI
         t98LgwSTYF3n6E8Y1RX9ynzD9+S9k5Sp0G/dusntr+dcduYrBc0FhJt0TAAXTDFWuBYx
         vtPA==
X-Gm-Message-State: AOAM53269QRHj0ptsFPyXK1Caa0EwAbzaTKf4lVb6tco8BOkdVhjsgc+
        AnByOxFoqUuZkf54aVQUh9rYYm8zQ/0=
X-Google-Smtp-Source: ABdhPJy+tvS3+K7sfYIGeYaZ5HlFjz8vLgYSBHkYoDYFx2Jh9ydO5cH2HKTHEGm0OOG4GYBiwuAZuHGV1sA=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:e558:: with SMTP id
 ei24mr72404pjb.54.1598329370679; Mon, 24 Aug 2020 21:22:50 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:22:06 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-11-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 10/14 v1] usb: typec: tcpci: Implement callbacks for FRS
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

Implement tcpc.enable_frs to enable TCPC to receive
Fast role swap signal.

Additionally set the sink disconnect threshold to 4v
to prevent disconnect during Fast Role swap.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 17 +++++++++++++++++
 drivers/usb/typec/tcpm/tcpci.h |  8 ++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 89d28e3fbee8..13d2e1c2ff20 100644
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
@@ -610,6 +626,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
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
2.28.0.297.g1956fa8f8d-goog

