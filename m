Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B70D30B429
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 01:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbhBBAbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 19:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbhBBAbt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 19:31:49 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05213C0613D6
        for <linux-usb@vger.kernel.org>; Mon,  1 Feb 2021 16:31:09 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id m7so6658573ybm.19
        for <linux-usb@vger.kernel.org>; Mon, 01 Feb 2021 16:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=sPq47L+9BIHkF/0ZeuUBPSrtxyRugGo3S/yCj7eF4vI=;
        b=UypH13Q2VyB2rYB0/02VP0iA/N6ovqoPXcdrMWGpkOJtHHPXrG3wVAetubYWgkIuM8
         1txWwWgRgMBuVgwS9PWbL5JBy6y9gYDL1+yMJ9qQKESWseuiiiQa/uoOxcvs09tmyW/O
         U987PNj4kr2iQFxAmZClhqys6LVPTRl6UxOr9vo0UHC9NWduC2zdX5gNDFCeZhwLvq4w
         4iJ295wEEFWpHaqW22+nyjhvudMTu9E/JMIcPVeWINFs7qdONSwnIGVlbOoPJhwnSnvo
         8YQdgWW/EbMn2/lgLPmhcP0pYgCc2ykKzqUTJkDZsjHoq1Jv0Fo/kP+QJNkl33PspHfP
         IkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sPq47L+9BIHkF/0ZeuUBPSrtxyRugGo3S/yCj7eF4vI=;
        b=PAYiTOX1/2LkfGsjzMRnwUq8ItpQ5J0pochUbYFW+T5RYjeDKPg9HVQAgpcSBWiloM
         7a7TX1MLDubiZe01uU2To8Y2pvV/5iuC9YHbSbPULTSoF/7LQpYD1ecG/QsjrTXAsP34
         pyyDigMyE/T0FJ7o3CN0qT5EZuIYuzCbSRpZ3Zx0VLf2G/KKr1AKnn9hGQF2BxhBX3fw
         obZlxlOswWVWPAHvTM8hpwoAFV5jQJEpVrLvrF6PkUMYD1mAKoTAP+L7nl60oiOXOdr/
         TbcTKi5rMJOHG9sL6Tn9p7owQ+OGLuULN7JIpzxWJULDXo7B0tYCyDUO3zWmkHnBRWDZ
         yKHQ==
X-Gm-Message-State: AOAM533yEajfe2upLc7274xAtOeV6NMgoJBAT/alk+262nFfn9eUPc4X
        UqL6OCOZKE4Z+jXNMIGjefAa2OfGOF8=
X-Google-Smtp-Source: ABdhPJz5bT+4VkOmzylQfs/chnDSdWvTMSgFT+G88ZX3256ESxb7jNf34H7GjkMpjNIb3CsoT0ZHwc/uJD8=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:d56c:119f:44fb:5da4])
 (user=badhri job=sendgmr) by 2002:a25:1086:: with SMTP id 128mr28250556ybq.375.1612225868244;
 Mon, 01 Feb 2021 16:31:08 -0800 (PST)
Date:   Mon,  1 Feb 2021 16:31:00 -0800
In-Reply-To: <20210202003101.221145-1-badhri@google.com>
Message-Id: <20210202003101.221145-2-badhri@google.com>
Mime-Version: 1.0
References: <20210202003101.221145-1-badhri@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 2/3] usb: typec: tcpci: Add Callback to Usb Communication
 capable partner
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyle Tso <kyletso@google.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB Communications Capable bit indicates if port
partner is capable of communication over the USB data lines
(e.g. D+/- or SS Tx/Rx). TCPM passes this information for chip specific
operations.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 drivers/usb/typec/tcpm/tcpci.h | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index f676abab044b..a27deb0b5f03 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -255,6 +255,14 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			   TCPC_TCPC_CTRL_ORIENTATION : 0);
 }
 
+static void tcpci_set_partner_usb_comm_capable(struct tcpc_dev *tcpc, bool capable)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+
+	if (tcpci->data->set_partner_usb_comm_capable)
+		tcpci->data->set_partner_usb_comm_capable(tcpci, tcpci->data, capable);
+}
+
 static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -720,6 +728,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_bist_data = tcpci_set_bist_data;
 	tcpci->tcpc.enable_frs = tcpci_enable_frs;
 	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
+	tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
 
 	if (tcpci->data->auto_discharge_disconnect) {
 		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index c3c7d07d9b4e..57b6e24e0a0c 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -161,6 +161,10 @@ struct tcpci;
  *		Optional; Enables TCPC to autonously discharge vbus on disconnect.
  * @vbus_vsafe0v:
  *		optional; Set when TCPC can detect whether vbus is at VSAFE0V.
+ * @set_partner_usb_comm_capable:
+ *		Optional; The USB Communications Capable bit indicates if port
+ *		partner is capable of communication over the USB data lines
+ *		(e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
  */
 struct tcpci_data {
 	struct regmap *regmap;
@@ -175,6 +179,8 @@ struct tcpci_data {
 				  enum typec_cc_status cc);
 	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
 	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
+	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
+					     bool capable);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.30.0.365.g02bc693789-goog

