Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59256251072
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgHYEXA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgHYEW6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:58 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D8BC061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:58 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id lx6so890844pjb.9
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=MSjuJlqwZbeT/5gqoAJ2R9KeJjOh0ok3YdAVNY4kQaQ=;
        b=iiGIlPDOuad/QAjayZvFuF9m6tB9LjCXcmIMy8uLi85cby6M0mje5/RE6FryMc5jzU
         87st0DVi/rwSFdumypv1bjZ0JYLvyFksJxFRNcHzHvf+e346hdcQbVySpRqhFcxI8haY
         gbsCaQmSxvd99S0w6IZUjp6qfkQ3SPhtcxkcYZE+DTnPyymDT8aodQrGhmfMSnVg8bi3
         IDuZr2O5DkdTDn615ZI/QDSQOxU2ijLydeA5tmwhEq9sS2V4ZJrJlLuU8v192ha3J62P
         Hzq2Vb9L9PB7Yi65Xwt2tSfmEx3vGH0WaCRwfZh7GXhq0IHD6/Lewyn428Pgp+tO7T7g
         IvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=MSjuJlqwZbeT/5gqoAJ2R9KeJjOh0ok3YdAVNY4kQaQ=;
        b=hsFdDPjLTgTtPogDZ7496xjZAojtld5Rkhm5sjjIsB2beiFD8XP8w7cPUi3a/fTT6P
         qmOfFsOPL4kMfBMKyY32LofZK5j/VOZW5Q8Kz6Et8C6i2tv7ytNAvE0gFic55rnzrct9
         bi9PrXXOGoj/GdaoYZTB4zfGMqCGOl4vfBKfhaqmRJUHsjydZo6VIFpaQOT51u9Iak3j
         Payk61rfzHQRmO7nTCcIYpTkUIHj0FNRFrku3nTOBusDTr0Hb6mhl4blmIQsuC25NTCG
         Obhnu8VDdsMLlUQjYfqqY7uYIpQv2xH0nK2lp4i+kKLsX/eSt53eCbZfrd935m391YiO
         vZfA==
X-Gm-Message-State: AOAM531O2gbxGnLn2QACmPIW20gkA7Hwq4gbLppGCBxBuceNVehe5YCV
        MhlrETeghwSNEzi84xsBW4DMHwM4pPA=
X-Google-Smtp-Source: ABdhPJzBTyW+pz3D1TsoZ/ckSs2GKW2XpSlJoOPGekFFwT/3u4C/xG6pxz48LFAsil4v0+HC4sTHI9Hsi7E=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a05:6a00:22cc:: with SMTP id
 f12mr6383025pfj.42.1598329377892; Mon, 24 Aug 2020 21:22:57 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:22:09 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-14-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 13/14 v1] usb: typec: tcpci: Implement Auto discharge
 disconnect callbacks
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

Implement callbacks for enabling/disabling
POWER_CONTROL.AutoDischargeDisconnect.

TCPCI spec allows TCPC hardware to autonomously discharge the vbus
capacitance upon disconnect. The expectation is that the TCPM enables
AutoDischargeDisconnect while entering SNK/SRC_ATTACHED states. Hardware
then automously discharges vbus when the vbus falls below a certain
threshold i.e. VBUS_SINK_DISCONNECT_THRESHOLD.

Apart from enabling the vbus discharge circuit, AutoDischargeDisconnect
is also used a flag to move TCPCI based TCPC implementations into
Attached.Snk/Attached.Src state as mentioned in
Figure 4-15. TCPC State Diagram before a Connection of the
USB Type-C Port Controller Interface Specification.
In such TCPC implementations, setting AutoDischargeDisconnect would
prevent TCPC into entering "Connection_Invalid" state as well.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
 drivers/usb/typec/tcpm/tcpci.h | 22 ++++++++++++++++++++--
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 13d2e1c2ff20..e876f13ddf31 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -268,6 +268,33 @@ static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
 }
 
+static int tcpci_enable_auto_vbus_discharge(struct tcpc_dev *dev, bool enable)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(dev);
+	int ret;
+
+	ret = regmap_update_bits(tcpci->regmap, TCPC_POWER_CTRL, TCPC_POWER_CTRL_AUTO_DISCHARGE,
+				 enable ? TCPC_POWER_CTRL_AUTO_DISCHARGE : 0);
+	return ret;
+}
+
+static int tcpci_set_auto_vbus_discharge_threshold(struct tcpc_dev *dev, enum typec_role port_role,
+						   enum typec_pwr_opmode mode, bool pps_active,
+						   u32 requested_vbus_voltage)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(dev);
+	int (*set_auto_vbus_threshold)(struct tcpci *tcpci, struct tcpci_data *data,
+				       enum typec_role port_role, enum typec_pwr_opmode mode,
+				       bool pps_active, u32 requested_vbus_voltage);
+
+	set_auto_vbus_threshold = tcpci->data->set_auto_vbus_discharge_threshold;
+	if (set_auto_vbus_threshold)
+		return set_auto_vbus_threshold(tcpci, tcpci->data, port_role, mode, pps_active,
+					       requested_vbus_voltage);
+
+	return 0;
+}
+
 static int tcpci_enable_frs(struct tcpc_dev *dev, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(dev);
@@ -628,6 +655,12 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_bist_data = tcpci_set_bist_data;
 	tcpci->tcpc.enable_frs = tcpci_enable_frs;
 
+	if (tcpci->data->auto_discharge_disconnect) {
+		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
+		tcpci->tcpc.set_auto_vbus_discharge_threshold =
+			tcpci_set_auto_vbus_discharge_threshold;
+	}
+
 	err = tcpci_parse_config(tcpci);
 	if (err < 0)
 		return ERR_PTR(err);
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 5ef07a56d67a..6a0aea34e544 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -8,6 +8,8 @@
 #ifndef __LINUX_USB_TCPCI_H
 #define __LINUX_USB_TCPCI_H
 
+#include <linux/usb/typec.h>
+
 #define TCPC_VENDOR_ID			0x0
 #define TCPC_PRODUCT_ID			0x2
 #define TCPC_BCD_DEV			0x4
@@ -67,6 +69,7 @@
 
 #define TCPC_POWER_CTRL			0x1c
 #define TCPC_POWER_CTRL_VCONN_ENABLE	BIT(0)
+#define TCPC_POWER_CTRL_AUTO_DISCHARGE	BIT(4)
 #define TCPC_FAST_ROLE_SWAP_EN		BIT(7)
 
 #define TCPC_CC_STATUS			0x1d
@@ -133,6 +136,8 @@
 
 #define TCPC_VBUS_VOLTAGE			0x70
 #define TCPC_VBUS_SINK_DISCONNECT_THRESH	0x72
+#define TCPC_VBUS_SINK_DISCONNECT_THRESH_LSB	25
+#define TCPC_VBUS_SINK_DISCONNECT_THRESH_MAX	1023
 #define TCPC_VBUS_STOP_DISCHARGE_THRESH		0x74
 #define TCPC_VBUS_VOLTAGE_ALARM_HI_CFG		0x76
 #define TCPC_VBUS_VOLTAGE_ALARM_LO_CFG		0x78
@@ -140,20 +145,33 @@
 /* I2C_WRITE_BYTE_COUNT + 1 when TX_BUF_BYTE_x is only accessible I2C_WRITE_BYTE_COUNT */
 #define TCPC_TRANSMIT_BUFFER_MAX_LEN		31
 
+struct tcpci;
+
 /*
- * @TX_BUF_BYTE_x_hidden
+ * @TX_BUF_BYTE_x_hidden:
  *		optional; Set when TX_BUF_BYTE_x can only be accessed through I2C_WRITE_BYTE_COUNT.
+ * @auto_discharge_disconnect:
+ *		Optional; Enables TCPC to autonously discharge vbus on disconnect.
+ * @set_auto_vbus_discharge_threshold:
+ *		Mandatory when @auto_discharge_disconnect is sets. Allows
+ *		programming the voltage threshold of vbus below which TCPC
+ *		enables the vbus discharge circuit.
  */
-struct tcpci;
 struct tcpci_data {
 	struct regmap *regmap;
 	unsigned char TX_BUF_BYTE_x_hidden:1;
+	unsigned char auto_discharge_disconnect:1;
+
 	int (*init)(struct tcpci *tcpci, struct tcpci_data *data);
 	int (*set_vconn)(struct tcpci *tcpci, struct tcpci_data *data,
 			 bool enable);
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
 	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
+	int (*set_auto_vbus_discharge_threshold)(struct tcpci *tcpci, struct tcpci_data *data,
+						 enum typec_role port_role,
+						 enum typec_pwr_opmode mode, bool pps_active,
+						 u32 requested_vbus_voltage);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.28.0.297.g1956fa8f8d-goog

