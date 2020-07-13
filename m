Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE0221E185
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 22:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726892AbgGMUio (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 16:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgGMUin (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 16:38:43 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A8CC061794
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 13:38:43 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id m8so8144135qvv.10
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=dGP3NBiuPYOp4kG6UmTmoWb3Yy//DSuALfFpCez22cA=;
        b=HC46yhzEbc7uMnOMe0PWMfCPdnyTNb0RHGlCBCN93asvKXs8drlpZCe88L2xLYlpIj
         N1/q9PF2f07DYTy5b5lvFqFlRGXcq9miO5L430N/PxUxTiAp5ThT806l0nHaT4jYWbP+
         E5XlhYpR0qkolCuNP1G4eMAU8Km8Kxpbg6JmZ7/TKs/z/kuzshXLQ6uvt41HiIfe4XVC
         UNHr8ps0dACDZ1xnJuKHt0xVxx4gb7ahEjto7DG70F6zDo+b2zAf0VBUVfWPNINKolLt
         d1uXQPUQWPOPME/NCDLD53H5Jy4mcAoohlKFJ/HhelPdgaK9wUfPyo1G7kkDzMq6kKHZ
         9ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=dGP3NBiuPYOp4kG6UmTmoWb3Yy//DSuALfFpCez22cA=;
        b=dxt1NS8ONHerpWJdk4iehdzVZgV1IaWdtOLRb5rQsu+b0fMB67ihnxF6udzHEajcPM
         z0tD0M8VgEYC2Ss1KIgCKV354iXVNC1zm2XacD8vZpliD5o7nuCBc8l9AbTUytqWNL/B
         YsC6vVn/chEBiSDhbjIDJ1z/82AXFk8JrntjsQcTl2j0B/9YhpCJ05YUBoMci9Cnq+6c
         0fgL7yHRY1xQg6cdRmTce24BVyF0vrAyFct4VsJ8qM9nFUw3TJ6h2VZ2ZLICmrpXiwXC
         mW1iO8ATaO/7GWx+Gwk49PmOVqk2NRirUua4r27zdQCNu5hVtVWkiQC6tiXqF4gD4OXS
         cIhA==
X-Gm-Message-State: AOAM531rFWZqTV6wBtTRJ15NjH7Z7v4tjprFuJlOvUt9HWP+90GRSwDP
        ffm/tOvYhHg9asuEnB/qp0mBUQJ1EcY=
X-Google-Smtp-Source: ABdhPJzRvmcMJE/hMn2ryQpDopXmW4JA+HZ4UObh+jH6v+Sn6OcL47jpUcPp0QvVmneZvzPwEqdWhlJkNfk=
X-Received: by 2002:a05:6214:26:: with SMTP id b6mr1239373qvr.239.1594672722444;
 Mon, 13 Jul 2020 13:38:42 -0700 (PDT)
Date:   Mon, 13 Jul 2020 13:38:37 -0700
Message-Id: <20200713203838.339297-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 1/2] usb: typec: tcpm: Support bist test data mode for compliance
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        reg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TCPM supports BIST carried mode. PD compliance tests require
BIST Test Data to be supported as well.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 14 ++++++++++++++
 drivers/usb/typec/tcpm/tcpci.h |  3 +++
 drivers/usb/typec/tcpm/tcpm.c  |  7 +++++++
 include/linux/usb/tcpm.h       |  2 ++
 4 files changed, 26 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 753645bb25273a..3616263f661233 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -227,6 +227,19 @@ static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
 }
 
+static int tcpci_set_bist_data(struct tcpc_dev *tcpc, bool enable)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+	int ret;
+
+	dev_info(tcpci->dev, "set bist %s\n", enable ? "true" : "false");
+	ret = regmap_update_bits(tcpci->regmap, TCPC_TCPC_CTRL,
+				 TCPC_TCPC_CTRL_BIST_TM, enable ?
+				 TCPC_TCPC_CTRL_BIST_TM : 0);
+
+	return ret;
+}
+
 static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
 			   enum typec_role role, enum typec_data_role data)
 {
@@ -530,6 +543,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_pd_rx = tcpci_set_pd_rx;
 	tcpci->tcpc.set_roles = tcpci_set_roles;
 	tcpci->tcpc.pd_transmit = tcpci_pd_transmit;
+	tcpci->tcpc.set_bist_data = tcpci_set_bist_data;
 
 	err = tcpci_parse_config(tcpci);
 	if (err < 0)
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 303ebde265465c..a29c8b6c2efe07 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -36,6 +36,7 @@
 
 #define TCPC_TCPC_CTRL			0x19
 #define TCPC_TCPC_CTRL_ORIENTATION	BIT(0)
+#define TCPC_TCPC_CTRL_BIST_TM		BIT(1)
 
 #define TCPC_ROLE_CTRL			0x1a
 #define TCPC_ROLE_CTRL_DRP		BIT(6)
@@ -130,6 +131,8 @@ struct tcpci_data {
 			 bool enable);
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
+	int (*set_bist_data)(struct tcpci *tcpci, struct tcpci_data *data,
+			     bool enable);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 82b19ebd7838e0..525379798d6c5c 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2746,6 +2746,9 @@ static void tcpm_detach(struct tcpm_port *port)
 	if (!port->attached)
 		return;
 
+	if (port->tcpc->set_bist_data)
+		port->tcpc->set_bist_data(port->tcpc, false);
+
 	if (tcpm_port_is_disconnected(port))
 		port->hard_reset_count = 0;
 
@@ -3555,6 +3558,10 @@ static void run_state_machine(struct tcpm_port *port)
 		case BDO_MODE_CARRIER2:
 			tcpm_pd_transmit(port, TCPC_TX_BIST_MODE_2, NULL);
 			break;
+		case BDO_MODE_TESTDATA:
+			if (port->tcpc->set_bist_data)
+				port->tcpc->set_bist_data(port->tcpc, true);
+			break;
 		default:
 			break;
 		}
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index e7979c01c3517c..89f58760cf4800 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -79,6 +79,7 @@ enum tcpm_transmit_type {
  * @try_role:	Optional; called to set a preferred role
  * @pd_transmit:Called to transmit PD message
  * @mux:	Pointer to multiplexer data
+ * @set_bist_data: Turn on/off bist data mode for compliance testing
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -103,6 +104,7 @@ struct tcpc_dev {
 	int (*try_role)(struct tcpc_dev *dev, int role);
 	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 			   const struct pd_message *msg);
+	int (*set_bist_data)(struct tcpc_dev *dev, bool on);
 };
 
 struct tcpm_port;
-- 
2.27.0.383.g050319c2ae-goog

